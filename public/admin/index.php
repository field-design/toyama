<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　管理画面トップページ
機能名：
　管理画面トップページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Sales.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

//受注一覧取得
$order = new Order();
$orderlist = $order->getOrderListView();

//月間売上取得
$sales = new Sales();
$selessum = $sales->getSalesSum();

$smarty->assign('orderlist', $orderlist);
$smarty->assign('salessum', $selessum);
$smarty->display(ADMIN_DIR . 'index.tpl');
