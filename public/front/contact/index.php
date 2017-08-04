<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　contactページ
機能名：
　contactページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();

$err_msg = array();

$page = new Page();

$page_data = $page->getLangPage(1, 3);

if( isset($_POST['send']) ) {

    $err_flg = false;

    $contact = new Contact();
    $err_msg['simei'] = $contact->setSimei($_POST['simei']);
    $err_msg['email'] = $contact->setEmail($_POST['email']);
    $err_msg['email_confirm'] = $contact->setEmailConfirm($_POST['email_confirm']);
    $err_msg['tel'] = $contact->setTel($_POST['tel']);
    $err_msg['naiyo'] = $contact->setNaiyo($_POST['naiyo']);

    if( !empty(implode('', $err_msg)) ) {
        $err_flg = true;
    }

    if( !$err_flg ) {
        $msg = $contact->checkInput();
        if ( !empty($msg) ) {
            $err_msg['email'] = $msg;
            $err_msg['email_confirm'] = $msg;
            $err_flg = true;
        }
    }

    if( !$err_flg ) {
        $msg = $contact->sendContact($_POST);
        if ( !empty($msg) ) {
            $smarty->assign('global_message', $msg);
            $err_flg = true;
        }
    }

    if( !$err_flg ) {
        $_POST = array();
    }    
}

$smarty->assign('page_data', $page_data);
$smarty->assign('err_msg', $err_msg);
$smarty->display(FRONT_DIR . 'contact/index.tpl');
