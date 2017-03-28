{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　にいかわトップページ
機能名：
　にいかわトップページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>{$smarty.const.SITE_TITLE_FRONT}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/index.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="{$smarty.const.SITE_TITLE_FRONT}">
<meta property="og:type" content="website">
<meta property="og:title" content="{$smarty.const.SITE_TITLE_FRONT}">
<meta property="og:description" content="">
<meta property="og:url" content="{$smarty.const.URL_ROOT_PATH_FULL}">
<meta property="og:image" content="{$smarty.const.URL_ROOT_PATH_HOST}/assets/img/index/slide01.jpg">
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

<div class="mainvisual">
    <div class="bxslider">
        <div class="slide" style="background-image: url(/assets/img/niikawa/slide01.jpg);"></div>
        <div class="slide" style="background-image: url(/assets/img/niikawa/slide02.jpg);"></div>
        <div class="slide" style="background-image: url(/assets/img/niikawa/slide03.jpg);"></div>
    </div>
    <p>いますぐ えらべる<br>いますぐ とらべる</p>
</div>

{include file=$smarty.const.FRONT_DIR|cat:'includes/head/sns_share.tpl' url="{$smarty.const.URL_ROOT_PATH_FULL}" title={$smarty.const.SITE_TITLE_FRONT}}


<section>
    <div class="introduction">
        <div data-lg>
            <h2>越中にいかわ観光圏<span>（魚津市、黒部市、入善町、朝日町）</span></h2>
            <div class="sub-ttl">
                <img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/sub_ttl.svg" alt="水が織りなす、奇跡の物語">
            </div>
            <p>いのちを育む「水」。<br>雨が降り注ぎ、地に染み込み、川をたどり、海へ流れ、<br>水蒸気となって、また雨となる。<br>水は、多くの恵みを運びます。<br>山から海へ、はじまりから終わりまでを物語る、水の旅。<br>水に沿って広がる物語の舞台。<br>それが「富山湾・黒部峡谷・越中にいかわ観光圏」です。<br>さあ、美しき水の冒険へ。</p>
            <div class="more">
                <a href="{$smarty.const.URL_ROOT_PATH}niikawa/about/">詳しくみる</a>
            </div>
        </div>
    </div>
</section>

<div class="btn-wrap cf">
    <div class="purchase">
        <a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">ツアーを購入する</a>
    </div>
    <div class="choice">
        <div class="area">
            <p><span>地域でえらぶ</span></p>
        </div>
        <div class="genre">
            <p><span>ジャンルでえらぶ</span></p>
        </div>
    </div>
    <div class="area-accordion">
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=1"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_uodu.svg" alt="魚津市"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=2""><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_kurobe.svg" alt="黒部市"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=3""><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_nyuzen.svg" alt="入善町"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=4""><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_asahi.svg" alt="朝日町"></a></li>
        </ul>
    </div>
    <div class="genre-accordion">
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=1"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_experience.svg" alt="体験する"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=2"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_see.svg" alt="見る"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=3"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_eat.svg" alt="食べる"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=4"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_buy.svg" alt="買う"></a></li>
        </ul>
    </div>
</div>

<div class="tour">
    <div class="cf" data-lg>
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
                                    <li>{$product.$plan_title}{if $product.$plan_Kind != ''}({$product.$plan_Kind}){/if} {$product.$plan_Fee|number_format}円</li>
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
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/jquery.bxslider.min.css">
<script src="{$smarty.const.URL_ROOT_PATH}assets/js/jquery.bxslider.min.js"></script>
{literal}
<script type="text/javascript">
    $(function(){
        var sliderImg = $('.bxslider .slide').length;
        if(sliderImg > 1){
            $('.bxslider').bxSlider({
                mode: 'fade',
                auto: true,
                speed: 2000,
                pause: 6000,
                // pager: false,
                controls: false,
                adaptiveHeight: true,
                adaptiveHeightSpeed: 0,
                touchEnabled: false,
            });
        }
    });
</script>
<script>
    $(function(){
        $(".choice .area").on("click", function() {
            if ($(".area-accordion").css('display') == 'none'){
                $(".area-accordion").slideDown();
                $(".choice .area").addClass("active");
                $(".choice .genre").removeClass("active");
                $(".genre-accordion").slideUp();
            } else {
                $(".area-accordion").slideUp();
                $(".choice .area").removeClass("active");
            }
        });
    });
    $(function(){
        $(".choice .genre").on("click", function() {
            if ($(".genre-accordion").css('display') == 'none'){
                $(".genre-accordion").slideDown();
                $(".choice .genre").addClass("active");
                $(".choice .area").removeClass("active");
                $(".area-accordion").slideUp();
            } else {
                $(".genre-accordion").slideUp();
                $(".choice .genre").removeClass("active");
            }
        });
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>