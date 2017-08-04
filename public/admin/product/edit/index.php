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
require_once(CLS_DIR . 'jp/Contact.php');

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
// 表示用料金
//=============
if( isset($_POST['addtype']) && $_POST['addtype'] == 'disp_course' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('course_number', intval($_POST['count']));
    $smarty->assign('disp_course', '');
    $smarty->assign('disp_price_title', '');
    $smarty->assign('disp_price_type', array());
    $smarty->assign('disp_price_value', array());
    $smarty->assign('disp_price_condition', array());
    $smarty->assign('err_msg', array());
    $smarty->display(ADMIN_DIR . 'addparts/product_disp_course.tpl');
    exit;
}

//料金追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'price' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('disp_price_type', 0);
    $smarty->assign('disp_price_value', '');
    $smarty->assign('disp_price_condition', array());
    $smarty->assign('course_number', intval($_POST['container_option']));
    $smarty->assign('price_number', intval($_POST['container_option']) * 100 + intval($_POST['count']));
    $smarty->display(ADMIN_DIR . 'addparts/product_disp_price.tpl');
    exit;
}
//料金条件
if( isset($_POST['addtype']) && $_POST['addtype'] == 'price_condition' ) {
    if(intval($_POST['count']) >= 5) {
        exit;
    }
    $course_number = intval(intval($_POST['container_option']) / 100);
    $price_number = substr($_POST['container_option'], -1, 2);   
    $smarty->assign('placeholder', '例：6歳以上');
    $smarty->assign('input_name', 'disp_price_condition[' . $course_number . '][' . $price_number . '][]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_single.tpl');
    exit;
}

//=============
// プラン情報
//=============

//ご旅行・プラン代金に含まれるもの追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'plan_info_included' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('placeholder', '例：タクシー乗車代');
    $smarty->assign('input_name', 'price_include[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_single.tpl');
    exit;
}

//=============
// 集合場所
//=============

//集合場所
if( isset($_POST['addtype']) && $_POST['addtype'] == 'location' ) {
    $smarty->assign('placeholder', '例：JR富山駅 新幹線改札前　9:20集合');
    $smarty->assign('meeting_place', '');
    $smarty->assign('meeting_place_address', '');
    $smarty->assign('coordinate', ADMIN_INIT_LAT . ',' . ADMIN_INIT_LNG);
    $smarty->display(ADMIN_DIR . 'addparts/product_map.tpl');
    exit;
}

//=============
// 注意事項その他
//=============
if( isset($_POST['addtype']) && $_POST['addtype'] == 'caution' ) {
    if(intval($_POST['count']) >= 5) {
        exit;
    }
    $smarty->assign('placeholder', '例：おとな1名 こども1名でお申込みの場合は、おとな2名での価格として取り扱いさせていただきます。');
    $smarty->assign('input_name', 'notes[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}
if( isset($_POST['addtype']) && $_POST['addtype'] == 'other' ) {
    if(intval($_POST['count']) >= 5) {
        exit;
    }
    $smarty->assign('placeholder', '例：ます寿し1/8カットサイズの試食ができます。店舗は当日のお任せになります。');
    $smarty->assign('input_name', 'others[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}

//=============
// 取消料
//=============
if( isset($_POST['addtype']) && $_POST['addtype'] == 'cancel_rate' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('cancel_charge_text', '');
    $smarty->assign('cancel_charge_rate', 1);
    $smarty->display(ADMIN_DIR . 'addparts/product_cancel.tpl');
    exit;
}
if( isset($_POST['addtype']) && $_POST['addtype'] == 'cancel_note' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('placeholder', '例：オプショナルプランも上記取消料率による取消料が利用日を基準として別途適用されます。ただし、旅行開始後の取消料は100％となります。');
    $smarty->assign('input_name', 'cancel_notes[]');
    $smarty->assign('value', '');
    $smarty->assign('style', 'style="min-height: 60px; min-width: auto;"');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}

//=============
// お申し込み
//=============
//コース
if( isset($_POST['addtype']) && $_POST['addtype'] == 'product_course' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('course_id', '');
    $smarty->assign('course_name', '');
    $smarty->assign('number', 1);
    $smarty->display(ADMIN_DIR . 'addparts/product_course.tpl');
    exit;
}

//=============
// プラン内容
//=============

//プラン内容追加
if( isset($_POST['addtype']) && $_POST['addtype'] == 'product_plan' ) {
    if(intval($_POST['count']) >= 10) {
        exit;
    }
    $smarty->assign('number', intval($_POST['container_option']) + 1);
    $smarty->assign('title', '');
    $smarty->assign('photo', '');
    $smarty->assign('detail', '');
    $smarty->assign('link', '');
    $smarty->display(ADMIN_DIR . 'addparts/product_plan.tpl');
    exit;
}

//プラン内容画像追加
if( isset($_POST['fileapi_uploadtype']) && $_POST['fileapi_uploadtype'] == 'course_image' && isset($_FILES['files']) ) {

    $ary_result = $uploader->upload();

    header('Content-Type: application/json');
    echo json_encode($ary_result);
    exit;
}

//=============
// 質問事項
//=============
if( isset($_POST['addtype']) && $_POST['addtype'] == 'question' ) {
    if(intval($_POST['count']) >= 5) {
        exit;
    }
    $smarty->assign('placeholder', '例：食物アレルギーをお持ちですか？');
    $smarty->assign('input_name', 'question[]');
    $smarty->assign('value', '');
    $smarty->display(ADMIN_DIR . 'addparts/sortable_multi.tpl');
    exit;
}

/**********************************************
◆ メイン処理
***********************************************/
$product = new Product($login);

//サイドバーメニューに商品編集リストを表示
$smarty->assign('menu_product', true);

$err_flg = false;
$err_msg = array();

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
// 削除処理
//=============
if( !$err_flg ) {
    if( isset($_POST['proc']) ) {
        $proc = htmlspecialchars($_POST['proc']);
        $product_id = htmlspecialchars($data['product_id']);
        if($proc == 'delete') {
            $err_msg = $product->delete($product_id);
        }
        if( !empty($err_msg) ) {
            $smarty->assign('global_message', $err_msg);
            $err_flg = true;
        } else {
            header('Location: ' . URL_ROOT_PATH_ADMIN . 'product/');
            exit;
        }
    }
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
            if (isset($err_msg['nextsection'])) {
                $nextsection = $err_msg['nextsection'];
            }
            $err_flg = true;
        }
    }
}


//公開リクエスト送信
if( !$err_flg ) {
    if(isset($_POST['request']) && $_POST['request'] != '' && $data['publish_status'] == 3) {
        $contact = new Contact();
        $msg = $contact->publishRequest($data['title'], $login->getPersonID());
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

if($data['product_id'] == '') {
    $edit_type = 'new';
} else {
    $edit_type = 'edit';
}

$smarty->assign('data', $data);
$smarty->assign('err_msg', $err_msg);
$smarty->assign('edit_type', $edit_type);
$smarty->assign('protocol', empty($_SERVER["HTTPS"]) ? "http://" : "https://");
$smarty->display(ADMIN_DIR . 'product/edit/index.tpl');
