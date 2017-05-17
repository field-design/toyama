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

class OrderMy extends Entity {

    private $person_id = null;

    function __construct($login = null) {

        if( !is_null($login) && !$login->isAuthAdmin() ) {
            $this->person_id = $login->getPersonID();
        }

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
    function checkInputVolume($data, $stock_type, $stock_value, $stock_option) {
        $err_msg = array();
   
        if( array_sum($data['amount']) == 0) {
            $err_msg['volume'] = MESSAGE_ERROR_NO_VOLUME;
        } elseif( array_sum($data['amount']) > $stock_value ) {
            //在庫がないとき、リクエストプランでなければエラー
            if ($stock_type != 1 && $stock_option != 1) {
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
        if( empty($data['mobile'][0]) || empty($data['mobile'][1]) || empty($data['mobile'][2])) {
            $err_msg['mobile'] = MESSAGE_ERROR_REQUIRE;
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

        if( $tel_input_cnt > 0 ) {
            if( $tel_input_cnt != 3 ) {
                $err_msg['tel_'] = MESSAGE_ERROR_TEL;
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

        foreach($session_data as $key => $value) {
            if( array_key_exists($key, $data)) {
                if ( is_null($data[$key]) || $data[$key] == '' || (is_array($data[$key]) && count($data[$key]) == 0))  {
                    $data[$key] = $session_data[$key];
                }
            } else {
                $data[$key] = $session_data[$key];
            }
        }

        return $data;
    }

    /******************************
    保持データ破棄
    *******************************/
    function clearSession() {
        if( isset($_SESSION[SESSION_ORDER_DATA]) ) {
            unset($_SESSION[SESSION_ORDER_DATA]);
        }
    }

    /******************************
    申込取得
    *******************************/
    function getOrder($orderID) {

        //==========================================
        //◆ Spiral申込管理DB
        //==========================================
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
            $registDate = DateTime::createFromFormat('Y年m月d日 H時i分s秒', $data['registDate']);
            $data['registDate_a'] = $registDate->format('Y/m/d H:i:s');

            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['oderDate']);
            $data['oderDate'] = $oderDate->format('Y/m/d H:i');

            if($data['job_'] != '') {
                $data['job_'] = Constant::$aryJob[$data['job_']];
            }

        }

        //==========================================
        //◆ MySQL申込管理DB
        //==========================================
        $sql = '';
        $sql .= 'select t_order.order_id ';
        $sql .= '     , t_order.product_id ';
        $sql .= '     , t_order.course_id ';
        $sql .= '     , t_order.order_status ';
        $sql .= '     , t_order.request_flg ';
        $sql .= '     , t_order.pay_date ';
        $sql .= '     , t_order.credit_number ';
        $sql .= '     , t_order.settlement_type ';
        $sql .= '     , t_order.settlement ';
        $sql .= '     , t_order.settlement_name ';
        $sql .= '     , t_order.payment ';
        $sql .= '     , group_concat(meta_value SEPARATOR ",") amount ';
        $sql .= 'from   t_order ';
        $sql .= 'left join t_order_meta ';
        $sql .= 'on        t_order.order_id = t_order_meta.order_id ';
        $sql .= 'and       t_order_meta.meta_type = "amount"';
        $sql .= 'where  t_order.order_id = :order_id ';

        if( !is_null($this->person_id) ) {
            $sql .= 'and   t_order.person_id = :person_id ';
        }

        $sql .= 'group by t_order.order_id ';
        $sql .= '       , t_order.product_id ';
        $sql .= '       , t_order.course_id ';
        $sql .= '       , t_order.order_status ';
        $sql .= '       , t_order.request_flg ';
        $sql .= '       , t_order.pay_date ';
        $sql .= '       , t_order.credit_number ';
        $sql .= '       , t_order.settlement_type ';
        $sql .= '       , t_order.settlement ';
        $sql .= '       , t_order.settlement_name ';
        $sql .= '       , t_order.payment ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':order_id', $orderID);
        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }
        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectDataMeta = $db->getResponse();

        $selectData[0]['product_id'] = $selectDataMeta[0]['product_id'];
        $selectData[0]['course_id'] = $selectDataMeta[0]['course_id'];
        $selectData[0]['request_flg'] = $selectDataMeta[0]['request_flg'];
        $selectData[0]['order_status'] = $selectDataMeta[0]['order_status'];
        if($selectDataMeta[0]['pay_date'] != '') {
            $selectData[0]['pay_date'] = date('Y/m/d H:i:s', strtotime($selectDataMeta[0]['pay_date']));
        }
        $selectData[0]['credit_number'] = $selectDataMeta[0]['credit_number'];
        $selectData[0]['settlement_type'] = $selectDataMeta[0]['settlement_type'];
        if($selectDataMeta[0]['settlement_type'] != '') {
            $selectData[0]['settlement_type_text'] = ConstantMy::$arySettlementType[$selectDataMeta[0]['settlement_type']];
        }
        $selectData[0]['settlement'] = $selectDataMeta[0]['settlement'];
        $selectData[0]['settlement_name'] = $selectDataMeta[0]['settlement_name'];
        $selectData[0]['payment'] = $selectDataMeta[0]['payment'];
        if($selectDataMeta[0]['payment'] != '') {
            $selectData[0]['payment_text'] = ConstantMy::$aryPayment[$selectDataMeta[0]['payment']];
        }
        $selectData[0]['order_status_text'] = ConstantMy::$aryCorrespondence[$selectDataMeta[0]['order_status']];
        $selectData[0]['amount'] = explode(',', $selectDataMeta[0]['amount']);
        return $selectData[0];
    }

    /******************************
    申込数取得
    *******************************/
    function getOrderAmount($sha1_order_id) {

        $sql = '';
        $sql .= 'select t_order.order_id ';
        $sql .= '     , t_order.product_id ';
        $sql .= '     , t_order.course_id ';
        $sql .= '     , t_order.order_status ';
        $sql .= '     , sum(t_order_meta.meta_value) amount ';
        $sql .= 'from   t_order ';
        $sql .= 'left join t_order_meta ';
        $sql .= 'on        t_order.order_id = t_order_meta.order_id ';
        $sql .= 'and       t_order_meta.meta_type = "price_value"';
        $sql .= 'where  SHA1(CONCAT("' . ORDER_ID_SALT . '", t_order.order_id)) = :order_id ';
        $sql .= 'and    t_order.order_status = 5 ';
        $sql .= 'and    t_order.request_flg = 2 ';
        $sql .= 'group by t_order.order_id ';
        $sql .= '       , t_order.product_id ';
        $sql .= '       , t_order.course_id ';
        $sql .= '       , t_order.order_status ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':order_id', $sha1_order_id);
        
        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        return $selectData[0];
    }

    /******************************
    受注一覧取得
    $num：
      デフォルト５件
    *******************************/
    function getOrderListView($num = 5, $search_params = null) {

        //==========================================
        //◆ Spiral申込管理DB
        //==========================================
        $spiral = new SpiralApi('database/select', 'oderDB');

        $serch_condition = array();
        if( !is_null($search_params) ) {
            foreach($search_params as $key => $value) {
                if(!isset($value) || $value == '') {
                    continue;
                }
                if($key == 'order_id') {
                    $serch_condition[] = array('name' => 'OderID', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'simei_sei') {
                    $serch_condition[] = array('name' => 'nameSei', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'simei_mei') {
                    $serch_condition[] = array('name' => 'nameMei', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'simei_kana_sei') {
                    $serch_condition[] = array('name' => 'kanaSei', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'simei_kana_mei') {
                    $serch_condition[] = array('name' => 'kanaMei', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'mail') {
                    $serch_condition[] = array('name' => 'mail', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'tel') {
                    $serch_condition[] = array('name' => 'tel_', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'mobile') {
                    $serch_condition[] = array('name' => 'mobile', 'value' => '%' . $value . '%', 'operator' => 'like');
                }
                if($key == 'order_date_from') {
                    $serch_condition[] = array('name' => 'oderDate', 'value' => $value, 'operator' => '>=');
                }
                if($key == 'order_date_to') {
                    $serch_condition[] = array('name' => 'oderDate', 'value' => $value, 'operator' => '<=');
                }
            }
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
        $order_ids = array();
        foreach($selectData as &$data) {
            $regDate = DateTime::createFromFormat('Y年m月d日 H時i分s秒', $data['registDate']);
            $data['registDate'] = $regDate->format('Y/m/d H:i');

            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['oderDate']);
            $data['oderDate'] = $oderDate->format('Y/m/d H:i');

            $main_photo_thumb = UPL_DIR . $data['ProductID'] . '/thumb_' . PRODUCT_MAIN_PHOTO1_NAME;

            if (!file_exists($main_photo_thumb)) {
                $data['main_photo'] = URL_UPL_DIR . $data['ProductID'] . '/' . PRODUCT_MAIN_PHOTO1_NAME;
            } else {
                $data['main_photo'] = URL_UPL_DIR . $data['ProductID'] . '/thumb_' . PRODUCT_MAIN_PHOTO1_NAME;
            }

            $order_ids[] = $data['OderID'];
        }

        //==========================================
        //◆ MySQL申込管理DB
        //==========================================
        $sql = '';
        $sql .= 'select t_order.order_id ';
        $sql .= '     , t_order.product_id ';
        $sql .= '     , t_order.course_id ';
        $sql .= '     , t_order.order_status ';
        $sql .= '     , t_order.settlement_type ';
        $sql .= '     , t_product.title ';
        $sql .= '     , sum(t_order_meta.meta_value) total ';
        $sql .= 'from   t_order ';
        $sql .= 'left join t_order_meta ';
        $sql .= 'on        t_order.order_id = t_order_meta.order_id ';
        $sql .= 'and       t_order_meta.meta_type = "price_value" ';
        $sql .= 'left join t_product ';
        $sql .= 'on        t_order.product_id = t_product.product_id ';
        $sql .= 'where  t_order.order_id in ("' . implode('","', $order_ids) . '") ';

        if( !is_null($this->person_id) ) {
            $sql .= 'and   t_order.person_id = :person_id ';
        }

        if( !is_null($search_params) ) {
            foreach($search_params as $key => $value) {
                if(!isset($value) || $value == '' || (is_array($value) && count($value) == 0) ) {
                    continue;
                }
                if($key == 'order_status') {
                    $sql .= 'and t_order.order_status = :order_status ';
                }
                if($key == 'settlement_type') {
                    $sql .= 'and t_order.settlement_type in (:settlement_type) ';
                }
                if($key == 'title') {
                    $sql .= 'and t_product.title like :title ';
                }
            }
        }

        $sql .= 'group by t_order.order_id ';
        $sql .= '       , t_order.product_id ';
        $sql .= '       , t_order.course_id ';
        $sql .= '       , t_order.order_status ';
        $sql .= '       , t_order.settlement_type ';
        $sql .= '       , t_product.title ';
        $sql .= 'order by t_order.regist_date desc ';

        $db = new DB();
        $db->setPrepare($sql);

        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }
        if( !is_null($search_params) ) {
            foreach($search_params as $key => $value) {
                if(!isset($value) || $value == '') {
                    continue;
                }
                if($key == 'order_status') {
                    $db->setBindValueSTR(':order_status', $value);
                }
                if($key == 'settlement_type') {
                    $db->setBindValueSTR(':settlement_type', implode(',', $value));
                }
                if($key == 'title') {
                    $db->setBindValueSTR(':title', '%' . $value . '%');
                }
            }
        }

        

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectMetaData = $db->getResponse();

        $resultData = array();
        $spiralData = array_column($selectData, null, 'OderID');
        
        for($i = 0; $i < count($selectMetaData); $i++) {
            $resultData[] = $spiralData[$selectMetaData[$i]['order_id']];
            $resultData[$i]['order_id'] = $selectMetaData[$i]['order_id'];
            $resultData[$i]['order_status'] = $selectMetaData[$i]['order_status'];
            $resultData[$i]['order_status_text'] = ConstantMy::$aryCorrespondence[$selectMetaData[$i]['order_status']];
            if($selectMetaData[$i]['settlement_type'] != '') {
                $resultData[$i]['settlement_type_text'] = ConstantMy::$arySettlementType[$selectMetaData[$i]['settlement_type']];
            } else {
                $resultData[$i]['settlement_type_text'] = '';
            }
            $resultData[$i]['total'] = $selectMetaData[$i]['total'];
            $resultData[$i]['title'] = $selectMetaData[$i]['title'];
        }

        return $resultData;
    }

    /******************************
    申し込み登録
    *******************************/
    function update($data, $product_data, $price_data, $request_flg) {

        $time_stamp = date("Y/m/d H:i:s");

        //==========================================
        //◆ Spiral申込管理DB
        //==========================================
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
        $update_data['PersonID'] = $product_data['person_id'];
        $update_data['ProductID'] = $product_data['product_id'];

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

        //==========================================
        //◆ MySQL申込管理DB
        //==========================================
        $db = new DB();

        //申込管理
        $params = array();
        $params['order_id'] = $data['OderID'];
        $params['person_id'] = $product_data['person_id'];
        $params['product_id'] = $product_data['product_id'];
        $params['course_id'] = $data['course_id'];
        $params['order_date'] = $data['oderDate'];
        $params['order_status'] = $request_flg ? 1 : 5; // 1:承認待ち 5:決済処理中;
        $params['request_flg'] = $request_flg ? 1 : 0;
        $params['regist_date'] = $time_stamp;
        $params['update_date'] = $time_stamp;

        //トランザクション開始
        $db->beginTransaction();

        $err_msg = $db->execInsert('t_order', $params, false);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        //申込管理メタ情報
        $params = array();
        $params['order_id'] = $data['OderID'];
        for($i = 0; $i < count($product_data['price_type']); $i++) {
            $params['meta_type'] = 'price_type';
            $params['meta_type_no'] = $i + 1;
            $params['meta_value'] = $product_data['price_type'][$i];
            $err_msg = $db->execInsert('t_order_meta', $params, false);

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }
        }
        for($i = 0; $i < count($data['amount']); $i++) {
            $params['meta_type'] = 'amount';
            $params['meta_type_no'] = $i + 1;
            $params['meta_value'] = $data['amount'][$i];
            $err_msg = $db->execInsert('t_order_meta', $params, false);

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }
        }
        for($i = 0; $i < count($price_data['price_value']); $i++) {
            $params['meta_type'] = 'price_value';
            $params['meta_type_no'] = $i + 1;
            $params['meta_value'] = $price_data['price_value'][$i] * $data['amount'][$i];
            $err_msg = $db->execInsert('t_order_meta', $params, false);

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }
        }

        $db->commit();

        return $data;
    }

    /******************************
    決済結果登録
    *******************************/
    function update_payment($data) {
        $time_stamp = date("Y/m/d H:i:s");

        /*
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
        */

        $db = new DB();

        $params = array();
        $params['update_date'] = $time_stamp;
        $params['payment'] = $data['Payment'];
        $params['settlement_type'] = $data['settlementType'];
        $params['credit_number'] = $data['CreditNumber'];
        $params['order_status'] = $data['Correspondence'];
        $params['settlement'] = $data['settlement'];
        $params['settlement_name'] = $data['settlement_name'];
        $params['pay_date'] = $data['paymentDate'];

        $where_params = array();
        $where_params['order_id'] = $data['OderID'];

        $err_msg = $db->execUpdate('t_order', $params, $where_params);

        if( !empty($err_msg) ) {
            //エラー処理
            $log = new Log();
            $log->setErrorLog($err_msg);
            return $err_msg;
        }

        return $data;
    }

    /******************************
    承認登録
    *******************************/
    function update_approval($data) {
        $time_stamp = date("Y/m/d H:i:s");

        $db = new DB();

        $params = array();
        $params['update_date'] = $time_stamp;
        $params['order_status'] = 5;
        $params['request_flg'] = 2;

        $where_params = array();
        $where_params['order_id'] = $data['OderID'];

        //トランザクション開始
        $db->beginTransaction();

        $err_msg = $db->execUpdate('t_order', $params, $where_params, false);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $db->commit();

        $data['request_flg'] = 2;
        $data['order_status_text'] = ConstantMy::$aryCorrespondence[5];

        return $data;
    }

    /******************************
    承認取消登録
    *******************************/
    function update_approval_cancel($data) {
        $time_stamp = date("Y/m/d H:i:s");

        $db = new DB();

        $params = array();
        $params['update_date'] = $time_stamp;
        $params['order_status'] = 6;
        $params['request_flg'] = 2;

        $where_params = array();
        $where_params['order_id'] = $data['OderID'];

        //トランザクション開始
        $db->beginTransaction();

        $err_msg = $db->execUpdate('t_order', $params, $where_params, false);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $db->commit();

        $data['request_flg'] = 2;
        $data['order_status_text'] = ConstantMy::$aryCorrespondence[6];

        return $data;
    }

    /*******************
    POSTデータ取得(override)
    ********************/
    function getPostData() {
        $data = parent::getPostData();

        if(isset($_POST['amount'])) {
            $amount = $_POST['amount'];
            $data['amount'] = array();
            foreach($amount as $value) {
                $data['amount'][] = htmlspecialchars($value);
            }
        }

        return $data;
    }

    /*******************
    新規データ取得(override)
    ********************/
    function getNewData() {
        $data = parent::getNewData();

        $data['amount'] = array();

        return $data;
    }
}