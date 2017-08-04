<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　定数管理（英語）
機能名：
　定数管理（英語）
*******************************************/
require_once(CLS_DIR . 'ConstantBase.php');

class Constant extends ConstantBase {
    public static $siteName = 'TRAVEL you can choose right now';
    public static $siteNameNiikawa = 'TRAVEL in niikawa you can choose right now';

    public static $aryCorrespondence = array(
        '1' => '承認待ち',
        '6' => '非承認',
        '2' => '入金待ち',
        '3' => 'キャンセル',
        '4' => '入金済み',
        '5' => '決済処理中'
    );

    public static $aryPayment = array(
        '1' => 'Single payment',
        '2' => 'Installment payment',
        '3' => 'Single payment with your bonus',
        '4' => 'Installment payment with your bonus',
        '5' => 'Revolving repayment'
    );

    public static $aryCategory = array(
        'cat1' => 'Experience',
        'cat2' => 'See',
        'cat3' => 'Eat',
        'cat4' => 'Buy'
    );

    public static $aryArea = array(
        'area1' => 'Kurobe-Unaduki',
        'area2' => 'Tateyama',
        'area3' => 'Toyama',
        'area4' => 'Tonami-Gokayama',
        'area5' => 'Takayama-Himi'
    );
    public static $aryAreaDetail = array(
        'area1' => array(
                   'area1_1' => 'Uozu',
                   'area1_2' => 'Kurobe',
                   'area1_3' => 'Nyuzen',
                   'area1_4' => 'Asahi',
                   'area1_5' => 'Namerikawa'
               ),
        'area2' => array(
                   'area2_1' => 'Funahashi',
                   'area2_2' => 'Kamiichi',
                   'area2_3' => 'Tateyama'
               ),
        'area3' => array(
                   'area3_1' => 'Toyama'
               ),
        'area4' => array(
                   'area4_1' => 'Himi',
                   'area4_2' => 'Imizu',
                   'area4_3' => 'Takaoka'
               ),
        'area5' => array(
                   'area5_1' => 'Oyabe',
                   'area5_2' => 'Tonami',
                   'area5_3' => 'Nanto'
               )
    );

    public static $aryAuthority = array(
        '1' => 'システム管理者',
        '2' => '事業者'
    );

    public static $arySettlementType = array(
        '0' => 'Creditcard',
        '3' => 'Convenience stores'
    );

    public static $aryPriceType = array(
        '0' => 'Adults・Children same amount',
        '1' => 'Adults',
        '2' => 'Children',
        '3' => 'College student',
        '4' => 'High school student',
        '5' => 'Middle school students',
        '6' => 'Elementary school student',
        '7' => 'Infant',
        '8' => 'Other'
    );

    public static $aryWeekDay = array(
        '0' => 'Sun',
        '1' => 'Mon',
        '2' => 'Tue',
        '3' => 'Wed',
        '4' => 'Thu',
        '5' => 'Fri',
        '6' => 'Sat'
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
        '11' => 'None'
    );

    public static $aryJob = array(
        '1' => 'A student',
        '2' => 'Employee',
        '3' => 'Self-employed',
        '4' => 'Housewife',
        '5' => 'Other'
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
        '3' => '下書き'
    );

    public static $aryGender = array(
        '1' => 'Male',
        '2' => 'Female'
    );

