<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　ログイン管理
機能名：
　ログイン管理
*******************************************/
define('SESSION_LOGIN_USER', 'session_login_user');
define('SESSION_LOGIN_AUTH', 'session_login_authority');

class Login {

    private $personID;
    private $authority;
    private $email;
    private $pass;

    function __construct() {
        // ユーザー取得
        $this->setPersonID();
        $this->setAuthority();
    }

    /******************************
    ログイン状況判定
    *******************************/
    function isLogin() {
        if($this->personID != '') {
            return true;
        }

        return false;
    }
    /******************************
    管理者判定
    *******************************/
    function isAuthAdmin() {
        if($this->authority == 1) {
            return true;
        }

        return false;
    }

    /******************************
    未ログイン時処理
    *******************************/
    function notLoginToRedirect() {
        if(!$this->isLogin()) {
            header('Location: ' . URL_ROOT_PATH_ADMIN . 'login/');
            exit;
        }
    }

    /******************************
    Setter＋入力チェック
    *******************************/
    //事業者ID
    function setPersonID($personID = '') {
        if($personID != '') {
            $this->personID = $personID;
            $_SESSION[SESSION_LOGIN_USER] = $personID;
        } elseif(isset($_SESSION[SESSION_LOGIN_USER])) {
            $this->personID = $_SESSION[SESSION_LOGIN_USER];
        } else {
            $this->personID = '';
        }
    }

    //権限
    function setAuthority($authority = '') {
        if($authority != '') {
            $this->authority = $authority;
            $_SESSION[SESSION_LOGIN_AUTH] = $authority;
        } elseif(isset($_SESSION[SESSION_LOGIN_AUTH])) {
            $this->authority = $_SESSION[SESSION_LOGIN_AUTH];
        } else {
            $this->authority = '';
        }
    }

    //メールアドレス
    function setEmail($mail) {
        $mail = htmlspecialchars(trim($mail));
        if($mail == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->email = $mail;
        return '';
    }

    //パスワード
    function setPass($passwd) {
        $passwd = htmlspecialchars(trim($passwd));
        if($passwd == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->pass = $passwd;
        return '';
    }

    /******************************
    ログイン処理
    *******************************/
    function execLogin() {

        $spiral = new SpiralApi('database/select', 'admin_DB');

        $columns = array();
        $columns[] = 'PersonID';
        $columns[] = 'authority';

        $serch_condition = array();
        $serch_condition[] = array("name" => "email", "value" => $this->email);
        $serch_condition[] = array("name" => "pass", "value" => $this->pass);

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $data = $spiral->getSelectData();

        if(count($data) == 0) {
            return MESSAGE_ERROR_NO_USER;
        }

        //ログイン処理後
        $this->setPersonID($data[0]['PersonID']);
        $this->setAuthority($data[0]['authority']);

        return '';
    }

    /******************************
    ログアウト処理
    *******************************/
    function execLogout() {
        global $cls_session;
        $cls_session->clearSession();
        return '';
    }

    /******************************
    Getter
    *******************************/
    function getPersonID() {
        return $this->personID;
    }
    function getAuthority() {
        return $this->authority;
    }
}