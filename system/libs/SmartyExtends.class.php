<?php

/* includes/init.phpで読み込み済み */
//require_once('../configs/conf.php');

require_once('Smarty.class.php');

class SmartyExtends extends Smarty {
  function __construct($template_dir = null) {
    parent::__construct();

    $this->template_dir = BASE_DIR . 'templates/';
  
    global $global_lang;
    if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
      if($global_lang == 2) {
        $this->template_dir = BASE_DIR . 'templates_en/';
      }
    }

    if(!is_null($template_dir)) {
        $this->template_dir = BASE_DIR . $template_dir . '/';
    }

    $this->compile_dir  = BASE_DIR . 'templates_c/';
    $this->config_dir   = CONF_DIR;
    $this->cache_dir    = BASE_DIR . 'cache/';

    // デフォルトで改行とサニタイズ
    //$this->default_modifiers = array('escape','nl2br');

   // 毎回コンパイルする(デバッグ用）
   //$this->force_compile = true;

  }

}
