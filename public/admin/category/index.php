<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　カテゴリー
機能名：
　カテゴリー
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

//追加ボタン処理
if( isset($_POST['addtype']) ) {
    $smarty->assign('placeholder', '例：体験する');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_single.tpl');
    exit;
}

$smarty->display(ADMIN_DIR . 'category/index.tpl');
