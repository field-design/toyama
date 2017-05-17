<?php
/******************************************
システム名： 
　旅行商品予約システム 管理サイト
コントローラ名：
　商品一覧
機能名：
　商品一覧
*******************************************/
require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Login.php');
require_once(CLS_DIR . 'ProductMy.php');

$login = new Login();
$smarty = new SmartyExtends();

//未ログインならログインページへ
$login->notLoginToRedirect();

//権限取得
$smarty->assign('is_admin', $login->isAuthAdmin());
//事業者ID取得
$smarty->assign('menu_person_id', $login->getPersonID());

$product = new ProductMy($login);

$err_flg = false;

if( !$err_flg ) {
    if( isset($_POST['proc']) && isset($_POST['product_id'])) {
        $proc = htmlspecialchars($_POST['proc']);
        $product_id = htmlspecialchars($_POST['product_id']);
        if($proc == 'delete') {
            $err_msg = $product->delete($product_id);
        } elseif($proc == 'copy') {
            $err_msg = $product->copy($product_id, $login->getPersonID());
        }
        if( !empty($err_msg) ) {
            $smarty->assign('global_message', $err_msg);
            $err_flg = true;
        }
    }
}

//商品リスト取得
$data_list = $product->getProductListView(100);
if(!is_array($data_list)) {
    $smarty->assign('global_message', $data_list);
    $err_flg = true;
}

$smarty->assign('data_list', $data_list);
$smarty->assign('protocol', empty($_SERVER["HTTPS"]) ? "http://" : "https://");
$smarty->display(ADMIN_DIR . 'product/index.tpl');
