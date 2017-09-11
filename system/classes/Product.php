<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　商品管理（MySQL）
機能名：
　商品管理（MySQL）
*******************************************/
class Product extends Entity {

    private $log;
    private $t_product_name = 't_product';
    private $t_product_meta_name = 't_product_meta';
    private $t_product_course_name = 't_product_course';
    private $person_id = null;

    function __construct($login = null) {

        if( !is_null($login) && !$login->isAuthAdmin() ) {
            $this->person_id = $login->getPersonID();
        }

        $this->log = new Log();

        $this->columns = array();
        $this->columnsDef = array();
        $this->tableName = array();

        $this->columns[] = 'regist_date';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'update_date';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'product_id';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'person_id';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'display_order';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'title';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'sub_title';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'description';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'price_title';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'area';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'category';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'publish_status';
        $this->columnsDef[] = 3;
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'publish_date';
        $this->columnsDef[] = array(date('Y/m/d'), date('H:i'));
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'period_from';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'period_to';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'period_note';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'period_exclusion';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'min_member';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'min_depart';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'max_order';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'operator';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'conductor_flg';
        $this->columnsDef[] = 0;
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'start_time';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'tour_time';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'order_deadline';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'disp_price_page';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'lang';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        $this->columns[] = 'group_slug';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_product_name;

        //商品管理メタ情報
        $this->columns[] = 'main_photo';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        /*
        $this->columns[] = 'price_type';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'price_value';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'price_condition';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_meta_name;
        */

        $this->columns[] = 'price_include';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'meeting_place';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'meeting_place_address';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'coordinate';
        $this->columnsDef[] = array(ADMIN_INIT_LAT . ',' . ADMIN_INIT_LNG);
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'notes';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'others';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'detail_photo';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'detail_title';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'detail_description';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'detail_link';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'cancel_charge_text';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'cancel_charge_rate';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'cancel_notes';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'disp_course';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'disp_price_title';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'disp_price_type';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'disp_price_value';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'disp_price_condition';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_product_meta_name;

        $this->columns[] = 'question';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_meta_name;

        //商品コース
        $this->columns[] = 'course_id';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_course_name;

        $this->columns[] = 'course_name';
        $this->columnsDef[] = array('');
        $this->tableName[] = $this->t_product_course_name;

    }

