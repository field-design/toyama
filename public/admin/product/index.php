<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　商品一覧
機能名：
　商品一覧
*******************************************/
require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Product.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

//商品リスト取得
$product = new Product();
$data_list = $product->getProductListView(100);

$smarty->assign('data_list', $data_list);
$smarty->assign('protocol', empty($_SERVER["HTTPS"]) ? "http://" : "https://");
$smarty->display(ADMIN_DIR . 'product/index.tpl');
