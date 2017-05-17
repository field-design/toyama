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
require_once(CLS_DIR . 'ProductMy.php');
require_once(CLS_DIR . 'ProductStockMy.php');
require_once(CLS_DIR . 'ProductPriceMy.php');
require_once(CLS_DIR . 'ProductAccessMy.php');
require_once(CLS_DIR . 'Settings.php');

$smarty = new SmartyExtends();

$product = new ProductMy();
$stock = new ProductStockMy();
$price = new ProductPriceMy();
$access = new ProductAccessMy();
$settings = new Settings();

/**********************************************
◆ Ajax処理
***********************************************/
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calendar' ) {

    $stock_data = $stock->getCourseCurrentStock(htmlspecialchars($_POST['course_id']), htmlspecialchars($_POST['ym']));
    $close_data = $stock->getCourseClose(htmlspecialchars($_POST['course_id']));

    if($_POST['course_id'] != '') {
        $stock_data['close_date'] = intval($close_data['close_date']);
        if($close_data['close_time'] == '') {
            $stock_data['close_time'] = '0000';
        } else {
            $stock_data['close_time'] = substr($close_data['close_time'], 0, 2) . substr($close_data['close_time'], 3, 2);
        }
    }

    header('Content-Type: application/json');
    echo json_encode($stock_data);
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

$price_list = array();
foreach($data['course_id'] as $course_id) {
    $price_list[] = $price->getCourseMeta($course_id);
}
$person = $settings->getSettings($data['person_id']);
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

//商品ページアクセス保存
$access->access($data['product_id']);

$smarty->assign('data', $data);
$smarty->assign('price_list', $price_list);
$smarty->assign('person', $person);
$smarty->assign('recommend_data', $recommend_data);
$smarty->display(FRONT_DIR . 'niikawa/plan/index.tpl');
