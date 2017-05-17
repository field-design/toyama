<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　富山ページ設定
機能名：
　富山ページ設定
*******************************************/
require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'FileUploader.php');
require_once(CLS_DIR . 'ProductMy.php');
require_once(CLS_DIR . 'PageMy.php');

$login = new Login();
$smarty = new SmartyExtends();

$product = new ProductMy();
$page = new PageMy();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

/**********************************************
◆ Ajax処理
***********************************************/

// Session.php
global $cls_session;

// 一時アップロードディレクトリ作成
$tmpdir = $cls_session->getSessionID();
$uploader = new FileUploader($tmpdir);

//==========
// アップロードファイル重複チェック
//==========
if(isset($_POST['fileapi_check']) && isset($_FILES['files'])) {
    
    $ary_result = $uploader->checkExistFiles();

    header('Content-Type: application/json');
    echo json_encode($ary_result);
    exit;
}

//==========
// スライド画像
//==========
if( isset($_POST['addtype']) && $_POST['addtype'] == 'slide_photo' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('number', intval($_POST['container_option']) + 1);
    $smarty->assign('photo', '');
    $smarty->display(ADMIN_DIR . 'addparts/page_slide_photo.tpl');
    exit;
}

//スライド画像追加
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'slide_image' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    header('Content-Type: application/json');
    echo json_encode($ary_result);
    exit;
}


/**********************************************
◆ メイン処理
***********************************************/
$err_flg = false;

//=============
// データ取得
//=============

//商品リスト取得
$product_list = $product->getProductListView(100);
if(!is_array($product_list)) {
    $smarty->assign('global_message', $product_list);
    $err_flg = true;
}

//ページデータ取得
$data = array();
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $data = $page->getPostData();
} elseif( isset($_GET['PageID']) ) {
    $data = $page->getPageData(htmlspecialchars($_GET['PageID']));
} else {
    $data = MESSAGE_ERROR_DB_NO_DATA;
}
if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $err_flg = true;
}

//=============
// データ登録
//=============

//登録処理
$err_msg = array();

//入力チェック
if( !$err_flg ) {
    if( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
        $err_msg = $page->checkInput($data);
        if( !empty(implode('', $err_msg)) ) {
            $err_flg = true;
        }
    }
}

if( !$err_flg ) {
    //登録
    if( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
        $data = $page->update($product_list, $data);
    }
}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = $page->getPostData();
}

$smarty->assign('product_list', $product_list);
$smarty->assign('data', $data);
$smarty->assign('err_msg', $err_msg);
$smarty->display(ADMIN_DIR . 'page/top/index.tpl');
