<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　商品管理
機能名：
　商品管理
*******************************************/
class Product extends Entity {

    private $log;

    function __construct() {

        $this->log = new Log();

        $this->columns = array();
        $this->columnsDef = array();

        $this->columns[] = 'ProductID';
        $this->columnsDef[] = '';

        $this->columns[] = 'PersonID';
        $this->columnsDef[] = '';

        $this->columns[] = 'registDate';
        $this->columnsDef[] = '';

        $this->columns[] = 'lastupdate';
        $this->columnsDef[] = '';

        $this->columns[] = 'title';
        $this->columnsDef[] = '';

        $this->columns[] = 'SubTitle';
        $this->columnsDef[] = '';

        $this->columns[] = 'ExplanatoryText';
        $this->columnsDef[] = '';

        $this->columns[] = 'main_photo';
        $this->columnsDef[] = array();

        $this->columns[] = 'photo';
        $this->columnsDef[] = array('');

        $this->columns[] = 'CourseTitle';
        $this->columnsDef[] = array('');

        $this->columns[] = 'CourseDetail';
        $this->columnsDef[] = array('');

        $this->columns[] = 'CourseRink';
        $this->columnsDef[] = array('');

        $this->columns[] = 'StartDate';
        $this->columnsDef[] = '';

        $this->columns[] = 'EndDate';
        $this->columnsDef[] = '';

        $this->columns[] = 'WhetExclusion';
        $this->columnsDef[] = '';

        $this->columns[] = 'plan_included';
        $this->columnsDef[] = array('');

        $this->columns[] = 'minimumMember';
        $this->columnsDef[] = '';

        $this->columns[] = 'minimumDeparts';
        $this->columnsDef[] = '';

        $this->columns[] = 'largestMember';
        $this->columnsDef[] = '';

        $this->columns[] = 'Operation';
        $this->columnsDef[] = '';

        $this->columns[] = 'contractDead';
        $this->columnsDef[] = '';

        $this->columns[] = 'locationname';
        $this->columnsDef[] = '';

        $this->columns[] = 'Coordinate';
        $this->columnsDef[] = '';

        $this->columns[] = 'importantPoints';
        $this->columnsDef[] = array('');

        $this->columns[] = 'Other';
        $this->columnsDef[] = array('');

        $this->columns[] = 'plan_type';
        $this->columnsDef[] = 1;

        $this->columns[] = 'plan_title';
        $this->columnsDef[] = array(1);

        $this->columns[] = 'plan_Fee';
        $this->columnsDef[] = array('');

        $this->columns[] = 'plan_Kind';
        $this->columnsDef[] = array('');

        $this->columns[] = 'ClosingOut_date';
        $this->columnsDef[] = '';

        $this->columns[] = 'ClosingOut_time';
        $this->columnsDef[] = '';

        $this->columns[] = 'area';
        $this->columnsDef[] = array();

        $this->columns[] = 'Category';
        $this->columnsDef[] = array();

        $this->columns[] = 'mt_disp';
        $this->columnsDef[] = 3;//下書き

        $this->columns[] = 'date';
        $this->columnsDef[] = array(date('Y/m/d'), date('H:i'));
    }

