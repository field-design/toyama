<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　ログ管理
機能名：
　ログ管理
*******************************************/
class Log {

    function __construct() {
        //エラーログ用ディレクトリ作成
        if( !file_exists(SYS_ERR_DIR) ) {
           mkdir(SYS_ERR_DIR, 0755);
           chmod(SYS_ERR_DIR, 0755);
        }
    }

    function setErrorLog($value) {
        error_log(date("Y/m/d H:i:s") . ' -> ' . var_export($value, true). PHP_EOL, 3, SYS_ERR_DIR . "system_errors.log");
    }
}