<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　商品ページアクセス（MySQL）
機能名：
　商品ページアクセス（MySQL）
*******************************************/
class ProductAccessMy {
    function __construct() {

    }

    /******************************
    商品ページアクセス保存
    *******************************/
    function access($product_id) {
        $db = new DB();

        $params = array();
        $params['product_id'] = $product_id;

        $err_msg = $db->execInsert('t_product_access', $params);

        if( !empty($err_msg) ) {
            $log = new Log();
            $log->setErrorLog($err_msg);
        }
    }
}