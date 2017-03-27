<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　受注管理
機能名：
　受注管理
*******************************************/
define('SESSION_ORDER_DATA', 'session_order_data');

class Order extends Entity {

    function __construct() {

        $this->columns = array();
        $this->columnsDef = array();

        $this->columns[] = 'registDate';
        $this->columnsDef[] = '';

        $this->columns[] = 'lastupDate';
        $this->columnsDef[] = '';

        //商品ID
        $this->columns[] = 'ProductID';
        $this->columnsDef[] = '';

        $this->columns[] = 'PersonID';
        $this->columnsDef[] = '';

        //申込ID
        $this->columns[] = 'OderID';
        $this->columnsDef[] = '';

        //受注番号
        $this->columns[] = 'OrdersNumber';
        $this->columnsDef[] = '';

        //受注日
        $this->columns[] = 'oderDate';
        $this->columnsDef[] = '';

        //注文番号
        $this->columns[] = 'OrderNumber';
        $this->columnsDef[] = '';

        //姓
        $this->columns[] = 'nameSei';
        $this->columnsDef[] = '';

        //名
        $this->columns[] = 'nameMei';
        $this->columnsDef[] = '';

        //セイ
        $this->columns[] = 'kanaSei';
        $this->columnsDef[] = '';

        //メイ
        $this->columns[] = 'kanaMei';
        $this->columnsDef[] = '';

        //メールアドレス
        $this->columns[] = 'mail';
        $this->columnsDef[] = '';

        //電話番号
        $this->columns[] = 'tel_';
        $this->columnsDef[] = '';

        //携帯番号
        $this->columns[] = 'mobile';
        $this->columnsDef[] = '';

        //郵便番号
        $this->columns[] = 'zipCode';
        $this->columnsDef[] = '';

        //都道府県
        $this->columns[] = 'pref';
        $this->columnsDef[] = '';

        //住所
        $this->columns[] = 'adress';
        $this->columnsDef[] = '';

        //生年月日
        $this->columns[] = 'birthday';
        $this->columnsDef[] = '';

        //性別
        $this->columns[] = 'gender';
        $this->columnsDef[] = '';

        //職業
        $this->columns[] = 'job_';
        $this->columnsDef[] = '';

        //支払方法
        $this->columns[] = 'Payment';
        $this->columnsDef[] = '';

        //タイトル
        $this->columns[] = 'title';
        $this->columnsDef[] = '';

        //サブタイトル
        $this->columns[] = 'SubTitle';
        $this->columnsDef[] = '';

        //集合場所／場所名
        $this->columns[] = 'locationname';
        $this->columnsDef[] = '';

        $this->columns[] = 'plan_type';
        $this->columnsDef[] = 1;

        //料金タイトル
        for($i = 1; $i <=5; $i++) {
            $this->columns[] = 'plan_title' . $i;
            $this->columnsDef[] = '';
        }

        //料金
        for($i = 1; $i <=5; $i++) {
            $this->columns[] = 'plan_Fee' . $i;
            $this->columnsDef[] = '';
        }

        //料金種別
        for($i = 1; $i <=5; $i++) {
            $this->columns[] = 'plan_Kind' . $i;
            $this->columnsDef[] = '';
        }

        //数量
        for($i = 1; $i <=5; $i++) {
            $this->columns[] = 'volume' . $i;
            $this->columnsDef[] = '';
        }

        //対応状況
        $this->columns[] = 'Correspondence';
        $this->columnsDef[] = '';

        //決済種別
        $this->columns[] = 'settlementType';
        $this->columnsDef[] = '';

        //決済金額
        $this->columns[] = 'settlement';
        $this->columnsDef[] = '';

        //与信承認番号
        $this->columns[] = 'CreditNumber';
        $this->columnsDef[] = '';

        //入金日
        $this->columns[] = 'paymentDate';
        $this->columnsDef[] = '';

        //会員ID
        $this->columns[] = 'MemberID';
        $this->columnsDef[] = '';
    }

