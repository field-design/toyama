<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　申込（ご予約内容確認）ページ
機能名：
　申込（ご予約内容確認）ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Order.php');

$smarty = new SmartyExtends();

$smarty->display(FRONT_DIR . 'order/check/index.tpl');
