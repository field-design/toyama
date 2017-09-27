<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　事業者一覧
機能名：
　事業者一覧
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Settings.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

//設定データ取得
$settings = new Settings();

$settingslist = $settings->getSettingsListView(999, $login);

if( !is_array($settingslist) ) {
    $smarty->assign('global_message', $data);
}

$smarty->assign('settingslist', $settingslist);
$smarty->display(ADMIN_DIR . 'admins/index.tpl');
