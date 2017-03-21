<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　商品登録・編集
機能名：
　商品登録・編集
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'FileUploader.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Contact.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

/**********************************************
◆ Ajax処理
***********************************************/

// グローバル変数取得
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
// 基本情報
//==========

//基本情報メイン画像追加
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'main_image' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    if( count($ary_result['url']) > 0 ) {
        $smarty->assign('main_photo_url', $ary_result['url'][0]);
    }
    $smarty->display(ADMIN_DIR . 'addparts/product_main_image.tpl');
    exit;
}

//=============
// 料金
//=============

//料金追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'price' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('plan_title', 1);
    $smarty->assign('plan_Fee', '');
    $smarty->assign('plan_Kind', 1);
    $smarty->display(ADMIN_DIR . 'addparts/product_price.tpl');
    exit;
}

//=============
// コースの内容
//=============

//コース追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'product_course' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('number', intval($_POST['count']) + 1);
    $smarty->assign('title', '');
    $smarty->assign('photo', '');
    $smarty->assign('CourseTitle', '');
    $smarty->assign('CourseDetail', '');
    $smarty->assign('CourseRink', '');
    $smarty->display(ADMIN_DIR . 'addparts/product_course.tpl');
    exit;
}

//コース内容画像追加
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'course_image' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    header('Content-Type: application/json');
    echo json_encode($ary_result);
    exit;
}

//=============
// プラン情報
//=============

//ご旅行・プラン代金に含まれるもの追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'plan_info' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('placeholder', '例：タクシー乗車代');
    $smarty->assign('input_name', 'plan_included[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_single.tpl');
    exit;
}

//=============
// 注意事項その他
//=============
if( isset($_POST['addtype']) && $_POST['addtype'] == 'caution' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('placeholder', '例：おとな1名 こども1名でお申込みの場合は、おとな2名での価格として取り扱いさせていただきます。');
    $smarty->assign('input_name', 'importantPoints[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}
if( isset($_POST['addtype']) && $_POST['addtype'] == 'other' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('placeholder', '例：ます寿し1/8カットサイズの試食ができます。店舗は当日のお任せになります。');
    $smarty->assign('input_name', 'Other[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/
$product = new Product();

//サイドバーメニューに商品編集リストを表示
$smarty->assign('menu_product', true);

$err_flg = false;

//=============
// データ設定
//=============
$data;
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $data = $product->getPostData();
} elseif( isset($_GET['ProductID']) ) {
    $data = $product->getProduct(htmlspecialchars($_GET['ProductID']));
} else {
    $data = $product->getNewData();
}
if(!is_array($data)) {
    $err_flg = true;
}

//=============
// データ登録
//=============

$nextsection = isset($_POST['nextsection']) ? $_POST['nextsection'] : '0';

//入力チェック
if( !$err_flg ) {
    if(isset($_POST['nextsection']) && $_POST['nextsection'] != '') {
        $err_msg = $product->checkInput($data, $nextsection);
        if( !empty(implode('', $err_msg)) ) {
            $smarty->assign('err_msg', $err_msg);
            if (isset($err_msg['nextsection'])) {
                $nextsection = $err_msg['nextsection'];
            }
            $err_flg = true;
        }
    }
}


//公開リクエスト送信
if( !$err_flg ) {
    if(isset($_POST['request']) && $_POST['request'] != '' && $data['mt_disp'] == 3) {
        $contact = new Contact();
        $msg = $contact->publishRequest($data['title']);
        if(!empty($msg)) {
            $smarty->assign('global_message', $msg);
            $err_flg = true;
        }
    }
}


if( !$err_flg ) {
    //登録
    if(isset($_POST['nextsection']) && $_POST['nextsection'] != '') {
        $data = $product->update($data, $login->getPersonID());
    }
}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = $product->getPostData();
}

$data['nextsection'] = $nextsection;

if($data['ProductID'] == '') {
    $edit_type = 'new';
} else {
    $edit_type = 'edit';
}

$smarty->assign('data', $data);
$smarty->assign('edit_type', $edit_type);
$smarty->assign('protocol', empty($_SERVER["HTTPS"]) ? "http://" : "https://");
$smarty->display(ADMIN_DIR . 'product/edit/index.tpl');
