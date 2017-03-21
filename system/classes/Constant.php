<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　定数管理
機能名：
　定数管理
*******************************************/

class Constant {
    public static $aryCorrespondence = array(
        '1' => '承認待ち',
        '2' => '入金待ち',
        '3' => 'キャンセル',
        '4' => '入金済み',
        '5' => '決済処理中'
    );

    public static $aryPayment = array(
        '1' => '一括',
        '2' => '分割',
        '3' => 'ボーナス一括',
        '4' => 'ボーナス分割',
        '5' => 'リボ'
    );

    public static $aryCategory = array(
        '1' => '体験する',
        '2' => '見る',
        '3' => '食べる',
        '4' => '買う'
    );

    public static $aryArea = array(
        '1' => '魚津市',
        '2' => '黒部市',
        '3' => '入善町',
        '4' => '朝日町'
    );

    public static $aryAuthority = array(
        '1' => 'システム管理者',
        '2' => '事業者'
    );

    public static $arySettlementType = array(
        '0' => 'カード',
        '3' => 'コンビニ'
    );

    public static $aryPlanTitle = array(
        '1' => 'おとな',
        '2' => 'こども',
        '3' => 'その他'
    );

    public static $aryPlanKind = array(
        '1' => '幼児',
        '2' => '小学生',
        '3' => '中学生',
        '4' => '1台',
        '5' => '1組'
    );

    public static $aryJob = array(
        '1' => '学生',
        '2' => '会社員',
        '3' => '自営',
        '4' => '主婦',
        '5' => 'その他'
    );

    public static $aryMtCancelTtl = array(
        '1' => '旅行開始後無連絡不参加',
        '2' => '当日',
        '3' => '前日',
        '4' => '2日前まで',
        '5' => '3日前まで',
        '6' => '3日から2日前まで'
    );

    public static $aryMtCancelRatio = array(
        '1' => '100%',
        '2' => '90%',
        '3' => '80%',
        '4' => '70%',
        '5' => '60%',
        '6' => '50%',
        '7' => '40%',
        '8' => '30%',
        '9' => '20%',
        '10' => '10%',
        '11' => 'なし'
    );

    public static $aryMtDisp = array(
        '1' => '公開',
        '2' => '非公開',
        '3' => '下書き'
    );
}