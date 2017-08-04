<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　設定（事業者）管理
機能名：
　設定（事業者）管理
*******************************************/
class Settings extends Entity {

    function __construct() {

        $this->columns = array();
        $this->columnsDef = array();

        $this->columns[] = 'registDate';
        $this->columnsDef[] = '';

        $this->columns[] = 'lastUpdate';
        $this->columnsDef[] = '';

        $this->columns[] = 'PW_lastUpdate';
        $this->columnsDef[] = '';

        $this->columns[] = 'PersonID';
        $this->columnsDef[] = '';

        $this->columns[] = 'display_name';
        $this->columnsDef[] = '';

        $this->columns[] = 'email';
        $this->columnsDef[] = '';

        $this->columns[] = 'name01';
        $this->columnsDef[] = '';

        $this->columns[] = 'name02';
        $this->columnsDef[] = '';

        $this->columns[] = 'kana01';
        $this->columnsDef[] = '';

        $this->columns[] = 'kana02';
        $this->columnsDef[] = '';

        $this->columns[] = 'company_name';
        $this->columnsDef[] = '';

        $this->columns[] = 'zipcode';
        $this->columnsDef[] = array('', '');

        $this->columns[] = 'pref';
        $this->columnsDef[] = '';

        $this->columns[] = 'address';
        $this->columnsDef[] = '';

        $this->columns[] = 'tel_';
        $this->columnsDef[] = array('', '', '');

        $this->columns[] = 'fax_';
        $this->columnsDef[] = array('', '', '');;

        $this->columns[] = 'service_time';
        $this->columnsDef[] = '';

        $this->columns[] = 'website_url';
        $this->columnsDef[] = '';

        $this->columns[] = 'facebook_url';
        $this->columnsDef[] = '';

        $this->columns[] = 'twitter_url';
        $this->columnsDef[] = '';

        $this->columns[] = 'instagram_url';
        $this->columnsDef[] = '';

        $this->columns[] = 'cancel_version';
        $this->columnsDef[] = '';

        $this->columns[] = 'mt_cancel_ttl';
        $this->columnsDef[] = array(1);

        $this->columns[] = 'MtCancelRatio';
        $this->columnsDef[] = array(1);

        $this->columns[] = 'mt_cancel_note';
        $this->columnsDef[] = array('');

        $this->columns[] = 'agency';
        $this->columnsDef[] = 0;

        $this->columns[] = 'file_select';
        $this->columnsDef[] = 1;

        $this->columns[] = 'file';
        $this->columnsDef[] = '';

        $this->columns[] = 'condition_url';
        $this->columnsDef[] = '';

        $this->columns[] = 'marketer_type';
        $this->columnsDef[] = '';

        $this->columns[] = 'projectAddress';
        $this->columnsDef[] = '';

        $this->columns[] = 'projectNumber';
        $this->columnsDef[] = '';

        $this->columns[] = 'projectName';
        $this->columnsDef[] = '';

        $this->columns[] = 'authority';
        $this->columnsDef[] = 2;

        $this->columns[] = 'photo_text';
        $this->columnsDef[] = '';

        $this->columns[] = 'logomark';
        $this->columnsDef[] = '';

        $this->columns[] = 'pass';
        $this->columnsDef[] = '';

        $this->columns[] = 'Registered';
        $this->columnsDef[] = '';

        $this->columns[] = 'Travel';
        $this->columnsDef[] = '';

        $this->columns[] = 'TravelAdmin';
        $this->columnsDef[] = '';

        $this->columns[] = 'SalesOffice1';
        $this->columnsDef[] = '';

        $this->columns[] = 'SalesOffice2';
        $this->columnsDef[] = '';

        $this->columns[] = 'SalesOffice3';
        $this->columnsDef[] = '';

        $this->columns[] = 'Clause';
        $this->columnsDef[] = 1;

        $this->columns[] = 'file2';
        $this->columnsDef[] = '';

        $this->columns[] = 'ClauseURL';
        $this->columnsDef[] = '';

        $this->columns[] = 'privacypolicy';
        $this->columnsDef[] = 1;

        $this->columns[] = 'file3';
        $this->columnsDef[] = '';

        $this->columns[] = 'PrivacyURL';
        $this->columnsDef[] = '';

        $this->columns[] = 'TravelPriceList';
        $this->columnsDef[] = 1;

        $this->columns[] = 'file4';
        $this->columnsDef[] = '';

        $this->columns[] = 'PricelistURL';
        $this->columnsDef[] = '';

        $this->columns[] = 'mt_cancel_text';
        $this->columnsDef[] = array('');

        $this->columns[] = 'settlement';
        $this->columnsDef[] = array();

        $this->columns[] = 'info';
        $this->columnsDef[] = '';

        $this->columns[] = 'tel_2';
        $this->columnsDef[] = '';

        $this->columns[] = 'informationTime';
        $this->columnsDef[] = '';

        $this->columns[] = 'siteID';
        $this->columnsDef[] = '';

        $this->columns[] = 'shopID';
        $this->columnsDef[] = '';

        $this->columns[] = 'pass2';
        $this->columnsDef[] = '';

        $this->columns[] = 'APIurl';
        $this->columnsDef[] = '';

        $this->columns[] = 'language';
        $this->columnsDef[] = '';

        $this->columns[] = 'group';
        $this->columnsDef[] = '';
    }

