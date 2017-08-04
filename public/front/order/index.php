<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　申込（人数・オプション）ページ
機能名：
　申込（人数・オプション）ページ
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
$page = new Page();
$log = new Log();

//=============
// データ設定
//=============
$order_data;
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $order_data = $order->getPostData();
} else {
    $order_data = $order->getNewData();
}

$err_flg = false;

//申し込みデータチェック
if(!is_array($order_data)) {
    $smarty->assign('global_message', $order_data);
    $err_flg = true;
}

if( !$err_flg ) {
    if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
        $order_data['ProductID'] = htmlspecialchars($_POST['plan']);
        $order_data['course_id'] = htmlspecialchars($_POST['course']);
        $order_data['oderDate'] = htmlspecialchars($_POST['ymd']);
    } else {
        if( isset($_GET['plan']) && isset($_GET['course']) && isset($_GET['ymd']) ) {
            $order->clearSession();
            $order_data['ProductID'] = htmlspecialchars($_GET['plan']);
            $order_data['course_id'] = htmlspecialchars($_GET['course']);
            $order_data['oderDate'] = htmlspecialchars($_GET['ymd']);
        }
    }
}

if( !$err_flg ) {
    //保持データ取得
    $session_data = $order->setSessionToOrder($order_data);

    if(is_array($session_data)) {
        $order_data = $session_data;
    }
}

//商品データチェック
if( !$err_flg ) {
    $product_data = $product->getLangProduct($order_data['ProductID']);
    //商品データがなければリダイレクト
    if( !isset($product_data) || !is_array($product_data) ) {
        $log = new Log();
        $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_PRODUCT_DATA);
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        exit;
    }

    $course_data = $stock->getCourse($order_data['ProductID'], $order_data['course_id']);
    $price_data = $price->getCourseMeta($order_data['course_id']);
    $order_date = strtotime($order_data['oderDate']);

    $order_data['oderDate_text'] = date(Constant::$formatYMD, $order_date);
}

//在庫チェック
if( !$err_flg ) {
    $stock_data = $stock->getCourseCurrentStock($order_data['course_id'], date('Y-m-01', $order_date));
    $stock_type = intval($stock_data['stock_type'][date('j', $order_date) - 1]);
    $stock_value = intval($stock_data['stock_value'][date('j', $order_date) - 1]);
    $stock_option = intval($stock_data['stock_option'][date('j', $order_date) - 1]);

    if( $stock_value == 0 ) {
        //在庫がないとき、リクエストプランでなければエラー
        if ($stock_type != 1 && $stock_option != 1) {
            $smarty->assign('global_message', MESSAGE_ERROR_DB_NO_STOCK);
            $err_flg = true;
        }
    }

    $select_volume = 0;
    foreach($order_data['amount'] as $value) {
        $select_volume += is_numeric($value) ? intval($value) : 0;
    }

    if( $stock_value - $select_volume < 0 ) {
        //在庫以上の購入の場合、リクエストプランでなければエラー
        if ($stock_type != 1 && $stock_option != 1) {
            $smarty->assign('global_message', MESSAGE_ERROR_OVER_STOCK);
            $err_flg = true;
        }
    }
}

//手じまい日チェック
if( !$err_flg ) {
    $msg = $stock->checkClosingOut($order_data['course_id'], $order_date);
    if( !empty($msg) ) {
        //手じまい日以降であっても、オプション１かつ過去日でなければリクエストプラン
        if($stock_option == 1 && (date('Ymd', $order_date) >= date('Ymd')) ) {
 
        } else {
            $smarty->assign('global_message', $msg);
            $err_flg = true;
        }
    }
}

//事業者情報取得
$settings_data = $settings->getLangPerson($product_data['person_id']);
if(!is_array($settings_data)) {
    $smarty->assign('global_message', $settings_data);
    $err_flg = true;
}

$page_data = $page->getLangPage(2, 4);

//=============
// 入力データチェック
//=============
if( !$err_flg ) {
    if ( isset($_POST['next']) ) {
        $err_msg = $order->checkInputVolume($order_data, $stock_type, $stock_value, $stock_option);

        if( !empty(implode('', $err_msg)) ) {
            $smarty->assign('err_msg', $err_msg);
            if(isset($err_msg['volume'])) {
                $smarty->assign('global_message', $err_msg['volume']);
            }
        } else {
            //データ保存
            $order->setOrderToSession($order_data);
            //お客様情報入力へ
            header('Location: ' . URL_ROOT_PATH . 'order/input/');
            exit;
        }
    }
}

$smarty->assign('product_data', $product_data);
$smarty->assign('course_data', $course_data);
$smarty->assign('price_data', $price_data);
$smarty->assign('order_data', $order_data);
$smarty->assign('settings_data', $settings_data);
$smarty->assign('page_data', $page_data);
$smarty->display(FRONT_DIR . 'order/index.tpl');
