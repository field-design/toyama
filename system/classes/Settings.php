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
    }

    /******************************
    入力チェック
    *******************************/
    function checkInputParam($data) {

        $err_msg = array();

        if( empty($data['display_name']) ) {
            $err_msg['display_name'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['photo_text']) ) {
            $err_msg['photo_text'] = MESSAGE_ERROR_REQUIRE_IMAGE_ONE;
        }
        if( empty($data['logomark']) ) {
            $err_msg['logomark'] = MESSAGE_ERROR_REQUIRE_IMAGE_ONE;
        }
        if( empty($data['name01']) ) {
            $err_msg['name01'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['name02']) ) {
            $err_msg['name02'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['email']) ) {
            $err_msg['email'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['tel_'][0]) || empty($data['tel_'][1]) || empty($data['tel_'][2]) ) {
            $err_msg['tel_'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['cancel_version']) ) {
            $err_msg['cancel_version'] = MESSAGE_ERROR_REQUIRE;
        }
        if( empty($data['PersonID']) ) {
            if( empty($data['pass']) ) {
                $err_msg['pass'] = MESSAGE_ERROR_REQUIRE;
            }
        }

        if($data['pass'] != $_POST['pass_confirm']) {
            $err_msg['pass'] = MESSAGE_ERROR_PASS_MISMATCH;
        }
        return $err_msg;
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
    function getSettingsListView($num = 5) {

        $spiral = new SpiralApi('database/select', 'admin_DB');

        $columns = array();
        $columns[] = 'logomark';
        $columns[] = 'display_name';
        $columns[] = 'company_name';
        $columns[] = 'PersonID';
        $columns[] = 'authority';

        $serch_condition = array();

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
    function update($data) {
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
            } elseif($column == 'file') {
                if($data[$column] != '' && strpos($data[$column], 'https://') === false) {
                    $pdf_file = str_replace(URL_UPL_DIR, UPL_DIR, $data[$column]);
                }
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