    /******************************
    入力チェック
    *******************************/
    function checkInputParam($data, $login) {

        $err_msg = array();

        if( empty($data['company_name']) ) {
            $err_msg['company_name'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['photo_text']) ) {
            $err_msg['photo_text'] = MESSAGE_ERROR_REQUIRE_IMAGE_ONE;
        }
        if( empty($data['logomark']) ) {
            $err_msg['logomark'] = MESSAGE_ERROR_REQUIRE_IMAGE_ONE;
        }
        if( empty($data['zipcode'][0]) || empty($data['zipcode'][1]) ) {
            $err_msg['zipcode'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['pref']) ) {
            $err_msg['pref'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['address']) ) {
            $err_msg['address'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['tel_'][0]) || empty($data['tel_'][1]) || empty($data['tel_'][2]) ) {
            $err_msg['tel_'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['service_time']) ) {
            $err_msg['service_time'] = MESSAGE_ERROR_REQUIRE;
        }

        if( empty($data['name01']) ) {
            $err_msg['name01'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['name02']) ) {
            $err_msg['name02'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['kana01']) ) {
            $err_msg['kana01'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['kana02']) ) {
            $err_msg['kana02'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['email']) ) {
            $err_msg['email'] = MESSAGE_ERROR_REQUIRE;
        }

        //旅行業に基づく旅行商品の取り扱い 「あり」の場合
        if( $data['agency'] == 1 ) {
            if( empty($data['Registered']) ) {
                $err_msg['Registered'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['Travel']) ) {
                $err_msg['Travel'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['projectNumber']) ) {
                $err_msg['projectNumber'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['marketer_type']) ) {
                $err_msg['marketer_type'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['projectAddress']) ) {
                $err_msg['projectAddress'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['TravelAdmin']) ) {
                $err_msg['TravelAdmin'] = MESSAGE_ERROR_REQUIRE;
            }

            //約款
            if( $data['Clause'] == '2') {
                if( empty($data['file2']) ) {
                    $err_msg['file2'] = MESSAGE_ERROR_REQUIRE;
                }
            }
            if( $data['Clause'] == '3') {
                if( empty($data['ClauseURL']) ) {
                    $err_msg['ClauseURL'] = MESSAGE_ERROR_REQUIRE;
                }
            }

            //旅行条件書
            if( $data['file_select'] == '1') {
                if( empty($data['file']) ) {
                    $err_msg['file'] = MESSAGE_ERROR_REQUIRE;
                }
            }
            if( $data['file_select'] == '2') {
                if( empty($data['condition_url']) ) {
                    $err_msg['condition_url'] = MESSAGE_ERROR_REQUIRE;
                }
            }

            //プライバシーポリシー
            if( $data['privacypolicy'] == '1') {
                if( empty($data['file']) ) {
                    $err_msg['file3'] = MESSAGE_ERROR_REQUIRE;
                }
            }
            if( $data['privacypolicy'] == '2') {
                if( empty($data['PrivacyURL']) ) {
                    $err_msg['PrivacyURL'] = MESSAGE_ERROR_REQUIRE;
                }
            }

            //旅行業務取扱料金表
            if( $data['TravelPriceList'] == '1') {
                if( empty($data['file']) ) {
                    $err_msg['file4'] = MESSAGE_ERROR_REQUIRE;
                }
            }
            if( $data['TravelPriceList'] == '2') {
                if( empty($data['PricelistURL']) ) {
                    $err_msg['PricelistURL'] = MESSAGE_ERROR_REQUIRE;
                }
            }
        }

        //取消料
        if( count($data['mt_cancel_text']) == 0 ) {
            $err_msg['mt_cancel_text'] = MESSAGE_ERROR_REQUIRE;
        }
        foreach($data['mt_cancel_text'] as $value) {
            if( empty($value) ) {
                $err_msg['mt_cancel_text'] = MESSAGE_ERROR_REQUIRE;
                break;
            }
        }

        //取引決済コンビニ
        if( count($data['settlement']) == 0 ) {
            $err_msg['settlement'] = MESSAGE_ERROR_REQUIRE;
        }
        if( in_array('2', $data['settlement']) ) {

            if( empty($data['info']) ) {
                $err_msg['info'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['tel_2']) ) {
                $err_msg['tel_2'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['informationTime']) ) {
                $err_msg['informationTime'] = MESSAGE_ERROR_REQUIRE;
            }

        }

        //GMOペイメント
        if($login->isAuthAdmin()) {
            if( empty($data['siteID']) ) {
                $err_msg['siteID'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['shopID']) ) {
                $err_msg['shopID'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['pass2']) ) {
                $err_msg['pass2'] = MESSAGE_ERROR_REQUIRE;
            }
            if( empty($data['APIurl']) ) {
                $err_msg['APIurl'] = MESSAGE_ERROR_REQUIRE;
            }

            if( empty($data['PersonID']) ) {
                if( empty($data['pass']) ) {
                    $err_msg['pass'] = MESSAGE_ERROR_REQUIRE;
                }
            }

            if($data['pass'] != $_POST['pass_confirm']) {
                $err_msg['pass'] = MESSAGE_ERROR_PASS_MISMATCH;
            }

        }

        return $err_msg;
    }

