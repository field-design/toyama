<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　受注管理
機能名：
　受注管理
*******************************************/
class Order extends Entity {

    function __construct() {

        $this->columns = array();
        $this->columnsDef = array();

        //商品ID
        $this->columns[] = 'ProductID';
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
            $this->columnsDef[] = 0;
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
    function getOrderListView($num = 5) {

        $spiral = new SpiralApi('database/select', 'oderDB');

        $serch_condition = array();

        $lines_per_page = $num;

        $page = 1;

        $sort = array();
        $sort[] = array('name' => 'oderDate', 'order' => 'desc');

        $spiral->setSelectParam($this->columns, $serch_condition, null, $lines_per_page, $page, $sort);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //DB値調整
        foreach($selectData as &$data) {
            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['oderDate']);
            $data['oderDate'] = $oderDate->format('Y/m/d H:i');

            $data['Correspondence'] = Constant::$aryCorrespondence[$data['Correspondence']];

            if($data['Payment'] != '') {
                $data['Payment'] = Constant::$aryPayment[$data['Payment']];
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

}