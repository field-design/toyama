<?php
require_once(dirname(__FILE__) . '/bat_common.php');
require_once(CLS_DIR . 'Log.php');
require_once(CLS_DIR . 'DB.php');
require_once(CLS_DIR . 'SpiralApi.php');
require_once(CLS_DIR . 'Entity.php');
require_once(CLS_DIR . 'ContactBase.php');

$log = new Log();
$db = new DB();
$contact = new ContactBase();

$mail_cnt = 0;


//入金案内メールを送信する商品コースデータ取得
$sql = '';
$sql .= 'select       t_product_course.course_id ';
$sql .= '     ,       t_product_course.course_name ';
$sql .= '     ,       t_product_course.remind_mail_date ';
$sql .= '     ,       t_product_course.product_id ';
$sql .= '     ,       product.jp_product_title ';
$sql .= '     ,       product.en_product_title ';
$sql .= '     ,       product.person_id ';
$sql .= 'from         t_product_course ';
$sql .= 'left join   ( ';
$sql .= '               select    jp_product.product_id ';
$sql .= '                    ,    jp_product.person_id ';
$sql .= '                    ,    jp_product.title as jp_product_title ';
$sql .= '                    ,    en_product.title as en_product_title ';
$sql .= '               from      t_product as jp_product ';
$sql .= '               left join t_product as en_product ';
$sql .= '                      on jp_product.group_slug = en_product.group_slug ';
$sql .= '                     and en_product.lang = 2 ';
$sql .= '               where     jp_product.lang = 1 ';
$sql .= '             ) as product ';
$sql .= '        on   t_product_course.product_id = product.product_id ';
$sql .= 'where  t_product_course.remind_mail_date is not null ';
$sql .= '  and  t_product_course.remind_mail_date != "" ';

$db->setPrepare($sql);

$err_msg = $db->execute();

if( !empty($err_msg) ) {
    $log->setErrorLog('FAIL_PAYMENT_RIMIND_MAIL_BAT GET_COURSE');
    $log->setErrorLog($err_msg);
    exit();
}

$course_data_list = $db->getResponse();


