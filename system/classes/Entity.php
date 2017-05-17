<?php

/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　エンティティ管理
機能名：
　エンティティ管理
*******************************************/
class Entity {

    protected $columns;
    protected $columnsDef;
    protected $tableName;

    /*******************
    POSTデータ取得
    ********************/
    function getPostData() {
        $data = array();

        for( $i = 0; $i < count($this->columns); $i++ ) {
            $column = $this->columns[$i];
            $column_def = $this->columnsDef[$i];
            $data[$column] = isset($_POST[$column]) ? $_POST[$column] : $column_def;
        }

        return $data;
    }

    /*******************
    新規データ取得
    ********************/
    function getNewData() {
        $data = array();

        for( $i = 0; $i < count($this->columns); $i++ ) {
            $column = $this->columns[$i];
            $column_def = $this->columnsDef[$i];
            $data[$column] = $column_def;
        }

        return $data;
    }
}