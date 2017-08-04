<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　リクエスト承認ページ
機能名：
　リクエスト承認ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'ProductStock.php');
require_once(CLS_DIR . 'ProductPrice.php');
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Settings.php');

$smarty = new SmartyExtends();
$product = new Product();
$stock = new ProductStock();
$price = new ProductPrice();
$order = new Order();
$settings = new Settings();
$log = new Log();

$err_flg = false;

global $cls_session;
$cls_session->clearSession();

if( !isset($_GET['order']) || !isset($_GET['date']) ) {
    //パラメータが取得できなければリダイレクト
    header('Location: ' . URL_ROOT_PATH . 'niikawa/');
    $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_GET_DATA);
    exit;
}

//データ取得
$order_data = $order->getOrderAmount(htmlspecialchars($_GET['order']));

//申し込みデータチェック
if(!is_array($order_data) || is_null($order_data['order_id'])) {
    $smarty->assign('global_message', $order_data);
    $err_flg = true;
}

if( !$err_flg ) {
    if( $order_data['order_status'] != 5 ) {
        $smarty->assign('global_message', MESSAGE_ERROR_ALREADY_COMP);
        $err_flg = true;
    }
}

if( !$err_flg ) {

    //商品情報取得
    $product_data = $product->getLangProduct($order_data['product_id']);
    if(!is_array($product_data)) {
        $smarty->assign('global_message', $product_data);
        $err_flg = true;
    }

    //コース情報取得
    $course_data = $stock->getCourse($order_data['product_id'], $order_data['course_id']);
    if(!is_array($course_data)) {
        $smarty->assign('global_message', $course_data);
        $err_flg = true;
    }

    //コースメタ情報取得
    $price_data = $price->getCourseMeta($order_data['course_id']);
    if(!is_array($price_data)) {
        $smarty->assign('global_message', $price_data);
        $err_flg = true;
    }

    //事業者情報取得
    $settings_data = $settings->getLangPerson($product_data['person_id']);
    if(!is_array($settings_data)) {
        $smarty->assign('global_message', $settings_data);
        $err_flg = true;
    }
}

/**********************************************
◆ 決済処理
***********************************************/
$response = array();
if( !$err_flg ) {

    $response['status'] = 'ok';

    $response['action'] = $settings_data['APIurl'];

    $response['JobCd'] = 'CAPTURE';
    $response['ShopID'] = $settings_data['shopID'];
    $response['OrderID'] = $order_data['order_id'];
    $response['Amount'] = $order_data['amount'];
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

}

$smarty->assign('response', $response);
$smarty->display(FRONT_DIR . 'order/requestapp/index.tpl');
