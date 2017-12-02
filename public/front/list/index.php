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
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();

//商品リスト取得
$product = new Product();
$page = new Page();

$page_data = $page->getLangPage(1, 3);

$area_detail = null;
$area_text = '';
$category = null;
$category_text = '';

if( isset($_GET['area']) ) {
    $area_detail = htmlspecialchars($_GET['area']);
    $area = explode('_', $area_detail)[0];
    if( array_key_exists($area, Constant::$aryArea) ) {

        $ary_area = Constant::$aryAreaDetail[$area];

        if(  array_key_exists($area_detail, $ary_area) ) {
            $area_text = $ary_area[$area_detail];
        } else {
            $area_text = Constant::$aryArea[$area];
        }
    } else {
        $area_detail = null;
    }
}
if( isset($_GET['Category']) ) {
    $category = htmlspecialchars($_GET['Category']);
    if( array_key_exists($category, Constant::$aryCategory) ) {
        $category_text = Constant::$aryCategory[$category];
    } else {
        $category = null;
    }
}

//１ページの表示件数
$count_per_page = 12;

//ページネーション作成
$count_plan = $product->getProductTotalCount(1, $area_detail, $category);

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
$productlist = $product->getProductListView($count_per_page, $current_page, 1, $area_detail, $category, 2);

$smarty->assign('pager', $pager);
$smarty->assign('current_page', $current_page);
$smarty->assign('productlist', $productlist);
$smarty->assign('area_detail', $area_detail);
$smarty->assign('area_text', $area_text);
$smarty->assign('category', $category);
$smarty->assign('category_text', $category_text);
$smarty->assign('page_data', $page_data);
$smarty->display(FRONT_DIR . 'list/index.tpl');
