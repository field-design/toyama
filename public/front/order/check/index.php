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
require_once(CLS_DIR . 'Order.php');

$smarty = new SmartyExtends();
$product = new Product();
$order = new Order();
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

}

//商品データチェック
if( !$err_flg ) {
    $product_data = $product->getProduct(htmlspecialchars($order_data['ProductID']), 1);
    $order_date = strtotime(htmlspecialchars($order_data['oderDate']));

    //商品データがなければリダイレクト
    if( !isset($product_data) || !is_array($product_data) || !$order_date) {
        $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_PRODUCT_DATA);
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        exit;
    }
}

//在庫チェック
if( !$err_flg ) {
    $stock_data = $product->getProductStock($product_data['ProductID'], date('Y/m', $order_date));

    $select_volume = 0;
    for($i = 1; $i <=5; $i++) {
        $select_volume += is_numeric($order_data['volume' . $i]) ? intval($order_data['volume' . $i]) : 0;
    }
    if( $stock_data['stock' . date('j', $order_date)] - $select_volume <= 0 ) {
        $smarty->assign('global_message', MESSAGE_ERROR_DB_NO_STOCK);
        $err_flg = true;
    }
}

//手じまい日チェック
if( !$err_flg ) {
    $msg = $product->checkClosingOut($product_data, $order_date);
    if( !empty($msg) ) {
        $smarty->assign('global_message', $msg);
        $err_flg = true;
    }
}

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
    $order_data = $order->update($order_data, $product_data);

    if(!is_array($order_data)) {
        header('Content-Type: application/json');
        echo json_encode($order_data);
        exit;
    }

    header('Content-Type: application/json');
    echo json_encode('create order!!');
    exit;
}



$smarty->assign('product_data', $product_data);
$smarty->assign('order_data', $order_data);
$smarty->display(FRONT_DIR . 'order/check/index.tpl');
