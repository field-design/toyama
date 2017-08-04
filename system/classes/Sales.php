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

    private $person_id = null;

    function __construct($login = null) {

        if( !is_null($login) && !$login->isAuthAdmin() ) {
            $this->person_id = $login->getPersonID();
        }

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
    function getSalesListView($num = 5, $time = null) {

        if(is_null($time)) {
            $time = time();
        }
        $date_from = date('Y-m-01', $time);
        $date_to = date('Y-m-d', strtotime("+1 month", $time));

        //==========================================
        //◆ MySQL申込管理DB
        //==========================================
        $sql = '';
        $sql .= 'select t_order.order_id ';
        $sql .= '     , t_order.product_id ';
        $sql .= '     , t_order.course_id ';
        $sql .= '     , t_order.order_status ';
        $sql .= '     , t_order.pay_date ';
        $sql .= '     , t_product.title ';
        $sql .= '     , price.price_total ';
        $sql .= '     , amount.amount_total ';
        $sql .= 'from   t_order ';
        $sql .= 'left join ( ';
        $sql .= '          select order_id ';
        $sql .= '               , sum(meta_value) price_total ';
        $sql .= '          from   t_order_meta ';
        $sql .= '          where  meta_type = "price_value" ';
        $sql .= '          group by order_id ';
        $sql .= ') price ';
        $sql .= 'on        t_order.order_id = price.order_id ';
        $sql .= 'left join ( ';
        $sql .= '          select order_id ';
        $sql .= '               , sum(meta_value) amount_total ';
        $sql .= '          from   t_order_meta ';
        $sql .= '          where  meta_type = "amount" ';
        $sql .= '          group by order_id ';
        $sql .= ') amount ';
        $sql .= 'on        t_order.order_id = amount.order_id ';
        $sql .= 'left join t_product ';
        $sql .= 'on        t_order.product_id = t_product.product_id ';
        $sql .= 'where     t_order.order_status = :order_status ';
        $sql .= 'and       t_order.pay_date >= :pay_date_from ';
        $sql .= 'and       t_order.pay_date <  :pay_date_to ';

        if( !is_null($this->person_id) ) {
            $sql .= 'and   t_order.person_id = :person_id ';
        }

        $sql .= 'group by  t_order.order_id ';
        $sql .= '       ,  t_order.product_id ';
        $sql .= '       ,  t_order.course_id ';
        $sql .= '       ,  t_order.order_status ';
        $sql .= '       ,  t_order.pay_date ';
        $sql .= '       ,  t_product.title ';
        $sql .= 'order by  t_order.regist_date desc ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':order_status', '4');
        $db->setBindValueSTR(':pay_date_from', $date_from);
        $db->setBindValueSTR(':pay_date_to', $date_to);
        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectMySQLData = $db->getResponse();

        $ids = array_column($selectMySQLData, 'order_id');

        $spiral = new SpiralApi('database/select', 'oderDB');

        $serch_condition = array();
        foreach($ids as $id) {
            $serch_condition[] = array('name' => 'OderID', 'value' => $id, 'logical_connection' => 'or');
        }
        if(count($serch_condition) == 0) {
            $serch_condition[] = array('name' => 'OderID', 'value' => '');
        }

        $lines_per_page = $num;

        $page = 1;

        $sort = array();

        $spiral->setSelectParam($this->columns, $serch_condition, null, $lines_per_page, $page, $sort);

        $err_msg = $spiral->exec();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $spiral->getSelectData();

        $resultData = array();
        $spiralData = array_column($selectData, null, 'OderID');
        
        for($i = 0; $i < count($selectMySQLData); $i++) {
            $resultData[] = $spiralData[$selectMySQLData[$i]['order_id']];
            $resultData[$i]['order_id'] = $selectMySQLData[$i]['order_id'];
            $resultData[$i]['order_status'] = $selectMySQLData[$i]['order_status'];
            $resultData[$i]['order_status_text'] = Constant::$aryCorrespondence[$selectMySQLData[$i]['order_status']];
            $resultData[$i]['price_total'] = $selectMySQLData[$i]['price_total'];
            $resultData[$i]['pay_date'] = date('Y/m/d H:i:s', strtotime($selectMySQLData[$i]['pay_date']));
            $resultData[$i]['amount_total'] = $selectMySQLData[$i]['amount_total'];
            $resultData[$i]['title'] = $selectMySQLData[$i]['title'];
        }

        return $resultData;
    }

    /******************************
    当月の売り上げ金額・数量取得
    return：array('sales' => 当月売上, 'amount' => 当月数量, 'product5' => TOP5商品（カンマ区切り文字列）, 'sales5' => TOP5売上配列（カンマ区切り文字列） )
    *******************************/
    function getSalesSum($time = null) {

        if(is_null($time)) {
            $time = time();
        }

        $date_from = date('Y-m-01', $time);
        $date_to = date('Y-m-d', strtotime("+1 month", $time));

        $result = array('sales' => 0, 'amount' => 0, 'product5' => array(), 'sales5' => array());

        //当月売上取得
        $sql = '';
        $sql .= 'select sum(price.price_total) price_month_total ';
        $sql .= '     , sum(amount.amount_total) amount_month_total ';
        $sql .= 'from   t_order ';
        $sql .= 'left join ( ';
        $sql .= '          select order_id ';
        $sql .= '               , sum(meta_value) price_total ';
        $sql .= '          from   t_order_meta ';
        $sql .= '          where  meta_type = "price_value" ';
        $sql .= '          group by order_id ';
        $sql .= ') price ';
        $sql .= 'on        t_order.order_id = price.order_id ';
        $sql .= 'left join ( ';
        $sql .= '          select order_id ';
        $sql .= '               , sum(meta_value) amount_total ';
        $sql .= '          from   t_order_meta ';
        $sql .= '          where  meta_type = "amount" ';
        $sql .= '          group by order_id ';
        $sql .= ') amount ';
        $sql .= 'on        t_order.order_id = amount.order_id ';
        $sql .= 'where     t_order.order_status = :order_status ';
        $sql .= 'and       t_order.pay_date >= :pay_date_from ';
        $sql .= 'and       t_order.pay_date <  :pay_date_to ';
        if( !is_null($this->person_id) ) {
            $sql .= 'and   t_order.person_id = :person_id ';
        }

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':order_status', '4');
        $db->setBindValueSTR(':pay_date_from', $date_from);
        $db->setBindValueSTR(':pay_date_to', $date_to);
        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        if( count($selectData) > 0 ) {
            $result['sales'] = $selectData[0]['price_month_total'];
            $result['amount'] = $selectData[0]['amount_month_total'];
        }


        //当月TOP5取得
        $sql = '';
        $sql .= 'select t_product.product_id ';
        $sql .= '     , t_product.title ';
        $sql .= '     , sum(price.price_total) price_month_total ';
        $sql .= 'from   t_order ';
        $sql .= 'left join ( ';
        $sql .= '          select order_id ';
        $sql .= '               , sum(meta_value) price_total ';
        $sql .= '          from   t_order_meta ';
        $sql .= '          where  meta_type = "price_value" ';
        $sql .= '          group by order_id ';
        $sql .= ') price ';
        $sql .= 'on        t_order.order_id = price.order_id ';
        $sql .= 'left join t_product ';
        $sql .= 'on        t_order.product_id = t_product.product_id ';
        $sql .= 'where     t_order.order_status = :order_status ';
        $sql .= 'and       t_order.pay_date >= :pay_date_from ';
        $sql .= 'and       t_order.pay_date <  :pay_date_to ';
        if( !is_null($this->person_id) ) {
            $sql .= 'and   t_order.person_id = :person_id ';
        }

        $sql .= 'group by  t_product.product_id ';
        $sql .= '       ,  t_product.title ';
        $sql .= 'order by  price_month_total desc ';
        $sql .= 'limit     5 ';

        $db = new DB();
        $db->setPrepare($sql);
        $db->setBindValueSTR(':order_status', '4');
        $db->setBindValueSTR(':pay_date_from', $date_from);
        $db->setBindValueSTR(':pay_date_to', $date_to);
        if( !is_null($this->person_id) ) {
            $db->setBindValueSTR(':person_id', $this->person_id);
        }

        $err_msg = $db->execute();

        if( !empty($err_msg) ) {
            //エラー処理
            return $err_msg;
        }

        $selectData = $db->getResponse();

        foreach( $selectData as $data ) {
            $result['product5'][] = $data['title'];
            $result['sales5'][] = $data['price_month_total'];
        }

        $result['product5'] = implode('","', $result['product5']);
        $result['sales5'] = implode(',', $result['sales5']);

        return $result;
    }

}