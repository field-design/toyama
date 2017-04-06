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
require_once(CLS_DIR . 'Order.php');

$smarty = new SmartyExtends();
$product = new Product();
$order = new Order();
$log = new Log();

$err_flg = false;

if( !isset($_GET['order']) || !isset($_GET['date']) ) {
    //パラメータが取得できなければリダイレクト
    header('Location: ' . URL_ROOT_PATH . 'niikawa/');
    $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_GET_DATA);
    exit;
}

//オーダーデータ取得
$order_list = $order->getOrderListView(100, htmlspecialchars($_GET['date']));
$order_data = '';

foreach ( $order_list as $data ) {
    if( htmlspecialchars($_GET['order']) == sha1(ORDER_ID_SALT . $data['OderID']) ) {
        $order_data = $data;
        break;
    }
}

//申し込みデータチェック
if(!is_array($order_data)) {
    $smarty->assign('global_message', $order_data);
    $err_flg = true;
}

if( !$err_flg ) {
    if( $order_data['Correspondence'] != Constant::$aryCorrespondence['5'] ) {
        $smarty->assign('global_message', MESSAGE_ERROR_ALREADY_COMP);
        $err_flg = true;
    }
}

/**********************************************
◆ 決済処理
***********************************************/
$response = array();
if( !$err_flg ) {

    $response['status'] = 'ok';

    $response['action'] = 'https://pt01.mul-pay.jp/link/tshop00026711/Multi/Entry';    

    $response['JobCd'] = 'CAPTURE';
    $response['ShopID'] = 'tshop00026711';
    $response['OrderID'] = $order_data['OderID'];
    $response['Amount'] = 0;
    for($i = 1; $i <= 5; $i++) {
        $response['Amount'] += intval($order_data['plan_Fee' . $i]) * intval($order_data['volume' . $i]);
    }
    $response['DateTime'] = date('YmdHis');
    $response['ShopPassString'] = md5($response['ShopID'] . '|' . $response['OrderID'] . '|' . $response['Amount'] . '|' . '' . '|' . 'cuf2yv88' . '|' . $response['DateTime']);
    $response['RetURL'] = URL_ROOT_PATH_HOST . '/order/complete/';
    $response['ClientField1'] = $order_data['title'];
    $response['UseCredit'] = 1;
    $response['UseCvs'] = 1;
    $response['SiteID'] = 'tsite00024286';
    $response['ReceiptsDisp11'] = '株式会社観光販売システムズ';
    $response['ReceiptsDisp12'] = '05037754727';
    $response['ReceiptsDisp13'] = '10:00-18:30';

}

$smarty->assign('response', $response);
$smarty->display(FRONT_DIR . 'order/requestapp/index.tpl');
