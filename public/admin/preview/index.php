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
require_once(CLS_DIR . 'ProductStock.php');
require_once(CLS_DIR . 'ProductPrice.php');
require_once(CLS_DIR . 'ProductAccess.php');
require_once(CLS_DIR . 'Settings.php');

$login = new Login();

//未ログインならログインページへ
$login->notLoginToRedirect();

$product = new Product();
$stock = new ProductStock();
$price = new ProductPrice();
$access = new ProductAccess();
$settings = new Settings();

/**********************************************
◆ Ajax処理
***********************************************/
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calendar' ) {
    $stock_data = $stock->getCourseCurrentStock(htmlspecialchars($_POST['course_id']), htmlspecialchars($_POST['ym']));
    $close_data = $stock->getCourseClose(htmlspecialchars($_POST['course_id']));

    $stock_data['close_date'] = intval($close_data['close_date']);
    if($close_data['close_time'] == '') {
        $stock_data['close_time'] = '0000';
    } else {
        $stock_data['close_time'] = substr($close_data['close_time'], 0, 2) . substr($close_data['close_time'], 3, 2);
    }

    header('Content-Type: application/json');
    echo json_encode($stock_data);
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/

//POSTデータ取得
$post_data = $product->getPostData(true);
$price_list = array();
foreach($post_data['course_id'] as $course_id) {
    $price_list[] = $price->getCourseMeta($course_id);
}

if($post_data['lang'] == 2) {
    $person = $settings->getLangPerson($post_data['person_id'], 2);
    $smarty = new SmartyExtends('templates_en');
} else {
    $smarty = new SmartyExtends();
    $person = $settings->getLangPerson($post_data['person_id'], 1);
}
$smarty->assign('data', $post_data);
$smarty->assign('price_list', $price_list);
$smarty->assign('person', $person);
$smarty->display(FRONT_DIR . 'niikawa/plan/index.tpl');
