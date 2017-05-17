<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　受注一覧
機能名：
　受注一覧
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'OrderMy.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

//検索条件取得
$search_params = array();
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    if(isset($_POST['order_id'])) {
        $search_params['order_id'] = htmlspecialchars($_POST['order_id']);
    }
    if(isset($_POST['order_status'])) {
        $search_params['order_status'] = htmlspecialchars($_POST['order_status']);
    }
    if(isset($_POST['simei_sei'])) {
        $search_params['simei_sei'] = htmlspecialchars($_POST['simei_sei']);
    }
    if(isset($_POST['simei_mei'])) {
        $search_params['simei_mei'] = htmlspecialchars($_POST['simei_mei']);
    }
    if(isset($_POST['simei_kana_sei'])) {
        $search_params['simei_kana_sei'] = htmlspecialchars($_POST['simei_kana_sei']);
    }
    if(isset($_POST['simei_kana_mei'])) {
        $search_params['simei_kana_mei'] = htmlspecialchars($_POST['simei_kana_mei']);
    }
    if(isset($_POST['mail'])) {
        $search_params['mail'] = htmlspecialchars($_POST['mail']);
    }
    if(isset($_POST['tel'])) {
        $search_params['tel'] = htmlspecialchars($_POST['tel']);
    }
    if(isset($_POST['mobile'])) {
        $search_params['mobile'] = htmlspecialchars($_POST['mobile']);
    }
    if(isset($_POST['order_date_from'])) {
        $search_params['order_date_from'] = htmlspecialchars($_POST['order_date_from']);
    }
    if(isset($_POST['order_date_to'])) {
        $search_params['order_date_to'] = htmlspecialchars($_POST['order_date_to']);
    }
    if(isset($_POST['settlement_type']) && is_array($_POST['settlement_type'])) {
        $search_params['settlement_type'] = $_POST['settlement_type'];
    }
    if(isset($_POST['title'])) {
        $search_params['title'] = htmlspecialchars($_POST['title']);
    }
}

//受注一覧取得
$order = new OrderMy($login);
$orderlist = $order->getOrderListView(100, $search_params);

$smarty->assign('orderlist', $orderlist);
$smarty->assign('search_params', $search_params);
$smarty->display(ADMIN_DIR . 'order/index.tpl');
