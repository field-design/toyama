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

<title>ツアーの一覧 |  {Constant::$siteName}</title>
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
<meta property="og:site_name" content=" {Constant::$siteName}">
<meta property="og:type" content="website">
<meta property="og:title" content="ツアーの一覧">
<meta property="og:description" content="">
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
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header.tpl' h1_tag=$page_data.h1_tag}
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
        <h2><span>{if $area_text != ''}{$area_text}{elseif $category_text != ''}{$category_text}{else}ツアーの一覧{/if}</span></h2>
        <div class="tour cf">
            {if count($productlist) == 0}
                <p>現在ツアーはありません。</p>
            {else}
                {foreach from=$productlist item=product}
                <div class="tours">
                    {if isset($product.area['area1'])}
                        <a class="cf" href="{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$product.product_id|default:''}">
                    {else}
                        <a class="cf" href="{$smarty.const.URL_ROOT_PATH}plan/?plan={$product.product_id|default:''}">
                    {/if}
                        <div class="image" style="background-image: url({$product.main_photo1|default:''});"></div>
                        <div class="overview">
                            <div class="inner">
                                <p>{$product.sub_title|default:''}</p>
                                <h3>{$product.title|default:''}</h3>
                                <ul class="cost">
                                    {if $product.price_value_min != '' || $product.price_value_max != ''}
                                        {if $product.price_value_min == $product.price_value_max}
                                        <li>{$product.price_title} <span class="num3">{$product.price_value_max}</span>円</li>
                                        {else}
                                        <li>{$product.price_title} <span class="num3">{$product.price_value_min}</span>〜<span class="num3">{$product.price_value_max}</span>円</li>
                                        {/if}
                                    {/if}
                                </ul>
                                <ul class="keyword">
                                    {foreach from=$product.area_text item=value}
                                    <li class="area">{$value|default:''}</li>
                                    {/foreach}
                                    {foreach from=$product.category_text item=value}
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
    <div class="pagination">
        <div data-lg>
            <ul>
                {foreach from=$pager item=value}
                    {if $value == ($current_page - 2) && $current_page != count($pager) || ($current_page == count($pager) && $value == $current_page - 3)}
                        <li class="prev"><a href="{$smarty.const.URL_ROOT_PATH}list/?page={$current_page - 1}&area={$area_detail|default:''}&Category={$category|default:''}">前へ</a></li>
                    {elseif $value == $current_page - 1 || $value == $current_page + 1 }
                        <li><a class="page" href="{$smarty.const.URL_ROOT_PATH}list/?page={$value}&area={$area_detail|default:''}&Category={$category|default:''}">{$value}</a></li>
                    {elseif $current_page == 1 && $value == $current_page + 2 }
                        <li><a class="page" href="{$smarty.const.URL_ROOT_PATH}list/?page={$value}&area={$area_detail|default:''}&Category={$category|default:''}">{$value}</a></li>
                    {elseif $current_page == count($pager) && $value == $current_page - 2 }
                        <li><a class="page" href="{$smarty.const.URL_ROOT_PATH}list/?page={$value}&area={$area_detail|default:''}&Category={$category|default:''}">{$value}</a></li>
                    {elseif $value == ($current_page + 2) && $current_page != 1 || ($current_page == 1 && $value == $current_page + 3) }
                        <li class="next"><a href="{$smarty.const.URL_ROOT_PATH}list/?page={$current_page + 1 }&area={$area_detail|default:''}&Category={$category|default:''}">次へ</a></li>
                    {elseif $value == $current_page}
                        <li><span class='current'>{$value}</span></li>
                    {/if}
                {/foreach}
            </ul>
        </div>
    </div>
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