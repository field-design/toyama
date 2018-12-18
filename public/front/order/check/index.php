<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　申込（ご予約内容確認）ページ
機能名：
　申込（ご予約内容確認）ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'ProductStock.php');
require_once(CLS_DIR . 'ProductPrice.php');
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Settings.php');
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();
$product = new Product();
$stock = new ProductStock();
$price = new ProductPrice();
$order = new Order();
$settings = new Settings();
$page = new Page();
$contact = new Contact();
$log = new Log();

$order_data = $order->getNewData();

$err_flg = false;

//申し込みデータチェック
if(!is_array($order_data)) {
    $smarty->assign('global_message', $order_data);
    $err_flg = true;
}

if( !$err_flg ) {
    //保持データ取得
    $order_data = $order->setSessionToOrder($order_data);
 
    if(!is_array($order_data)) {
        //データが取得できなければリダイレクト
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_SESSION_DATA);
        exit;
    }
    if($order_data['gender'] != '') {
        $order_data['gender_text'] = Constant::$aryGender[$order_data['gender']];
    }
    if($order_data['job_'] != '') {
        $order_data['job_text'] = Constant::$aryJob[$order_data['job_']];
    }
    for($i = 0; $i < count($order_data['withSei']); $i++) {
        $order_data['withGender_text'][$i] = Constant::$aryGender[$order_data['withGender'][$i]];        
    }
}

//商品データチェック
if( !$err_flg ) {
    $product_data = $product->getLangProduct($order_data['ProductID']);
    $course_data = $stock->getCourse($order_data['ProductID'], $order_data['course_id']);
    $price_data = $price->getCourseMeta($order_data['course_id']);
    $order_date = strtotime($order_data['oderDate']);

    //商品データがなければリダイレクト
    if( !isset($product_data) || !is_array($product_data) || !$order_date) {
        $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_PRODUCT_DATA);
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        exit;
    }

    $order_data['oderDate_text'] = date(Constant::$formatYMD, $order_date);
}

//在庫チェック
$request_flg = false;
if( !$err_flg ) {
    $stock_data = $stock->getCourseCurrentStock($order_data['course_id'], date('Y-m-01', $order_date));
    $stock_type = intval($stock_data['stock_type'][date('j', $order_date) - 1]);
    $stock_value = intval($stock_data['stock_value'][date('j', $order_date) - 1]);
    $stock_option = intval($stock_data['stock_option'][date('j', $order_date) - 1]);

    if( $stock_value == 0 ) {
        //在庫がないとき、リクエストプランでなければエラー
        if ($stock_type != 1 && $stock_option != 1) {
            $smarty->assign('global_message', MESSAGE_ERROR_DB_NO_STOCK);
            $err_flg = true;
        }
    }

    $select_volume = 0;
    foreach($order_data['amount'] as $value) {
        $select_volume += is_numeric($value) ? intval($value) : 0;
    }

    if( $stock_value - $select_volume < 0 ) {
        //在庫がないとき、リクエストプランでなければエラー
        if ($stock_type != 1 && $stock_option != 1) {
            $smarty->assign('global_message', MESSAGE_ERROR_OVER_STOCK);
            $err_flg = true;
        } else {
            $request_flg = true;
        }
    }

}

//手じまい日チェック
if( !$err_flg ) {
    $msg = $stock->checkClosingOut($order_data['course_id'], $order_date);
    if( !empty($msg) ) {
        //手じまい日以降であっても、オプション１かつ過去日でなければリクエストプラン
        if($stock_option == 1 && (date('Ymd', $order_date) >= date('Ymd')) ) {
            $request_flg = true;
        } else {
            $smarty->assign('global_message', $msg);
            $err_flg = true;
        }
    }
}

//事業者情報取得
$settings_data = $settings->getLangPerson($product_data['person_id']);
if(!is_array($settings_data)) {
    $smarty->assign('global_message', $settings_data);
    $err_flg = true;
}

$page_data = $page->getLangPage(2, 4);

