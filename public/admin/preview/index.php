<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　プレビュー
機能名：
　プレビュー
*******************************************/
require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Settings.php');

$login = new Login();

//未ログインならログインページへ
$login->notLoginToRedirect();

$smarty = new SmartyExtends();

$product = new Product();
$settings = new Settings();

/**********************************************
◆ Ajax処理
***********************************************/
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calendar' ) {
    $data = $product->getProductStock(htmlspecialchars($_POST['ProductID']), htmlspecialchars($_POST['ym']));
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/

//POSTデータ取得
$post_data = $product->getPostData();
$person = $settings->getSettings($post_data['PersonID']);

$smarty->assign('data', $post_data);
$smarty->assign('person', $person);
$smarty->display(FRONT_DIR . 'niikawa/plan/index.tpl');
