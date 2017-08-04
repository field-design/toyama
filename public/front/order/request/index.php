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
require_once(CLS_DIR . 'ProductStock.php');
require_once(CLS_DIR . 'ProductPrice.php');
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Settings.php');
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();
$product = new Product();
$stock = new ProductStock();
$price = new ProductPrice();
$order = new Order();
$settings = new Settings();
$contact = new Contact();
$page = new Page();
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
            $log->setErrorLog($order_data);
            exit;
        }
    } else {
        $err_flg = true;
    }
}

if ( !$err_flg ) {
    //商品情報取得
    $product_data = $product->getLangProduct($order_data['product_id']);
    if(!is_array($product_data)) {
        $smarty->assign('global_message', $product_data);
        $err_flg = true;
    }

    //コース情報取得
    $course_data = $stock->getCourse($order_data['product_id'], $order_data['course_id']);
    if(!is_array($course_data)) {
        $smarty->assign('global_message', $course_data);
        $err_flg = true;
    }

    //コースメタ情報取得
    $price_data = $price->getCourseMeta($order_data['course_id']);
    if(!is_array($price_data)) {
        $smarty->assign('global_message', $price_data);
        $err_flg = true;
    }

    //事業者情報取得
    $settings_data = $settings->getLangPerson($order_data['PersonID']);
    if(!is_array($settings_data)) {
        $smarty->assign('global_message', $settings_data);
        $err_flg = true;
    }

    $page_data = $page->getLangPage(2, 4);

    //メール送信
    if( !isset($_SESSION['send_request_mail']) ) {
        $contact->sendRequestComp($order_data, $product_data, $course_data, $price_data, $settings_data);
        $_SESSION['send_request_mail'] = 1;
    }

    $temp_regist_date = DateTime::createFromFormat('Y年m月d日 H時i分s秒', $order_data['registDate']);
    $order_data['registDate_text'] =  $temp_regist_date->format(Constant::$formatYMDHIS);
    $order_data['oderDate_text'] = date(Constant::$formatYMD, strtotime($order_data['oderDate']));
}

$smarty->assign('err_flg', $err_flg);
$smarty->assign('data', $order_data);
$smarty->assign('product_data', $product_data);
$smarty->assign('course_data', $course_data);
$smarty->assign('price_data', $price_data);
$smarty->assign('settings_data', $settings_data);
$smarty->assign('page_data', $page_data);
$smarty->display(FRONT_DIR . 'order/request/index.tpl');
