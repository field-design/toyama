<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　定数管理（日本語）
機能名：
　定数管理（日本語）
*******************************************/
require_once(CLS_DIR . 'ConstantBase.php');

class Constant extends ConstantBase {
    public static $siteName = 'いまからえらべるTRAVEL';
    public static $siteNameNiikawa = 'いまからえらべるTRAVELinにいかわ';

    public static $aryCorrespondence = array(
        '1' => '承認待ち',
        '6' => '非承認',
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
        'cat1' => '体験する',
        'cat2' => '見る',
        'cat3' => '食べる',
        'cat4' => '買う'
    );

    public static $aryArea = array(
        'area1' => '黒部・宇奈月',
        'area2' => '立山',
        'area3' => '富山',
        'area4' => '砺波・五箇山',
        'area5' => '高岡・氷見'
    );
    public static $aryAreaDetail = array(
        'area1' => array(
                   'area1_1' => '魚津市',
                   'area1_2' => '黒部市',
                   'area1_3' => '入善町',
                   'area1_4' => '朝日町',
                   'area1_5' => '滑川市'
               ),
        'area2' => array(
                   'area2_1' => '船橋村',
                   'area2_2' => '上市町',
                   'area2_3' => '立山町'
               ),
        'area3' => array(
                   'area3_1' => '富山市'
               ),
        'area4' => array(
                   'area4_1' => '氷見市',
                   'area4_2' => '射水市',
                   'area4_3' => '高岡市'
               ),
        'area5' => array(
                   'area5_1' => '小矢部市',
                   'area5_2' => '砺波市',
                   'area5_3' => '南砺市'
               )
    );

    public static $aryAuthority = array(
        '1' => 'システム管理者',
        '2' => '事業者'
    );

    public static $arySettlementType = array(
        '0' => 'クレジットカード',
        '3' => 'コンビニ'
    );

    public static $aryPriceType = array(
        '0' => 'おとな・こども同額',
        '1' => 'おとな',
        '2' => 'こども',
        '3' => '大学生',
        '4' => '高校生',
        '5' => '中学生',
        '6' => '小学生',
        '7' => '幼児',
        '8' => 'その他'
    );

    public static $aryWeekDay = array(
        '0' => '日',
        '1' => '月',
        '2' => '火',
        '3' => '水',
        '4' => '木',
        '5' => '金',
        '6' => '土'
    );

    public static $aryCancelChargeRate = array(
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
        '0' => '削除',
        '1' => '公開',
        '2' => '非公開',
        '3' => '下書き',
        '31' => '公開リクエスト中'
    );

    public static $aryGender = array(
        '1' => '男性',
        '2' => '女性'
    );

    public static $aryPref = array(
        '北海道' => '北海道',
        '青森県' => '青森県',
        '岩手県' => '岩手県',
        '宮城県' => '宮城県',
        '秋田県' => '秋田県',
        '山形県' => '山形県',
        '福島県' => '福島県',
        '茨城県' => '茨城県',
        '栃木県' => '栃木県',
        '群馬県' => '群馬県',
        '埼玉県' => '埼玉県',
        '千葉県' => '千葉県',
        '東京都' => '東京都',
        '神奈川県' => '神奈川県',
        '新潟県' => '新潟県',
        '富山県' => '富山県',
        '石川県' => '石川県',
        '福井県' => '福井県',
        '山梨県' => '山梨県',
        '長野県' => '長野県',
        '岐阜県' => '岐阜県',
        '静岡県' => '静岡県',
        '愛知県' => '愛知県',
        '三重県' => '三重県',
        '滋賀県' => '滋賀県',
        '京都府' => '京都府',
        '大阪府' => '大阪府',
        '兵庫県' => '兵庫県',
        '奈良県' => '奈良県',
        '和歌山県' => '和歌山県',
        '鳥取県' => '鳥取県',
        '島根県' => '島根県',
        '岡山県' => '岡山県',
        '広島県' => '広島県',
        '山口県' => '山口県',
        '徳島県' => '徳島県',
        '香川県' => '香川県',
        '愛媛県' => '愛媛県',
        '高知県' => '高知県',
        '福岡県' => '福岡県',
        '佐賀県' => '佐賀県',
        '長崎県' => '長崎県',
        '熊本県' => '熊本県',
        '大分県' => '大分県',
        '宮崎県' => '宮崎県',
        '鹿児島県' => '鹿児島県',
        '沖縄県' => '沖縄県',
        'その他' => 'その他'
    );

    public static $aryGovernor = array(
        '1' => '観光庁長官',
        '2' => '北海道知事',
        '3' => '青森県知事',
        '4' => '岩手県知事',
        '5' => '宮城県知事',
        '6' => '秋田県知事',
        '7' => '山形県知事',
        '8' => '福島県知事',
        '9' => '茨城県知事',
        '10' => '栃木県知事',
        '11' => '群馬県知事',
        '12' => '埼玉県知事',
        '13' => '千葉県知事',
        '14' => '東京都知事',
        '15' => '神奈川県知事',
        '16' => '新潟県知事',
        '17' => '富山県知事',
        '18' => '石川県知事',
        '19' => '福井県知事',
        '20' => '山梨県知事',
        '21' => '長野県知事',
        '22' => '岐阜県知事',
        '23' => '静岡県知事',
        '24' => '愛知県知事',
        '25' => '三重県知事',
        '26' => '滋賀県知事',
        '27' => '京都府知事',
        '28' => '大阪府知事',
        '29' => '兵庫県知事',
        '30' => '奈良県知事',
        '31' => '和歌山県知事',
        '32' => '鳥取県知事',
        '33' => '島根県知事',
        '34' => '岡山県知事',
        '35' => '広島県知事',
        '36' => '山口県知事',
        '37' => '徳島県知事',
        '38' => '香川県知事',
        '39' => '愛媛県知事',
        '40' => '高知県知事',
        '41' => '福岡県知事',
        '42' => '佐賀県知事',
        '43' => '長崎県知事',
        '44' => '熊本県知事',
        '45' => '大分県知事',
        '46' => '宮崎県知事',
        '47' => '鹿児島県知事',
        '48' => '沖縄県知事'
    );

    public static $aryTravel = array(
        '1' => '旅行業第1種',
        '2' => '旅行業第2種',
        '3' => '旅行業第3種',
        '4' => '地域限定旅行業'
    );

    public static $aryCvs = array(
        '00003' => 'サンクス',
        '00004' => 'サークルＫ',
        '00006' => 'デイリーヤマザキ',
        '00007' => 'セブンイレブン',
        '00008' => 'セイコーマート',
        '00009' => 'スリーエフ',
        '10001' => 'ローソン',
        '10002' => 'ファミリーマート',
        '10003' => 'サンクス',
        '10004' => 'サークルＫ',
        '10005' => 'ミニストップ',
        '10008' => 'セイコーマート'
    );

    public static $aryProfession = array(
        '1' => '学生',
        '2' => '会社員',
        '3' => '自営',
        '4' => '主婦',
        '5' => 'その他'
    );

    public static $formatYMD = 'Y年n月j日';
    public static $formatYMDHIS = 'Y年n月j日 H時i分s秒';
}