<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　予約カレンダー・設定
機能名：
　予約カレンダー・設定
*******************************************/
require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'ProductStockMy.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

$stock = new ProductStockMy();

$err_flg = false;
$err_msg = array();

/**********************************************
◆ Ajax処理
***********************************************/
//在庫取得
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calendar' ) {
    $data = $stock->getCourseStock(htmlspecialchars($_POST['course_id']));
    header('Content-Type: application/json');
    echo json_encode($data);
    exit;
}
//手じまい日取得
if( isset($_POST['addtype']) && $_POST['addtype'] == 'close' ) {
    $data = $stock->getCourseClose(htmlspecialchars($_POST['course_id']));
    if(!is_null($data['close_time']) && $data['close_time'] != '') {
        $data['close_time'] = substr($data['close_time'], 0, 5);
    }
    header('Content-Type: application/json');
    echo json_encode($data);
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
    $data_course = $stock->getCourse(htmlspecialchars($_POST['product_id']));
} elseif( isset($_GET['ProductID']) ) {
    $data_course = $stock->getCourse(htmlspecialchars($_GET['ProductID']));
} 

//データ取得
$data;
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $data = $stock->getPostData();
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
        $err_msg = $stock->checkInput($data);
        if( !empty(implode('', $err_msg)) ) {
            $err_flg = true;
        }
    }
}
if( !$err_flg ) {
    //登録
    if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
        $data = $stock->update($data);
    }
}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = $stock->getPostData();
}

$smarty->assign('data_course', $data_course);
$smarty->assign('data', $data);
$smarty->assign('err_msg', $err_msg);
$smarty->assign('protocol', empty($_SERVER["HTTPS"]) ? "http://" : "https://");
$smarty->display(ADMIN_DIR . 'product/calendar/setting/index.tpl');

