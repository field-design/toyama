<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　商品代金・設定
機能名：
　商品代金・設定
*******************************************/
require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'ProductPriceMy.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

$price = new ProductPriceMy();

$err_flg = false;
$err_msg = array();

/**********************************************
◆ Ajax処理
***********************************************/
//料金取得
if( isset($_POST['addtype']) && $_POST['addtype'] == 'price_list' ) {
    $data = $price->getCourseMeta(htmlspecialchars($_POST['course_id']));
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}

//料金追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'price' ) {
    $smarty->assign('price_type', 0);
    $smarty->assign('price_value', '');
    $smarty->assign('price_condition', array());
    $smarty->assign('number', intval($_POST['container_option']));
    $smarty->display(ADMIN_DIR . 'addparts/product_price.tpl');
    exit;
}
//料金条件
if( isset($_POST['addtype']) && $_POST['addtype'] == 'price_condition' ) {
    if(intval($_POST['count']) >= 5) {
        exit;
    }
    $smarty->assign('placeholder', '例：6歳以上');
    $smarty->assign('input_name', 'price_condition' . intval($_POST['container_option']) . '[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_single.tpl');
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/
//=============
// データ設定
//=============

//商品全コース取得
$data_course;
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $data_course = $price->getCourse(htmlspecialchars($_POST['product_id']));
} elseif( isset($_GET['ProductID']) ) {
    $data_course = $price->getCourse(htmlspecialchars($_GET['ProductID']));
} 

//データ取得
$data;
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $data = $price->getPostData();
} elseif( isset($_GET['ProductID']) ) {
    $data = array();
    if( isset($_GET['CourseID']) ) {
        $data['course_id'] = htmlspecialchars($_GET['CourseID']);
    } else {
        $data['course_id'] = $data_course['course_id'][0];
    }
} else {
    $data = MESSAGE_ERROR_DB_NO_DATA;
}
if(!is_array($data)) {
    $err_flg = true;
}

//=============
// データ登録
//=============

if( !$err_flg ) {
    //入力チェック
    if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
        $err_msg = $price->checkInput($data);
        if( !empty(implode('', $err_msg)) ) {
            $err_flg = true;
        }
    }
}
if( !$err_flg ) {
    //登録
    if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
        $data = $price->update($data);
    }
}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = $price->getPostData();
}

$smarty->assign('data_course', $data_course);
$smarty->assign('data', $data);
$smarty->assign('err_msg', $err_msg);
$smarty->display(ADMIN_DIR . 'product/price/setting/index.tpl');