    /******************************
    同事業者言語別データ取得
    *******************************/
    function getLangPersonID($person_id, $lang = null) {
        $spiral = new SpiralApi('database/select', 'admin_DB');

        $select_columns = array();
        $select_columns[] = 'group';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'PersonID', 'value' => $person_id);

        $spiral->setSelectParam($select_columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        if( count($selectData) == 0 ) {
            return '';
        }
        if( $selectData[0]['group'] == '' ) {
            return $person_id;
        }

        //同group取得
        $group = $selectData[0]['group'];

        $select_columns = array();
        $select_columns[] = 'PersonID';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'group', 'value' => $group);
        if(strpos($_SERVER["REQUEST_URI"], URL_ROOT_PATH_ADMIN) === false){
            global $global_lang;
            if(!is_null($lang)) {
                $serch_condition[] = array('name' => 'language', 'value' => htmlentities($lang), 'logical_connection' => 'or');
                $serch_condition[] = array('name' => 'language', 'value' => '', 'logical_connection' => 'or');
            } else if($global_lang == 2) {
                $serch_condition[] = array('name' => 'language', 'value' => 2);
            } else {
                $serch_condition[] = array('name' => 'language', 'value' => 1, 'logical_connection' => 'or');
                $serch_condition[] = array('name' => 'language', 'value' => '', 'logical_connection' => 'or');
            }
        } else {
            if(!is_null($lang)) {
                $serch_condition[] = array('name' => 'language', 'value' => htmlentities($lang), 'logical_connection' => 'or');
                $serch_condition[] = array('name' => 'language', 'value' => '', 'logical_connection' => 'or');
            }
        }

