<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　ファイルアップローダー
機能名：
　ファイルアップローダー
*******************************************/
class FileUploader {

    private $uploadDir;
    private $uploadUrl;

    function __construct($target_dir = '') {

        //一時アップロードディレクトリ作成
        $this->uploadDir = UPL_DIR . 'tmp/';
        $this->uploadUrl = URL_UPL_DIR . 'tmp/';

        if( !file_exists($this->uploadDir) ) {
           mkdir($this->uploadDir, 0755);
           chmod($this->uploadDir, 0755);
        }

        //一時ファイル削除
        $this->deleteExpireDir();

        //アップロードディレクトリ指定の場合
        if($target_dir != '') {
            $this->uploadDir .= $target_dir . '/';
            $this->uploadUrl .= $target_dir . '/';
            
            if( !file_exists($this->uploadDir) ) {
                mkdir($this->uploadDir, 0755);
                chmod($this->uploadDir, 0755);
            }
        }
    }

    /************************ 

    一時ファイル削除

    *************************/
    function deleteExpireDir() {
        date_default_timezone_set('Asia/Tokyo');
 
        //削除期限
        $expire = strtotime("24 hours ago");
        
        //ディレクトリ
        $dir = $this->uploadDir;
        $util = new Util();
        $util->removeDir($dir, $expire);
    }

    /************************ 

    ファイル存在チェック

    *************************/
    function checkExistFiles() {
        $count = count($_FILES['files']['tmp_name']);
        $ary_result = array();

        for ($i = 0 ; $i < $count ; $i ++ ) {

            $name = $_FILES["files"]["name"][$i];
            if (file_exists($this->uploadDir . $name)) {
                $ary_result[] = $name;
            }
        }

        return $ary_result;
    }

    /************************ 

    アップロード処理

    戻り値：連想配列
    　key:count, value:保存ファイル数
    　key:path, value:保存先パス（URL）
    *************************/
    function upload() {
        $count = count($_FILES['files']['tmp_name']);
        $ary_result = array();
        $ary_result['count'] = $count;
        $ary_result['path'] = array();

        for ($i = 0 ; $i < $count ; $i ++ ) {

            $tmp_name = $_FILES["files"]["tmp_name"][$i];
            $name = $_FILES["files"]["name"][$i];
            if (!is_uploaded_file($tmp_name)) {
                continue;
            }

            move_uploaded_file($tmp_name, $this->uploadDir . $name);
            $ary_result['url'][] = $this->uploadUrl . $name;

        }

        return $ary_result;
    }
}