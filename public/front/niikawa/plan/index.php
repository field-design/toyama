<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　商品詳細ページ
機能名：
　商品詳細ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Settings.php');

$smarty = new SmartyExtends();

$product = new Product();
$settings = new Settings();

/**********************************************
◆ Ajax処理
***********************************************/
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calendar' ) {
    $data = $product->getProductStock(htmlspecialchars($_POST['plan']), htmlspecialchars($_POST['ym']));
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/

if( isset($_GET['plan']) ) {
    $data = $product->getProduct(htmlspecialchars($_GET['plan']), 1);
}

if( !isset($data) || !is_array($data) ) {
    header('Location: ' . URL_ROOT_PATH . 'niikawa/');
    exit;
}

$person = $settings->getSettings($data['PersonID']);

$smarty->assign('data', $data);
$smarty->assign('person', $person);
$smarty->display(FRONT_DIR . 'niikawa/plan/index.tpl');