        $spiral->setSelectParam($select_columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        if( count($selectData) == 0 ) {
            return '';
        }

        return $selectData[0]['PersonID'];
    }

    /******************************
    同事業者別言語データ取得
    *******************************/
    function getLangPerson($person_id, $new_lang = null) {
        $base_person_id = $this->getLangPersonID($person_id, 1);
        if(!is_null($new_lang)) {
            $new_person_id = $this->getLangPersonID($person_id, $new_lang);
        } else {
            $new_person_id = $this->getLangPersonID($person_id);
        }

        $base_data = $this->getSettings($base_person_id, 1);
        $new_data = $this->getSettings($new_person_id, 1);

        $new_data['PersonID'] = $base_data['PersonID'];
    
        return $new_data;
    }

    /******************************
    事業者取得
    *******************************/
    function getSettings($personID) {

        //=============
        //商品情報取得
        //=============
        $spiral = new SpiralApi('database/select', 'admin_DB');

        $multi_value_columns = array('mt_cancel_ttl' => 10, 
                                     'mt_cancel_text' => 5,
                                     'MtCancelRatio' => 10,
                                     'mt_cancel_note' => 10);

        $select_columns = array();
        foreach($this->columns as $column) {

            if(array_key_exists($column, $multi_value_columns)) {
                //複数値列を分解 ・・・ mt_cancel_ttl --> mt_cancel_ttl1, mt_cancel_ttl2, ・・・
                $field_num = $multi_value_columns[$column];
                for($i = 1; $i <=$field_num; $i++) {
                    $select_columns[] = $column . $i;
                }
            } else {
                $select_columns[] = $column;
            }

        }

        $serch_condition = array();
        $serch_condition[] = array('name' => 'PersonID', 'value' => $personID);

        $spiral->setSelectParam($select_columns, $serch_condition);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        if( count($selectData) == 0 ) {
            return $selectData;
        }

        $resultData = array();

        foreach( $multi_value_columns as $key => $value ) {
            $resultData[$key] = array();
        }

        foreach( $selectData[0] as $column => $value) {

            $new_column = '';

            //複数値列をまとめる ・・・ mt_cancel_ttl1, mt_cancel_ttl2,  --> mt_cancel_ttl
            foreach( $multi_value_columns as $multi_column => $field_num ) {
                if(strpos($column, $multi_column) !== false) {
                    $new_column = $multi_column;
                    break;
                }
            }

            if($new_column != '') {

                $resultData[$new_column][] = $value;

                if( $new_column == 'mt_cancel_ttl' || $new_column == 'MtCancelRatio' ) {

                    if($value != '' && $new_column == 'mt_cancel_ttl') {
                        $resultData[$new_column . '_text'][] = Constant::$aryMtCancelTtl[$value];
                    } elseif($value != '' && $new_column == 'MtCancelRatio') {
                        $resultData[$new_column . '_text'][] = Constant::$aryMtCancelRatio[$value];
                    } else {
                        $resultData[$new_column . '_text'][] = '';
                    }
                }

            } else {
                if( $column == 'photo_text' || $column == 'logomark' ) {
                    $resultData[$column] = URL_UPL_DIR . $personID . '/' . $value;
                } elseif( $column == 'zipcode' || $column == 'tel_' || $column == 'fax_' ) {
                    $resultData[$column] = explode('-', $value);
                } elseif( $column == 'settlement' ) {
                    $resultData[$column] = explode(',', $value);
                    
                    $resultData[$column . '_text'] = array();
                    if( in_array('1', $resultData[$column]) ) {
                        $resultData[$column . '_text'][] = Constant::$arySettlementType['0'];
                    }
                    if( in_array('2', $resultData[$column]) ) {
                        $resultData[$column . '_text'][] = Constant::$arySettlementType['3'];
                    }
                } elseif( $column == 'Registered' ) {
                    $resultData[$column] = $value;
                    $resultData[$column . '_text'] = $value != '' ? Constant::$aryGovernor[$value] : '';
                    $resultData[$column . '_text_en'] = $value != '' ? Constant::$aryGovernorEn[$value] : '';
                } elseif( $column == 'Travel' ) {
                    $resultData[$column] = $value;
                    $resultData[$column . '_text'] = $value != '' ? Constant::$aryTravel[$value] : '';
                    $resultData[$column . '_text_en'] = $value != '' ? Constant::$aryTravelEn[$value] : '';
                } else {
                    $resultData[$column] = $value;
                }
            }
        }

        return $resultData;
    }

