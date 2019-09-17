<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　商品管理（MySQL）
機能名：
　商品管理（MySQL）
*******************************************/
define('SESSION_PRODUCT_STOCK_CALEN', 'session_product_stock_calen');
define('SESSION_PRODUCT_STOCK_CLOSE', 'session_product_stock_close');

class ProductStock extends Entity {

    private $log;
    private $t_product_course_name = 't_product_course';
    private $t_product_course_stock_name = 't_product_course_stock';

    function __construct() {

        $this->log = new Log();

        $this->columns = array();
        $this->columnsDef = array();
        $this->tableName = array();

        //商品コース
        $this->columns[] = 'course_id';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'course_name';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'close_date';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'close_time';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'reservation_type';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'open_date_from';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'open_date_from_limit';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'open_date';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'remind_mail_date';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_name;

        //商品コース在庫
        $this->columns[] = 'stock_date';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_stock_name;

        $this->columns[] = 'stock_day';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_stock_name;

        $this->columns[] = 'stock_type';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_stock_name;

        $this->columns[] = 'stock_value';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_stock_name;

        $this->columns[] = 'stock_option';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_stock_name;
    }

    /******************************
    商品コース取得
    *******************************/
    function getCourse($product_id, $course_id = null) {

        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_course_name . ' ';
        $sql .= 'where product_id = :product_id ';
        if(!is_null($course_id)) {
            $sql .= 'and course_id = :course_id ';
        }
        $sql .= 'order by course_order ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':product_id', $product_id);
        if(!is_null($course_id)) {
            $db->setBindValueSTR(':course_id', $course_id);
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectCourseData = $db->getResponse();

        //=============
        //データ設定
        //=============
        $resultData = $this->getNewData();
        $resultData['product_id'] = $product_id;

        foreach($selectCourseData as $data) {
            $resultData['course_id'][] = $data['course_id'];
            $resultData['course_name'][] = $data['course_name'];
            $resultData['course_order'][] = $data['course_order'];
        }

        return $resultData;
    }

    /******************************
    商品コース手じまい日取得
    *******************************/
    function getCourseClose($course_id) {

        //セッション変数にデータがあれば復元
        if(isset($_SESSION[SESSION_PRODUCT_STOCK_CLOSE])) {
            $resultData = $_SESSION[SESSION_PRODUCT_STOCK_CLOSE];
            unset($_SESSION[SESSION_PRODUCT_STOCK_CLOSE]);
            return $resultData;
        }

        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_course_name . ' ';
        $sql .= 'where course_id = :course_id ';
        $sql .= 'order by course_order ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':course_id', $course_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectCourseData = $db->getResponse();

        //=============
        //データ設定
        //=============
        $resultData = array();
        foreach($selectCourseData as $data) {
            $resultData['close_date'] = is_null($data['close_date']) ? '' : $data['close_date'];
            $resultData['close_time'] = is_null($data['close_time']) ? '' : $data['close_time'];
            $resultData['reservation_type'] = is_null($data['reservation_type']) ? '' : $data['reservation_type'];
            $resultData['open_date_from'] = is_null($data['open_date_from']) ? '' : $data['open_date_from'];
            $resultData['open_date_from_limit'] = is_null($data['open_date_from_limit']) ? '' : $data['open_date_from_limit'];
            $resultData['open_date'] = is_null($data['open_date']) ? '' : $data['open_date'];
            $resultData['remind_mail_date'] = is_null($data['remind_mail_date']) ? '' : $data['remind_mail_date'];
        }

        return $resultData;
    }

    /******************************
    商品コース在庫取得
    *******************************/
    function getCourseStock($course_id, $init_stock_date = null) {

        //セッション変数にデータがあれば復元
        if(isset($_SESSION[SESSION_PRODUCT_STOCK_CALEN])) {
            $resultData = $_SESSION[SESSION_PRODUCT_STOCK_CALEN];
            unset($_SESSION[SESSION_PRODUCT_STOCK_CALEN]);
            return $resultData;
        }

        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_course_stock_name . ' ';
        $sql .= 'where course_id = :course_id ';
        if(!is_null($init_stock_date)) {
            $sql .= 'and stock_date = :stock_date ';
        } else {
            $sql .= 'and stock_date >= :stock_date ';
        }
        $sql .= 'order by stock_date, stock_day ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':course_id', $course_id);
        if(!is_null($init_stock_date)) {
            $db->setBindValueSTR(':stock_date', $init_stock_date);
        } else {
            $db->setBindValueSTR(':stock_date', date('Y-m-01'));
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        //=============
        //データ設定
        //=============
        $resultData = array();

        if(count($selectData) == 0) {
            $stock_date = date('Y-m-01');
            $resultData[$stock_date] = array();
            $resultData[$stock_date]['stock_value'] = array();
            $resultData[$stock_date]['stock_option'] = array();
            $resultData[$stock_date]['stock_type'] = array();
            return $resultData;
        }

        foreach($selectData as $data) {
            $stock_date = $data['stock_date'];
            
            if(!array_key_exists($stock_date, $resultData)) {
                $resultData[$stock_date] = array();
            }
            if(!array_key_exists('stock_type', $resultData[$stock_date])) {
                $resultData[$stock_date]['stock_type'] = array();
            }
            if(!array_key_exists('stock_value', $resultData[$stock_date])) {
                $resultData[$stock_date]['stock_value'] = array();
            }
            if(!array_key_exists('stock_option', $resultData[$stock_date])) {
                $resultData[$stock_date]['stock_option'] = array();
            }

            $resultData[$stock_date]['stock_type'][] = $data['stock_type'];
            if(intval($data['stock_type']) > 0) {
                $resultData[$stock_date]['stock_value'][] = intval($data['stock_type']) * -1;
            } else {
                $resultData[$stock_date]['stock_value'][] = $data['stock_value'];
            }
            $resultData[$stock_date]['stock_option'][] = $data['stock_option'];

        }

        return $resultData;
    }

    /******************************
    商品現在在庫取得
    *******************************/
    function getCourseCurrentStock($course_id, $ym, $order_id = null) {

        //============
        //在庫取得
        //============
        $stockData = $this->getCourseStock($course_id, $ym);

        if(!array_key_exists($ym, $stockData) || count($stockData[$ym]['stock_value']) == 0 ) {
            for($i = 1; $i <= 31; $i++) {
                $stockData[$ym]['stock_type'][] = null;
                $stockData[$ym]['stock_value'][] = 0;
                $stockData[$ym]['stock_option'][] = 0;
            }
        }

        //============
        //申込取得
        //============
        $sql = '';
        $sql .= 'select   t_order.order_date ';
        $sql .= '     ,   sum(cast(t_order_meta.meta_value as SIGNED)) order_count ';
        $sql .= 'from     t_order ';

        $sql .= 'left join t_order_meta ';
        $sql .= 'on        t_order.order_id = t_order_meta.order_id ';
        $sql .= 'and       t_order_meta.meta_type = "amount" ';

        $sql .= 'where    course_id = :course_id ';
        $sql .= 'and      DATE_FORMAT(order_date, "%Y%m") = :order_date_ym ';
        $sql .= 'group by t_order.order_date ';
        $sql .= 'order by t_order.order_date ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':course_id', $course_id);
        $db->setBindValueSTR(':order_date_ym', date('Ym', strtotime($ym)));

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $orderData = $db->getResponse();

        //============
        //在庫計算
        //============
        foreach($orderData as $order) {
            $day = intval(date('j', strtotime($order['order_date'])));
            $stockData[$ym]['stock_value'][$day - 1] = $stockData[$ym]['stock_value'][$day - 1] - $order['order_count'];
        }

        //============
        //前後月追加
        //============
        $stockData[$ym]['prevMonth'] = date('Y-m-d', strtotime('-1 month', strtotime($ym)));
        $stockData[$ym]['nextMonth'] = date('Y-m-d', strtotime('+1 month', strtotime($ym)));

        return $stockData[$ym];
    }

    /******************************
    手じまい日チェック
    *******************************/
    function checkClosingOut($course_id, $order_date) {
        $err_msg = '';

        $close_data = $this->getCourseClose($course_id);

        $now = time();
        $now_plus_closingout = strtotime('+' . intval($close_data['close_date']) . ' day', $now);
        $closingout_time = '0000';
        if( isset($close_data['close_time']) && $close_data['close_time'] != '' ) {
            $closingout_time = substr($close_data['close_time'], 0, 2) . substr($close_data['close_time'], 3, 2);
        }

        $now_plus_openingout_from = strtotime('+' . intval($close_data['open_date_from']) . ' day', $now);
        $openingout_from_limit = '2359';
        if( isset($close_data['open_date_from_limit']) && $close_data['open_date_from_limit'] != '' ) {
            $openingout_from_limit = substr($close_data['open_date_from_limit'], 0, 2) . substr($close_data['open_date_from_limit'], 3, 2);
        }
        $now_plus_openingout = strtotime('+' . intval($close_data['open_date']) . ' day', $now);

        if($close_data['reservation_type'] == 2) {
            if( date('Ymd', $order_date) > date('Ymd', $now_plus_openingout) ) {
                $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
            } elseif( date('Ymd', $order_date) < date('Ymd', $now_plus_openingout_from) ) {
                $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
            } elseif( date('Ymd', $order_date) == date('Ymd', $now_plus_openingout_from) && date('Hi', $now) >= $openingout_from_limit ) {
                $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
            }

        } else {
            if( date('Ymd', $order_date) < date('Ymd', $now_plus_closingout) ) {
                $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
            } elseif( date('Ymd', $order_date) == date('Ymd', $now_plus_closingout) && date('Hi', $now) >= $closingout_time ) {
                $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
            }

        }

        return $err_msg;
    }

    /******************************
    商品入力チェック
    *******************************/
    function checkInput($data) {
        $err_msg = array();

        if( $data['reservation_type'] == '1' ) {
            if( $data['close_date'] == '' ) {
                $err_msg['close_date'] = MESSAGE_ERROR_REQUIRE;
            }
        } else {
            if( $data['open_date_from'] == '' ) {
                $err_msg['open_date_from'] = MESSAGE_ERROR_REQUIRE;
            }
            if( $data['open_date'] == '' ) {
                $err_msg['open_date'] = MESSAGE_ERROR_REQUIRE;
            }
        }

        return $err_msg;
    }

    /******************************
    登録処理
    *******************************/
    function update($data) {

        //=============
        //商品コース登録（手じまい日）
        //=============

        $db = new DB();

        //トランザクション開始
        $db->beginTransaction();

        $params = array();
        $params['close_date'] = $data['close_date'];
        $params['close_time'] = $data['close_time'];
        $params['reservation_type'] = $data['reservation_type'];
        $params['open_date_from'] = $data['open_date_from'];
        $params['open_date_from_limit'] = $data['open_date_from_limit'];
        $params['open_date'] = $data['open_date'];
        $params['remind_mail_date'] = $data['remind_mail_date'];

        $where_params = array();
        $where_params['course_id'] = $data['course_id'];

        $err_msg = $db->execUpdate($this->t_product_course_name, $params, $where_params, false);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        //=============
        //商品コース在庫登録
        //=============

        $calenData = $_SESSION[SESSION_PRODUCT_STOCK_CALEN];

        $where_params = array();
        $where_params['course_id'] = $data['course_id'];

        foreach( $calenData as $ym => $stock ) {
            //削除
            $where_params['stock_date'] = $ym;
            $err_msg = $db->execDelete($this->t_product_course_stock_name, $where_params, false);
            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }

            //登録
            $params = array();
            $params['course_id'] = $data['course_id'];
            $params['stock_date'] = $ym;
            for($i = 0; $i < count($stock['stock_value']); $i++) {

                $params['stock_day'] = $i + 1;
                
                $stock_value = $stock['stock_value'][$i];
                if(intval($stock_value) < 0) {
                    $params['stock_type'] = intval($stock_value) * -1;
                    $params['stock_value'] = "0";
                } elseif(intval($stock_value) == 0) {
                    $params['stock_type'] = null;
                    $params['stock_value'] = null;
                } else {
                    $params['stock_type'] = "0";
                    $params['stock_value'] = intval($stock_value);
                }

                $params['stock_option'] = $stock['stock_option'][$i];

                $err_msg = $db->execInsert($this->t_product_course_stock_name, $params, false);

                if( !empty($err_msg) ) {
                    //エラー処理
                    return $err_msg;
                }
            }
        }

        $db->commit();

        return $data;
    }

    /*******************
    POSTデータ取得(override)
    ********************/
    function getPostData() {
        $data = parent::getPostData();

        //カレンダーデータ取得
        $calenData = array();
        $no_input_date = array();
        foreach( $data['stock_date'] as $stock_date ) {

            if(!array_key_exists($stock_date, $calenData)) {
                $calenData[$stock_date] = array();
            }

            $calenData[$stock_date]['stock_value'] = $_POST['stock_value_' . $stock_date];
            $calenData[$stock_date]['stock_option'] = $_POST['stock_option_' . $stock_date];

            //入力のないカレンダーを取得
            if(implode('', $calenData[$stock_date]['stock_value']) == '') {
                $no_input_date[] = $stock_date;
            }

        }

        //入力のないカレンダーは削除対象
        foreach( $no_input_date as $date ) {
            $calenData[$date]['stock_value'] = array();
        }

        if(count($calenData) == 0) {
            $stock_date = date('Y-m-01');
            $calenData[$stock_date] = array();
            $calenData[$stock_date]['stock_value'] = array();
            $calenData[$stock_date]['stock_option'] = array();
        }

        //カレンダーデータをセッション保存
        $_SESSION[SESSION_PRODUCT_STOCK_CALEN] = $calenData;

        //手じまい日処理
        if(is_array($data['close_date'])) {
            $data['close_date'] = '';
        }
        if(is_array($data['open_date_from'])) {
            $data['open_date_from'] = '';
        }
        if(is_array($data['open_date'])) {
            $data['open_date'] = '';
        }
        if(is_array($data['remind_mail_date'])) {
            $data['remind_mail_date'] = '';
        }

        //手じまい日情報をセッション保存
        $closeData = array();
        $closeData['close_date'] = $data['close_date'];
        $closeData['close_time'] = $data['close_time'];
        $closeData['reservation_type'] = $data['reservation_type'];
        $closeData['open_date_from'] = $data['open_date_from'];
        $closeData['open_date_from_limit'] = $data['open_date_from_limit'];
        $closeData['open_date'] = $data['open_date'];
        $closeData['remind_mail_date'] = $data['remind_mail_date'];
        $_SESSION[SESSION_PRODUCT_STOCK_CLOSE] = $closeData;

        return $data;
    }
}