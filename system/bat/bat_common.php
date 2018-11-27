<?php
$env_lines = file(dirname(__FILE__) . '/../../.htaccess');
foreach ($env_lines as $env_line) {
    if (preg_match('/^SetEnv\ /', $env_line)) {
        $envs = explode(' ',$env_line);
        $server = $env = '';
        $server = str_replace("\n", "", $envs[1]);
        if (isset($envs[2])) {
            $env = $envs[2];
            $env = str_replace("\"", "", $env);
            $env = str_replace("\n", "", $env);
        }
        $_SERVER[$server] = $env;
    }
}

$_SERVER['HTTPS'] = '';
$_SERVER['HTTP_HOST'] = 'just-toyama-dev.visit-town.com';
$_SERVER['REQUEST_URI'] = '';

require_once(dirname(__FILE__) . '/../configs/conf.php');

/**********************************************
* メール文言
***********************************************/
function getMailSubjectJP() {
    $subject = "";
    $subject .= "【いまからえらべるTRAVEL】お支払いご確認のお願い";

    return $subject;
}
function getMailSubjectEN() {
    $subject = "";
    $subject .= "Please confirm payment. - Imasugu Eraberu Travel";

    return $subject;
}
function getMailTextJP($course_data, $order_data, $p_order_data, $settings_data) {

    $enc_id = sha1(ORDER_ID_SALT . $order_data['order_id']);
    
    $message = "";
    $message .= $p_order_data['name_sei'] . " " . $p_order_data['name_mei'] ."様" . "\r\n";
    $message .= "\r\n";
    $message .= "先日は「" . $course_data['jp_product_title'] . "」にご予約いただき誠にありがとうございます。" . "\r\n";
    $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "でございます。" . "\r\n";
    $message .= "\r\n";
    $message .= "さて、ご予約いただきました 「" . $course_data['jp_product_title'] . "」 の料金についてですが、" . "\r\n";
    $message .= "本日現在、お客様からの入金の確認が取れておりません。" . "\r\n";
    $message .= "\r\n";
    $message .= "誠に恐れ入りますが、お支払いがお済みでない場合は" . "\r\n";
    $message .= "下記URLよりお支払い手続きをしていただきますようお願いいたします。" . "\r\n";
    $message .= URL_ROOT_PATH_HOST . "/order/settleapp/?order=" . $enc_id . "&date=" . date('Y-m-d', strtotime($order_data['order_date'])) . " \r\n";
    $message .= "\r\n";
    $message .= "なお、本メールと行き違いでご入金いただいている場合は何卒ご容赦ください。" . "\r\n";
    $message .= "※ご都合によりご入金が遅れる場合は、予めご入金日をご連絡頂ければ幸甚でございます。" . "\r\n";
    $message .= "\r\n";
    $message .= "お忙しいところ大変恐縮ですが";
    $message .= "ご対応の程、何卒宜しくお願い申し上げます。" . "\r\n";
    $message .= "\r\n";
    $message .= "\r\n";
    $message .= "*********************\r\n";
    $message .= "主催者情報\r\n";
    $message .= "*********************\r\n";
    $message .= "・事業者名： " . (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "\r\n";
    $message .= "・電話： " . $settings_data['tel'][0] . "-" . $settings_data['tel'][1] . "-" . $settings_data['tel'][2] . "\r\n";
    $message .= "・住所： 〒" . $settings_data['zipcode'][0] . "-" . $settings_data['zipcode'][1] . $settings_data['pref'] . $settings_data['address'] . "\r\n";
    $message .= "・メール： " . $settings_data['email'] . "\r\n";
    if($settings_data['agency'] == 1) {
        $message .= "・旅行業登録：" . $settings_data['registered_text'] . $settings_data['travel_text'] . "第" . $settings_data['project_number'] . "号\r\n";
    }
    $message .= "\r\n";
    $message .= "※ご予約のお取消・変更につきましては、上記連絡先までご連絡をお願い致します。\r\n";
    $message .= "\r\n";

    return $message;
}
function getMailTextEN($course_data, $order_data, $p_order_data, $settings_data) {

    $enc_id = sha1(ORDER_ID_SALT . $order_data['order_id']);
    
    $message = "";
    $message .= "Dear " . $p_order_data['name_sei'] . " " . $p_order_data['name_mei'] . "\r\n";
    $message .= "\r\n";
    $message .= "Thank you for reserving \"" . $course_data['en_product_title'] . "\" the other day." . "\r\n";
    $message .= "Our company is " . (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "\r\n";
    $message .= "\r\n";
    $message .= "Well, about the price of \"" . $course_data['en_product_title'] . "\" that you booked,As of today, we have not been able to confirm payment from customers." . "\r\n";
    $message .= "\r\n";
    $message .= "Sorry to blame you, but if payment is not done." . "\r\n";
    $message .= "Please make payment procedure from the following URL." . "\r\n";
    $message .= URL_ROOT_PATH_HOST . "/order/settleapp/?order=" . $enc_id . "&date=" . date('Y-m-d', strtotime($order_data['order_date'])) . " \r\n";
    $message .= "\r\n";
    $message .= "If this mail has crossed your payment, please accept our apologies and disregard this letter." . "\r\n";
    $message .= "\r\n";
    $message .= "Thank you.";
    $message .= "\r\n";
    $message .= "\r\n";
    $message .= "*********************\r\n";
    $message .= "Organizer Information\r\n";
    $message .= "*********************\r\n";
    $message .= "・Organizer：" . (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "\r\n";
    $message .= "・Phone Number：" . $settings_data['tel'][0] . "-" . $settings_data['tel'][1] . "-" . $settings_data['tel'][2] . "\r\n";
    $message .= "・Street Address：〒" . $settings_data['zipcode'][0] . "-" . $settings_data['zipcode'][1] . " " . getAryPrefEn($settings_data['pref']) . " " . $settings_data['address'] . "\r\n";
    $message .= "・Email Address：" . $settings_data['email'] . "\r\n";
    if($settings_data['agency'] == 1) {
        $message .= "・Registration of Travel Services：" . $settings_data['registered_text'] . $settings_data['travel_text'] . " " . $settings_data['project_number'] . "\r\n";
    }
    $message .= "\r\n";
    $message .= "Please contact the above for cancellation or change of reservation.\r\n";
    $message .= "\r\n";

    return $message;
}

/**********************************************
* その他関数
***********************************************/
function getAryGovernorJpText($registered) {
    $ary = array(
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

    if(!array_key_exists($registered, $ary)) {
        return '';
    } else {
        return $ary[$registered];
    }
}

function getAryGovernorEnText($registered) {
    $ary = array(
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

    if(!array_key_exists($registered, $ary)) {
        return '';
    } else {
        return $ary[$registered];
    }
}

function getAryTravelJpText($travel) {
    $ary = array(
        '1' => '旅行業第1種',
        '2' => '旅行業第2種',
        '3' => '旅行業第3種',
        '4' => '地域限定旅行業'
    );
    
    if(!array_key_exists($travel, $ary)) {
        return '';
    } else {
        return $ary[$travel];
    }
}

function getAryTravelEnText($travel) {
    $ary = array(
        '1' => 'Travel Services Type 1',
        '2' => 'Travel Services Type 2',
        '3' => 'Travel Services Type 3',
        '4' => 'Region Specific Travel Company'
    );

    if(!array_key_exists($travel, $ary)) {
        return '';
    } else {
        return $ary[$travel];
    }
}

function getAryPrefEn($pref) {
    $ary = array(
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

    if(!array_key_exists($pref, $ary)) {
        return '';
    } else {
        return $ary[$pref];
    }
}