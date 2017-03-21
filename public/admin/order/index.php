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
require_once(CLS_DIR . 'Order.php');

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
$orderlist = $order->getOrderListView(100);

$smarty->assign('orderlist', $orderlist);
$smarty->display(ADMIN_DIR . 'order/index.tpl');
