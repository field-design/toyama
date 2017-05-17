<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　申込（お客様情報入力）ページ
機能名：
　申込（お客様情報入力）ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'ProductMy.php');
require_once(CLS_DIR . 'ProductStockMy.php');
require_once(CLS_DIR . 'OrderMy.php');

$smarty = new SmartyExtends();
$product = new ProductMy();
$stock = new ProductStockMy();
$order = new OrderMy();
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
    //保持データ取得
    $order_data = $order->setSessionToOrder($order_data);
    if(!is_array($order_data)) {
        //データが取得できなければリダイレクト
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_SESSION_DATA);
        exit;
    }
}

//商品データチェック
if( !$err_flg ) {
    $product_data = $product->getProduct($order_data['ProductID'], 1);
    $course_data = $stock->getCourse($order_data['ProductID'], $order_data['course_id']);
    $order_date = strtotime($order_data['oderDate']);

    //商品データがなければリダイレクト
    if( !isset($product_data) || !is_array($product_data) || !$order_date) {
        $log->setErrorLog(MESSAGE_ERROR_SYSTEM_NO_PRODUCT_DATA);
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        exit;
    }
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

//=============
// 入力データチェック
//=============
if ( isset($_POST['prev']) ) {
    //データ保存
    $order->setOrderToSession($order_data);
    //確認へ
    header('Location: ' . URL_ROOT_PATH . 'order/');
    exit;
}
if ( isset($_POST['next']) ) {
    $err_msg = $order->checkInputCustomer($order_data);
    if( !empty(implode('', $err_msg)) ) {
        $smarty->assign('err_msg', $err_msg);
    } else {
        //データ保存
        $order->setOrderToSession($order_data);
        //確認へ
        header('Location: ' . URL_ROOT_PATH . 'order/check/');
        exit;
    }
}

$smarty->assign('const_pref', Constant::$aryPref);
$smarty->assign('order_data', $order_data);
$smarty->display(FRONT_DIR . 'order/input/index.tpl');
