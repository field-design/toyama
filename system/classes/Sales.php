<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　売上管理
機能名：
　売上管理
*******************************************/
class Sales extends Entity {

    function __construct() {

        $this->columns = array();
        $this->columnsDef = array();

        //商品ID
        $this->columns[] = 'ProductID';
        $this->columnsDef[] = '';

        //申込ID
        $this->columns[] = 'OderID';
        $this->columnsDef[] = '';

        //受注日
        $this->columns[] = 'oderDate';
        $this->columnsDef[] = '';

        //入金日
        $this->columns[] = 'paymentDate';
        $this->columnsDef[] = '';

        //注文番号
        $this->columns[] = 'OrderNumber';
        $this->columnsDef[] = '';

        //商品タイトル
        $this->columns[] = 'title';
        $this->columnsDef[] = '';

        //姓
        $this->columns[] = 'nameSei';
        $this->columnsDef[] = '';

        //名
        $this->columns[] = 'nameMei';
        $this->columnsDef[] = '';

        //支払方法
        $this->columns[] = 'Payment';
        $this->columnsDef[] = '';

        //料金
        for($i = 1; $i <=5; $i++) {
            $this->columns[] = 'plan_Fee' . $i;
            $this->columnsDef[] = 0;
        }
        
        //数量
        for($i = 1; $i <=5; $i++) {
            $this->columns[] = 'volume' . $i;
            $this->columnsDef[] = 0;
        }

        //対応状況
        $this->columns[] = 'Correspondence';
        $this->columnsDef[] = '';

    }

    /******************************
    売上一覧取得
    $num：
      デフォルト５件
    *******************************/
    function getSalesListView($num = 5) {
        $spiral = new SpiralApi('database/select', 'oderDB');

        $serch_condition = array();
        $serch_condition[] = array('name' => 'Correspondence', 'value' => '4');
        $serch_condition[] = array('name' => 'paymentDate', 'value' => date('Y/m/01'), 'operator' => '>=');
        $serch_condition[] = array('name' => 'paymentDate', 'value' => date("Y/m/01", strtotime("+1 month")), 'operator' => '<');

        $lines_per_page = $num;

        $page = 1;

        $sort = array();
        $sort[] = array('name' => 'paymentDate', 'order' => 'desc');

        $spiral->setSelectParam($this->columns, $serch_condition, null, $lines_per_page, $page, $sort);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        //DB値調整
        foreach($selectData as &$data) {
            $oderDate = DateTime::createFromFormat('Y年m月d日 H時i分', $data['paymentDate']);
            $data['paymentDate'] = $oderDate->format('Y/m/d H:i');

            $product = new Product();
            $data['title'] = $product->getProductName($data['ProductID']);
        }

        return $selectData;
    }

    /******************************
    当月の売り上げ金額・数量取得
    return：array('sales' => 当月売上, 'amount' => 当月数量, 'top' => array( TOP5商品配列 => TOP5金額配列 ))
    *******************************/
    function getSalesSum() {
        $spiral = new SpiralApi('database/select', 'oderDB');

        $columns = array();
        $columns[] = 'ProductID';
        $columns[] = 'title';
        for($i = 1; $i <=5; $i++) {
          $columns[] = 'plan_Fee' . $i;
        }
        for($i = 1; $i <=5; $i++) {
          $columns[] = 'volume' . $i;
        }

        $serch_condition = array();
        $serch_condition[] = array('name' => 'paymentDate', 'value' => date('Y/m/01'), 'operator' => '>=');
        $serch_condition[] = array('name' => 'paymentDate', 'value' => date("Y/m/01", strtotime("+1 month")), 'operator' => '<');
        $serch_condition[] = array('name' => 'Correspondence', 'value' => '4');

        $spiral->setSelectParam($columns, $serch_condition, null, 999);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        $result = array('sales' => 0, 'amount' => 0, 'product5' => '', 'sales5' => '');
        $top5 = array();
        $top5_text = array();
        foreach($selectData as $data) {

            $sales = 0;
            $amount = 0;

            //売上
            for($i = 1; $i <=5; $i++) {
                $sales += $data['plan_Fee' . $i] * $data['volume' . $i];
            }
            
            //数量
            for($i = 1; $i <=5; $i++) {
                $amount += $data['volume' . $i];
            }

            $result['sales'] += $sales;
            $result['amount'] += $amount;

            if ( !array_key_exists($data['ProductID'], $top5) ) {
                $top5[$data['ProductID']] = $sales;
                $top5_text[$data['ProductID']] = $data['title'];
            } else {
                $top5[$data['ProductID']] += $sales;
            }
            
        }

        arsort($top5);
        $top5 = array_slice($top5, 0, 5);

        foreach($top5 as $key => $value) {
            $result['product5'] .= $top5_text[$key] . '","';
            $result['sales5'] .= $value . ',';
        }

        $result['product5'] = trim($result['product5'], "\",\"");
        $result['sales5'] = trim($result['sales5'], ",");

        return $result;
    }

}