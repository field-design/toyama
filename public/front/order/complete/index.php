<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　申し込み完了ページ
機能名：
　申し込み完了ページ
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
        //エラー時リダイレクト
        header('Location: ' . URL_ROOT_PATH . 'niikawa/');
        exit;
    }
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
    //結果データ取得
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

    ////結果データ更新
    //$order_data = $order->update_payment($order_data);

    //if(!is_array($order_data)) {
    //    $smarty->assign('global_message', $order_data);
    //    $err_flg = true;
    //}

    //追加情報
    $order_data['oderDate_text'] = date('Y年m月d日', strtotime($order_data['oderDate']));

    if( isset($_POST['CvsCode']) ) {
        $order_data['CvsCode'] = htmlspecialchars($_POST['CvsCode']);
    } else {
        $order_data['CvsCode'] = '';
    }
    if( isset($_POST['CvsReceiptNo']) ) {
        $order_data['CvsReceiptNo'] = htmlspecialchars($_POST['CvsReceiptNo']);
    } else {
        $order_data['CvsReceiptNo'] = '';
    }
    if( isset($_POST['CvsConfNo']) ) {
        $order_data['CvsConfNo'] = htmlspecialchars($_POST['CvsConfNo']);
    } else {
        $order_data['CvsConfNo'] = '';
    }
    if( isset($_POST['CvsReceiptUrl']) ) {
        $order_data['CvsReceiptUrl'] = htmlspecialchars($_POST['CvsReceiptUrl']);
    } else {
        $order_data['CvsReceiptUrl'] = '';
    }


    //事業者情報取得
    $settings_data = $settings->getSettings($order_data['PersonID']);
    if(!is_array($settings_data)) {
        $smarty->assign('global_message', $settings_data);
        $err_flg = true;
    }

    //メール送信
    if( !isset($_SESSION['send_comp_mail']) ) {
        if( $order_data['settlementType'] == 0 ) {
            $contact->sendCardOrderComp($order_data, $settings_data);
        } elseif( $order_data['settlementType'] == 3 ) {
            $contact->sendConveniOrderComp($order_data, $settings_data);
        }
        $_SESSION['send_comp_mail'] = 1;
    }
    
}

$smarty->assign('err_flg', $err_flg);
$smarty->assign('data', $order_data);
$smarty->assign('settings_data', $settings_data);
$smarty->display(FRONT_DIR . 'order/complete/index.tpl');
