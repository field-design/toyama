<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　メール管理
機能名：
　メール管理
*******************************************/
class ContactBase {

    private $simei;
    private $mail;
    private $mailconfirm;
    private $tel;
    private $naiyo;
    private $log;

    function __construct() {
        $this->log = new Log();
    }

    /******************************
    Setter＋入力チェック
    *******************************/
    //名前
    function setSimei($simei) {
        $simei = htmlspecialchars(trim($simei));
        if($simei == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->simei = $simei;
        return '';
    }

    //メールアドレス
    function setEmail($mail) {
        $mail = htmlspecialchars(trim($mail));
        if($mail == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->email = $mail;
        return '';
    }

    //確認用メールアドレス
    function setEmailConfirm($mailconfirm) {
        $mailconfirm = htmlspecialchars(trim($mailconfirm));
        if($mailconfirm == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->mailconfirm = $mailconfirm;
        return '';
    }
    //TEL
    function setTel($tel) {
        $tel = htmlspecialchars(trim($tel));
        if($tel == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->tel = $tel;
        return '';
    }
    //内容
    function setNaiyo($naiyo) {
        $naiyo = htmlspecialchars(trim($naiyo));
        if($naiyo == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->naiyo = $naiyo;
        return '';
    }

    /*******************
    入力チェック
    ********************/
    function checkInput() {
        if($this->email != $this->mailconfirm) {
            return MESSAGE_ERROR_MAIL_MISMATCH;
        }

        return '';
    }

    /*******************
    商品公開リクエスト
    ********************/
    function publishRequest($product_data, $settings_data) {

        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        $to      = OWNER_MAIL;
        $subject = '【いまからえらべるTRAVEL】商品公開リクエストが入りました';
        $message = '';
        $message .= '以下の商品に対して、公開リクエストが入りました。' . "\r\n";
        $message .= "\r\n";
        $message .= '商品名：' . $product_data['title'] . "\r\n";
        $message .= '事業者名：' . $settings_data['company_name'] . '（' . $settings_data['PersonID'] . '）' . "\r\n";
        $message .= '商品URL：'. "\r\n";
        $message .= URL_ROOT_PATH_HOST . URL_ROOT_PATH_ADMIN . 'product/edit/?ProductID=' . $product_data['product_id'] . "\r\n";
        $message .= '（※管理画面にログインした状態でクリックしてください。）'. "\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= '管理画面より商品を確認の上、公開処理を行ってください。' . "\r\n";
        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        return '';
    }

    /*******************
    商品公開リクエスト承認
    ********************/
    function publishRequestApproval($product_data, $settings_data) {
        
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        $to      = $settings_data['email'];
        $subject = '【いまからえらべるTRAVEL】商品公開リクエストが承認されました';
        $message = '';
        $message .= $settings_data['company_name'] . ' 様' . "\r\n";
        $message .= "\r\n";
        $message .= '平素より「いまからえらべるTRAVEL」をご利用いただきありがとうございます。' . "\r\n";
        $message .= "\r\n";
        $message .= '以下の商品に対して、公開リクエストが承認され、商品が公開状態となりました。' . "\r\n";
        $message .= "\r\n";
        $message .= '公開リクエスト送信日時：' . date('Y/m/d H:i:s', strtotime($product_data['publish_request_date'])) . "\r\n";
        
        $setting_publish_date = strtotime($product_data['publish_date'][0] . ' ' . $product_data['publish_date'][1]);
        $publish_date = strtotime('now');
        if($setting_publish_date > $publish_date) {
            $publish_date = date('Y/m/d H:i:s', $setting_publish_date);
        } else {
            $publish_date = date('Y/m/d H:i:s', $publish_date);
        }

        $message .= '公開日時：' . $publish_date . "\r\n";
        $message .= '商品名：' . $product_data['title'] . "\r\n";

        if(in_array('area1', $product_data['area'])) {
            $message .= '公開URL：' . URL_ROOT_PATH_HOST . URL_ROOT_PATH. 'niikawa/plan/?plan=' . $product_data['product_id'] . "\r\n";
        } else {
            $message .= '公開URL：' . URL_ROOT_PATH_HOST . URL_ROOT_PATH. 'plan/?plan=' . $product_data['product_id'] . "\r\n";            
        }
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= '今後とも、いまからえらべるTRAVELをよろしくお願いいたします。' . "\r\n";
        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        return '';
    }

    /*******************
    商品公開リクエスト非承認
    ********************/
    function publishRequestApprovalCancel($product_data, $settings_data) {
        
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        $to      = $settings_data['email'];
        $subject = '【いまからえらべるTRAVEL】商品公開リクエストが非承認となりました';
        $message = '';
        $message .= $settings_data['company_name'] . ' 様' . "\r\n";
        $message .= "\r\n";
        $message .= '平素より「いまからえらべるTRAVEL」をご利用いただきありがとうございます。' . "\r\n";
        $message .= "\r\n";
        $message .= '以下の商品に対しての公開リクエストは非承認となりました。' . "\r\n";
        $message .= "\r\n";
        $message .= '公開リクエスト送信日時：' . date('Y/m/d H:i:s', strtotime($product_data['publish_request_date'])) . "\r\n";
        $message .= '商品名：' . $product_data['title'] . "\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= '今後とも、いまからえらべるTRAVELをよろしくお願いいたします。' . "\r\n";
        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        return '';
    }

    /*******************
    お問い合わせ
    ********************/
    function sendContact($post) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        $to      = htmlspecialchars($post['email']);
        $subject = 'お問い合わせを受け付けました';
        
        $message = htmlspecialchars($post['simei']) . '様' . "\r\n";
        $message .= "\r\n";
        $message .= "この度は、当サイトにお問い合わせをいただき、" . "\r\n";
        $message .= "誠にありがとうございます。" . "\r\n";
        $message .= "\r\n";
        $message .= "お問合せいただい内容は次の通りです。" . "\r\n";
        $message .= "あらためて担当者より連絡させていただきますので、" . "\r\n";
        $message .= "今しばらくお待ちください。" . "\r\n";
        $message .= "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= "お問い合わせ内容" . "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= 'お名前：' . htmlspecialchars($post['simei']) . "\r\n";
        $message .= 'メールアドレス：' .  htmlspecialchars($post['email']) . "\r\n";
        $message .= '電話番号：' .  htmlspecialchars($post['tel']) . "\r\n";
        $message .= 'お問い合わせ内容：' . "\r\n" .  htmlspecialchars($post['naiyo']) . "\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= "サイト運営者情報" . "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= "株式会社観光販売システムズ　長野営業所" . "\r\n";
        $message .= "〒380-0823　長野県長野市南千歳1-7-1　第2荒井ビル4Ｆ" . "\r\n";
        $message .= "TEL：026-224-3501" . "\r\n";
        $message .= "FAX：026-224-3555" . "\r\n";
        $message .= "メール：admin@just-toyama.visit-town.com" . "\r\n";

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        //============
        //管理者宛
        //============
        $to      = OWNER_MAIL;
        $subject = '【いまからえらべるTRAVEL】問い合わせが入りました';
        
        $message = '以下の内容で問い合わせが入りました。' . "\r\n";
        $message .= "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= "お問い合わせ内容" . "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= 'お名前：' . htmlspecialchars($post['simei']) . "\r\n";
        $message .= 'メールアドレス：' .  htmlspecialchars($post['email']) . "\r\n";
        $message .= '電話番号：' .  htmlspecialchars($post['tel']) . "\r\n";
        $message .= 'お問い合わせ内容：' . "\r\n" .  htmlspecialchars($post['naiyo']) . "\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= "サイト運営者情報" . "\r\n";
        $message .= "*********************" . "\r\n";
        $message .= "株式会社観光販売システムズ　長野営業所" . "\r\n";
        $message .= "〒380-0823　長野県長野市南千歳1-7-1　第2荒井ビル4Ｆ" . "\r\n";
        $message .= "TEL：026-224-3501" . "\r\n";
        $message .= "FAX：026-224-3555" . "\r\n";
        $message .= "メール：admin@just-toyama.visit-town.com" . "\r\n";


        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        return '';
    }

    /*******************
    申し込み完了（カード）
    ********************/
    function sendCardOrderComp($order_data, $product_data, $course_data, $price_data, $settings_data) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        
        $to      = $order_data['mail'];
        $subject = 'お申し込みを承りました。';

        $message = '';
        $message .= $order_data['nameSei'] . '　' . $order_data['nameMei'] . '　様' . "\r\n";
        $message .= "\r\n";
        $message .= "この度は、いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にお申し込み頂きありがとうございます。\r\n";
        $message .= "下記の内容にて、お申し込みを承りました。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data);
        $message .= "※クレジットカード決済内容は、カード会社から送付される明細書にてご確認ください。\r\n";
        $message .= "\r\n";
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getProductSettings($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        //=============
        //事業者宛
        //=============
        $to      = $settings_data['email'];
        $subject = 'お申し込みが入りました';

        $message = "";
        $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "　御中\r\n";
        $message .= "\r\n";
        $message .= "いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にお申込がありました。\r\n";
        $message .= "下記の内容にて承りましたので、内容の確認、お客様へ確定書面のご発送をお願い致します。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data);
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        return '';
    }

    /*******************
    申し込み完了（コンビニ）
    ********************/
    function sendConveniOrderComp($order_data, $product_data, $course_data, $price_data, $settings_data) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'お申し込みを承りました。';

        $message = "";
        $message .= $order_data['nameSei'] . "　" . $order_data['nameMei'] . "　様\r\n";
        $message .= "\r\n";
        $message .= "この度は、いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にお申し込み頂きありがとうございます。\r\n";
        $message .= "下記の内容にて、お申し込みを承りました。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data);
        $message .= "コンビニ名：" . Constant::$aryCvs[$order_data['CvsCode']] . " \r\n";
        $message .= "受付番号：" . $order_data['CvsReceiptNo'] . " \r\n";
        $message .= "確認番号：" . $order_data['CvsConfNo'] . " \r\n";
        $message .= "払込票URL：" . $order_data['CvsReceiptUrl'] . "\r\n";
        //$message .= "支払期限：2017年03月26日（日）\r\n";
        $message .= "\r\n";
        $message .= "※コンビニでのお支払方法は、こちらをご覧ください。\r\n";
        $message .= "https://www.gmo-pg.com/sep/customer-convenience-store/\r\n";
        $message .= "\r\n";
        $message .= "入金完了メールや発券完了メールは配信しておりません。\r\n";
        $message .= "お受け取りいただきましたレシート又は決済領収書、受領書が発券された証明となります。\r\n";
        $message .= "※レシート又は決済領収書、受領書は大切に保管してください。\r\n";
        $message .= "\r\n";
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettings($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        //=============
        //事業者宛
        //=============
        $to      = $settings_data['email'];
        $subject = 'お申し込みが入りました';

        $message = "";
        $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "　御中\r\n";
        $message .= "\r\n";
        $message .= "いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にお申込がありました。\r\n";
        $message .= "下記の内容にて承りましたので、内容の確認、お客様へ確定書面のご発送をお願い致します。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data);
        $message .= "コンビニ名：" . Constant::$aryCvs[$order_data['CvsCode']] . " \r\n";
        $message .= "受付番号：" . $order_data['CvsReceiptNo'] . " \r\n";
        $message .= "確認番号：" . $order_data['CvsConfNo'] . " \r\n";
        $message .= "払込票URL：" . $order_data['CvsReceiptUrl'] . "\r\n";
        //$message .= "支払期限：2017年03月26日（日）\r\n";
        $message .= "\r\n";
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        return '';
    }

    /*******************
    リクエスト申し込み
    ********************/
    function sendRequestComp($order_data, $product_data, $course_data, $price_data, $settings_data) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'リクエストを承りました。';

        $message = '';
        $message .= $order_data['nameSei'] . '　' . $order_data['nameMei'] . '　様' . "\r\n";
        $message .= "\r\n";
        $message .= "この度は、いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にリクエスト頂きありがとうございます。\r\n";
        $message .= "下記の内容にて、リクエストを承りました。\r\n";
        $message .= "参加日より3日前までにお申し込みの場合24時間以内／参加日の前日・前々日にお申し込みの場合は3時間以内にご連絡いたします。（※上記時間内にご連絡がない場合は、お手数ですが各事業者の営業時間内にお電話でお問い合わせください。）\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data, 'リクエスト');
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data, 'リクエスト');
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettings($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        //=============
        //事業者宛
        //=============
        $to      = $settings_data['email'];
        $subject = 'リクエストが入りました';

        $message = '';
        $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "　御中\r\n";
        $message .= "\r\n";
        $message .= "いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にリクエストがありました。\r\n";
        $message .= "下記の内容にて承りましたので、内容の確認後、お客様へリクエスト回答をお願い致します。\r\n";
        $message .= URL_ROOT_PATH_HOST . "/admin/\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data, 'リクエスト');
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data, 'リクエスト');
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        return '';
    }

    /*******************
    承認完了
    ********************/
    function sendRequestApproval($order_data, $product_data, $course_data, $price_data, $settings_data) {

        $enc_id = sha1(ORDER_ID_SALT . $order_data['OderID']);

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'リクエストが承認されました';

        $message = '';
        $message .= $order_data['nameSei'] . '　' . $order_data['nameMei'] . '　様' . "\r\n";
        $message .= "\r\n";
        $message .= "この度は、いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にリクエスト頂きありがとうございます。\r\n";
        $message .= "お客様のリクエストが承認されましたので、下記のページより決済をお願いいたします。\r\n";
        $message .= "\r\n";
        $message .= "【決済ページ】\r\n";
        $message .= URL_ROOT_PATH_HOST . "/order/requestapp/?order=" . $enc_id . "&date=" . date('Y-m-d', strtotime($order_data['oderDate'])) . " \r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data, 'リクエスト');
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data, 'リクエスト');
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettings($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }
    }

    /*******************
    承認キャンセル
    ********************/
    function sendRequestApprovalCancel($order_data, $product_data, $course_data, $price_data, $settings_data) {

        $enc_id = sha1(ORDER_ID_SALT . $order_data['OderID']);

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'リクエストがキャンセルされました';

        $message = '';
        $message .= $order_data['nameSei'] . '　' . $order_data['nameMei'] . '　様' . "\r\n";
        $message .= "\r\n";
        $message .= "この度は、いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にリクエスト頂きありがとうございます。\r\n";
        $message .= "お客様のリクエストがキャンセルされました。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data, 'リクエスト');
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data, 'リクエスト');
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettings($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !$this->send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }
    }

