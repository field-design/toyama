<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　プラン一覧ページ
機能名：
　プラン一覧ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');

$smarty = new SmartyExtends();

//商品リスト取得
$product = new Product();

$area = null;
$category = null;

if( isset($_GET['area']) ) {
    $area = htmlspecialchars($_GET['area']);
}
if( isset($_GET['Category']) ) {
    $category = htmlspecialchars($_GET['Category']);
}

/*
$count_per_page = 1;
$count_plan = count($product->getProductListView(100, 1, 1));
$count_page = $count_plan / $count_per_page;
$count_page_mod = $count_plan % $count_per_page;
if($count_page_mod > 0) {
    $count_page += 1;
}

$page = array();
for($i = 1; $i <= $count_page; $i++) {
    $page[] = $i;
}
*/

$productlist = $product->getProductListView(12, 1, 1, $area, $category);

$smarty->assign('productlist', $productlist);
$smarty->display(FRONT_DIR . 'niikawa/list/index.tpl');
