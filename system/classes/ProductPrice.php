<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　商品代金管理（MySQL）
機能名：
　商品代金管理（MySQL）
*******************************************/
define('SESSION_PRODUCT_PRICE', 'session_product_price');

class ProductPrice extends Entity {

    private $log;
    private $t_product_course_name = 't_product_course';
    private $t_product_course_meta_name = 't_product_course_meta';

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

        //商品コースメタ情報
        $this->columns[] = 'price_title';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_course_meta_name;

        $this->columns[] = 'price_type';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_course_meta_name;

        $this->columns[] = 'price_value';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_course_meta_name;

        $this->columns[] = 'price_condition';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_course_meta_name;

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
        }

        return $resultData;
    }

    /******************************
    商品コース代金データ取得
    *******************************/
    function getCourseMeta($course_id) {

        //セッション変数にデータがあれば復元
        if(isset($_SESSION[SESSION_PRODUCT_PRICE])) {
            $resultData = $_SESSION[SESSION_PRODUCT_PRICE];
            unset($_SESSION[SESSION_PRODUCT_PRICE]);
            return $resultData;
        }

        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_course_meta_name . ' ';
        $sql .= 'where course_id = :course_id ';
        $sql .= 'order by meta_type, meta_type_no ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':course_id', $course_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectMetaData = $db->getResponse();

        if(count($selectMetaData) == 0) {
            return $this->getNewData();
        }

        //=============
        //データ設定
        //=============
        $resultData = array();

        foreach($selectMetaData as $meta_data) {
            $meta_type = $meta_data['meta_type'];
            $meta_value = $meta_data['meta_value'];

            if(!array_key_exists($meta_type, $resultData)) {
                $resultData[$meta_type] = array();
            }

            if($meta_type == 'price_type') {
                //代金タイプ
                $resultData[$meta_type][] = $meta_value;
                $resultData[$meta_type . '_text'][] = Constant::$aryPriceType[$meta_value];
                $resultData[$meta_type . '_text_jp'][] = Constant::$aryPriceTypeJp[$meta_value];
                $resultData[$meta_type . '_text_en'][] = Constant::$aryPriceTypeEn[$meta_value];

            } elseif($meta_type == 'price_condition') {
                //代金条件
                $resultData[$meta_type][] = unserialize($meta_value);

            } else {
                $resultData[$meta_type][] = $meta_value;
            }
        }

        return $resultData;
    }

    /******************************
    商品入力チェック
    *******************************/
    function checkInput($data) {
        $err_msg = array();

        for($i = 0; $i < count($data['price_title']); $i++) {
            if( $data['price_title'][$i] == '' ) {
                $err_msg['price_title' . $i] = MESSAGE_ERROR_REQUIRE;
            }
        }
        for($i = 0; $i < count($data['price_type']); $i++) {
            if( $data['price_type'][$i] == '' ) {
                $err_msg['price_type' . $i] = MESSAGE_ERROR_REQUIRE;
            }
        }
        for($i = 0; $i < count($data['price_value']); $i++) {
            if( empty($data['price_value'][$i]) ) {
                $err_msg['price_value' . $i] = MESSAGE_ERROR_REQUIRE;
            }
        }

        return $err_msg;
    }

    /******************************
    登録処理
    *******************************/
    function update($data) {

        //==============
        //商品コースメタ情報登録
        //==============
        $db = new DB();

        //トランザクション開始
        $db->beginTransaction();

        for($i = 0; $i < count($this->columns); $i++) {
            $table = $this->tableName[$i];
            $column = $this->columns[$i];
            
            $params = array();
            $params['course_id'] = $data['course_id'];
            
            $where_params = array();
            $where_params['course_id'] = $data['course_id'];

            if($table == $this->t_product_course_meta_name) {
                //削除
                $where_params['meta_type'] = $column;
                $err_msg = $db->execDelete($table, $where_params, false);
                if( !empty($err_msg) ) {
                    //エラー処理
                    return $err_msg;
                }

                //登録
                $params['meta_type'] = $column;
                for($j = 0; $j < count($data[$column]); $j++) {
                    $params['meta_type_no'] = $j + 1;

                    if($column == 'price_condition') {

                        $params['meta_value'] = serialize($data[$column][$j]);

                    } else {

                        $params['meta_value'] = $data[$column][$j];

                    }

                    $err_msg = $db->execInsert($table, $params, false);

                    if( !empty($err_msg) ) {
                        //エラー処理
                        return $err_msg;
                    }
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

        //料金条件
        $price_count = 0;
        if( isset($_POST['price_count']) ) {
            $price_count = intval(htmlspecialchars($_POST['price_count']));
        }
        for($i = 1; $i <= $price_count; $i++) {
            if( isset($_POST['price_condition' . $i]) ) {
                $data['price_condition'][] = $_POST['price_condition' . $i];
            } else {
                $data['price_condition'][] = array();
            }
        }

        //料金区分テキスト
        $data['price_type_text'] = array();
        foreach( $data['price_type'] as $value) {
            if($value != '') {
                $data['price_type_text'][] = Constant::$aryPriceType[$value];
            } else {
                $data['price_type_text'][] = '';
            }
        }

        //データをセッション保存
        $_SESSION[SESSION_PRODUCT_PRICE] = $data;

        return $data;
    }

    /*******************
    新規データ取得(override)
    ********************/
    function getNewData() {
        $data = parent::getNewData();

        for($i = 1; $i <= count($data['price_type']); $i++) {
            $data['price_condition'][] = array('');
        }

        return $data;
    }
}