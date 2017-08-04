<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　受注詳細
機能名：
　受注詳細
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'ProductStock.php');
require_once(CLS_DIR . 'ProductPrice.php');
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Settings.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

//受注データ取得
$product = new Product();
$stock = new ProductStock();
$order = new Order($login);
$price = new ProductPrice();

$err_flg = false;

if( isset($_POST['OderID']) ) {
    $data = $order->getOrder(htmlspecialchars($_POST['OderID']));
} else {
    $data = $order->getOrder(htmlspecialchars($_GET['OderID']));
}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = array();
    $err_flg = true;
}

if( !$err_flg ) {
    
    //商品情報取得
    $product_data = $product->getProduct($data['product_id']);
    if(!is_array($product_data)) {
        $smarty->assign('global_message', $product_data);
        $err_flg = true;
    }

    //コース情報取得
    $course_data = $stock->getCourse($data['product_id'], $data['course_id']);
    if(!is_array($course_data)) {
        $smarty->assign('global_message', $course_data);
        $err_flg = true;
    }

    //コースメタ情報取得
    $price_data = $price->getCourseMeta($data['course_id']);
    if(!is_array($price_data)) {
        $smarty->assign('global_message', $price_data);
        $err_flg = true;
    }
}

if( !$err_flg ) {

    if( isset($_POST['approval']) ) {

        if( $_POST['approval'] == 'ok' ) {
            //承認処理
            $data = $order->update_approval($data);

            if(!is_array($data)) {
                $smarty->assign('global_message', $data);
                $data = array();
            }

            //承認メール送信
            $settings = new Settings();

            $product_data_mail;
            if($data['lang'] == 2) {
                $settings_data = $settings->getLangPerson($data['PersonID'], 2);
                require_once(CLS_DIR . 'en/Contact.php');
                $product_data_mail = $product->getLangProduct($data['product_id'], 2);
            } else {
                $settings_data = $settings->getLangPerson($data['PersonID']);
                require_once(CLS_DIR . 'jp/Contact.php');
                $product_data_mail = $product->getLangProduct($data['product_id']);
            }
            $contact = new Contact();
            $contact = $contact->sendRequestApproval($data, $product_data_mail, $course_data, $price_data, $settings_data);
 
        } elseif( $_POST['approval'] == 'cancel' ) {
            //非承認処理
            $data = $order->update_approval_cancel($data);

            if(!is_array($data)) {
                $smarty->assign('global_message', $data);
                $data = array();
            }

            //非承認メール送信
            $settings = new Settings();

            $product_data_mail;
            if($data['lang'] == 2) {
                $settings_data = $settings->getLangPerson($data['PersonID'], 2);
                require_once(CLS_DIR . 'en/Contact.php');
                $product_data_mail = $product->getLangProduct($data['product_id'], 2);
            } else {
                $settings_data = $settings->getLangPerson($data['PersonID']);
                require_once(CLS_DIR . 'jp/Contact.php');
                $product_data_mail = $product->getLangProduct($data['product_id']);
            }
            $contact = new Contact();
            $contact = $contact->sendRequestApprovalCancel($data, $product_data_mail, $course_data, $price_data, $settings_data);
 
        }
    }

    $data['oderDate'] = date('Y/m/d', strtotime($data['oderDate']));
    //決済情報URL
    $enc_id = sha1(ORDER_ID_SALT . $data['OderID']);
    $data['payment_url'] = URL_ROOT_PATH_HOST . "/order/requestapp/?order=" . $enc_id . "&date=" . date('Y-m-d', strtotime($data['oderDate']));

}

$smarty->assign('data', $data);
$smarty->assign('product_data', $product_data);
$smarty->assign('course_data', $course_data);
$smarty->assign('price_data', $price_data);
$smarty->display(ADMIN_DIR . 'order/edit/index.tpl');
