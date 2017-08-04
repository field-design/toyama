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
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();

$page = new Page();

$page_data = $page->getLangPage(2, 4);

$smarty->assign('page_data', $page_data);
$smarty->display(FRONT_DIR . 'niikawa/about/index.tpl');