    /******************************
    事業者一覧取得
    $num：
      デフォルト５件
    *******************************/
    function getSettingsListView($num = 5, $login) {

        $spiral = new SpiralApi('database/select', 'admin_DB');

        $columns = array();
        $columns[] = 'logomark';
        $columns[] = 'display_name';
        $columns[] = 'company_name';
        $columns[] = 'PersonID';
        $columns[] = 'authority';
        $columns[] = 'language';

        $serch_condition = array();
        if(!$login->isAuthAdmin()) {
            $serch_condition[] = array("name" => "PersonID", "value" => $login->getPersonID());
        }

        $lines_per_page = $num;

        $page = 1;

        $sort = array();
        $sort[] = array('name' => 'PersonID', 'order' => 'asc');

        $spiral->setSelectParam($columns, $serch_condition, null, $lines_per_page, $page, $sort);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //事業者は同じグループスラッグのデータも取得
        if(!$login->isAuthAdmin()) {
            $serch_condition = array();
            $serch_condition[] = array("name" => "group", "value" => $login->getGroup());
            $serch_condition[] = array("name" => "authority", "value" => 1, 'operator' => '!=');

            $spiral->setSelectParam($columns, $serch_condition, null, $lines_per_page, $page, $sort);

            $err_msg = $spiral->exec();

            if( !empty($err_msg) ) {
                //エラー処理
                return $err_msg;
            }

            $selectGroupData = $spiral->getSelectData();
            $selectDataIds = array_column($selectData, 'PersonID');

            foreach($selectGroupData as $data) {
                if(!in_array($data['PersonID'], $selectDataIds)) {
                    $selectData[] = $data;
                }
            }
        }

        //DB値調整
        foreach($selectData as &$data) {
            $data['authority'] = Constant::$aryAuthority[$data['authority']];
            $data['logomark'] = URL_UPL_DIR . $data['PersonID'] . '/' . $data['logomark'];
        }

        return $selectData;
    }

