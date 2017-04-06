<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　TOPページ
機能名：
　TOPページ
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

//１ページの表示件数
$count_per_page = 12;

//ページネーション作成
$count_plan = count($product->getProductListView(999, 1, 1, $area, $category));
$count_page = $count_plan / $count_per_page;
$count_page_mod = $count_plan % $count_per_page;
if($count_page_mod > 0) {
    $count_page += 1;
}

$pager = array();
for($i = 1; $i <= $count_page; $i++) {
    $pager[] = $i;
}

$current_page = 1;
if(isset($_GET['page'])) {
    $current_page = htmlspecialchars($_GET['page']);
    if(!is_numeric($current_page)) {
        $current_page = 1;
    }
}
$productlist = $product->getProductListView($count_per_page, $current_page, 1, $area, $category);

$smarty->assign('pager', $pager);
$smarty->assign('current_page', $current_page);
$smarty->assign('productlist', $productlist);

$smarty->display(FRONT_DIR . 'index.tpl');