    /******************************
    人数・オプション入力チェック
    *******************************/
    function checkInputVolume($data, $stock) {
        $err_msg = array();

        $volume_input = array();
        for($i = 1; $i <= 5; $i++) {

            $volume_input[] = $data['volume' . $i] == '' ? 0 : $data['volume' . $i];
            
            if( !is_numeric($volume_input[$i - 1]) ) {
                $err_msg['volume' . $i] = MESSAGE_ERROR_NUMBER;
                continue;
            }
        }
    
        if( count($err_msg) == 0) {
            if( array_sum($volume_input) == 0) {
                $err_msg['volume'] = MESSAGE_ERROR_NO_VOLUME;
            } elseif( array_sum($volume_input) > $stock ) {
                $err_msg['volume'] = MESSAGE_ERROR_OVER_STOCK;
            }
        }

        return $err_msg;
    }

    /******************************
    お客様情報入力チェック
    *******************************/
    function checkInputCustomer($data) {
        $err_msg = array();

        if( empty($data['nameSei']) ) {
            $err_msg['nameSei'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['nameMei']) ) {
            $err_msg['nameMei'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['kanaSei']) ) {
            $err_msg['kanaSei'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['kanaMei']) ) {
            $err_msg['kanaMei'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['mail']) ) {
            $err_msg['mail'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['zipCode'][0]) || empty($data['zipCode'][1]) ) {
            $err_msg['zipCode'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['pref']) ) {
            $err_msg['pref'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['adress']) ) {
            $err_msg['adress'] = MESSAGE_ERROR_REQUIRE;
        }

        $tel_input_cnt = 0;
        if( $data['tel_'][0] != '' ) {
            $tel_input_cnt++;
        }
        if( $data['tel_'][1] != '' ) {
            $tel_input_cnt++;
        }
        if( $data['tel_'][2] != '' ) {
            $tel_input_cnt++;
        }
        $mb_input_cnt = 0;
        if( $data['mobile'][0] != '' ) {
            $mb_input_cnt++;
        }
        if( $data['mobile'][1] != '' ) {
            $mb_input_cnt++;
        }
        if( $data['mobile'][2] != '' ) {
            $mb_input_cnt++;
        }

        if( $tel_input_cnt == 0 && $mb_input_cnt == 0 ) {
            $err_msg['tel_'] = MESSAGE_ERROR_REQUIRE_TEL;
            $err_msg['mobile'] = MESSAGE_ERROR_REQUIRE_TEL;
        } elseif( $tel_input_cnt > 0 && $mb_input_cnt == 0  ) {
            if( $tel_input_cnt != 3 ) {
                $err_msg['tel_'] = MESSAGE_ERROR_REQUIRE;
            }
        } elseif( $tel_input_cnt == 0 && $mb_input_cnt > 0 ) {
            if( $mb_input_cnt != 3 ) {
                $err_msg['mobile'] = MESSAGE_ERROR_REQUIRE;
            }
        } else {
            if( $tel_input_cnt != 3 ) {
                $err_msg['tel_'] = MESSAGE_ERROR_REQUIRE;
            }
            if( $mb_input_cnt != 3 ) {
                $err_msg['mobile'] = MESSAGE_ERROR_REQUIRE;
            }
        }

        if( empty($data['birthday'][0]) || empty($data['birthday'][1]) || empty($data['birthday'][2]) ) {
            $err_msg['birthday'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['gender']) ) {
            $err_msg['gender'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['job_']) ) {
            $err_msg['job_'] = MESSAGE_ERROR_REQUIRE;
        }
    
        return $err_msg;
    }

    /******************************
    データ保持
    *******************************/
    function setOrderToSession($data) {
        $_SESSION[SESSION_ORDER_DATA] = $data;
    }
    /******************************
    保持データ取得
    *******************************/
    function setSessionToOrder($data) {

        if( isset($_SESSION[SESSION_ORDER_DATA]) ) {
            $session_data = $_SESSION[SESSION_ORDER_DATA];
        } else {
            return '';
        } 

        foreach($data as $key => &$value) {
            if( (is_null($value) || $value == '') && isset($session_data[$key]) ) {
                $value = $session_data[$key];
            }
        }

        return $data;
    }