    /*******************
    申込内容取得
    ********************/
    function getOrderInfo($order_data, $product_data, $course_data, $price_data, $type_name = '申込') {
        $message = '';
        $message .= "********************\r\n";
        $message .= $type_name . "内容\r\n";
        $message .= "********************\r\n";
        $message .= "・" . $type_name . "日時：" . $order_data['registDate'] . "\r\n";
        $message .= "・申込番号：" . $order_data['OderID'] . "\r\n";
        $message .= "\r\n";
        $message .= "*********************\r\n";
        $message .= $type_name . "プラン\r\n";
        $message .= "*********************\r\n";
        $message .= "・プラン名：" . $product_data['title_jp'] . "（" . $course_data['course_name'][0] . "）" . "\r\n";
        $message .= "・参加日：" . date('Y年m月d日', strtotime($order_data['oderDate'])) . "\r\n";
        $message .= "・集合場所：" . "\r\n";
        foreach($product_data['meeting_place_jp'] as $value) {
            $message .= "　" . $value . "\r\n";
        }
        $message .= "・人数：\r\n";

        $total = 0;
        for($i = 0; $i < count($price_data['price_type']); $i++) {
            $message .= "　" . $price_data['price_type_text_jp'][$i] . " ：" . number_format($order_data['amount'][$i]) . "名\r\n";
            $total += intval($order_data['amount'][$i]);
        }

        $message .= "　合計：" . $total . "名\r\n";

        $message .= "・ご旅行代金：\r\n";

        $total = 0;
        for($i = 0; $i < count($price_data['price_type']); $i++) {
            $sum = intval($price_data['price_value'][$i]) * intval($order_data['amount'][$i]);
            $message .= "　" . $price_data['price_type_text_jp'][$i] . "：" . number_format($price_data['price_value'][$i]) . "円×" . number_format($order_data['amount'][$i]) . "名＝" . number_format($sum) . "円\r\n";
            $total += $sum;
        }

        $message .= "　合計：" . number_format($total) . "円\r\n";

        return $message;
    }

