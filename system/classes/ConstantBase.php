<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　定数管理（共通）
機能名：
　定数管理（共通）
*******************************************/

class ConstantBase {
    public static $aryLang = array(
        '1' => '日本語',
        '2' => '英語'
    );

    public static $init_course = array(
        'close_date' => '0',
        'close_time' => null,
        'stock_value' => '0',
        'stock_option' => '0'
    );

    public static $aryPaymentJp = array(
        '1' => '一括',
        '2' => '分割',
        '3' => 'ボーナス一括',
        '4' => 'ボーナス分割',
        '5' => 'リボ'
    );

    public static $aryPriceTypeJp = array(
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

    public static $aryPriceTypeEn = array(
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

    public static $aryPrefEn = array(
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

    public static $aryGovernorEn = array(
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

    public static $aryTravelEn = array(
        '1' => 'Travel Services Type 1',
        '2' => 'Travel Services Type 2',
        '3' => 'Travel Services Type 3',
        '4' => 'Region Specific Travel Company'
    );
}