    /******************************
    商品入力チェック
    *******************************/
    function checkInput($data, $nextsection) {
        $err_msg = array();

        //公開日
        if( empty($data['date'][0]) || empty($data['date'][1]) ) {
            $err_msg['date'] = MESSAGE_ERROR_REQUIRE;
            $err_msg['nextsection'] = 7;
        }
        if( !array_key_exists('date', $err_msg) ) {
            $date_ymdhis = $data['date'][0] . ' ' . $data['date'][1];
            if(!strptime($date_ymdhis, '%Y/%m/%d %H:%M')) {
                $err_msg['date'] = MESSAGE_ERROR_DATE;
                $err_msg['nextsection'] = 7;
            }
        }
        if( !array_key_exists('date', $err_msg) ) {
            $date_ymd = explode('/', $data['date'][0]);
            $date_hi = explode(':', $data['date'][1]);
            if(!checkdate($date_ymd[1], $date_ymd[2], $date_ymd[0])) {
                $err_msg['date'] = MESSAGE_ERROR_DATE;
                $err_msg['nextsection'] = 7;
            }
        }


        //集合場所
        if($nextsection == 0 || $nextsection == 6) {
            if( empty($data['locationname']) ) {
                $err_msg['locationname'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 5;
            }
        }

        //プラン情報
        if($nextsection == 0 || $nextsection == 5) {
            if( empty($data['StartDate']) ) {
                $err_msg['StartDate'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 4;
            }
            if( empty($data['EndDate']) ) {
                $err_msg['EndDate'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 4;
            }
            if( empty($data['minimumMember']) ) {
                $err_msg['minimumMember'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 4;
            }
            if( empty($data['minimumDeparts']) ) {
                $err_msg['minimumDeparts'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 4;
            }
            if( empty($data['largestMember']) ) {
                $err_msg['largestMember'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 4;
            }
            //if( empty($data['Operation']) ) {
            //    $err_msg['Operation'] = MESSAGE_ERROR_REQUIRE;
            //    $err_msg['nextsection'] = 4;
            //}
            if( empty($data['contractDead']) ) {
                $err_msg['contractDead'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 4;
            }
        }

        //コースの内容
        if($nextsection == 0 || $nextsection == 4) {
            for($i = 0; $i < count($data['CourseTitle']); $i++) {
                if( empty($data['CourseTitle'][$i]) ) {
                    $err_msg['CourseTitle' . $i] = MESSAGE_ERROR_REQUIRE;
                    $err_msg['nextsection'] = 3;
                } else {
                    $err_msg['CourseTitle' . $i] = '';
                }
            }
        }
    
        //カレンダー
        if($nextsection == 0 || $nextsection == 3) {
            if( $data['ClosingOut_date'] == '' ) {
                $err_msg['ClosingOut_date'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 2;
            }
        }

        //料金
        if($nextsection == 0 || $nextsection == 2) {
            if( empty( implode('', $data['plan_Fee'])) ) {
                $err_msg['plan_Fee'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 1;
            }
        }

        //基本情報
        if($nextsection == 0 || $nextsection == 1) {
            if( empty($data['title']) ) {
                $err_msg['title'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 0;
            }
            if( empty($data['ExplanatoryText']) ) {
                $err_msg['ExplanatoryText'] = MESSAGE_ERROR_REQUIRE;
                $err_msg['nextsection'] = 0;
            }
            if( empty( implode('', $data['main_photo'])) ) {
                $err_msg['main_photo'] = MESSAGE_ERROR_REQUIRE_IMAGE;
                $err_msg['nextsection'] = 0;
            }
        }

        return $err_msg;
    }

    /******************************
    手じまい日チェック
    *******************************/
    function checkClosingOut($data, $order_date) {
        $err_msg = '';

        $now = time();
        $now_plus_closingout = strtotime('+' . intval($data['ClosingOut_date']) . ' day', $now);
        $closingout_time = '0000';
        if( isset($data['ClosingOut_time']) && $data['ClosingOut_time'] != '' ) {
            $closingout_time = str_replace(':', '', $data['ClosingOut_time']);
        }

        if( date('Ymd', $order_date) < date('Ymd', $now_plus_closingout) ) {
            $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
        } elseif( date('Ymd', $order_date) == date('Ymd', $now_plus_closingout) && date('Hi', $now) >= $closingout_time ) {
            $err_msg = MESSAGE_ERROR_ORDER_EXPIRE;
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
    商品取得
    *******************************/
    function getProduct($productID, $mt_disp = null) {

        //=============
        //商品情報取得
        //=============
        $spiral = new SpiralApi('database/select', 'ProductmanageDB');

        $multi_value_columns = array('main_photo' => 5, 
                                     'photo' => 10,
                                     'CourseTitle' => 10,
                                     'CourseDetail' => 10,
                                     'CourseRink' => 10,
                                     'plan_included' => 10,
                                     'importantPoints' => 5,
                                     'Other' => 5,
                                     'plan_title' => 5,
                                     'plan_Fee' => 5,
                                     'plan_Kind' => 5);

        $select_columns = array();
        foreach($this->columns as $column) {

            if(array_key_exists($column, $multi_value_columns)) {
                //複数値列を分解 ・・・ main_photo --> main_photo1, main_photo2, ・・・
                $field_num = $multi_value_columns[$column];
                for($i = 1; $i <=$field_num; $i++) {
                    $select_columns[] = $column . $i;
                }
            } else {
                $select_columns[] = $column;
            }

        }

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $productID);
        if( !is_null($mt_disp) ) {
            $serch_condition[] = array('name' => 'mt_disp', 'value' => $mt_disp);
            $serch_condition[] = array('name' => 'date', 'value' => date('Y/m/d H:i'), 'operator' => '<=');
        }

        $spiral->setSelectParam($select_columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        if( count($selectData) == 0 ) {
            return MESSAGE_ERROR_DB_NO_DATA;
        }

        $resultData = array();

        foreach( $multi_value_columns as $key => $value ) {
            $resultData[$key] = array();
        }

        foreach( $selectData[0] as $column => $value) {

            $new_column = '';

            //複数値列をまとめる ・・・ main_photo1, main_photo2,  --> main_photo
            foreach( $multi_value_columns as $multi_column => $field_num ) {
                if(strpos($column, $multi_column) !== false) {
                    $new_column = $multi_column;
                    break;
                }
            }

            if($new_column != '') {
                if( ($new_column == 'main_photo' || $new_column == 'photo') && $value != '') {

                    $resultData[$new_column][] = URL_UPL_DIR . $productID . '/' . $value;

                } elseif( $new_column == 'plan_title' || $new_column == 'plan_Kind' ) {

                    $resultData[$new_column][] = $value;
                    if($value != '' && $new_column == 'plan_title') {
                        $resultData[$new_column . '_text'][] = Constant::$aryPlanTitle[$value];
                    } elseif($value != '' && $new_column == 'plan_Kind') {
                        $resultData[$new_column . '_text'][] = Constant::$aryPlanKind[$value];
                    } else {
                        $resultData[$new_column . '_text'][] = '';
                    }

                } else {
                    $resultData[$new_column][] = $value;
                }
            } else {
                if( $column == 'area' || $column == 'Category') {
                    $resultData[$column] = explode(',', $value);
                } elseif( $column == 'mt_disp' ) {
                    $resultData[$column] = $value;
                    if($value != '') {
                        $resultData[$column . '_text'] = Constant::$aryMtDisp[$value];
                    }
                } elseif( $column == 'ClosingOut_time' ) {
                    if($value != '') {
                        $date = DateTime::createFromFormat('H時i分', $value);
                        $resultData[$column] = $date->format('H:i');
                    }
                } elseif( $column == 'date' ) {
                    $resultData[$column] = array(date('Y/m/d'), date('H:i'));
                    if($value != '') {
                        $date = DateTime::createFromFormat('Y年m月d日 H時i分', $value);
                        $resultData[$column][0] = $date->format('Y/m/d');
                        $resultData[$column][1] = $date->format('H:i');
                    }

                } else {
                    $resultData[$column] = $value;
                }
            }
        }

        //=============
        //在庫情報取得
        //=============
        unset($spiral);
        $spiral = new SpiralApi('database/select', 'stockDB');

        $columns = array();
        $columns[] = 'productDate';
        for($i = 1; $i <= 31; $i++) {
            $columns[] = 'stock' . $i;
        }

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $productID);
        $serch_condition[] = array('name' => 'productDate', 'value' => date('Y/m'), 'operator' => '>=');

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        $resultData['stock_calen_ym'] = array();
        foreach( $selectData as $data) {
            $productDate = DateTime::createFromFormat('Y年m月', $data['productDate']);
            $ym = $productDate->format('Ym');
            $resultData['stock_calen_ym'][] = $ym;
            $resultData['stock_calen_data_' . $ym] = array();
            for($i = 1; $i <= 31; $i++) {
                $resultData['stock_calen_data_' . $ym][] = $data['stock' . $i];
            }
        }
        if( count($resultData['stock_calen_ym']) == 0) {
            $ym = date('Ym');
            $resultData['stock_calen_ym'][] = $ym;
            $resultData['stock_calen_data_' . $ym] = array();
        }

        return $resultData;
    }

    /******************************
    商品一覧取得
    $num：
      デフォルト５件
    *******************************/
    function getProductListView($num = 5, $page = 1, $mt_disp = null, $area = null, $category = null) {

        $spiral = new SpiralApi('database/select', 'ProductmanageDB');

        $columns = array();
        $columns[] = 'main_photo1';
        $columns[] = 'ProductID';
        $columns[] = 'SubTitle';
        $columns[] = 'title';
        $columns[] = 'plan_title1';
        $columns[] = 'plan_title2';
        $columns[] = 'plan_title3';
        $columns[] = 'plan_title4';
        $columns[] = 'plan_title5';
        $columns[] = 'plan_Fee1';
        $columns[] = 'plan_Fee2';
        $columns[] = 'plan_Fee3';
        $columns[] = 'plan_Fee4';
        $columns[] = 'plan_Fee5';
        $columns[] = 'plan_Kind1';
        $columns[] = 'plan_Kind2';
        $columns[] = 'plan_Kind3';
        $columns[] = 'plan_Kind4';
        $columns[] = 'plan_Kind5';
        $columns[] = 'area';
        $columns[] = 'Category';
        $columns[] = 'registDate';
        $columns[] = 'mt_disp';

        $serch_condition = array();

        if( !is_null($mt_disp) ) {
            $serch_condition[] = array('name' => 'mt_disp', 'value' => $mt_disp);
            $serch_condition[] = array('name' => 'date', 'value' => date('Y/m/d H:i'), 'operator' => '<=');
        }
        if( !is_null($area) ) {
            $serch_condition[] = array('name' => 'area', 'value' => '%' . $area . '%', 'operator' => 'like');
        }
        if( !is_null($category) ) {
            $serch_condition[] = array('name' => 'Category', 'value' => '%' . $category . '%', 'operator' => 'like');
        }

        $lines_per_page = $num;

        $sort = array();
        $sort[] = array('name' => 'registDate', 'order' => 'desc');

        $spiral->setSelectParam($columns, $serch_condition, null, $lines_per_page, $page, $sort);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //DB値調整
        foreach($selectData as &$data) {

            if( $data['main_photo1'] != '') {

                $main_photo_thumb = UPL_DIR . $data['ProductID'] . '/thumb_' . $data['main_photo1'];

                if (!file_exists($main_photo_thumb)) {
                    $data['main_photo1'] = URL_UPL_DIR . $data['ProductID'] . '/' . $data['main_photo1'];
                } else {
                    $data['main_photo1'] = URL_UPL_DIR . $data['ProductID'] . '/thumb_' . $data['main_photo1'];
                }
            }

            if( $data['area'] != '' ) {
                $areas = explode(',', $data['area']);
                foreach( $areas as &$area ) {
                    $area = Constant::$aryArea[$area];
                }
                $data['area'] = $areas;
            } else {
                $data['area'] = array();
            }

            if( $data['Category'] != '' ) {
                $categories = explode(',', $data['Category']);
                foreach( $categories as &$category ) {
                    $category = Constant::$aryCategory[$category];
                }
                $data['Category'] = $categories;
            } else {
                $data['Category'] = array();
            }

            for($i = 1; $i <= 5; $i++) {
                if( $data['plan_title' . $i] != '' ) {
                    $data['plan_title' . $i] = Constant::$aryPlanTitle[$data['plan_title' . $i]];
                }
                if( $data['plan_Kind' . $i] != '' ) {
                    $data['plan_Kind' . $i] = Constant::$aryPlanKind[$data['plan_Kind' . $i]];
                }
            }

            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分s秒', $data['registDate']);
            $data['registDate'] = $oderDate->format('Y/m/d H:i:s');

        }

        return $selectData;
    }

    /******************************
    商品在庫取得
    *******************************/
    function getProductStock($productID, $ym, $orderID = null) {

        //============
        //在庫取得
        //============
        $spiral = new SpiralApi('database/select', 'stockDB');

        $columns = array();
        $columns[] = 'productDate';
        for($i = 1; $i <= 31; $i++) {
            $columns[] = 'stock' . $i;
        }

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $productID);
        $serch_condition[] = array('name' => 'productDate', 'value' => $ym);

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $stockData = $spiral->getSelectData();

        if( count($stockData) == 0 ) {
            $stockData = array();
            $stockData[] = array();
            $stockData[0]['productDate'] = substr($ym, 0, 4) . '年' . substr($ym, 4, 6) . '月';
            for($i = 1; $i <= 31; $i++) {
                $stockData[0]['stock' . $i] = 0;
            }
        }

        //============
        //申込取得
        //============
        unset($spiral);
        $start_date = date('Y/m/d', strtotime($ym . '/01'));
        $end_date = date('Y/m/d', strtotime('+1 month', strtotime($ym . '/01')));
        $spiral = new SpiralApi('database/select', 'oderDB');

        $columns = array();
        $columns[] = 'OderID';
        $columns[] = 'oderDate';
        $columns[] = 'volume1';
        $columns[] = 'volume2';
        $columns[] = 'volume3';
        $columns[] = 'volume4';
        $columns[] = 'volume5';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $productID);
        $serch_condition[] = array('name' => 'Correspondence', 'value' => 3, 'operator' => '!=');
        $serch_condition[] = array('name' => 'oderDate', 'value' => $start_date . ' 00:00:00', 'operator' => '>=');
        $serch_condition[] = array('name' => 'oderDate', 'value' => $end_date . ' 00:00:00', 'operator' => '<');
        if( !is_null($orderID) ) {
            $serch_condition[] = array('name' => 'OderID', 'value' => $orderID, 'operator' => '<=');
        }

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $orderData = $spiral->getSelectData();

        $orderSumData = array();
        foreach( $orderData as $order ) {
            $date = DateTime::createFromFormat('Y年m月d日 H時i分', $order['oderDate']);
            $date = $date->format('Y/m/j'); //日付0なし
            $volume = intval($order['volume1']) + intval($order['volume2']) + intval($order['volume3']) + intval($order['volume4']) + intval($order['volume5']);
            if( !array_key_exists($date, $orderSumData) ) {
                $orderSumData[$date] = $volume;
            } else {
                $orderSumData[$date] += $volume;
            }
        }

        //============
        //在庫計算
        //============
        for($i = 1; $i <= 31; $i++) {
            if( array_key_exists($ym . '/' . $i, $orderSumData) ) {
                $stockData[0]['stock' . $i] = intval($stockData[0]['stock' . $i]) - intval($orderSumData[$ym . '/' . $i]);
            } else {
                $stockData[0]['stock' . $i] = intval($stockData[0]['stock' . $i]);
            }
        }

        //============
        //前後月追加
        //============
        $stockData[0]['prevMonth'] = date('Y/m', strtotime('-1 month', strtotime($ym . '/01')));
        $stockData[0]['nextMonth'] = date('Y/m', strtotime('+1 month', strtotime($ym . '/01')));

        return $stockData[0];
    }

    /******************************
    商品登録
    *******************************/
    function update($data, $personID) {

        $time_stamp = date("Y/m/d H:i:s");

        //==========================================
        //◆ 商品管理DB
        //==========================================

        //==============
        //対象データ検索
        //==============
        $spiral = new SpiralApi('database/select', 'ProductmanageDB');

        $columns = array();
        $columns[] = 'ProductID';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'ProductID', 'value' => $data['ProductID']);

        $spiral->setSelectParam($columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //==============
        //処理
        //==============
        unset($spiral);
        $update_columns = array();
        $update_data = array();
        $serch_condition = array();        

        foreach($this->columns as $column) {

            if($column == 'main_photo') {
                for($i = 0; $i < 5; $i++) {
                    $update_columns[] = $column . ($i + 1);
                    if(count($data[$column]) > $i) {
                        if($i == 0) {
                            //メイン画像１はファイル名を固定
                            $update_data[$column . ($i + 1)] = PRODUCT_MAIN_PHOTO1_NAME;
                        } else {
                            $update_data[$column . ($i + 1)] = end(explode("/", $data[$column][$i]));
                        }
                    } else {
                        $update_data[$column . ($i + 1)] = '';
                    }
                }
            } elseif ($column == 'photo') {
                for($i = 0; $i < 10; $i++) {
                    $update_columns[] = $column . ($i + 1);
                    if(count($data[$column]) > $i) {
                        $update_data[$column . ($i + 1)] = end(explode("/", $data[$column][$i]));
                    } else {
                        $update_data[$column . ($i + 1)] = '';
                    }
                }
            } elseif ($column == 'plan_title' ||
                      $column == 'plan_Fee' ||
                      $column == 'plan_Kind' ||
                      $column == 'importantPoints' ||
                      $column == 'Other') {
                for($i = 0; $i < 5; $i++) {
                    $update_columns[] = $column . ($i + 1);
                    if(count($data[$column]) > $i) {
                        $update_data[$column . ($i + 1)] = $data[$column][$i];
                    } else {
                        $update_data[$column . ($i + 1)] = '';
                    }
                }
            } elseif ($column == 'CourseTitle' ||
                      $column == 'CourseDetail' ||
                      $column == 'CourseRink' ||
                      $column == 'plan_included') {
                for($i = 0; $i < 10; $i++) {
                    $update_columns[] = $column . ($i + 1);
                    if(count($data[$column]) > $i) {
                        $update_data[$column . ($i + 1)] = $data[$column][$i];
                    } else {
                        $update_data[$column . ($i + 1)] = '';
                    }
                }
            } elseif($column == 'area' ||
                     $column == 'Category') {
                $update_columns[] = $column;
                $update_data[$column] = implode(",", $data[$column]);
            } elseif($column == 'date') {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column][0] . ' ' . $data[$column][1];
            } elseif($column == 'mt_disp') {
                $update_columns[] = $column;
                $update_data[$column] = htmlspecialchars($_POST[$column . '_pre']);
            } else {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column];
            }
        }

        if( count($selectData) > 0 ) {
            //更新
            $spiral = new SpiralApi('database/update', 'ProductmanageDB');

            $update_data['lastupdate'] = $time_stamp;
            $serch_condition[] = array('name' => 'ProductID', 'value' => $data['ProductID']);
            $spiral->setUpdateParam($update_columns, $update_data, $serch_condition);

        } else {
            //登録
            $spiral = new SpiralApi('database/insert', 'ProductmanageDB');

            $update_data['registDate'] = $time_stamp;
            $update_data['lastupdate'] = $time_stamp;
            $update_data['PersonID'] = $personID;
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
            $data['ProductID'] = 'plan' . sprintf('%06d', $response['id']);
        }
        //personID設定
        if( $data['PersonID'] == '' ) {
            $data['PersonID'] = $personID;
        }

        //画像設定
        $img_dir = UPL_DIR . $data['ProductID'] . '/';
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
        foreach( $data['photo'] as &$url) {
            if($url == '') {
                continue;
            }
            $tmp_img_path = str_replace(URL_UPL_DIR, UPL_DIR, $url);
            $tmp_img_name = end(explode("/", $tmp_img_path));
            if( copy($tmp_img_path, $img_dir . $tmp_img_name) ) {
                $url = str_replace(UPL_DIR, URL_UPL_DIR, $img_dir . $tmp_img_name);
            }
        }

        $data['mt_disp'] = htmlspecialchars($_POST['mt_disp_pre']);
        $data['mt_disp_text'] = Constant::$aryMtDisp[$data['mt_disp']];

        //==========================================
        //◆ 在庫管理DB
        //==========================================

        //==============
        //対象データ検索
        //==============

        $spiral_select = new SpiralApi('database/select', 'stockDB');
        $select_columns = array();
        $select_columns[] = 'ProductID';
        $select_condition = array();
        $select_condition[] = array('name' => 'ProductID', 'value' => $data['ProductID']);        

        foreach( $data['stock_calen_ym'] as $ym) {

            //入力のない月は登録しない
            if(array_sum($data['stock_calen_data_' . $ym]) == 0) {
                continue;
            }

            $select_condition[] = array('name' => 'productDate', 'value' => substr($ym, 0, 4) . '/' . substr($ym, 4, 6));

            $spiral_select->setSelectParam($select_columns, $select_condition);

            $err_msg = $spiral_select->exec();

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }

            $selectData = $spiral_select->getSelectData();

            unset($spiral_update);
            unset($update_columns);
            unset($update_data);
            unset($update_condition);
            $update_columns = array();
            $update_data = array();
            $update_condition = array();

            for($i = 0; $i < count($data['stock_calen_data_' . $ym]); $i++) {
                $update_columns[] = 'stock' . ($i + 1);
                $update_data['stock' . ($i + 1)] = $data['stock_calen_data_' . $ym][$i];
            }

            if( count($selectData) > 0 ) {
                //更新
                $spiral_update = new SpiralApi('database/update', 'stockDB');

                $update_columns[] = 'lastupdate';
                
                $update_data['lastupdate'] = $time_stamp;

                $update_condition[] = array('name' => 'ProductID', 'value' => $data['ProductID']);
                $update_condition[] = array('name' => 'productDate', 'value' => substr($ym, 0, 4) . '/' . substr($ym, 4, 6));
  
                $spiral_update->setUpdateParam($update_columns, $update_data, $update_condition);
            } else {
                //登録
                $spiral_update = new SpiralApi('database/insert', 'stockDB');

                $update_columns[] = 'registDate';
                $update_columns[] = 'lastupdate';
                $update_columns[] = 'ProductID';
                $update_columns[] = 'productDate';

                $update_data['registDate'] = $time_stamp;
                $update_data['lastupdate'] = $time_stamp;
                $update_data['ProductID'] = $data['ProductID'];
                $update_data['productDate'] = substr($ym, 0, 4) . '/' . substr($ym, 4, 6);

                $spiral_update->setInsertParam($update_columns, $update_data);
            }

            $err_msg = $spiral_update->exec();

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }

            $response = $spiral_update->getResponse();
        }

        return $data;
    }

    /*******************
    POSTデータ取得(override)
    ********************/
    function getPostData() {
        $data = parent::getPostData();

        $data['plan_title_text'] = array();
        foreach( $data['plan_title'] as $value) {
            if($value != '') {
                $data['plan_title_text'][] = Constant::$aryPlanTitle[$value];
            } else {
                $data['plan_title_text'][] = '';
            }
        }

        $data['plan_Kind_text'] = array();
        foreach( $data['plan_Kind'] as $value) {
            if($value != '') {
                $data['plan_Kind_text'][] = Constant::$aryPlanKind[$value];
            } else {
                $data['plan_Kind_text'][] = '';
            }
        }

        $data['mt_disp_text'] = Constant::$aryMtDisp[$data['mt_disp']];

        //カレンダー月取得
        $data['stock_calen_ym'] = isset($_POST['stock_calen_ym']) ? $_POST['stock_calen_ym'] : array(date('Ym'));

        $no_input_index = array();
        $cnt = 0;
        foreach( $data['stock_calen_ym'] as $ym ) {
            //カレンダー入力取得
            $data['stock_calen_data_' . $ym] = isset($_POST['stock_calen_data_' . $ym]) ? $_POST['stock_calen_data_' . $ym] : array();

            //入力のないカレンダーを取得
            if(array_sum($data['stock_calen_data_' . $ym]) == 0) {
                $no_input_index[] = $cnt;
            }

            $cnt++;
        }

        //入力のないカレンダーは削除
        foreach( $no_input_index as $i ) {
            unset($data['stock_calen_ym'][$i]);
        }
        $data['stock_calen_ym'] = array_values($data['stock_calen_ym']);
        if(count($data['stock_calen_ym']) == 0) {
            $data['stock_calen_ym'][] = date('Ym');
        }

        return $data;
    }

    /*******************
    新規データ取得(override)
    ********************/
    function getNewData() {
        $data = parent::getNewData();

        $data['mt_disp_text'] = Constant::$aryMtDisp[$data['mt_disp']];

        $data['stock_calen_ym'] = array(date('Ym'));
        foreach( $data['stock_calen_ym'] as $ym ) {
            $data['stock_calen_data_' . $ym] = array();
        }

        return $data;
    }
}