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
require_once(CLS_DIR . 'Page.php');

$smarty = new SmartyExtends();

$page = new Page();

$page_data = $page->getLangPage(1, 3);

$smarty->assign('page_data', $page_data);
$smarty->display(FRONT_DIR . 'law/index.tpl');
