<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　トップページ
機能名：
　トップページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');

$smarty = new SmartyExtends();

//商品リスト取得
$product = new Product();

$count_per_page = 6;

$productlist = $product->getProductListView($count_per_page, 1, 1);

$smarty->assign('productlist', $productlist);
$smarty->display(FRONT_DIR . 'niikawa/index.tpl');
