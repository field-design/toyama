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
require_once(CLS_DIR . 'Order.php');
require_once(CLS_DIR . 'Contact.php');
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
$order = new Order();

if( isset($_POST['OderID']) ) {
    $data = $order->getOrder(htmlspecialchars($_POST['OderID']));
} else {
    $data = $order->getOrder(htmlspecialchars($_GET['OderID']));
}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = array();
}

if( isset($_POST['OderID']) ) {
    //承認処理
    $data = $order->update_approval($data);

    if(!is_array($data)) {
        $smarty->assign('global_message', $data);
        $data = array();
    }

    //承認メール送信
    $settings = new Settings();
    $settings_data = $settings->getSettings($data['PersonID']);
    $contact = new Contact();
    $contact = $contact->sendRequestApproval($data, $settings_data);
}

$data['oderDate'] = date('Y月m日d', strtotime($data['oderDate']));

$smarty->assign('data', $data);
$smarty->display(ADMIN_DIR . 'order/edit/index.tpl');
