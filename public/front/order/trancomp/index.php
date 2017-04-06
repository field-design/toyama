<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　決済結果通知処理ページ
機能名：
　決済結果通知処理ページ
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
    echo '1';
    exit;
}

if ( !$err_flg ) {
    if( isset($_POST['ErrCode']) && !empty($_POST['ErrCode'])) {
        $log->setErrorLog(htmlspecialchars($_POST['OrderID']));
        $log->setErrorLog(htmlspecialchars($_POST['ErrCode']));
        $err_flg = true;
    }
    if( isset($_POST['ErrInfo'])  && !empty($_POST['ErrInfo'])) {
        $log->setErrorLog(htmlspecialchars($_POST['ErrInfo']));
        $err_flg = true;
    }
    if($err_flg) {
        echo '1';
        exit;
    }
}

//申し込みデータ取得
if ( !$err_flg ) {
    if( isset($_POST['OrderID']) ) {
        $order_data = $order->getOrder(htmlspecialchars($_POST['OrderID']));
        if(!is_array($order_data)) {
            echo '1';
            exit;
        }
    } else {
        $err_flg = true;
    }
}

if ( !$err_flg ) {
    if( !isset($_POST['PayType']) ) {
        echo '1';
        exit;
    }

    if( isset($_POST['Method']) ) {
        $order_data['Payment'] = htmlspecialchars($_POST['Method']);
    } else {
        $order_data['Payment'] = '';
    }
    if( isset($_POST['PayType']) ) {
        $order_data['settlementType'] = htmlspecialchars($_POST['PayType']);
    } else {
        $order_data['settlementType'] = '';
    }
    if( isset($_POST['Approve']) ) {
        $order_data['CreditNumber'] = htmlspecialchars($_POST['Approve']);
    } else {
        $order_data['CreditNumber'] = '';
    }

    if( $order_data['settlementType'] == 0 ) {
        $order_data['Correspondence'] = 4;
        $paymentDate = htmlspecialchars($_POST['TranDate']);
        $order_data['paymentDate'] = substr($paymentDate, 0, 4) . '/' . substr($paymentDate, 4, 2) . '/' . substr($paymentDate, 6, 2) . ' ' . substr($paymentDate, 8, 2) . ':' . substr($paymentDate, 10, 2);
    } else {
        $order_data['Correspondence'] = 2;
        $order_data['paymentDate'] = '';
    }

    if( isset($_POST['Amount']) ) {
        $order_data['settlement'] = htmlspecialchars($_POST['Amount']);
    } else {
        $order_data['settlement'] = '';
    }

    if( isset($_POST['FinishDate']) && $_POST['FinishDate'] != '' ) {
        $paymentDate = htmlspecialchars($_POST['FinishDate']);
        $order_data['paymentDate'] = substr($paymentDate, 0, 4) . '/' . substr($paymentDate, 4, 2) . '/' . substr($paymentDate, 6, 2) . ' ' . substr($paymentDate, 8, 2) . ':' . substr($paymentDate, 10, 2);
    }

    if( isset($_POST['Status']) ) {
        if( htmlspecialchars($_POST['Status']) == 'CAPTURE' ) {
            $order_data['Correspondence'] = '4';
        } elseif( htmlspecialchars($_POST['Status']) == 'PAYSUCCESS' ) {
            $order_data['Correspondence'] = '4';

        } elseif( htmlspecialchars($_POST['Status']) == 'VOID' ) {
            $order_data['Correspondence'] = '3';
        } elseif( htmlspecialchars($_POST['Status']) == 'RETURN' ) {
            $order_data['Correspondence'] = '3';
        } elseif( htmlspecialchars($_POST['Status']) == 'CANCEL' ) {
            $order_data['Correspondence'] = '3';
        }
    }

    //結果データ更新
    $order_data = $order->update_payment($order_data);

    if(!is_array($order_data)) {
        echo '1';
        exit;
    }

    echo '0';
    exit;
}
