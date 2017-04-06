<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　リクエスト完了ページ
機能名：
　リクエスト完了ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Settings.php');
require_once(CLS_DIR . 'Contact.php');

$smarty = new SmartyExtends();
$product = new Product();
$order = new Order();
$settings = new Settings();
$contact = new Contact();
$log = new Log();

$err_flg = false;

if ( $_SERVER['REQUEST_METHOD'] != 'POST' ) {
    $err_flg = true;
    //POSTでなければリダイレクト
    header('Location: ' . URL_ROOT_PATH . 'niikawa/');
    $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_POST_DATA);
    exit;
}

//申し込みデータ取得
if ( !$err_flg ) {
    if( isset($_POST['OrderID']) ) {
        $order_data = $order->getOrder(htmlspecialchars($_POST['OrderID']));
        if(!is_array($order_data)) {
            //データが取得できなければリダイレクト
            header('Location: ' . URL_ROOT_PATH . 'niikawa/');
            $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_ORDER_DATA);
            exit;
        }
    } else {
        $err_flg = true;
    }
}

if ( !$err_flg ) {

    //事業者情報取得
    $settings_data = $settings->getSettings($order_data['PersonID']);
    if(!is_array($settings_data)) {
        $smarty->assign('global_message', $settings_data);
        $err_flg = true;
    }

    //メール送信
    if( !isset($_SESSION['send_request_mail']) ) {
        $contact->sendRequestComp($order_data, $settings_data);
        $_SESSION['send_request_mail'] = 1;
    }

    $order_data['oderDate_text'] = date('Y年m月d日', strtotime($order_data['oderDate']));
}

$smarty->assign('err_flg', $err_flg);
$smarty->assign('data', $order_data);
$smarty->assign('settings_data', $settings_data);
$smarty->display(FRONT_DIR . 'order/request/index.tpl');
