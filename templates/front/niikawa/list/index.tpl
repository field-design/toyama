{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
  listページ
機能名：
　listページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>ツアーの一覧 | {$smarty.const.SITE_TITLE_FRONT}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/list.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="サイト名">
<meta property="og:type" content="website">
<meta property="og:title" content="ページタイトル">
<meta property="og:description" content="ディスクリプション">
<meta property="og:url" content="">
<meta property="og:image" content="">
<meta property="fb:app_id" content="">
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

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}">トップページ</a></li>
            <li>ツアーの一覧</li>
        </ul>
    </div>
</div>

<article>
    <div class="cf" data-lg>
        <h2><span>ツアーの一覧</span></h2>
        <div class="tour">
            {if count($productlist) == 0}
                <p>現在ツアーはありません。</p>
            {else}
                {foreach from=$productlist item=product}
                <div class="tours">
                    <a class="cf" href="{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$product.ProductID|default:''}">
                        <div class="image" style="background-image: url({$product.main_photo1|default:''});"></div>
                        <div class="overview">
                            <div class="inner">
                                <p>{$product.SubTitle|default:''}</p>
                                <h3>{$product.title|default:''}</h3>
                                <ul class="cost">
                                    {section name=i start=0 loop=5}
                                        {assign var='index' value=$smarty.section.i.index}
                                        {assign var='plan_title' value='plan_title'|cat:($index + 1)}
                                        {assign var='plan_Fee' value='plan_Fee'|cat:($index + 1)}
                                        {assign var='plan_Kind' value='plan_Kind'|cat:($index + 1)}
                                        {if isset($product.$plan_title) }
                                        <li>{$product.$plan_title}{if $product.$plan_Kind != ''}({$product.$plan_Kind}){/if} {$product.$plan_Fee}円</li>
                                        {/if}
                                    {/section}
                                </ul>
                                <ul class="keyword">
                                    {foreach from=$product.area item=value}
                                    <li class="area">{$value|default:''}</li>
                                    {/foreach}
                                    {foreach from=$product.Category item=value}
                                    <li class="genre">{$value|default:''}</li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                    </a>
                </div>
                {/foreach}
            {/if}
        </div>
    </div>
<!--
    <div class="pagination">
        <div data-lg>
            <ul>
                <li class="prev"><a href="">前へ</a></li>
                <li><a class="page" href="">1</a></li>
                <li><span class='current'>2</span></li>
                <li><a class="page" href="">3</a></li>
                <li class="next"><a href="">次へ</a></li>
            </ul>
        </div>
    </div>
-->
</article>

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


{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>