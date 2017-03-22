<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　申込（お客様情報入力）ページ
機能名：
　申込（お客様情報入力）ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');
require_once(CLS_DIR . 'Product.php');
require_once(CLS_DIR . 'Order.php');

$smarty = new SmartyExtends();

$smarty->display(FRONT_DIR . 'order/input/index.tpl');
