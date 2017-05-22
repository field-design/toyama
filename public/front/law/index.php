<?php
/******************************************
システム名： 
　旅行商品予約システム フロントサイト
コントローラ名：
　特定商取引法ページ
機能名：
　特定商取引法ページ
*******************************************/

require_once($_SERVER['FD_SYS_DIR'] . 'system/includes/init.php');

$smarty = new SmartyExtends();

$smarty->display(FRONT_DIR . 'law/index.tpl');
