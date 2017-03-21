<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　ログイン
機能名：
　ログイン
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');

$login = new Login();

//ログアウト処理
if( isset($_GET['logout']) ) {
    $login->execLogout();
}

//ログイン済みなら管理画面トップページへ
if( $login->isLogin() ) {
    header('Location: ' . URL_ROOT_PATH_ADMIN) ;
    exit;
}

$mail = '';
$err_msg = '';
$err_msg_mail = '';
$err_msg_passwd = '';
if( isset($_POST['mail']) || isset($_POST['passwd']) ) {
    $mail = $_POST['mail'];
    //入力チェック
    $err_msg_mail = $login->setEmail($_POST['mail']);
    $err_msg_passwd = $login->setPass($_POST['passwd']);

    //ログイン処理
    if( empty($err_msg_mail)  && empty($err_msg_passwd) ) {

        $err_msg = $login->execLogin();

        if( empty($err_msg) ) {
            header('Location: ' . URL_ROOT_PATH_ADMIN) ;
            exit;
        }
    }

}

$smarty = new SmartyExtends();

$smarty->assign('mail', $mail);
$smarty->assign('err_msg', $err_msg);
$smarty->assign('err_msg_mail', $err_msg_mail);
$smarty->assign('err_msg_passwd', $err_msg_passwd);
$smarty->display(ADMIN_DIR . 'login/index.tpl');