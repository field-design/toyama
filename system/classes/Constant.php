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
        '0' => 'クレジットカード',
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

    public static $aryGender = array(
        '1' => '男',
        '2' => '女'
    );

    public static $aryPref = array(
        '1' => '北海道',
        '2' => '青森県',
        '3' => '岩手県',
        '4' => '宮城県',
        '5' => '秋田県',
        '6' => '山形県',
        '7' => '福島県',
        '8' => '茨城県',
        '9' => '栃木県',
        '10' => '群馬県',
        '11' => '埼玉県',
        '12' => '千葉県',
        '13' => '東京都',
        '14' => '神奈川県',
        '15' => '新潟県',
        '16' => '富山県',
        '17' => '石川県',
        '18' => '福井県',
        '19' => '山梨県',
        '20' => '長野県',
        '21' => '岐阜県',
        '22' => '静岡県',
        '23' => '愛知県',
        '24' => '三重県',
        '25' => '滋賀県',
        '26' => '京都府',
        '27' => '大阪府',
        '28' => '兵庫県',
        '29' => '奈良県',
        '30' => '和歌山県',
        '31' => '鳥取県',
        '32' => '島根県',
        '33' => '岡山県',
        '34' => '広島県',
        '35' => '山口県',
        '36' => '徳島県',
        '37' => '香川県',
        '38' => '愛媛県',
        '39' => '高知県',
        '40' => '福岡県',
        '41' => '佐賀県',
        '42' => '長崎県',
        '43' => '熊本県',
        '44' => '大分県',
        '45' => '宮崎県',
        '46' => '鹿児島県',
        '47' => '沖縄県'
    );

    public static $aryCvs = array(
        '00006' => 'デイリーヤマザキ',
        '00007' => 'セブンイレブン',
        '00009' => 'スリーエフ',
        '10001' => 'ローソン',
        '10002' => 'ファミリーマート',
        '10003' => 'サンクス',
        '10004' => 'サークルＫ',
        '10005' => 'ミニストップ',
        '10008' => 'セイコーマート'
    );
}