    /******************************
    商品入力チェック
    *******************************/
    function checkInput($data, $nextsection) {
        $err_msg = array();

        //公開日
        $err_section = 10;
        if( empty($data['publish_date'][0]) || empty($data['publish_date'][1]) ) {
            $err_msg['publish_date'] = MESSAGE_ERROR_REQUIRE;
            $err_msg['nextsection'] = $err_section;
        }
        if( !array_key_exists('publish_date', $err_msg) ) {
            $date_ymdhis = $data['publish_date'][0] . ' ' . $data['publish_date'][1];
            if(!strptime($date_ymdhis, '%Y/%m/%d %H:%M')) {
                $err_msg['publish_date'] = MESSAGE_ERROR_DATE;
                $err_msg['nextsection'] = $err_section;
            }
        }
        if( !array_key_exists('publish_date', $err_msg) ) {
            $date_ymd = explode('/', $data['publish_date'][0]);
            $date_hi = explode(':', $data['publish_date'][1]);
            if(!checkdate($date_ymd[1], $date_ymd[2], $date_ymd[0])) {
                $err_msg['publish_date'] = MESSAGE_ERROR_DATE;
                $err_msg['nextsection'] = $err_section;
            }
        }

        //プラン内容
        $err_section = 7;
        if($nextsection == 0 || $nextsection == $err_section + 1) {
            for($i = 0; $i < count($data['detail_title']); $i++) {
                if( empty($data['detail_title'][$i]) ) {
                    $err_msg['detail_title' . $i] = MESSAGE_ERROR_REQUIRE;
                    $err_msg['nextsection'] = $err_section;
                } else {
                    $err_msg['detail_title' . $i] = '';
                }
            }
        }

        //お申込み（コース）
        $err_section = 6;
        if($nextsection == 0 || $nextsection == $err_section + 1) {
            if(count($data['course_name']) == 0) {
                $err_msg['course_name'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            } else {
                if( empty($data['course_name'][0]) ) {
                    $err_msg['course_name'] = MESSAGE_ERROR_REQUIRE;
                    $err_msg['nextsection'] = $err_section;
                }
            }
        }

        //集合場所
        $err_section = 3;
        if($nextsection == 0 || $nextsection == $err_section + 1) {
            for($i = 0; $i < count($data['meeting_place']); $i++) {
                if( empty($data['meeting_place'][$i]) ) {
                    $err_msg['meeting_place' . $i] = MESSAGE_ERROR_REQUIRE;
                    $err_msg['nextsection'] = $err_section;
                } else {
                    $err_msg['meeting_place' . $i] = '';
                }
            }
        }

        //プラン詳細
        $err_section = 2;
        if($nextsection == 0 || $nextsection == $err_section + 1) {
            if( $data['period_from'] == '' ) {
                $err_msg['period_from'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }
            if( $data['period_to'] == '' ) {
                $err_msg['period_to'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }
            if( $data['period_note'] == '' ) {
                $err_msg['period_note'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }
            if( $data['min_member'] == '' ) {
                $err_msg['min_member'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            } else if($data['min_member'] < 1) {
                $err_msg['min_member'] = MESSAGE_ERROR_INPUT;
                $err_msg['nextsection'] = $err_section;
            }
            if( $data['min_depart'] == '' ) {
                $err_msg['min_depart'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }  else if($data['min_depart'] < 1) {
                $err_msg['min_depart'] = MESSAGE_ERROR_INPUT;
                $err_msg['nextsection'] = $err_section;
            }
            if( $data['max_order'] == '' ) {
                $err_msg['max_order'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }  else if($data['max_order'] < 1) {
                $err_msg['max_order'] = MESSAGE_ERROR_INPUT;
                $err_msg['nextsection'] = $err_section;
            }
            if( $data['order_deadline'] == '' ) {
                $err_msg['order_deadline'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }
        }

        //代金
        $err_section = 1;
        if($nextsection == 0 || $nextsection == $err_section + 1) {

            for($i = 0; $i < count($data['disp_course']); $i++) {
                if( empty($data['disp_price_title'][$i]) ) {
                    $err_msg['disp_price_title' . $i] = MESSAGE_ERROR_REQUIRE;
                    $err_msg['nextsection'] = $err_section;
                } else {
                    $err_msg['disp_price_title' . $i] = '';                    
                }

                for($j = 0; $j < count($data['disp_price_type'][$i]); $j++) {
                    if( empty($data['disp_price_value'][$i][$j]) ) {
                        $err_msg['disp_price_value' . $i . $j] = MESSAGE_ERROR_REQUIRE;
                        $err_msg['nextsection'] = $err_section;
                    } else {
                        $err_msg['disp_price_value' . $i . $j] = '';
                    }
                }
            }
        }

        //基本情報
        $err_section = 0;
        if($nextsection == 0 || $nextsection == $err_section + 1) {
            if( empty($data['title']) ) {
                $err_msg['title'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }
            if( empty($data['description']) ) {
                $err_msg['description'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = $err_section;
            }
            if( empty( implode('', $data['main_photo'])) ) {
                $err_msg['main_photo'] = MESSAGE_ERROR_REQUIRE_IMAGE;
                $err_msg['nextsection'] = $err_section;
            }
        }

        return $err_msg;
    }

    /******************************
    商品名取得
    *******************************/
    function getProductName($productID) {
        $spiral = new SpiralApi('database/select', 'ProductmanageDB');

        $columns = array();
        $columns[] = 'title';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $productID);

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        if( count($selectData) == 0 ) {
            return '';
        }

        return $selectData[0]['title'];
        
    }

    /******************************
    同商品言語別データ取得
    *******************************/
    function getLangProductID($product_id, $lang = null) {
    
        $sql = '';
        $sql .= 'select ifnull(group_slug, "") group_slug ';
        $sql .= 'from   ' . $this->t_product_name . ' ';
        $sql .= 'where  product_id = :product_id ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':product_id', $product_id);
    
        $err_msg = $db->execute();
    
        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        if( count($selectData) == 0 ) {
            return '';
        }
        if( $selectData[0]['group_slug'] == '' ) {
            return $product_id;
        }

        $sql = '';
        $sql .= 'select product_id ';
        $sql .= 'from   ' . $this->t_product_name . ' ';
        $sql .= 'where  group_slug = :group_slug ';

        if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
            global $global_lang;
            if(!is_null($lang)) {
                $sql .= 'and (lang = ' . htmlspecialchars($lang) . ' or lang is null) ';                
            } else if($global_lang == 2) {
                $sql .= 'and lang = 2 ';
            } else if($global_lang == 3) {
                $sql .= 'and lang = 3 ';
            } else {
                $sql .= 'and (lang = 1 or lang is null) ';
            }
        } else {
            if(!is_null($lang)) {
                $sql .= 'and (lang = ' . htmlspecialchars($lang) . ' or lang is null) ';                
            }
        }

        $db->setPrepare($sql);
        $db->setBindValueSTR(':group_slug', $selectData[0]['group_slug']);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();
    
        if( count($selectData) == 0 ) {
            return '';
        }

        return $selectData[0]['product_id'];
    }

    /******************************
    同商品別言語データ取得
    *******************************/
    function getLangProduct($product_id, $new_lang = null) {
        $base_product_id = $this->getLangProductID($product_id, 1);
        if(!is_null($new_lang)) {
            $new_product_id = $this->getLangProductID($product_id, $new_lang);
        } else {
            $new_product_id = $this->getLangProductID($product_id);
        }

        $base_data = $this->getProduct($base_product_id, 1);
        $new_data = $this->getProduct($new_product_id, 1);

        //変更不要個所の設定
        $new_data['product_id'] = $base_data['product_id'];
        //$new_data['main_photo'] = $base_data['main_photo'];
        //$new_data['detail_photo'] = $base_data['detail_photo'];
        $new_data['area_id'] = $base_data['area_id'];
        $new_data['area_text'] = $base_data['area_text'];
        $new_data['category_id'] = $base_data['category_id'];
        $new_data['category_text'] = $base_data['category_text'];
        $new_data['course_id'] = $base_data['course_id'];

        //日本語データ
        $new_data['title_jp'] = $base_data['title'];
        $new_data['meeting_place_jp'] = $base_data['meeting_place'];
        $new_data['question_jp'] = $base_data['question'];
        

        return $new_data;
    }

    /******************************
    商品取得
    *******************************/
    function getProduct($product_id, $publish_status = null) {

        //=============
        //商品管理取得
        //=============
        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_name . ' ';
        $sql .= 'where publish_status != :publish_status_delete ';
        $sql .= 'and   product_id = :product_id ';

        if( !is_null($this->person_id) ) {
            $sql .= 'and   person_id = :person_id ';
        }

        if( !is_null($publish_status) ) {
            $sql .= 'and publish_status = :publish_status ';
            $sql .= 'and publish_date <= now() ';
        }

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':publish_status_delete', '0');
        $db->setBindValueSTR(':product_id', $product_id);
        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }
        if( !is_null($publish_status) ) {
            $db->setBindValueSTR(':publish_status', $publish_status);
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        if( count($selectData) == 0 ) {
            return MESSAGE_ERROR_DB_NO_DATA;
        }

        //=============
        //商品管理メタ情報取得
        //=============
        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_meta_name . ' ';
        $sql .= 'where product_id = :product_id ';
        $sql .= 'order by meta_type, meta_type_no ';

        $db->setPrepare($sql);
        $db->setBindValueSTR(':product_id', $product_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectMetaData = $db->getResponse();

        //=============
        //商品コース取得
        //=============
        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_product_course_name . ' ';
        $sql .= 'where product_id = :product_id ';
        $sql .= 'order by course_order ';

        $db->setPrepare($sql);
        $db->setBindValueSTR(':product_id', $product_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectCourseData = $db->getResponse();

        //=============
        //表示調整
        //=============
        $resultData = $selectData[0];

        //商品情報
        $period_ymd = date(Constant::$formatYMD, strtotime($resultData['period_from']));
        
        $period_w = Constant::$aryWeekDay[date('w', strtotime($resultData['period_from']))];
        $resultData['period_from_text'] = $period_ymd . '(' . $period_w . ')';

        $period_ymd = date(Constant::$formatYMD, strtotime($resultData['period_to']));
        $period_w = Constant::$aryWeekDay[date('w', strtotime($resultData['period_to']))];
        $resultData['period_to_text'] = $period_ymd . '(' . $period_w . ')';

        $area_data = unserialize($resultData['area']);
        $resultData['area'] = array();
        $resultData['area_id'] = array();
        $resultData['area_text'] = array();
        
        foreach($area_data as $area => $area_detail) {
            $resultData['area'][] = $area;
            $resultData['area' . $area] = $area_detail;

            if($area != '') {
                $area_detail_map = Constant::$aryAreaDetail[$area];

                foreach($area_detail as $value) {
                    if($value != '') {
                        $resultData['area_id'][] = $value;
                        $resultData['area_text'][] = $area_detail_map[$value];
                    }
                }
            }
        }

        $resultData['category'] = unserialize($resultData['category']);
        $resultData['category_id'] = array();
        $resultData['category_text'] = array();
        foreach($resultData['category'] as $category) {
            if($category != '') {
                $resultData['category_id'][] = $category;
                $resultData['category_text'][] = Constant::$aryCategory[$category];
            }
        }

        $publish_date_time = strtotime($resultData['publish_date']);
        $resultData['publish_date'] = array(date('Y/m/d', $publish_date_time), date('H:i', $publish_date_time));
        $resultData['publish_status_text'] = Constant::$aryMtDisp[$resultData['publish_status']];

        //商品メタ情報
        foreach($selectMetaData as $meta_data) {
            $meta_type = $meta_data['meta_type'];
            $meta_value = $meta_data['meta_value'];

            if(!array_key_exists($meta_type, $resultData)) {
                $resultData[$meta_type] = array();
            }

            if($meta_type == 'main_photo' || $meta_type == 'detail_photo') {
                //メイン画像・プラン内容画像
                if(!is_null( $meta_value) && $meta_value != '') {
                    $resultData[$meta_type][] = URL_UPL_DIR . $product_id . '/' . $meta_value;
                } else {
                    $resultData[$meta_type][] = '';
                }

            } elseif($meta_type == 'cancel_charge_rate') {
                //取消料率
                $resultData[$meta_type][] = $meta_value;
                if($meta_value != '') {
                    $resultData[$meta_type . '_text'][] = Constant::$aryCancelChargeRate[$meta_value];
                }
            } elseif($meta_type == 'disp_price_type'
                     || $meta_type == 'disp_price_value'
                     || $meta_type == 'disp_price_condition') {
                $resultData[$meta_type][] = unserialize($meta_value);

            } else {
                $resultData[$meta_type][] = $meta_value;
            }
        }
        //料金区分テキスト
        if(array_key_exists('disp_price_type', $resultData)) {
            for($i = 0; $i < count($resultData['disp_price_type']); $i++) {
                $resultData['disp_price_type_text'][] = array();
                foreach( $resultData['disp_price_type'][$i] as $value) {
                    if($value != '') {
                        $resultData['disp_price_type_text'][$i][] = Constant::$aryPriceType[$value];
                    } else {
                        $resultData['disp_price_type_text'][$i][] = '';
                    }
                }
            }
        }

        //商品コース情報
        foreach($selectCourseData as $course_data) {
            if(!array_key_exists('course_id', $resultData)) {
                $resultData['course_id'] = array();
            }
            if(!array_key_exists('course_name', $resultData)) {
                $resultData['course_name'] = array();
            }
            $resultData['course_id'][] = $course_data['course_id'];
            $resultData['course_name'][] = $course_data['course_name'];
        }

        return $resultData;
    }

    /******************************
    商品件数取得
    *******************************/
    function getProductTotalCount($publish_status = null, $area = null, $category = null) {
        global $global_lang;

        $sql = '';
        $sql .= 'select    count(product.product_id) count ';
        $sql .= 'from      ' . $this->t_product_name . ' product ';

        //英語
        $sql .= 'left join ( ';
        $sql .= '          select   * ';
        $sql .= '          from     t_product ';
        $sql .= '          where    lang = 2 ';
        $sql .= ') product_en ';
        $sql .= '       on product.group_slug = product_en.group_slug ';

        $sql .= 'where     product.publish_status != :publish_status_delete ';
        if( !is_null($publish_status) ) {
            $sql .= 'and   product.publish_status = :publish_status ';
            $sql .= 'and   product.publish_date <= now() ';
        }
        if( !is_null($area) ) {
            $sql .= 'and   product.area like "%' . $area . '%" ';
        }
        if( !is_null($category) ) {
            $sql .= 'and   product.category like "%' . $category . '%" ';
        }

        if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
            $sql .= 'and (';
            $sql .= '  product.lang = 1 ';
            $sql .= '  or product.lang is null ';
            $sql .= ') ';

            if($global_lang == 2) {
                $sql .= ' and product_en.product_id is not null ';
            }
        }

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':publish_status_delete', '0');
        if( !is_null($publish_status) ) {
            $db->setBindValueSTR(':publish_status', $publish_status);
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        return intval($selectData[0]['count']);
    }

    /******************************
    商品一覧取得
    $num：
      デフォルト５件
    *******************************/
    function getProductListView($num = 5, $page = 1, $publish_status = null, $area = null, $category = null, $page_id = null) {

        //=============
        //商品管理取得
        //=============
        global $global_lang;

        $product_table = 'product';
        $product_price_title_table = 'meta_price_title';

        if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
            if($global_lang == 2) {
                $product_table = 'product_en';
                $product_price_title_table = 'meta_price_title_en';
            }
        }

        $sql = '';
        $sql .= 'select    product.regist_date ';
        $sql .= '     ,    product.product_id ';
        $sql .= '     ,    product_en.product_id product_id_en ';
        $sql .= '     ,    case when ' . $product_table . '.title is null then product.title ';
        $sql .= '               else ' . $product_table . '.title ';
        $sql .= '          end title ';
        $sql .= '     ,    case when ' . $product_table . '.sub_title is null then product.sub_title ';
        $sql .= '               else ' . $product_table . '.sub_title ';
        $sql .= '          end sub_title ';
        $sql .= '     ,    product.area ';
        $sql .= '     ,    product.category ';
        $sql .= '     ,    product.publish_status ';
        $sql .= '     ,    product.lang ';
        $sql .= '     ,    case when ' . $product_price_title_table . '.price_title is null then meta_price_title.price_title ';
        $sql .= '               else ' . $product_price_title_table . '.price_title ';
        $sql .= '          end price_title ';
        $sql .= '     ,    page_meta.meta_type_no ';
        $sql .= '     ,    meta_price_value.price_value_min ';
        $sql .= '     ,    meta_price_value.price_value_max ';
        $sql .= '     ,    access.access_count ';
        $sql .= 'from      ' . $this->t_product_name . ' product ';

        $sql .= 'left join ( ';
        $sql .= '          select   t_product_course.product_id ';
        $sql .= '               ,   GROUP_CONCAT(t_product_course_meta.meta_value order by t_product_course_meta.course_id) price_title ';
        $sql .= '          from     t_product_course ';
        $sql .= '          left join t_product_course_meta ';
        $sql .= '          on        t_product_course.course_id = t_product_course_meta.course_id ';
        $sql .= '          and       t_product_course_meta.meta_type = "price_title" ';
        $sql .= '          group by t_product_course.product_id ';
        $sql .= ') meta_price_title ';
        $sql .= '       on product.product_id = meta_price_title.product_id ';

        $sql .= 'left join ( ';
        $sql .= '          select   t_product_course.product_id ';
        $sql .= '               ,   min(cast(t_product_course_meta.meta_value as SIGNED)) price_value_min ';
        $sql .= '               ,   max(cast(t_product_course_meta.meta_value as SIGNED)) price_value_max ';
        $sql .= '          from     t_product_course ';
        $sql .= '          left join t_product_course_meta ';
        $sql .= '          on        t_product_course.course_id = t_product_course_meta.course_id ';
        $sql .= '          and       t_product_course_meta.meta_type = "price_value" ';
        $sql .= '          group by t_product_course.product_id ';
        $sql .= ') meta_price_value ';
        $sql .= '       on product.product_id = meta_price_value.product_id ';

        $sql .= 'left join ( ';
        $sql .= '          select   meta_value ';
        $sql .= '               ,   meta_type_no ';
        $sql .= '          from     t_page_meta ';
        $sql .= '          where    page_id = :page_id ';
        $sql .= '          and      meta_type = "product_order" ';
        $sql .= ') page_meta ';
        $sql .= '       on product.product_id = page_meta.meta_value ';

        $sql .= 'left join ( ';
        $sql .= '          select   product_id ';
        $sql .= '               ,   count(product_id) access_count ';
        $sql .= '          from     t_product_access ';
        $sql .= '          group by product_id ';
        $sql .= ') access ';
        $sql .= '       on product.product_id = access.product_id ';

        //英語
        $sql .= 'left join ( ';
        $sql .= '          select   * ';
        $sql .= '          from     t_product ';
        $sql .= '          where    lang = 2 ';
        $sql .= ') product_en ';
        $sql .= '       on product.group_slug = product_en.group_slug ';

        $sql .= 'left join ( ';
        $sql .= '          select   t_product.product_id ';
        $sql .= '               ,   t_product.group_slug ';
        $sql .= '               ,   GROUP_CONCAT(t_product_meta.meta_value order by t_product_meta.product_id) price_title ';
        $sql .= '          from     t_product ';
        $sql .= '          left join t_product_meta ';
        $sql .= '          on        t_product.product_id = t_product_meta.product_id ';
        $sql .= '          and       t_product_meta.meta_type = "disp_price_title" ';
        $sql .= '          where     t_product.lang = 2 ';
        $sql .= '          group by t_product.product_id, t_product.group_slug ';
        $sql .= ') meta_price_title_en ';
        $sql .= '       on product.group_slug = meta_price_title_en.group_slug ';


        $sql .= 'where     product.publish_status != :publish_status_delete ';

        if( !is_null($this->person_id) ) {
            $sql .= 'and   product.person_id = :person_id ';
        }

        if( !is_null($publish_status) ) {
            $sql .= 'and   product.publish_status = :publish_status ';
            $sql .= 'and   product.publish_date <= now() ';
        }
        if( !is_null($area) ) {
            $sql .= 'and   product.area like "%' . $area . '%" ';
        }
        if( !is_null($category) ) {
            $sql .= 'and   product.category like "%' . $category . '%" ';
        }

        if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
            $sql .= 'and (';
            $sql .= '  product.lang = 1 ';
            $sql .= '  or product.lang is null ';
            $sql .= ') ';

            if($global_lang == 2) {
                $sql .= ' and product_en.product_id is not null ';
            }
        }

        $sql .= 'order by  page_meta.meta_type_no is null asc ';
        $sql .= '     ,    page_meta.meta_type_no ';
        if(!is_null($page_id)) {
            $sql .= ' ,    access_count desc ';
        }
        $sql .= '     ,    product.regist_date desc ';

        $sql .= 'limit     ' . $num * ($page - 1) . ', ' . $num;

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':publish_status_delete', '0');
        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }
        if( !is_null($publish_status) ) {
            $db->setBindValueSTR(':publish_status', $publish_status);
        }
        $db->setBindValueINT(':page_id', $page_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            $log = new Log();
            $log->setErrorLog($err_msg);
            return $err_msg;
        }

        $selectData = $db->getResponse();

        //表示調整
        foreach($selectData as &$data) {
            $data_id = $data['product_id'];

            if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
                if($global_lang == 2 && isset($data['product_id_en']) && $data['product_id_en'] != '') {
                    $data_id = $data['product_id_en'];
                }
            }

            $main_photo_thumb = UPL_DIR . $data_id . '/thumb_' . PRODUCT_MAIN_PHOTO1_NAME;

            if (!file_exists($main_photo_thumb)) {
                $data['main_photo1'] = URL_UPL_DIR . $data_id . '/' . PRODUCT_MAIN_PHOTO1_NAME;
            } else {
                $data['main_photo1'] = URL_UPL_DIR . $data_id . '/thumb_' . PRODUCT_MAIN_PHOTO1_NAME;
            }

            $data['area'] = unserialize($data['area']);
            $data['area_text'] = array();
            foreach($data['area'] as $areas => $area_details) {
                if($areas != '') {
                    $area_detail_map = Constant::$aryAreaDetail[$areas];

                    foreach($area_details as $value) {
                        if($value != '') {
                            $data['area_text'][] = $area_detail_map[$value];
                        }
                    }
                }
            }

            $data['category'] = unserialize($data['category']);
            $data['category_text'] = array();
            foreach($data['category'] as $category) {
                if($category != '') {
                    $data['category_text'][] = Constant::$aryCategory[$category];
                }
            }

            $data['regist_date'] = date('Y/m/d H:i', strtotime($data['regist_date']));

            $data['price_title'] = explode(',', $data['price_title'])[0];
        }

        return $selectData;
    }

    /******************************
    商品登録
    *******************************/
    function update($data, $person_id) {

        $time_stamp = date("Y/m/d H:i:s");

        //==========================================
        //◆ Spiral商品管理DB
        //==========================================

        //==============
        //対象データ検索
        //==============

        $spiral = new SpiralApi('database/select', 'ProductmanageDB');

        $columns = array();
        $columns[] = 'ProductID';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $data['product_id']);

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //==============
        //SpiralDB処理
        //==============
        unset($spiral);
        $update_columns = array();
        $update_data = array();
        $serch_condition = array();        

        if( count($selectData) > 0 ) {
            //更新
            $spiral = new SpiralApi('database/update', 'ProductmanageDB');

            $update_columns[] ='lastupdate';
            $update_data['lastupdate'] = $time_stamp;
            $serch_condition[] = array('name' => 'ProductID', 'value' => $data['product_id']);
            $spiral->setUpdateParam($update_columns, $update_data, $serch_condition);

        } else {
            //登録
            $spiral = new SpiralApi('database/insert', 'ProductmanageDB');

            $update_columns[] ='registDate';
            $update_columns[] ='lastupdate';
            $update_columns[] ='PersonID';
            $update_data['registDate'] = $time_stamp;
            $update_data['lastupdate'] = $time_stamp;
            $update_data['PersonID'] = $person_id;
            $spiral->setInsertParam($update_columns, $update_data);

        }

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $response = $spiral->getResponse();

        //productID設定
        if( isset($response['id']) ) {
            $data['product_id'] = 'plan' . sprintf('%06d', $response['id']);
        }
        //personID設定
        if( $data['person_id'] == '' ) {
            $data['person_id'] = $person_id;
        }

        //==========================================
        //◆ MySQL商品管理DB
        //==========================================

        //==============
        //商品管理登録
        //==============
        $db = new DB();
        $db->setPrepare('select * from t_product where product_id = :product_id');
        $db->setBindValueSTR(':product_id', $data['product_id']);
        
        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        $params = array();
        for($i = 0; $i < count($this->columns); $i++) {
            $table = $this->tableName[$i];
            $column = $this->columns[$i];

            if($table == $this->t_product_name) {
                if($column == 'area') {
                    $areas = array();
                    for($j = 0; $j < count($data[$column]); $j++) {
                        $areas[$data[$column][$j]] = $data['area' . $data[$column][$j]];
                    }
                    $params[$column] = serialize($areas);

                } elseif($column == 'category') {
                    $params[$column] = serialize($data[$column]);
                } elseif($column == 'publish_date') {
                    $params[$column] = $data[$column][0] . ' ' . $data[$column][1];
                } elseif($column == 'publish_status') {
                    $params[$column] = htmlspecialchars($_POST[$column . '_pre']);
                } else {
                    $params[$column] = $data[$column];
                }
            }
        }

        //トランザクション開始
        $db->beginTransaction();

        if( count($selectData) > 0 ) {
            //更新
            unset($params['regist_date']);
            $params['update_date'] = $time_stamp;

            $where_params = array();
            $where_params['product_id'] = $data['product_id'];

            $err_msg = $db->execUpdate($this->t_product_name, $params, $where_params, false);
        } else {
            //登録

            $params['regist_date'] = $time_stamp;
            $params['update_date'] = $time_stamp;
            $params['product_id'] = $data['product_id'];
            $params['person_id'] = $person_id;

            $err_msg = $db->execInsert($this->t_product_name, $params, false);
        }


        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        //==============
        //商品管理メタ情報登録
        //==============
        for($i = 0; $i < count($this->columns); $i++) {
            $table = $this->tableName[$i];
            $column = $this->columns[$i];
            
            $params = array();
            $params['product_id'] = $data['product_id'];
            
            $where_params = array();
            $where_params['product_id'] = $data['product_id'];

            if($table == $this->t_product_meta_name) {
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

                    if($column == 'main_photo') {

                        if($j == 0) {
                            //メイン画像１はファイル名を固定
                            $params['meta_value'] = PRODUCT_MAIN_PHOTO1_NAME;
                        } else {
                            $params['meta_value'] = end(explode("/", $data[$column][$j]));
                        }

                    } elseif($column == 'detail_photo') {

                        $params['meta_value'] = end(explode("/", $data[$column][$j]));                        

                    } elseif($column == 'disp_price_type'
                            || $column == 'disp_price_value'
                            || $column == 'disp_price_condition') {

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

        //==============
        //商品コース登録
        //==============
        $insert_course_id = array();
        for($i = 0; $i < count($data['course_id']); $i++) {
            $sql = '';
            $sql .= 'select course_id ';
            $sql .= 'from ' . $this->t_product_course_name . ' ';
            $sql .= 'where course_id = :course_id ';

            $db->setPrepare($sql);
            $db->setBindValueSTR(':course_id', $data['course_id'][$i]);
            
            $err_msg = $db->execute();

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }

            $selectData = $db->getResponse();

            $params = array();
            $params['course_name'] = $data['course_name'][$i];
            $params['course_order'] = $i + 1;

            if( count($selectData) > 0 ) {
                $where_params = array();
                $where_params['course_id'] = $data['course_id'][$i];

                if($params['course_name'] == '') {
                    //削除
                    $err_msg = $db->execDelete($this->t_product_course_name, $where_params, false);                    
                    $err_msg = $db->execDelete('t_product_course_stock', $where_params, false);                                        
                } else {
                    //更新
                    $err_msg = $db->execUpdate($this->t_product_course_name, $params, $where_params, false);
                }
            } else {
                //登録
                $params['product_id'] = $data['product_id'];

                if(count($data['course_id']) == 1 && $params['course_name'] == '') {
                    //コース未入力時はデフォルトコース作成
                    $params['course_name'] = $data['title'];
                    $data['course_name'][$i] = $data['title'];
                }

                if($params['course_name'] == '') {
                    //コース名がなければ登録しない
                    continue;
                }
                $params['close_date'] = Constant::$init_course['close_date'];
                $params['close_time'] = Constant::$init_course['close_time'];

                $err_msg = $db->execInsert($this->t_product_course_name, $params, false);

                $data['course_id'][$i] = $db->getLastInsertId();
                $insert_course_id[] = $data['course_id'][$i];
            }

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }

        }

        //==============
        //登録時、商品コース在庫登録
        //==============
        $timestamp = time();
        $start_day = 1;
        $end_day = intval(date('t', $timestamp));

        foreach($insert_course_id as $course_id) {
            $params = array();
            $params['course_id'] = $course_id;
            $params['stock_date'] = date('Y-m-01', $timestamp);

            for($i = $start_day; $i <= $end_day; $i++) {
                $params['stock_day'] = $i;

                $stock_value = Constant::$init_course['stock_value'];
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

                $params['stock_option'] = Constant::$init_course['stock_option'];

                $err_msg = $db->execInsert('t_product_course_stock', $params, false);
            }
        }

        $db->commit();

        //画像設定
        $img_dir = UPL_DIR . $data['product_id'] . '/';
        if( !file_exists($img_dir) ) {
           mkdir($img_dir, 0755);
           chmod($img_dir, 0755);
        }
        $cnt = 0;
        foreach( $data['main_photo'] as &$url) {
            if($url == '') {
                continue;
            }

            $tmp_img_path = str_replace(URL_UPL_DIR, UPL_DIR, $url);
            if($cnt == 0) {
                //メイン画像１はファイル名を固定
                $tmp_img_name = PRODUCT_MAIN_PHOTO1_NAME;
            } else {
                $tmp_img_name = end(explode("/", $tmp_img_path));
            }

            if( copy($tmp_img_path, $img_dir . $tmp_img_name) ) {
                $url = str_replace(UPL_DIR, URL_UPL_DIR, $img_dir . $tmp_img_name);
            }

            //サムネイル作成
            if($cnt == 0) {
                $err;
                $util = new Util();
                $util->resizeImage($img_dir . $tmp_img_name, $img_dir . 'thumb_' . $tmp_img_name, $err);
            }
            $cnt++;
        }
        foreach( $data['detail_photo'] as &$url) {
            if($url == '') {
                continue;
            }
            $tmp_img_path = str_replace(URL_UPL_DIR, UPL_DIR, $url);
            $tmp_img_name = end(explode("/", $tmp_img_path));
            if( copy($tmp_img_path, $img_dir . $tmp_img_name) ) {
                $url = str_replace(UPL_DIR, URL_UPL_DIR, $img_dir . $tmp_img_name);
            }
        }

        $data['publish_status'] = htmlspecialchars($_POST['publish_status_pre']);
        $data['publish_status_text'] = Constant::$aryMtDisp[$data['publish_status']];

        return $data;
    }

    /******************************
    商品削除（論理削除）
    *******************************/
    function delete($product_id) {
        $db = new DB();

        $params = array();
        $params['publish_status'] = '0';
        $params['update_date'] = date('Y-m-d H:i:s');
        
        $where_params = array();
        $where_params['product_id'] = $product_id;

        $err_msg = $db->execUpdate($this->t_product_name, $params, $where_params);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        return '';
    }

    /******************************
    商品複製
    *******************************/
    function copy($product_id, $person_id) {
        $data = $this->getProduct($product_id);
        $data['product_id'] = '';
        for($i = 0; $i < count($data['course_id']); $i++) {
            $data['course_id'][$i] = '';
        }

        $data = $this->update($data, $person_id);

        if( !is_array($data) ) {
            //エラー処理
            return $data;
        }

        return '';
    }

    /*******************
    POSTデータ取得(override)
    ********************/
    function getPostData($preview = false) {
        $data = parent::getPostData();

        //エリア詳細
        foreach($data['area'] as $value) {
            if( isset($_POST['area' . $value]) ) {
                $data['area' . $value] = $_POST['area' . $value];
            }
        }

        //代金
        if(count(array_keys($data['disp_price_condition'])) > 0) {
            for($i = 0; $i < max(array_keys($data['disp_price_condition'])) ; $i++) {
                if(!array_key_exists($i, $data['disp_price_condition'])) {
                    $data['disp_price_condition'][$i] = array();
                }
            }
        }

        //公開状態テキスト
        $data['publish_status_text'] = Constant::$aryMtDisp[$data['publish_status']];

        if($preview) {
            //商品情報
            $period_ymd = date(Constant::$formatYMD, strtotime($data['period_from']));
            $period_w = Constant::$aryWeekDay[date('w', strtotime($data['period_from']))];
            $data['period_from_text'] = $period_ymd . '(' . $period_w . ')';

            $period_ymd = date(Constant::$formatYMD, strtotime($data['period_to']));
            $period_w = Constant::$aryWeekDay[date('w', strtotime($data['period_to']))];
            $data['period_to_text'] = $period_ymd . '(' . $period_w . ')';

            $data['area_id'] = array();
            $data['area_text'] = array();
            foreach($data['area'] as $area) {
                if($area != '') {
                    $area_detail_map = Constant::$aryAreaDetail[$area];

                    foreach($data['area' . $area] as $value) {
                        if($value != '') {
                            $data['area_id'][] = $value;
                            $data['area_text'][] = $area_detail_map[$value];
                        }
                    }
                }
            }

            $data['category_id'] = array();
            $data['category_text'] = array();
            foreach($data['category'] as $category) {
                if($category != '') {
                    $data['category_id'][] = $category;
                    $data['category_text'][] = Constant::$aryCategory[$category];
                }
            }

            $data['cancel_charge_rate_text'] = array();
            foreach($data['cancel_charge_rate'] as $value) {
                if($value != '') {
                    $data['cancel_charge_rate_text'][] = Constant::$aryCancelChargeRate[$value];
                }
            }

            for($i = 0; $i < count($data['disp_price_type']); $i++) {
                $data['disp_price_type_text'][] = array();
                foreach( $data['disp_price_type'][$i] as $value) {
                    if($value != '') {
                        $data['disp_price_type_text'][$i][] = Constant::$aryPriceType[$value];
                    } else {
                        $data['disp_price_type_text'][$i][] = '';
                    }
                }
            }

        }

        return $data;
    }

    /*******************
    新規データ取得(override)
    ********************/
    function getNewData() {
        $data = parent::getNewData();

        $data['publish_status_text'] = Constant::$aryMtDisp[$data['publish_status']];

        return $data;
    }
}