    /******************************
    事業者登録
    *******************************/
    function update($data, $login) {
        $time_stamp = date("Y/m/d H:i:s");

        //==============
        //対象データ検索
        //==============
        $spiral = new SpiralApi('database/select', 'admin_DB');

        $columns = array();
        $columns[] = 'PersonID';

        $serch_condition = array();
        $serch_condition[] = array('name' => 'PersonID', 'value' => $data['PersonID']);

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
        $pdf_file = null;
        foreach($this->columns as $column) {

            if($column == 'photo_text' || $column == 'logomark') {
                $update_columns[] = $column;
                $update_data[$column] = end(explode("/", $data[$column]));
            } elseif($column == 'zipcode' || $column == 'tel_' || $column == 'fax_') {
                if(implode('', $data[$column]) != '') {
                    $update_columns[] = $column;
                    $update_data[$column] = implode("-", $data[$column]);
                }
            } elseif ($column == 'mt_cancel_ttl' ||
                      $column == 'MtCancelRatio' ||
                      $column == 'mt_cancel_note') {
                for($i = 0; $i < count($data[$column]); $i++) {
                    $update_columns[] = $column . ($i + 1);
                    $update_data[$column . ($i + 1)] = $data[$column][$i];
                }
                for($j = $i; $j < 10; $j++) {
                    $update_columns[] = $column . ($j + 1);
                    $update_data[$column . ($j + 1)] = '';
                }
            } elseif ($column == 'mt_cancel_text') {
                for($i = 0; $i < count($data[$column]); $i++) {
                    $update_columns[] = $column . ($i + 1);
                    $update_data[$column . ($i + 1)] = $data[$column][$i];
                }
                for($j = $i; $j < 5; $j++) {
                    $update_columns[] = $column . ($j + 1);
                    $update_data[$column . ($j + 1)] = '';
                }
            } elseif($column == 'file' ||
                     $column == 'file2' ||
                     $column == 'file3' ||
                     $column == 'file4') {
                if($data[$column] != '' && strpos($data[$column], 'spiral/public_file') === false) {
                    if(is_null($pdf_file)) {
                        $pdf_file = array();
                    }
                    $pdf_file[$column] = str_replace(URL_UPL_DIR, UPL_DIR, $data[$column]);
                }
            } elseif($column == 'siteID' ||
                     $column == 'shopID' ||
                     $column == 'pass2' ||
                     $column == 'APIurl' ||
                     $column == 'language' ||
                     $column == 'group') {
                if($login->isAuthAdmin()) {
                    $update_columns[] = $column;
                    $update_data[$column] = $data[$column];
                }

            } elseif($column == 'settlement') {
                $update_columns[] = $column;
                $update_data[$column] = implode(',', $data[$column]);
            } elseif($column == 'pass') {
                if($data[$column] != '') {
                    $update_columns[] = $column;
                    $update_data[$column] = $data[$column];
                }
            } else {
                $update_columns[] = $column;
                $update_data[$column] = $data[$column];
            }

        }


        if( count($selectData) > 0 ) {
            //更新
            $spiral = new SpiralApi('database/update', 'admin_DB', !is_null($pdf_file) );

            $update_data['lastUpdate'] = $time_stamp;
            $serch_condition[] = array('name' => 'PersonID', 'value' => $data['PersonID']);
            $spiral->setUpdateParam($update_columns, $update_data, $serch_condition);
        } else {
            //登録
            $spiral = new SpiralApi('database/insert', 'admin_DB', !is_null($pdf_file));

            $update_data['registDate'] = $time_stamp;
            $update_data['lastUpdate'] = $time_stamp;
            $spiral->setInsertParam($update_columns, $update_data);
        }

        $err_msg = $spiral->exec($pdf_file);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $response = $spiral->getResponse();

        //PersonID設定
        if( isset($response['id']) ) {
            $data['PersonID'] = 'admin' . sprintf('%06d', $response['id']);
        }

        //画像設定
        $img_dir = UPL_DIR . $data['PersonID'] . '/';
        if( !file_exists($img_dir) ) {
           mkdir($img_dir, 0755);
           chmod($img_dir, 0755);
        }

        if( $data['photo_text'] != '' ) {
            $tmp_img_path = str_replace(URL_UPL_DIR, UPL_DIR, $data['photo_text']);
            $tmp_img_name = end(explode("/", $tmp_img_path));
            if( copy($tmp_img_path, $img_dir . $tmp_img_name) ) {
                $data['photo_text'] = str_replace(UPL_DIR, URL_UPL_DIR, $img_dir . $tmp_img_name);
            }
        }

        if( $data['logomark'] != '' ) {
            $tmp_img_path = str_replace(URL_UPL_DIR, UPL_DIR, $data['logomark']);
            $tmp_img_name = end(explode("/", $tmp_img_path));
            if( copy($tmp_img_path, $img_dir . $tmp_img_name) ) {
                $data['logomark'] = str_replace(UPL_DIR, URL_UPL_DIR, $img_dir . $tmp_img_name);
            }
        }


        return $data;
    }

    /*******************
    POSTデータ取得(override)
    ********************/
    function getPostData() {
        $data = parent::getPostData();

        ////pdfファイル
        //if( isset($_FILES['pdf_file']) ) {

        //}
        //$data['file'] = null;

        return $data;
    }

}