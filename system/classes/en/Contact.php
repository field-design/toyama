<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　メール管理（英語）
機能名：
　メール管理（英語）
*******************************************/
require_once(CLS_DIR . 'ContactBase.php');

class Contact extends ContactBase {

    /*******************
    申し込み完了（カード）
    ********************/
    function sendCardOrderComp($order_data, $product_data, $course_data, $price_data, $settings_data) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        
        $to      = $order_data['mail'];
        $subject = 'Your application is confirmed.';

        $message = '';
        $message .= 'Dear' . $order_data['nameSei'] . '　' . $order_data['nameMei'] . '' . "\r\n";
        $message .= "\r\n";
        $message .= "Thank you for applying for \"" . $product_data['title'] . "(" . $product_data['course_name'][0] . ")\" through Imasugu Eraberu Travel.\r\n";
        $message .= "Your application is confirmed as follows.\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfoEn($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= $this->getOrderPersonEn($order_data);
        $message .= "* Credit card transaction details should be checked in the statement sent from the card company.\r\n";
        $message .= "\r\n";
        $message .= $this->getCompanionEn($order_data);
        $message .= $this->getProductQuestionEn($order_data, $product_data);
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getProductSettingsEn($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        //=============
        //事業者宛
        //=============
        $to      = $settings_data['email'];
        $subject = 'お申し込みが入りました';

        $message = "";
        $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "　御中\r\n";
        $message .= "\r\n";
        $message .= "いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にお申込がありました。\r\n";
        $message .= "下記の内容にて承りましたので、内容の確認、お客様へ確定書面のご発送をお願い致します。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data);
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        return '';
    }

    /*******************
    申し込み完了（コンビニ）
    ********************/
    function sendConveniOrderComp($order_data, $product_data, $course_data, $price_data, $settings_data) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'Your application is confirmed.';

        $message = "";
        $message .= "Dear " . $order_data['nameSei'] . "　" . $order_data['nameMei'] . "\r\n";
        $message .= "\r\n";
        $message .= "Thank you for applying for \"" . $product_data['title'] . "(" . $product_data['course_name'][0] . ")\" through Imasugu Eraberu Travel.\r\n";
        $message .= "Your application is confirmed as follows.\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfoEn($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPersonEn($order_data);
        $message .= "Convenience Store Name：" . Constant::$aryCvs[$order_data['CvsCode']] . " \r\n";
        $message .= "Receipt number：" . $order_data['CvsReceiptNo'] . " \r\n";
        $message .= "Authorization number：" . $order_data['CvsConfNo'] . " \r\n";
        $message .= "Payment form URL：" . $order_data['CvsReceiptUrl'] . "\r\n";
        //$message .= "支払期限：2017年03月26日（日）\r\n";
        $message .= "\r\n";
        $message .= "The payment method at convenience store, please click here.\r\n";
        $message .= "https://www.gmo-pg.com/sep/customer-convenience-store/\r\n";
        $message .= "\r\n";
        $message .= "We do not send a confirmation email for payment and the issuing of tickets.\r\n";
        $message .= "Receipts or vouchers you receive will serve as proof of purchase.\r\n";
        $message .= "* Please make sure to keep your receipts or vouchers.\r\n";
        $message .= "\r\n";
        $message .= $this->getCompanionEn($order_data);
        $message .= $this->getProductQuestionEn($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettingsEn($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        //=============
        //事業者宛
        //=============
        $to      = $settings_data['email'];
        $subject = 'お申し込みが入りました';

        $message = "";
        $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "　御中\r\n";
        $message .= "\r\n";
        $message .= "いますぐ選べるトラベルより「" . $product_data['title'] . "（" . $course_data['course_name'][0] . "）」にお申込がありました。\r\n";
        $message .= "下記の内容にて承りましたので、内容の確認、お客様へ確定書面のご発送をお願い致します。\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data);
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data);
        $message .= "コンビニ名：" . Constant::$aryCvs[$order_data['CvsCode']] . " \r\n";
        $message .= "受付番号：" . $order_data['CvsReceiptNo'] . " \r\n";
        $message .= "確認番号：" . $order_data['CvsConfNo'] . " \r\n";
        $message .= "払込票URL：" . $order_data['CvsReceiptUrl'] . "\r\n";
        //$message .= "支払期限：2017年03月26日（日）\r\n";
        $message .= "\r\n";
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        return '';
    }