    /******************************
    商品取得
    *******************************/
    function getOrder($orderID) {

        $spiral = new SpiralApi('database/select', 'oderDB');

        $serch_condition = array();
        $serch_condition[] = array('name' => 'OderID', 'value' => $orderID);

        $spiral->setSelectParam($this->columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        if(count($selectData) == 0) {
            return MESSAGE_ERROR_DB_NO_DATA;
        }

        //DB値調整
        foreach($selectData as &$data) {
            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['oderDate']);
            $data['oderDate'] = $oderDate->format('Y/m/d H:i');

            if ($data['paymentDate'] != '') {
                $paymentDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['paymentDate']);
                $data['paymentDate'] = $paymentDate->format('Y/m/d H:i');
            } else {
                $data['paymentDate'] = '未入金';
            }

            $data['request'] = $data['Correspondence'] == 1 ? 1 : 0;
            if($data['Correspondence'] != '') {
                $data['Correspondence'] = Constant::$aryCorrespondence[$data['Correspondence']];
            }

            if($data['Payment'] != '') {
                $data['Payment'] = Constant::$aryPayment[$data['Payment']];
            }
            if($data['settlementType'] != '') {
                $data['settlementType'] = Constant::$arySettlementType[$data['settlementType']];
            }

            for($i = 1; $i <= 5; $i++) {
                if( $data['plan_title' . $i] != '' ) {
                    $data['plan_title' . $i] = Constant::$aryPlanTitle[$data['plan_title' . $i]];
                }
                if( $data['plan_Kind' . $i] != '' ) {
                    $data['plan_Kind' . $i] = Constant::$aryPlanKind[$data['plan_Kind' . $i]];
                }
            }

            if($data['job_'] != '') {
                $data['job_'] = Constant::$aryJob[$data['job_']];
            }

        }

