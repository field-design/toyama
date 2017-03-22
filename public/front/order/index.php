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
require_once(CLS_DIR . 'Order.php');

$product = new Product();

//公開商品取得
if( isset($_GET['ProductID']) ) {
    $data = $product->getProduct(htmlspecialchars($_GET['ProductID']), 1);
}

//データがなければリダイレクト
if( !isset($data) || !is_array($data) ) {
    header('Location: ' . URL_ROOT_PATH . 'niikawa/');
    exit;
}

//在庫チェック

//在庫がなければリダイレクト

$smarty = new SmartyExtends();

$smarty->display(FRONT_DIR . 'order/index.tpl');
