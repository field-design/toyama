<?php

require_once(dirname(__FILE__) . '/../configs/conf.php');
require_once(CONF_DIR . 'message.php');

/***************
 * 言語設定
 ***************/
$global_lang = 1;

if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
    //フロントページ
    if(isset($_GET['lang'])) {
        $expire = time() + 60 * 60 * 24 * 60; //60日
        $global_lang = htmlspecialchars($_GET['lang']);
        setcookie('lang', '', time() - 3600);
        setcookie('lang', $global_lang, $expire, URL_ROOT_PATH);
    } else {
        if(isset($_COOKIE['lang'])) {
            $global_lang = htmlspecialchars($_COOKIE['lang']);
        }
    }
    if($global_lang == 2) {
        //英語
        require_once(CLS_DIR . 'en/Constant.php');
        require_once(CLS_DIR . 'en/Contact.php');
    } else {
        //日本語
        require_once(CLS_DIR . 'jp/Constant.php');
        require_once(CLS_DIR . 'jp/Contact.php');
    }
} else {
    //管理画面（クッキー登録しない）
    if(isset($_GET['lang'])) {
        $global_lang = htmlspecialchars($_GET['lang']);
        if($global_lang == 2) {
            require_once(CLS_DIR . 'en/Constant.php');
        } else {
            require_once(CLS_DIR . 'jp/Constant.php');
        }
    } else {
        require_once(CLS_DIR . 'jp/Constant.php');
    }
}

require_once(LIBS_DIR . 'SmartyExtends.class.php');
require_once(CLS_DIR . 'Session.php');
require_once(CLS_DIR . 'Log.php');
require_once(CLS_DIR . 'Util.php');
require_once(CLS_DIR . 'SpiralApi.php');
require_once(CLS_DIR . 'Entity.php');
require_once(CLS_DIR . 'DB.php');


