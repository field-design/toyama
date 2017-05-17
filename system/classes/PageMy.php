<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　商品管理（MySQL）
機能名：
　商品管理（MySQL）
*******************************************/
class PageMy extends Entity {

    private $log;
    private $t_page_name = 't_page';
    private $t_page_meta_name = 't_page_meta';

    function __construct() {

        $this->log = new Log();

        $this->columns = array();
        $this->columnsDef = array();
        $this->tableName = array();

        //ページ情報

        $this->columns[] = 'page_id';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_page_name;

        $this->columns[] = 'page_name';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_page_name;

        $this->columns[] = 'h1_tag';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_page_name;

        $this->columns[] = 'title_tag';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_page_name;

        $this->columns[] = 'description_tag';
        $this->columnsDef[] = '';
        $this->tableName[] = $this->t_page_name;

        //ページメタ情報

        $this->columns[] = 'product_order';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_page_meta_name;

        $this->columns[] = 'slide_photo';
        $this->columnsDef[] = array();
        $this->tableName[] = $this->t_page_meta_name;

    }

    /******************************
    ページ情報取得
    *******************************/
    function getPageData($page_id) {

        $db = new DB();

        //ページ情報
        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_page_name . ' ';
        $sql .= 'where  page_id = :page_id ';

        $db->setPrepare($sql);
        $db->setBindValueSTR(':page_id', $page_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        if(count($selectData) == 0) {
            return MESSAGE_ERROR_DB_NO_DATA;
        }

        $sql = '';
        $sql .= 'select * ';
        $sql .= 'from   ' . $this->t_page_meta_name . ' ';
        $sql .= 'where  page_id = :page_id ';
        $sql .= 'order by meta_type, meta_type_no ';

        $db->setPrepare($sql);
        $db->setBindValueSTR(':page_id', $page_id);

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectMetaData = $db->getResponse();

        //=============
        //表示調整
        //=============
        $resultData = $this->getNewData();

        for($i = 0; $i < count($this->columns); $i++) {
            $column = $this->columns[$i];
            $table = $this->tableName[$i];

            if($table == $this->t_page_name) {
                $resultData[$column] = $selectData[0][$column];
            }
        }

        foreach($selectMetaData as $meta_data) {
            $meta_type = $meta_data['meta_type'];
            $meta_value = $meta_data['meta_value'];

            if(!array_key_exists($meta_type, $resultData)) {
                $resultData[$meta_type] = array();
            }

            if($meta_type == 'slide_photo') {
                $page_dir = 'page' . sprintf('%06d', $page_id);
                if(!is_null( $meta_value) && $meta_value != '') {
                    $resultData[$meta_type][] = URL_UPL_DIR . $page_dir . '/' . $meta_value;
                } else {
                    $resultData[$meta_type][] = '';
                }
            } else {
                $resultData[$meta_type][] = $meta_value;
            }
        }

        if( count($resultData['slide_photo']) == 0 ) {
            $resultData['slide_photo'][] = '';
        }

        return $resultData;
    }

    /******************************
    商品入力チェック
    *******************************/
    function checkInput($data) {
        $err_msg = array();

        if( empty( implode('', $data['slide_photo'])) ) {
            $err_msg['slide_photo'] = MESSAGE_ERROR_REQUIRE_IMAGE;
        }

        return $err_msg;
    }

    /******************************
    ページ情報登録
    *******************************/
    function update($data_list, $data) {

        $db = new DB();

        //トランザクション開始
        $db->beginTransaction();

        //ページ情報
        $params = array();
        $params['h1_tag'] = $data['h1_tag'];
        $params['title_tag'] = $data['title_tag'];
        $params['description_tag'] = $data['description_tag'];

        $where_params = array();
        $where_params['page_id'] = $data['page_id'];

        $err_msg = $db->execUpdate($this->t_page_name, $params, $where_params, false);

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }


        //ページメタ情報
        for($i = 0; $i < count($this->columns); $i++) {
            $table = $this->tableName[$i];
            $column = $this->columns[$i];
            
            $params = array();
            $params['page_id'] = $data['page_id'];
            
            $where_params = array();
            $where_params['page_id'] = $data['page_id'];

            if($table == $this->t_page_meta_name) {
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

                    if($column == 'slide_photo') {
                        $params['meta_value'] = end(explode("/", $data[$column][$j]));
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

        //画像設定
        $img_dir = UPL_DIR . 'page' . sprintf('%06d', $data['page_id']) . '/';
        if( !file_exists($img_dir) ) {
           mkdir($img_dir, 0755);
           chmod($img_dir, 0755);
        }

        foreach( $data['slide_photo'] as &$url) {
            if($url == '') {
                continue;
            }
            $tmp_img_path = str_replace(URL_UPL_DIR, UPL_DIR, $url);
            $tmp_img_name = end(explode("/", $tmp_img_path));
            if( copy($tmp_img_path, $img_dir . $tmp_img_name) ) {
                $url = str_replace(UPL_DIR, URL_UPL_DIR, $img_dir . $tmp_img_name);
            }
        }

        return $data;
    }

}