        return $selectData[0];
    }

    /******************************
    受注一覧取得
    $num：
      デフォルト５件
    *******************************/
    function getOrderListView($num = 5, $order_date = null) {

        $spiral = new SpiralApi('database/select', 'oderDB');

        $serch_condition = array();
        if( !is_null($order_date) ) {
            $serch_condition[] = array('name' => 'oderDate', 'value' => date('Y/m/d', strtotime($order_date)) . ' 00:00' );
        }

        $lines_per_page = $num;

        $page = 1;

        $sort = array();
        $sort[] = array('name' => 'registDate', 'order' => 'desc');

        $spiral->setSelectParam($this->columns, $serch_condition, null, $lines_per_page, $page, $sort);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //DB値調整
        foreach($selectData as &$data) {
            $regDate = DateTime::createFromFormat('Y年m月d日 H時i分s秒', $data['registDate']);
            $data['registDate'] = $regDate->format('Y/m/d H:i');

            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['oderDate']);
            $data['oderDate'] = $oderDate->format('Y/m/d H:i');

            $data['Correspondence'] = Constant::$aryCorrespondence[$data['Correspondence']];

            if($data['Payment'] != '') {
                $data['Payment'] = Constant::$aryPayment[$data['Payment']];
            }

            if($data['settlementType'] != '') {
                $data['settlementType'] = Constant::$arySettlementType[$data['settlementType']];
            }

            $main_photo_thumb = UPL_DIR . $data['ProductID'] . '/thumb_' . PRODUCT_MAIN_PHOTO1_NAME;

            if (!file_exists($main_photo_thumb)) {
                $data['main_photo'] = URL_UPL_DIR . $data['ProductID'] . '/' . PRODUCT_MAIN_PHOTO1_NAME;
            } else {
                $data['main_photo'] = URL_UPL_DIR . $data['ProductID'] . '/thumb_' . PRODUCT_MAIN_PHOTO1_NAME;
            }

        }

        return $selectData;
    }

    /******************************
    申し込み登録
    *******************************/
    function update($data, $product_data) {

        $time_stamp = date("Y/m/d H:i:s");

        $update_columns = array();
        $update_data = array();

        foreach($this->columns as $column) {
            if($column == 'zipCode') {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column][0] . '-' . $data[$column][1];
            } elseif($column == 'tel_' || $column == 'mobile') {
                $update_columns[] = $column;
                if(implode('', $data[$column]) != '') {
                    $update_data[$column] = $data[$column][0] . '-' . $data[$column][1] . '-' . $data[$column][2];
                } else {
                    $update_data[$column] = '';
                }
            } elseif($column == 'birthday') {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column][0] . '/' . $data[$column][1] . '/' . $data[$column][2];
            } elseif(strpos($column, 'plan_title') !== false || strpos($column, 'plan_Fee') !== false || strpos($column, 'plan_Kind') !== false) {
                $update_columns[] = $column;

                $product_column = substr($column, 0, -1);
                $product_value_index = intval(substr($column, -1)) - 1;
                $update_data[$column] = $product_data[$product_column][$product_value_index]; //商品データより取得

                //申し込みデータに設定
                $data[$column] = $update_data[$column];
            } elseif($column == 'gender') {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column . '_text'];
            } else {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column];
            }
        }

        //登録
        $spiral = new SpiralApi('database/insert', 'oderDB');

        $update_data['registDate'] = $time_stamp;
        $update_data['lastupDate'] = $time_stamp;
        $update_data['title'] = $product_data['title'];
        $update_data['SubTitle'] = $product_data['SubTitle'];
        $update_data['locationname'] = $product_data['locationname'];
        $update_data['plan_type'] = $product_data['plan_type'];
        $update_data['PersonID'] = $product_data['PersonID'];
        $update_data['ProductID'] = $product_data['ProductID'];
        $update_data['Correspondence'] = $product_data['plan_type'] == 2 ? 1 : 5; // 1:承認待ち 5:決済処理中

        $spiral->setInsertParam($update_columns, $update_data);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $response = $spiral->getResponse();

        //orderID設定
        if( isset($response['id']) ) {
            $data['OderID'] = 'order' . sprintf('%06d', $response['id']);
        }

        return $data;
    }

    /******************************
    決済結果登録
    *******************************/
    function update_payment($data) {
        $time_stamp = date("Y/m/d H:i:s");

        $update_columns = array();
        $update_data = array();
        $serch_condition = array();

        $spiral = new SpiralApi('database/update', 'oderDB');

        $update_columns[] = 'lastupDate';
        $update_columns[] = 'Payment';
        $update_columns[] = 'settlementType';
        $update_columns[] = 'CreditNumber';
        $update_columns[] = 'Correspondence';
        $update_columns[] = 'settlement';
        $update_columns[] = 'paymentDate';

        $update_data['lastupDate'] = $time_stamp;
        $update_data['Payment'] = $data['Payment'];
        $update_data['settlementType'] = $data['settlementType'];
        $update_data['CreditNumber'] = $data['CreditNumber'];
        $update_data['Correspondence'] = $data['Correspondence'];
        $update_data['settlement'] = $data['settlement'];
        $update_data['paymentDate'] = $data['paymentDate'];

        $serch_condition[] = array('name' => 'OderID', 'value' => $data['OderID']);

        $spiral->setUpdateParam($update_columns, $update_data, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        return $data;
    }

    /******************************
    承認登録
    *******************************/
    function update_approval($data) {
        $time_stamp = date("Y/m/d H:i:s");

        $update_columns = array();
        $update_data = array();
        $serch_condition = array();

        $spiral = new SpiralApi('database/update', 'oderDB');

        $update_columns[] = 'lastupDate';
        $update_columns[] = 'Correspondence';

        $update_data['lastupDate'] = $time_stamp;
        $update_data['Correspondence'] = 5;

        $serch_condition[] = array('name' => 'OderID', 'value' => $data['OderID']);

        $spiral->setUpdateParam($update_columns, $update_data, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $data['request'] = 0;
        $data['Correspondence'] = Constant::$aryCorrespondence[5];

        return $data;
    }

}