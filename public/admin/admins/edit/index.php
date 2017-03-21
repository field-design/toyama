<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　プロフィール
機能名：
　プロフィール
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'Settings.php');
require_once(CLS_DIR . 'FileUploader.php');

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

//画像アップロード
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'main_img' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    if( count($ary_result['url']) > 0 ) {
        $smarty->assign('image_url', $ary_result['url'][0]);
    }
    $smarty->assign('input_name', 'photo_text');
    $smarty->display(ADMIN_DIR . 'addparts/settings_image.tpl');
    exit;
}

//ロゴアップロード
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'logo_img' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    if( count($ary_result['url']) > 0 ) {
        $smarty->assign('image_url', $ary_result['url'][0]);
    }
    $smarty->assign('input_name', 'logomark');
    $smarty->display(ADMIN_DIR . 'addparts/settings_image.tpl');
    exit;
}

//取消料
if( isset($_POST['addtype']) && $_POST['addtype'] == 'calcel' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('mt_cancel_ttl', '');
    $smarty->assign('MtCancelRatio', '');
    $smarty->display(ADMIN_DIR . 'addparts/settings_cancel.tpl');
    exit;
}
//注釈
if( isset($_POST['addtype']) && $_POST['addtype'] == 'note' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('placeholder', '例：オプショナルプランも上記取消料率による取消料が利用日を基準として別途適用されます。ただし、旅行開始後の取消料は100％となります。');
    $smarty->assign('input_name', 'mt_cancel_note[]');
    $smarty->assign('style', 'style="min-height: 60px; min-width: auto;"');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}

//PDFファイルアップロード
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'pdf_file' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    if( count($ary_result['url']) > 0 ) {
        $smarty->assign('url', $ary_result['url'][0]);
    }
    $smarty->display(ADMIN_DIR . 'addparts/settings_pdf_file.tpl');
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/

//=============
// データ設定
//=============
$settings = new Settings();

$data;
if ( $_SERVER['REQUEST_METHOD'] == 'POST' ) {
    $data = $settings->getPostData();
} elseif( isset($_GET['PersonID']) ) {
    $data = $settings->getSettings(htmlspecialchars($_GET['PersonID']));
} else {
    $data = $settings->getNewData();
}

//=============
// エラー処理
//=============
if( !is_array($data) ) {
    $smarty->assign('global_message', $data);
    $data = $settings->getPostData();
} else {
    $err_flg = false;

    //システム管理者でないとき
    if( !$login->isAuthAdmin() ) {

        if( $data['PersonID'] == '' ) {
            //新規登録不可
            $err_flg = true;
            $smarty->assign('global_message', MESSAGE_ERROR_NO_AUTH);
        } elseif( $data['PersonID'] != $login->getPersonID() ) {
            //他事業者の編集不可
            $err_flg = true;
            $smarty->assign('global_message', MESSAGE_ERROR_NO_AUTH);
        }
    }

    if ( $err_flg ) {
        $data = $settings->getNewData();
        $smarty->assign('data', $data);
        $smarty->assign('err_flg', $err_flg);
        $smarty->display(ADMIN_DIR . 'admins/edit/index.tpl');
        exit;
    }
}

//=============
// データ登録
//=============
if(isset($_POST['update'])) {

    //入力チェック
    $err_msg = $settings->checkInputParam($data);

    if( !empty(implode('', $err_msg)) ) {

        $smarty->assign('err_msg', $err_msg);
        $smarty->assign('global_message', MESSAGE_ERROR_INPUT);

    } else {
        //登録
        if( $login->isAuthAdmin() && $data['PersonID'] == $login->getPersonID()) {
            $data['authority'] = $login->getAuthority();
        }
        $data = $settings->update($data);
    }

}

if(!is_array($data)) {
    $smarty->assign('global_message', $data);
    $data = $settings->getPostData();
}

$smarty->assign('data', $data);
$smarty->assign('err_flg', false);
$smarty->display(ADMIN_DIR . 'admins/edit/index.tpl');
