<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　aboutページ
機能名：
　aboutページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');

$smarty = new SmartyExtends();

$smarty->display(FRONT_DIR . 'niikawa/about/index.tpl');
