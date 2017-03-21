<?php

/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　セッション管理
機能名：
　セッション管理
*******************************************/

$cls_session = new Session();

class Session {

    function __construct() {
        session_start();
    }

    function clearSession() {
        session_destroy();
    }

    function getSessionID() {
        return session_id();
    }

}