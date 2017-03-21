<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　口座設定
機能名：
　口座設定
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());

$smarty->display(ADMIN_DIR . 'admins/edit/bank/index.tpl');
