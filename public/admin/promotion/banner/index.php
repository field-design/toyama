<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　バナー掲載について
機能名：
　バナー掲載について
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());


$smarty->display(ADMIN_DIR . 'promotion/banner/index.tpl');