    /*******************
    申込者取得
    ********************/
    function getOrderPerson($order_data, $type_name = '申込') {
        $message = '';
        $message .= "*********************\r\n";
        $message .= $type_name . "者情報\r\n";
        $message .= "*********************\r\n";
        $message .= "・氏名：" . $order_data['nameSei'] . "　" . $order_data['nameMei'] . "\r\n";
        $message .= "・住所：〒" . $order_data['zipCode'] . $order_data['pref'] . $order_data['adress'] . "\r\n";
        $message .= "・電話：" . $order_data['tel_'] . "\r\n";
        $message .= "・携帯電話：" . $order_data['mobile'] . "\r\n";
        $message .= "・メール：" . $order_data['mail'] . "\r\n";
        if( $type_name == '申込' ) {
            if( $order_data['settlementType'] == 3 ) {
                $message .= "・支払方法：コンビニ" . "\r\n";
            } else {
                $message .= "・支払方法：" . Constant::$aryPaymentJp[$order_data['Payment']] . "\r\n";
            }
        }
        $message .= "・備考：" . $order_data['note'] . "\r\n";
        $message .= "\r\n";

        return $message;
    }

    /*******************
    同行者者取得
    ********************/
    function getCompanion($order_data) {
        $message = '';
        $message .= "*********************\r\n";
        $message .= "同行者情報\r\n";
        $message .= "*********************\r\n";
        for($i = 0; $i < count($order_data['withSei']); $i++) {
            $message .= "・" . $order_data['withSei'][$i]. " " . $order_data['withMei'][$i] . "" . "\r\n";
        }
        $message .= "\r\n";

        return $message;
    }

