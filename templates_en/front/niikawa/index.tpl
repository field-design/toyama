{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　にいかわトップページ
機能名：
　にいかわトップページ
******************************************************}
<!DOCTYPE html>
<html lang="en">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>{$page_data.title_tag|default:''}</title>
<meta name="description" content="{$page_data.description_tag|default:''}">
<meta name="keywords" content="{$page_data.keyword_tag|default:''}">
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
<meta property="og:site_name" content="{$page_data.title_tag|default:''}">
<meta property="og:type" content="website">
<meta property="og:title" content="{$page_data.title_tag|default:''}">
<meta property="og:description" content="{$page_data.description_tag|default:''}">
<meta property="og:url" content="{$smarty.const.URL_ROOT_PATH_FULL}">
<meta property="og:image" content="{$smarty.const.URL_ROOT_PATH_HOST}{$page_data.slide_photo[0]|default:''}">
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
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header_niikawa.tpl' h1_tag=$page_data.h1_tag}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="mainvisual">
    <div class="bxslider">
        {foreach from=$page_data.slide_photo item=photo}
        <div class="slide" style="background-image: url({$photo});"></div>
        {/foreach}
    </div>
    <p>Choose right now<br>travel right now</p>
</div>

{include file=$smarty.const.FRONT_DIR|cat:'includes/head/sns_share.tpl' url="{$smarty.const.URL_ROOT_PATH_FULL}" title={$smarty.const.SITE_TITLE_FRONT}}


<section>
    <div class="introduction">
        <div data-lg>
            <h2>About Ettyu Niikawa Kankouken</span></h2>
            <p>Uozu-shi, Kurobe-shi, Nyuzen-machi and Asahi-machi, located in the east of Toyama Prefecture. The sightseeing area consists of these 2 cities and 2 towns.<br />Water flows from mountains 3,000 meters high to deep sea that sinks 1,000 meters beneath the surface, making for a 4,000 meter difference between the highest and lowest points. The dynamism of this terrain is unusual even by global standards.<br />The water’s journey has blessed the Niikawa area with a variety of charms.</p>
            <div class="more">
                <a href="{$smarty.const.URL_ROOT_PATH}en/niikawa/about">more</a>
            </div>
        </div>
    </div>
</section>

<div class="btn-wrap cf">
    <div class="purchase">
        <a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">Buy a tour</a>
    </div>
    <div class="choice">
        <div class="area">
            <p><span>Choose by region</span></p>
        </div>
        <div class="genre">
            <p><span>Choose by genre</span></p>
        </div>
    </div>
    <div class="area-accordion">
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 0, 1, true))}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_uodu_en.svg" alt="{current(array_slice(Constant::$aryAreaDetail['area1'], 0, 1, true))}"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 1, 1, true))}""><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_kurobe_en.svg" alt="{current(array_slice(Constant::$aryAreaDetail['area1'], 1, 1, true))}"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 2, 1, true))}""><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_nyuzen_en.svg" alt="{current(array_slice(Constant::$aryAreaDetail['area1'], 2, 1, true))}"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 3, 1, true))}""><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_asahi_en.svg" alt="{current(array_slice(Constant::$aryAreaDetail['area1'], 3, 1, true))}"></a></li>
        </ul>
    </div>
    <div class="genre-accordion">
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 0, 1, true))}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_experience_en.svg" alt="{current(array_slice(Constant::$aryCategory, 0, 1, true))}"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 1, 1, true))}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_see_en.svg" alt="{current(array_slice(Constant::$aryCategory, 1, 1, true))}"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 2, 1, true))}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_eat_en.svg" alt="{current(array_slice(Constant::$aryCategory, 2, 1, true))}"></a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 3, 1, true))}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/index/icon_buy_en.svg" alt="{current(array_slice(Constant::$aryCategory, 3, 1, true))}"></a></li>
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
                <a class="cf" href="{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$product.product_id|default:''}">
                    <div class="image" style="background-image: url({$product.main_photo1|default:''});"></div>
                    <div class="overview">
                        <div class="inner">
                            <p>{$product.sub_title|default:''}</p>
                            <h3>{$product.title|default:''}</h3>
                            <ul class="cost">
                                {if $product.price_value_min == $product.price_value_max}
                                <li>{$product.price_title} <span class="num3">{$product.price_value_max}</span>Yen</li>
                                {else}
                                <li>{$product.price_title} <span class="num3">{$product.price_value_min}</span>〜<span class="num3">{$product.price_value_max}</span>Yen</li>
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
                    <li class="prev"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?page={$current_page - 1}">Prev</a></li>
                {elseif $value == $current_page - 1 || $value == $current_page + 1 }
                    <li><a class="page" href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?page={$value}">{$value}</a></li>
                {elseif $current_page == 1 && $value == $current_page + 2 }
                    <li><a class="page" href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?page={$value}">{$value}</a></li>
                {elseif $current_page == count($pager) && $value == $current_page - 2 }
                    <li><a class="page" href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?page={$value}">{$value}</a></li>
                {elseif $value == ($current_page + 2) && $current_page != 1 || ($current_page == 1 && $value == $current_page + 3) }
                    <li class="next"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?page={$current_page + 1 }">Next</a></li>
                {elseif $value == $current_page}
                    <li><span class='current'>{$value}</span></li>
                {/if}
            {/foreach}
        </ul>
    </div>
</div>

</main>
<!-- END main -->


<!-- START global-footer -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer_niikawa.tpl'}
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