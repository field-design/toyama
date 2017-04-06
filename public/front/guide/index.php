<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　guideページ
機能名：
　guideページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');

$smarty = new SmartyExtends();

$smarty->display(FRONT_DIR . 'guide/index.tpl');