    /*******************
    質問事項取得
    ********************/
    function getProductQuestion($order_data, $product_data) {

        $message = '';

        if(isset($product_data['question_jp']) && implode('', $product_data['question_jp']) != '') {
            $message .= "*********************\r\n";
            $message .= "ご質問事項\r\n";
            $message .= "*********************\r\n";
            for($i = 0; $i < count($product_data['question_jp']); $i++) {
                $message .= "・" . $product_data['question_jp'][$i] . "：" . $order_data['question'][$i] . "\r\n";
            }
        }
        $message .= "\r\n";

        return $message;
    }

    /*******************
    事業者情報取得
    ********************/
    function getProductSettings($settings_data) {
        $message = '';
        $message .= "*********************\r\n";
        $message .= "主催者情報\r\n";
        $message .= "*********************\r\n";
        $message .= "・事業者名：" . (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "\r\n";
        $message .= "・電話：" . $settings_data['tel_'][0] . "-" . $settings_data['tel_'][1] . "-" . $settings_data['tel_'][2] . "\r\n";
        $message .= "・住所：〒" . $settings_data['zipcode'][0] . "-" . $settings_data['zipcode'][1] . $settings_data['pref'] . $settings_data['address'] . "\r\n";
        $message .= "・メール：" . $settings_data['email'] . "\r\n";
        if($settings_data['agency'] == 1) {
            $message .= "・旅行業登録：" . $settings_data['Registered_text'] . $settings_data['Travel_text'] . "第" . $settings_data['projectNumber'] . "号\r\n";
        }
        $message .= "\r\n";
        $message .= "※ご予約のお取消・変更につきましては、上記連絡先までご連絡をお願い致します。\r\n";

        return $message;
    }

    /*******************
    メール送信処理
    ********************/
    function send_mail($to, $subject, $message, $headers) {
        //to設定
        $send_to = array ();
        $send_to['name'] = '';
        $send_to['address'] = $to;

        //from設定
        $send_from = array ();
        $send_from['name'] = '';
        $send_from['address'] = SYS_MAIL_FROM;
        
        //POSTデータ
        $data = array(
            'api_user' => EMAIL_SENDING_API_USER,
            'api_key' => EMAIL_SENDING_API_KEY,
            'to' => json_encode($send_to),
            'from' => json_encode($send_from),
            'subject' => $subject,
            'text' => $message,
        );

        $data = http_build_query($data);
        
        //Request Header
        $header = array(
            "Content-Type: application/x-www-form-urlencoded",
            "Content-Length: ".strlen($data)
        );
        $header = implode("\r\n", $header);
        
        //context生成
        $context = array(
            "http" => array(
                "method"  => "POST",
                "header"  => $header,
                "content" => $data,
                "ignore_errors" => true,
            )
        );

        $response_body = file_get_contents(EMAIL_SENDING_API_URL, false, stream_context_create($context));
        $response_header = $http_response_header;
    
        if(strpos($response_header[0], '200') === false ) {
            $log = new Log();
            $log->setErrorLog($http_response_header);
            $log->setErrorLog($response_body);
            return false;
        }

        return true;
    }
}