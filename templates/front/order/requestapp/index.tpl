{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　リクエスト完了ページ
機能名：
　リクエスト完了ページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>お申し込み | {$smarty.const.SITE_TITLE_FRONT}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/order.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- Twitter Card -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/twitter_card.tpl'}
</head>

<body class="drawer drawer--right" id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


{include file=$smarty.const.FRONT_DIR|cat:'includes/head/loading.tpl'}


<!-- START global-header -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header.tpl'}
<!-- END global-header -->



<!-- START main -->
<main role="main">

{if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

{if count($response) > 0}
<form method="post" action="{$response.action}">
{foreach from=$response item=item key=key}
{if $key != 'status' || $key != 'action'}
<input name="{$key}" type="hidden" value="{$item}" />
{/if}
{/foreach}
</form>
{/if}
</main>
<!-- END main -->


<!-- START global-footer -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer.tpl'}
<!-- END global-footer -->


<!-- WEB Fonts -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/webfont.tpl'}
<!-- icon Fonts -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/iconfont.tpl'}
<!-- Common Script -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/script.tpl'}
<!-- Google map javascript api v3 -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/google_script.tpl'}


<!-- Page Script -->
{literal}
<script>
    $(function(){
        if($('form').length > 0) {
            $('form').submit();
        }
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>