    public static $aryPref = array(
        '北海道'=> 'Hokkaido',
        '青森県'=> 'Aomori Prefecture',
        '岩手県'=> 'Iwate Prefecture',
        '宮城県'=> 'Miyagi Prefecture',
        '秋田県'=> 'Akita Prefecture',
        '山形県'=> 'Yamagata Prefecture',
        '福島県'=> 'Fukushima Prefecture',
        '茨城県'=> 'Ibaraki Prefecture',
        '栃木県'=> 'Tochigi Prefecture',
        '群馬県' => 'Gunma Prefecture',
        '埼玉県' => 'Saitama Prefecture',
        '千葉県' => 'Chiba Prefecture',
        '東京都' => 'Tokyo Prefecture',
        '神奈川県' => 'Kanagawa Prefecture',
        '新潟県' => 'Niigata Prefecture',
        '富山県' => 'Toyama Prefecture',
        '石川県' => 'Ishikawa Prefecture',
        '福井県' => 'Fukui Prefecture',
        '山梨県' => 'Yamanashi Prefecture',
        '長野県' => 'Nagano Prefecture',
        '岐阜県' => 'Gifu Prefecture',
        '静岡県' => 'Shizuoka Prefecture',
        '愛知県' => 'Aichi Prefecture',
        '三重県' => 'Mie Prefecture',
        '滋賀県' => 'Shiga Prefecture',
        '京都府' => 'Kyoto Prefecture',
        '大阪府' => 'Osaka Prefecture',
        '兵庫県' => 'Hyogo Prefecture',
        '奈良県' => 'Nara Prefecture',
        '和歌山県'  => 'Wakayama Prefecture',
        '鳥取県' => 'Tottori Prefecture',
        '島根県' => 'Shimane Prefecture',
        '岡山県' => 'Okayama Prefecture',
        '広島県' => 'Hiroshima Prefecture',
        '山口県' => 'Yamaguchi Prefecture',
        '徳島県' => 'Tokushima Prefecture',
        '香川県' => 'Kagawa Prefecture',
        '愛媛県' => 'Ehime Prefecture',
        '高知県' => 'Kochi Prefecture',
        '福岡県' => 'Fukuoka Prefecture',
        '佐賀県' => 'Saga Prefecture',
        '長崎県' => 'Nagasaki Prefecture',
        '熊本県' => 'Kumamoto Prefecture',
        '大分県' => 'Oita Prefecture',
        '宮崎県' => 'Miyazaki Prefecture',
        '鹿児島県' => 'Kagoshima Prefecture',
        '沖縄県' => 'Okinawa Prefecture',
        'その他' => 'Other'
    );

    public static $aryGovernor = array(
        '1' => 'the commissioner of the Japan Tourism Agency',
        '2' => 'Governor of Hokkaido',
        '3' => 'Governor of Aomori',
        '4' => 'Governor of Iwate',
        '5' => 'Governor of Miyagi',
        '6' => 'Governor of Akita',
        '7' => 'Governor of Yamagata',
        '8' => 'Governor of Fukushima',
        '9' => 'Governor of Ibaraki',
        '10' => 'Governor of Tochigi',
        '11' => 'Governor of Gunma',
        '12' => 'Governor of Saitama',
        '13' => 'Governor of Chiba',
        '14' => 'Governor of Tokyo',
        '15' => 'Governor of Kanagawa',
        '16' => 'Governor of Niigata',
        '17' => 'Governor of Toyama',
        '18' => 'Governor of Ishikawa',
        '19' => 'Governor of Fukui',
        '20' => 'Governor of Yamanashi',
        '21' => 'Governor of Nagano',
        '22' => 'Governor of Gifu',
        '23' => 'Governor of Shizuoka',
        '24' => 'Governor of Aichi',
        '25' => 'Governor of Mie',
        '26' => 'Governor of Shiga',
        '27' => 'Governor of Kyoto',
        '28' => 'Governor of Osaka',
        '29' => 'Governor of Hyogo',
        '30' => 'Governor of Nara',
        '31' => 'Governor of Wakayama',
        '32' => 'Governor of Tottori',
        '33' => 'Governor of Shimane',
        '34' => 'Governor of Okayama',
        '35' => 'Governor of Hiroshima',
        '36' => 'Governor of Yamaguchi',
        '37' => 'Governor of Tokushima',
        '38' => 'Governor of Kagawa',
        '39' => 'Governor of Ehime',
        '40' => 'Governor of Kochi',
        '41' => 'Governor of Fukuoka',
        '42' => 'Governor of Saga',
        '43' => 'Governor of Nagasaki',
        '44' => 'Governor of Kumamoto',
        '45' => 'Governor of Oita',
        '46' => 'Governor of Miyazaki',
        '47' => 'Governor of Kagoshima',
        '48' => 'Governor of Okinawa'
    );

    public static $aryTravel = array(
        '1' => 'Travel Services Type 1',
        '2' => 'Travel Services Type 2',
        '3' => 'Travel Services Type 3',
        '4' => 'Region Specific Travel Company'
    );

    public static $aryCvs = array(
        '00003' => 'Sunkus',
        '00004' => 'CircleK',
        '00006' => 'Daily YAMAZAKI',
        '00007' => 'SEVEN-ELEVEN',
        '00008' => 'Seicomart',
        '00009' => 'Three-F',
        '10001' => 'LAWSON',
        '10002' => 'FamilyMart',
        '10003' => 'Sunkus',
        '10004' => 'CircleK',
        '10005' => 'MINISTOP',
        '10008' => 'Seicomart'
    );

    public static $aryProfession = array(
        '1' => 'A student',
        '2' => 'Employee',
        '3' => 'Self-employed',
        '4' => 'Housewife',
        '5' => 'Other'
    );

    public static $formatYMD = 'Y/n/j';
    public static $formatYMDHIS = 'Y/n/j H:i:s';
}