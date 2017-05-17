<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　スパイラルAPI管理
機能名：
　スパイラルAPI管理
*******************************************/

define("MULTIPART_BOUNDARY", "SPIRAL_API_MULTIPART_BOUNDARY");

class SpiralApi {

    // トークン
    private $TOKEN  = SPIRAL_API_TOKEN;
    // シークレットトークン
    private $SECRET = SPIRAL_API_SECRET;
    // サービス用のURL
    private $APIURL = SPIRAL_API_URL;

    // APIヘッダー
    private $apiHeaders;
    // JSONパラメータ
    private $parameters;

    private $multiFlg = false;

    // レスポンスデータ
    private $resData;

    // セレクトデータ
    private $selectData;

    function __construct($request, $dbname, $multi = false) {

        // HTTPヘッダ設定
        if( $multi ) {
            $this->apiHeaders = array(
                'X-SPIRAL-API: ' . $request . '/request',
                'Content-Type: multipart/form-data; boundary="' . MULTIPART_BOUNDARY . '"',
            );
        } else {
            $this->apiHeaders = array(
                'X-SPIRAL-API: ' . $request . '/request',
                'Content-Type: application/json; charset=UTF-8',
            );
        }


        $this->parameters = array();
        //DBのタイトル
        $this->parameters["db_title"] = $dbname;
    }

    /******************************
    データ登録パラメータ設定
    *******************************/
    function setInsertParam($columns, $data) {

        $this->parameters["data"] = array();
        foreach($columns as $column) {
            if($column == 'mt_disp' ||
               $column == 'job_' ||
               $column == 'main_photo1' || $column == 'main_photo2' || $column == 'main_photo3' || $column == 'main_photo4' || $column == 'main_photo5' ||
               $column == 'ClosingOut_date' || $column == 'ClosingOut_time' ||
               $column == 'display_name' || $column == 'company_name' || $column == 'tel_' || $column == 'tel_2' || $column == 'fax_' || $column == 'service_time' || $column == 'cancel_version' || $column == 'marketer_type' ||
               strpos($column, '_url') !== false || strpos($column, 'mt_') !== false) {
                $this->parameters["data"][] = array('name' => $column, 'value' => $data[$column]);
            } else {
                $this->parameters["data"][] = array('name' => str_replace('_', '-', $column), 'value' => $data[$column]);
            }
        }

    }

    /******************************
    データ更新パラメータ設定
    *******************************/
    function setUpdateParam($columns, $data, $serch_condition) {

        $this->parameters["data"] = array();
        foreach($columns as $column) {
            if($column == 'mt_disp' ||
               $column == 'job_' ||
               $column == 'main_photo1' || $column == 'main_photo2' || $column == 'main_photo3' || $column == 'main_photo4' || $column == 'main_photo5' ||
               $column == 'ClosingOut_date' || $column == 'ClosingOut_time' ||
               $column == 'display_name' || $column == 'company_name' || $column == 'tel_' || $column == 'tel_2' || $column == 'fax_' || $column == 'service_time' || $column == 'cancel_version' || $column == 'marketer_type' ||
               strpos($column, '_url') !== false || strpos($column, 'mt_') !== false) {
                $this->parameters["data"][] = array('name' => $column, 'value' => $data[$column]);
            } elseif($column == 'registDate') {
                continue;
            } else {
                $this->parameters["data"][] = array('name' => str_replace('_', '-', $column), 'value' => $data[$column]);
            }
        }

        $this->parameters["search_condition"] = $serch_condition;
    }

    /******************************
    データ検索パラメータ設定
    *******************************/
    function setSelectParam($columns, $serch_condition, $group_by = null, $lines_per_page = 10, $page = 1, $sort = 'asc') {

        $this->parameters["select_columns"] = array();
        foreach($columns as $column) {
            if($column == 'mt_disp' ||
               $column == 'job_' ||
               $column == 'main_photo1' || $column == 'main_photo2' || $column == 'main_photo3' || $column == 'main_photo4' || $column == 'main_photo5' ||
               $column == 'ClosingOut_date' || $column == 'ClosingOut_time' ||
               $column == 'display_name' || $column == 'company_name' || $column == 'tel_' || $column == 'tel_2' || $column == 'fax_' || $column == 'service_time' || $column == 'cancel_version' || $column == 'marketer_type' ||
               strpos($column, '_url') !== false || strpos($column, 'mt_') !== false) {
                $this->parameters["select_columns"][] = $column;
            } else {
                $this->parameters["select_columns"][] = str_replace('_', '-', $column);
            }
        }

        $this->parameters["search_condition"] = $serch_condition;

        if($group_by) {
            $this->parameters["group_by"] = array();
            foreach($group_by as $column) {
                $this->parameters["group_by"][] = str_replace('_', '-', $column);
            }
        }

        $this->parameters["lines_per_page"] = $lines_per_page;
        $this->parameters["page"] = $page;
        $this->parameters["sort"] = $sort;
    }

    /******************************
    APIアクセス実行
    *******************************/
    function exec($file = null) {

        //トークン
        $this->parameters["spiral_api_token"] = $this->TOKEN;
        //エポック秒
        $this->parameters["passkey"] = time(); 
        // 署名
        $key = $this->parameters["spiral_api_token"] . "&" . $this->parameters["passkey"];
        $this->parameters["signature"] = hash_hmac('sha1', $key, $this->SECRET, false);



        // POSTデータを生成します
        if( !is_null($file) ) {

            $postdata = "--" . MULTIPART_BOUNDARY . "\r\n";
            $postdata .= "Content-Type: application/json; charset=\"UTF-8\";\r\n";
            $postdata .= "Content-Disposition: form-data; name=\"json\"\r\n\r\n";
            $postdata .= json_encode($this->parameters);
            $postdata .= "\r\n\r\n";

            foreach($file as $key => $val) {
                $file_name = end(explode('/', $val));
                $postdata .= "--" . MULTIPART_BOUNDARY . "\r\n";
                $postdata .= "Content-Type: application/octet-stream;\r\n";
                $postdata .= "Content-Disposition: form-data; name=\"" . $key . "\"; filename=\"" . $file_name . "\"\r\n\r\n";
                $postdata .= file_get_contents($val);
                $postdata .= "\r\n\r\n";
            }
            $postdata .= "--" . MULTIPART_BOUNDARY . "--\r\n";
            
        } else {
            // 送信用のJSONデータを作成
            $postdata = json_encode($this->parameters);
        }

        // curlライブラリを使って送信
        $curl = curl_init($this->APIURL);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_POST      , true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $this->apiHeaders);
        curl_exec($curl);

        // エラー処理
        if (curl_errno($curl)) {
            return MESSAGE_ERROR_DB;
        }

        $response = curl_multi_getcontent($curl);

        curl_close($curl);

        $response = json_decode($response, true);

        //エラー処理
        if($response['code'] != '0') {
            $log = new Log();
            $log->setErrorLog($response);
            return MESSAGE_ERROR_DB;
        }

        //検索結果データ調整(select)
        if( isset($response['data']) ) {
            $this->selectData = array();
            for($i=0; $i<count($response['data']); $i++ ) {
                $this->selectData[] = array();

                for($j=0; $j<count($response['data'][$i]); $j++ ) {
                    $column = str_replace('-', '_', $this->parameters["select_columns"][$j]);
                    $this->selectData[$i][$column] = $response['data'][$i][$j];
                }

            }
        }

        //レスポンスデータ設定
        $this->resData = $response;

        return '';
    }

    /******************************
    Getter
    *******************************/
    function getSelectData() {
        return $this->selectData;
    }
    function getResponse() {
        return $this->resData;
    }
}