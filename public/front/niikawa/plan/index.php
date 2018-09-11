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
require_once(CLS_DIR . 'ProductStock.php');
require_once(CLS_DIR . 'ProductPrice.php');
require_once(CLS_DIR . 'ProductAccess.php');
require_once(CLS_DIR . 'Settings.php');
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();

$product = new Product();
$stock = new ProductStock();
$price = new ProductPrice();
$access = new ProductAccess();
$settings = new Settings();
$page = new Page();

/**********************************************
◆ Ajax処理
***********************************************/
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calendar' ) {

    $disp_ym = htmlspecialchars($_POST['ym']);
    $disp_ym_time = strtotime($disp_ym);

    $stock_data = $stock->getCourseCurrentStock(htmlspecialchars($_POST['course_id']), $disp_ym);
    $close_data = $stock->getCourseClose(htmlspecialchars($_POST['course_id']));

    if($_POST['course_id'] != '') {
        $stock_data['close_date'] = intval($close_data['close_date']);
        if($close_data['close_time'] == '') {
            $stock_data['close_time'] = '0000';
        } else {
            $stock_data['close_time'] = substr($close_data['close_time'], 0, 2) . substr($close_data['close_time'], 3, 2);
        }
    }

    //当月の残り在庫計算
    $couse_change = htmlspecialchars($_POST['couse_change']);
    $couse_change = filter_var($couse_change, FILTER_VALIDATE_BOOLEAN);
    if($_POST['course_id'] != '' && $couse_change) {
        $adjust_teijmaibi = $stock_data['close_date'];
        if(date('Hi') >= $stock_data['close_time']) {
            $adjust_teijmaibi += 1;
        }
        $stock_value_left = array_slice($stock_data['stock_value'], intval(date('j')) - 1 + $adjust_teijmaibi);
        
        if (array_sum($stock_value_left) == 0) {
            //来月以降の在庫計算
            for($i=1; $i < STOCK_CHECK_MONTHS; $i++) {
                $next_ym = date('Y-m-d', strtotime('+' . $i . ' month', $disp_ym_time));
                $next_stock_data = $stock->getCourseCurrentStock(htmlspecialchars($_POST['course_id']), $next_ym);
                if (array_sum($next_stock_data['stock_value']) != 0) {
                    $disp_ym = $next_ym;
                    $stock_data = $next_stock_data;
                    break;
                }
            }
        } 
    }

    $stock_data['disp_ym'] = $disp_ym;

    header('Content-Type: application/json');
    echo json_encode($stock_data);
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/

if( isset($_GET['plan']) ) {
    $data = $product->getLangProduct(htmlspecialchars($_GET['plan']));
}

if( !isset($data) || !is_array($data) ) {
    header('Location: ' . URL_ROOT_PATH . 'niikawa/');
    exit;
}

$price_list = array();
foreach($data['course_id'] as $course_id) {
    $price_list[] = $price->getCourseMeta($course_id);
}

$person = $settings->getLangPerson($data['person_id']);

$area_detail = null;
$category = null;
foreach($data['area'] as $val) {
    if( array_key_exists('area' . $val, $data) ) {
        if( count($data['area' . $val]) > 0) {
            $area_detail = $data['area' . $val][0];
            break;
        }
    }
}

$recommend_data = $product->getProductListView(3, 1, 1, $area_detail, $category);
//にいかわページ情報取得
$page_data = $page->getLangPage(2, 4);

//商品ページアクセス保存
$access->access($data['product_id']);

global $global_lang;
$smarty->assign('lang', $global_lang);

$smarty->assign('data', $data);
$smarty->assign('price_list', $price_list);
$smarty->assign('person', $person);
$smarty->assign('recommend_data', $recommend_data);
$smarty->assign('page_data', $page_data);
if(isset($_GET['type'])) {
    $smarty->assign('type', htmlspecialchars($_GET['type']));    
}
$smarty->display(FRONT_DIR . 'niikawa/plan/index.tpl');