foreach($course_data_list as $course_data) {

    //事業者データ取得

    $spiral = new SpiralApi('database/select', 'admin_DB');

    $columns = array();
    $columns[] = 'display_name';
    $columns[] = 'company_name';
    $columns[] = 'email';
    $columns[] = 'tel_';
    $columns[] = 'zipcode';
    $columns[] = 'pref';
    $columns[] = 'address';
    $columns[] = 'agency';
    $columns[] = 'Registered';
    $columns[] = 'Travel';
    $columns[] = 'projectNumber';
    $columns[] = 'language';
    $columns[] = 'group';

    //日本語データ取得
    $serch_condition = array();
    $serch_condition[] = array("name" => "PersonID", "value" => $course_data['person_id']);
    $serch_condition[] = array('name' => 'language', 'value' => 1);

    $spiral->setSelectParam($columns, $serch_condition);

    $err_msg = $spiral->exec();

    if( !empty($err_msg) ) {
        //エラー処理
        $log->setErrorLog('FAIL_PAYMENT_RIMIND_MAIL_BAT GET_SPIRAL_ADMIN');
        $log->setErrorLog($err_msg);
        exit();
    }

    $settings_data_list = $spiral->getSelectData();
    $settings_data_jp = $settings_data_list[0];


    //英語データ取得
    $serch_condition = array();
    $serch_condition[] = array("name" => "group", "value" => $settings_data_jp['group']);
    $serch_condition[] = array('name' => 'language', 'value' => 2);

    $spiral->setSelectParam($columns, $serch_condition);

    $err_msg = $spiral->exec();

    if( !empty($err_msg) ) {
        //エラー処理
        $log->setErrorLog('FAIL_PAYMENT_RIMIND_MAIL_BAT GET_SPIRAL_ADMIN');
        $log->setErrorLog($err_msg);
        exit();
    }

    $settings_data_list = $spiral->getSelectData();
    $settings_data_en = array();
    if(count($settings_data_list) > 0) {
        $settings_data_en = $settings_data_list[0];
    }


    //メールを送信する催行日を定義
    $now = time();
    $mail_send_order_date = strtotime('+' . intval($course_data['remind_mail_date']) . ' day', $now);

    //メール送信対象の申込データ取得
    $sql = '';
    $sql .= 'select * ';
    $sql .= 'from   t_order ';
    $sql .= 'where  course_id = :course_id ';
    $sql .= '  and  order_date = :order_date ';
    $sql .= '  and  regist_date < :regist_date ';
    $sql .= '  and  order_status in (2, 5) ';

    $db->setPrepare($sql);
    $db->setBindValueSTR(':course_id', $course_data['course_id']);
    $db->setBindValueSTR(':order_date', date('Y-m-d', $mail_send_order_date));
    $db->setBindValueSTR(':regist_date', date('Y-m-d', $now));

    $err_msg = $db->execute();

    if( !empty($err_msg) ) {
        $log->setErrorLog('FAIL_PAYMENT_RIMIND_MAIL_BAT GET_ORDER');
        $log->setErrorLog($err_msg);
        exit();
    }

    $order_data_list = $db->getResponse();

    
    foreach($order_data_list as $order_data) {
        //申込データ取得
        $spiral = new SpiralApi('database/select', 'oderDB');

        $columns = array();
        $columns[] = 'OderID';
        $columns[] = 'mail';
        $columns[] = 'nameSei';
        $columns[] = 'nameMei';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'OderID', 'value' => $order_data['order_id']);

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            $log->setErrorLog('FAIL_PAYMENT_RIMIND_MAIL_BAT GET_SPIRAL_ORDER');
            $log->setErrorLog($err_msg);
            exit();
        }

        $p_order_data_list = $spiral->getSelectData();
        $p_order_data = $p_order_data_list[0];
        $p_order_data['order_id'] = $p_order_data['OderID'];
        $p_order_data['name_sei'] = $p_order_data['nameSei'];
        $p_order_data['name_mei'] = $p_order_data['nameMei'];


        //メール送信
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        $to      = $p_order_data['mail'];

        $settings_data_lang = array();
        if($order_data['lang'] == 2) {
            $settings_data_lang['company_name'] = $settings_data_en['company_name'];
            $settings_data_lang['display_name'] = $settings_data_en['display_name'];
            $settings_data_lang['tel'] = explode('-', $settings_data_en['tel_']);
            $settings_data_lang['zipcode'] = explode('-', $settings_data_en['zipcode']);
            $settings_data_lang['email'] = $settings_data_en['email'];
            $settings_data_lang['agency'] = $settings_data_en['agency'];
            $settings_data_lang['pref'] = $settings_data_en['pref'];
            $settings_data_lang['address'] = $settings_data_en['address'];
            $settings_data_lang['project_number'] = $settings_data_en['projectNumber'];
            $settings_data_lang['registered_text'] = getAryGovernorEnText($settings_data_en['Registered']);
            $settings_data_lang['travel_text'] = getAryTravelEnText($settings_data_en['Travel']);
        
            $subject = getMailSubjectEN();
            $message = getMailTextEN($course_data, $order_data, $p_order_data, $settings_data_lang);

        } else {
            $settings_data_lang['company_name'] = $settings_data_jp['company_name'];
            $settings_data_lang['display_name'] = $settings_data_jp['display_name'];
            $settings_data_lang['tel'] = explode('-', $settings_data_jp['tel_']);
            $settings_data_lang['zipcode'] = explode('-', $settings_data_jp['zipcode']);
            $settings_data_lang['email'] = $settings_data_jp['email'];
            $settings_data_lang['agency'] = $settings_data_jp['agency'];
            $settings_data_lang['pref'] = $settings_data_jp['pref'];
            $settings_data_lang['address'] = $settings_data_jp['address'];
            $settings_data_lang['project_number'] = $settings_data_jp['projectNumber'];
            $settings_data_lang['registered_text'] = getAryGovernorJpText($settings_data_jp['Registered']);
            $settings_data_lang['travel_text'] = getAryTravelJpText($settings_data_jp['Travel']);
        
            $subject = getMailSubjectJP();
            $message = getMailTextJP($course_data, $order_data, $p_order_data, $settings_data_lang);

        }

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        /*
        $history_data = array();
        $history_data['order_id'] = $p_order_data['order_id'];
        */

        $bcc = 'support@nanala-it.com';

        if( !$contact->send_mail($to, $subject, $message, $headers, $bcc) ) {
            $log->setErrorLog('FAIL_PAYMENT_RIMIND_MAIL_BAT SEND_MAIL ');
            exit();
        }

        $mail_cnt++;

    }
}

$log->setSysLog('COMP_PAYMENT_RIMIND_MAIL_BAT SEND_MAIL:' . $mail_cnt);