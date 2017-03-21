<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　売上一覧
機能名：
　売上一覧
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Sales.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

//月間売上取得
$sales = new Sales();
$selessum = $sales->getSalesSum();
$seleslist = $sales->getSalesListView(100);

if(!is_array($selessum) || !is_array($seleslist)) {
    $smarty->assign('global_message', $data);
}

$smarty->assign('salessum', $selessum);
$smarty->assign('saleslist', $seleslist);
$smarty->display(ADMIN_DIR . 'sales/index.tpl');
