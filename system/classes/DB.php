<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　DBクラス
機能名：
　DBクラス
*******************************************/
class DB
{
    private $pdo;
    private $sql;
    private $stmt;
    private $bind_param;

    /******************************
    コンストラクタ
    *******************************/
    function __construct() 
    {
        try {
            // データベースに接続
            $this->pdo = new PDO(
                'mysql:dbname=' . DB_NAME . ';host=' . DB_HOST . ';charset=utf8mb4',
                DB_USER,
                DB_PASS,
                array(
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                )
            );
        } catch (PDOException $e) {
            exit($e->getMessage()); 
        }
    }

    /******************************
    プリペアードステートメント取得

    @param SQL文 $sql
    @return 空文字|エラー文言
    *******************************/
    function setPrepare($sql) {
        $this->stmt = $this->pdo->prepare($sql);
        if(!$this->stmt) {
            return 'ERROR PREPARE';
        }

        return '';
    }

    /******************************
    プレースホルダ―設定(INT)
    *******************************/
    function setBindValueINT($name, $value) {
        return $this->setBindValue($name, (int)$value, PDO::PARAM_INT);
    }

    /******************************
    プレースホルダ―設定(STR)
    *******************************/
    function setBindValueSTR($name, $value) {
        return $this->setBindValue($name, $value, PDO::PARAM_STR);
    }

    /******************************
    プレースホルダ―設定(NULL)
    *******************************/
    function setBindValueNULL($name, $value) {
        return $this->setBindValue($name, $value, PDO::PARAM_NULL);
    }

    /******************************
    プレースホルダ―設定(共通)
    *******************************/
    private function setBindValue($name, $value, $type) {
        if(!$this->stmt) {
            return 'ERROR PREPARE';
        }

        $this->stmt->bindValue($name, $value, $type);

        return '';
    }

    /******************************
    トランザクション開始
    *******************************/
    function beginTransaction() {
        $this->pdo->beginTransaction();
    }

    /******************************
    トランザクションコミット
    *******************************/
    function commit() {
        if($this->pdo->inTransaction()) {
            $this->pdo->commit();
        }
    }
    /******************************
    トランザクションロールバック
    *******************************/
    function rollBack() {
        if($this->pdo->inTransaction()) {
            $this->pdo->rollBack();
        }
    }

    /******************************
    SELECT実行
    *******************************/
    function execSelect() {
        
    }

    /******************************
    INSERT実行
    @param $table テーブル名
    @param $params array(列名 => 値)
    *******************************/
    function execInsert($table, $params, $auto_commit = true) {
        $sql = '';

        $sql .= 'insert into ' . $table . ' ';

        $sql .= '(';
        foreach($params as $column => $value) {
            $sql .= $column . ',';
        }
        $sql = trim($sql, ',');
        $sql .= ')';

        $sql .= ' values ';

        $sql .= '(';
        foreach($params as $column => $value) {
            $sql .= ':' . $column . ',';
        }
        $sql = trim($sql, ',');
        $sql .= ');';

        $err_msg = $this->setPrepare($sql);

        if(!empty($err_msg)) {
            return $err_msg;
        }

        foreach($params as $column => $value) {
            if($value == '') {
                $this->setBindValueNULL(':' . $column, null);
            } else {
                $this->setBindValueSTR(':' . $column, $value);
            }
        }

        return $this->execute($auto_commit);
    }

    /******************************
    UPDATE実行
    @param $table テーブル名
    @param $params array(列名 => 値)
    @param $where_params array(列名 => 値)
    *******************************/
    function execUpdate($table, $params, $where_params, $auto_commit = true) {
        $sql = '';

        $sql .= 'update ' . $table . ' set ';

        foreach($params as $column => $value) {
            $sql .= $column . ' = :' . $column . ',';
        }
        $sql = trim($sql, ',');

        $sql .= ' where ';

        foreach($where_params as $column => $value) {
            $sql .= ' ' . $column . ' = :where_' . $column . ' and';
        }
        $sql = rtrim($sql, "and");

        $err_msg = $this->setPrepare($sql);

        if(!empty($err_msg)) {
            return $err_msg;
        }

        foreach($params as $column => $value) {
            if($value == '') {
                $this->setBindValueNULL(':' . $column, null);
            } else {
                $this->setBindValueSTR(':' . $column, $value);
            }
        }

        foreach($where_params as $column => $value) {
            if($value == '') {
                $this->setBindValueNULL(':where_' . $column, null);
            } else {
                $this->setBindValueSTR(':where_' . $column, $value);
            }
        }

        return $this->execute($auto_commit);
    }

    /******************************
    DELETE実行
    @param $table テーブル名
    @param $where_params array(列名 => 値)
    *******************************/
    function execDelete($table, $where_params, $auto_commit = true) {
        $sql = '';

        $sql .= 'delete from ' . $table;

        $sql .= ' where ';

        foreach($where_params as $column => $value) {
            $sql .= ' ' . $column . ' = :where_' . $column . ' and';
        }
        $sql = rtrim($sql, "and");

        $err_msg = $this->setPrepare($sql);

        if(!empty($err_msg)) {
            return $err_msg;
        }

        foreach($where_params as $column => $value) {
            if($value == '') {
                $this->setBindValueNULL(':where_' . $column, null);
            } else {
                $this->setBindValueSTR(':where_' . $column, $value);
            }
        }

        return $this->execute($auto_commit);
    }

    /******************************
    SQL実行
    *******************************/
    function execute($auto_commit = true) {

        try {
            $this->stmt->execute();
            if($auto_commit) {
                $this->commit();
            }
        } catch (PDOException $e) {
            $this->rollBack();
            return $e->getMessage();
        }

        return '';
    }

    /******************************
    データ取得
    *******************************/
    function getResponse() {
        try {
            return $this->stmt->fetchAll();
        } catch (PDOException $e) {
            return $this->stmt->rowCount();
        }
        
    }
    function getLastInsertId() {
        return $this->pdo->lastInsertId();
    }
}