/**********************************************
◆ 申し込み処理
***********************************************/
if( isset($_POST['create_order']) ) {

    if($err_flg) {
        $msg = $smarty->get_template_vars('global_message');
        header('Content-Type: application/json');
        echo json_encode($msg);
        exit;
    }

    //データ登録
    $order_data = $order->update($order_data, $product_data, $price_data, $request_flg);

    if(!is_array($order_data)) {
        header('Content-Type: application/json');
        echo json_encode($order_data);
        exit;
    }

    //データ登録後在庫チェック
    $stock_data = $stock->getCourseCurrentStock($order_data['course_id'], date('Y-m-01', $order_date));
    $stock_type = $stock_data['stock_type'][date('j', $order_date) - 1];
    $stock_value = $stock_data['stock_value'][date('j', $order_date) - 1];
    $stock_option = $stock_data['stock_option'][date('j', $order_date) - 1];

    if( $stock_value < 0 ) {
        //在庫がないとき、リクエストプランでなければエラー
        if ($stock_type != 1 && $stock_option != 1) {
            $smarty->assign('global_message', MESSAGE_ERROR_DB_NO_STOCK);
            $err_flg = true;
        }
    }

    if( $err_flg ) {
        header('Content-Type: application/json');
        echo json_encode(MESSAGE_ERROR_DB_NO_STOCK);
        exit;
    }

    //取引ID取得・DB更新
    set_include_path(get_include_path() . PATH_SEPARATOR  . CLS_DIR . "api/");
    require_once( 'com/gmo_pg/client/input/EntryTranInput.php');
    require_once( 'com/gmo_pg/client/tran/EntryTran.php');

    $input = new EntryTranInput();
    $input->setShopId($settings_data['shopID']);
    $input->setShopPass($settings_data['pass2']);
    $input->setJobCd('CAPTURE');
    $input->setOrderId($order_data['OderID']);
    $amount = 0;
    for($i = 0; $i < count($order_data['amount']); $i++) {
        $amount += intval($price_data['price_value'][$i]) * intval($order_data['amount'][$i]);
    }
    $input->setAmount($amount);

    $exe = new EntryTran();
    $output = $exe->exec($input);
    if( $exe->isExceptionOccured() ){
        //エラー
        $exception = $exe->getException();
        $log->setErrorLog($exception->getMessage());
                
    } else {
        if( $output->isErrorOccurred() ){
            //エラー
            $exception = $output->getException();
            $log->setErrorLog($exception->getMessage());
        } else {
            $order_data['access_id'] = $output->getAccessId();
            $order_data['access_pass'] = $output->getAccessPass();

            $order_data = $order->update_access($order_data);

            if(!is_array($order_data)) {
                header('Content-Type: application/json');
                echo json_encode($order_data);
                exit;
            }
        }
        
    }

    
    $response = array();
    $response['status'] = 'ok';

    if($request_flg) {
        $response['action'] = URL_ROOT_PATH_HOST . '/order/request/';
    } else {
        $response['action'] = $settings_data['APIurl'];
        //メール送信
        $contact->sendOrderComp($order_data, $product_data, $course_data, $price_data, $settings_data);
    }

    $response['JobCd'] = 'CAPTURE';
    $response['ShopID'] = $settings_data['shopID'];
    $response['OrderID'] = $order_data['OderID'];
    $response['Amount'] = 0;
    for($i = 0; $i < count($order_data['amount']); $i++) {
        $response['Amount'] += intval($price_data['price_value'][$i]) * intval($order_data['amount'][$i]);
    }
    $response['DateTime'] = date('YmdHis');
    $response['ShopPassString'] = md5($response['ShopID'] . '|' . $response['OrderID'] . '|' . $response['Amount'] . '|' . '' . '|' . $settings_data['pass2'] . '|' . $response['DateTime']);
    $response['RetURL'] = URL_ROOT_PATH_HOST . '/order/complete/';
    $response['ClientField1'] = $product_data['title'];
    if( in_array('1', $settings_data['settlement']) ) {
        $response['UseCredit'] = "1";
    } else {
        $response['UseCredit'] = "0";
    }
    if( in_array('2', $settings_data['settlement']) ) {
        $response['UseCvs'] = "1";
    } else {
        $response['UseCvs'] = "0";
    }
    $response['SiteID'] = $settings_data['siteID'];
    $response['ReceiptsDisp11'] = $settings_data['info'];
    $response['ReceiptsDisp12'] = $settings_data['tel_2'];
    $response['ReceiptsDisp13'] = $settings_data['informationTime'];

    header('Content-Type: application/json');
    echo json_encode($response);

    global $cls_session;
    $cls_session->clearSession();

    exit;
}

$smarty->assign('product_data', $product_data);
$smarty->assign('course_data', $course_data);
$smarty->assign('price_data', $price_data);
$smarty->assign('order_data', $order_data);
$smarty->assign('settings_data', $settings_data);
$smarty->assign('page_data', $page_data);
$smarty->assign('request_flg', $request_flg);
$smarty->display(FRONT_DIR . 'order/check/index.tpl');