    /*******************
    リクエスト申し込み
    ********************/
    function sendRequestComp($order_data, $product_data, $course_data, $price_data, $settings_data) {
        mb_language("Japanese");
        mb_internal_encoding("UTF-8");

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'Your request has been sent.';

        $message = '';
        $message .= "Dear " . $order_data['nameSei'] . '　' . $order_data['nameMei'] . '' . "\r\n";
        $message .= "\r\n";
        $message .= "Thank you for sending your request for \"" . $product_data['title'] . "(" . $product_data['course_name'][0] . ")\" through Imasugu Eraberu Travel.\r\n";
        $message .= "Your request has been sent with the following content.\r\n";
        $message .= "We will contact you within 24 hours if your application is submitted 3 days prior to the date of participation or earlier. / We will contact you within 3 hours if your request is made the day before or 2 days before the date of participation. (* Please contact the office by phone during the business hours of each company if you are not contacted within the time frames stated above.)\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfoEn($order_data, $product_data, $course_data, $price_data, 'Request');
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPersonEn($order_data, 'Request');
        $message .= $this->getCompanionEn($order_data);
        $message .= $this->getProductQuestionEn($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettingsEn($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        //=============
        //事業者宛
        //=============
        $to      = $settings_data['email'];
        $subject = 'リクエストが入りました';

        $message = '';
        $message .= (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "　御中\r\n";
        $message .= "\r\n";
        $message .= "いますぐ選べるトラベルより「" . $product_data['title_jp'] . "（" . $course_data['course_name'][0] . "）」にリクエストがありました。\r\n";
        $message .= "下記の内容にて承りましたので、内容の確認後、お客様へリクエスト回答をお願い致します。\r\n";
        $message .= URL_ROOT_PATH_HOST . "/admin/\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfo($order_data, $product_data, $course_data, $price_data, 'リクエスト');
        $message .= "\r\n";
        $message .= $this->getOrderPerson($order_data, 'リクエスト');
        $message .= $this->getCompanion($order_data);
        $message .= $this->getProductQuestion($order_data, $product_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }

        return '';
    }

    /*******************
    承認完了
    ********************/
    function sendRequestApproval($order_data, $product_data, $course_data, $price_data, $settings_data) {

        $enc_id = sha1(ORDER_ID_SALT . $order_data['OderID']);

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'Your request is now approved.';

        $message = '';
        $message .= "Dear " . $order_data['nameSei'] . '　' . $order_data['nameMei'] . '' . "\r\n";
        $message .= "\r\n";
        $message .= "Thank you for sending your request for \"" . $product_data['title'] . "(" . $product_data['course_name'][0] . ")\" through Imasugu Eraberu Travel.\r\n";
        $message .= "Your request is now approved. Please proceed to payment on the page below.\r\n";
        $message .= "\r\n";
        $message .= "【Settlement page】\r\n";
        $message .= URL_ROOT_PATH_HOST . "/order/requestapp/?order=" . $enc_id . "&date=" . date('Y-m-d', strtotime($order_data['oderDate'])) . " \r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfoEn($order_data, $product_data, $course_data, $price_data, 'Request');
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPersonEn($order_data, 'Request');
        $message .= $this->getCompanionEn($order_data);
        $message .= $this->getProductQuestionEn($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettingsEn($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }
    }

    /*******************
    承認キャンセル
    ********************/
    function sendRequestApprovalCancel($order_data, $product_data, $course_data, $price_data, $settings_data) {

        $enc_id = sha1(ORDER_ID_SALT . $order_data['OderID']);

        //============
        //お客様宛
        //============
        $to      = $order_data['mail'];
        $subject = 'Your request is canceled.';

        $message = '';
        $message .= "Dear " . $order_data['nameSei'] . '　' . $order_data['nameMei'] . '' . "\r\n";
        $message .= "\r\n";
        $message .= "Thank you for sending your request for \"" . $product_data['title'] . "(" . $product_data['course_name'][0] . ")\" through Imasugu Eraberu Travel.\r\n";
        $message .= "Your request is canceled.\r\n";
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderInfoEn($order_data, $product_data, $course_data, $price_data, 'Request');
        $message .= "\r\n";
        $message .= "\r\n";
        $message .= $this->getOrderPersonEn($order_data, 'Request');
        $message .= $this->getCompanionEn($order_data);
        $message .= $this->getProductQuestionEn($order_data, $product_data);
        $message .= "\r\n";
        $message .= $this->getProductSettingsEn($settings_data);

        $headers = 'From: ' . SYS_MAIL_FROM . "\r\n";

        if( !mb_send_mail($to, $subject, $message, $headers) ){
            $this->log->setErrorLog('FAIL_SEND_MAIL');
        }
    }

    /*******************
    申込内容取得
    ********************/
    function getOrderInfoEn($order_data, $product_data, $course_data, $price_data, $type_name = 'Application') {
        $temp_regist_date = DateTime::createFromFormat('Y年m月d日 H時i分s秒', $order_data['registDate']);

        $message = '';
        $message .= "********************\r\n";
        $message .= $type_name . " details\r\n";
        $message .= "********************\r\n";
        $message .= "・" . $type_name . " Date：" . $temp_regist_date->format('Y/n/j H:i:s') . "\r\n";
        $message .= "・Application Number：" . $order_data['OderID'] . "\r\n";
        $message .= "\r\n";
        $message .= "*********************\r\n";
        $message .= $type_name . " plan\r\n";
        $message .= "*********************\r\n";
        $message .= "・Name of Plan：" . $product_data['title'] . "（" . $product_data['course_name'][0] . "）" . "\r\n";
        $message .= "・Departure Date：" . date('Y/n/j', strtotime($order_data['oderDate'])) . "\r\n";
        $message .= "・Meeting Place：" . "\r\n";
        foreach($product_data['meeting_place'] as $value) {
            $message .= "　" . $value . "\r\n";
        }
        $message .= "・Number of People:\r\n";

        $total = 0;
        for($i = 0; $i < count($price_data['price_type']); $i++) {
            $message .= "　" . $price_data['price_type_text_en'][$i] . " ：" . number_format($order_data['amount'][$i]) . "\r\n";
            $total += intval($order_data['amount'][$i]);
        }

        $message .= "　Total：" . $total . "\r\n";

        $message .= "・Price：\r\n";

        $total = 0;
        for($i = 0; $i < count($price_data['price_type']); $i++) {
            $sum = intval($price_data['price_value'][$i]) * intval($order_data['amount'][$i]);
            $message .= "　" . $price_data['price_type_text_en'][$i] . "：" . number_format($price_data['price_value'][$i]) . "Yen×" . number_format($order_data['amount'][$i]) . "＝" . number_format($sum) . "Yen\r\n";
            $total += $sum;
        }

        $message .= "　Total：" . number_format($total) . "Yen\r\n";

        return $message;
    }

    /*******************
    申込者取得
    ********************/
    function getOrderPersonEn($order_data, $type_name = 'Application') {
        $message = '';
        $message .= "*********************\r\n";
        $message .= $type_name . " information\r\n";
        $message .= "*********************\r\n";
        $message .= "・Name：" . $order_data['nameSei'] . "　" . $order_data['nameMei'] . "\r\n";
        $message .= "・Street address：〒" . $order_data['zipCode'] . " " . Constant::$aryPrefEn[$order_data['pref']] . " " . $order_data['adress'] . "\r\n";
        $message .= "・Phone Number：" . $order_data['tel_'] . "\r\n";
        $message .= "・Mobile Phone Number：" . $order_data['mobile'] . "\r\n";
        $message .= "・Email Address：" . $order_data['mail'] . "\r\n";
        if( $type_name == 'Application' ) {
            if( $order_data['settlementType'] == 3 ) {
                $message .= "・Payment Method：Convenience Store" . "\r\n";
            } else {
                $message .= "・Payment Method：" . Constant::$aryPayment[$order_data['Payment']] . "\r\n";
            }
        }
        $message .= "・Additional Remarks：" . $order_data['note'] . "\r\n";
        $message .= "\r\n";

        return $message;
    }

    /*******************
    同行者者取得
    ********************/
    function getCompanionEn($order_data) {
        $message = '';
        $message .= "*********************\r\n";
        $message .= "Companion Information\r\n";
        $message .= "*********************\r\n";
        for($i = 0; $i < count($order_data['withSei']); $i++) {
            $message .= "・" . $order_data['withSei'][$i]. " " . $order_data['withMei'][$i] . "" . "\r\n";
        }
        $message .= "\r\n";

        return $message;
    }

    /*******************
    質問事項取得
    ********************/
    function getProductQuestionEn($order_data, $product_data) {
        $message = '';
        $message .= "*********************\r\n";
        $message .= "Questions\r\n";
        $message .= "*********************\r\n";
        for($i = 0; $i < count($product_data['question']); $i++) {
            $message .= "・" . $product_data['question'][$i] . "：" . $order_data['question'][$i] . "\r\n";
        }
        $message .= "\r\n";

        return $message;
    }

    /*******************
    事業者情報取得
    ********************/
    function getProductSettingsEn($settings_data) {
        $message = '';
        $message .= "*********************\r\n";
        $message .= "Organizer Information\r\n";
        $message .= "*********************\r\n";
        $message .= "・Organizer：" . (empty($settings_data['company_name']) ? $settings_data['display_name'] : $settings_data['company_name']) . "\r\n";
        $message .= "・Phone Number：" . $settings_data['tel_'][0] . "-" . $settings_data['tel_'][1] . "-" . $settings_data['tel_'][2] . "\r\n";
        $message .= "・Street Address：〒" . $settings_data['zipcode'][0] . "-" . $settings_data['zipcode'][1] . " " . Constant::$aryPrefEn[$settings_data['pref']] . " " . $settings_data['address'] . "\r\n";
        $message .= "・Email Address：" . $settings_data['email'] . "\r\n";
        if($settings_data['agency'] == 1) {
            $message .= "・Registration of Travel Services：" . $settings_data['Registered_text_en'] . $settings_data['Travel_text_en'] . " " . $settings_data['projectNumber'] . "\r\n";
        }
        $message .= "\r\n";
        $message .= "Please contact the above for cancellation or change of reservation.\r\n";

        return $message;
    }
}