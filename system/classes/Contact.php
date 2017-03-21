<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　メール管理
機能名：
　メール管理
*******************************************/
class Contact {

    private $simei;
    private $mail;
    private $mailconfirm;
    private $tel;
    private $naiyo;

    function __construct() {
    }

    /******************************
    Setter＋入力チェック
    *******************************/
    //名前
    function setSimei($simei) {
        $simei = htmlspecialchars(trim($simei));
        if($simei == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->simei = $simei;
        return '';
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

    //確認用メールアドレス
    function setEmailConfirm($mailconfirm) {
        $mailconfirm = htmlspecialchars(trim($mailconfirm));
        if($mailconfirm == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->mailconfirm = $mailconfirm;
        return '';
    }
    //TEL
    function setTel($tel) {
        $tel = htmlspecialchars(trim($tel));
        if($tel == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->tel = $tel;
        return '';
    }
    //内容
    function setNaiyo($naiyo) {
        $naiyo = htmlspecialchars(trim($naiyo));
        if($naiyo == '') {
            return MESSAGE_ERROR_REQUIRE;
        }
        $this->naiyo = $naiyo;
        return '';
    }

    /*******************
    入力チェック
    ********************/
    function checkInput() {
        if($this->email != $this->mailconfirm) {
            return MESSAGE_ERROR_MAIL_MISMATCH;
        }

        return '';
    }

    /*******************
    商品公開リクエスト
    ********************/
    function publishRequest($title) {

        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        $to      = OWNER_MAIL;
        $subject = '公開リクエストがあります。';
        $message = '商品：' . $title;
        $headers = 'From: from@hoge.co.jp' . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        return '';
    }

    /*******************
    お問い合わせ
    ********************/
    function sendContact($post) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        $to      = OWNER_MAIL;
        $subject = 'お問い合わせ';
        $message = 'お名前：' . "\r\n" . htmlspecialchars($post['simei']) . "\r\n";
        $message .= 'メールアドレス：' . "\r\n" .  htmlspecialchars($post['email']) . "\r\n";
        $message .= '電話番号：' . "\r\n" .  htmlspecialchars($post['tel']) . "\r\n";
        $message .= 'お問い合わせ内容：' . "\r\n" .  htmlspecialchars($post['naiyo']) . "\r\n";
        $headers = 'From: from@hoge.co.jp' . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            return MESSAGE_ERROR_MAIL_SEND;
        }

        return '';
    }
}