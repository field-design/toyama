{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　aboutページ
機能名：
  aboutページ
******************************************************}
<!DOCTYPE html>
<html lang="en">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>About Ettyu Niikawa Kankouken | {Constant::$siteNameNiikawa}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/about.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="{Constant::$siteNameNiikawa}">
<meta property="og:type" content="website">
<meta property="og:title" content="About Ettyu Niikawa Kankouken">
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
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header_niikawa.tpl' h1_tag=$page_data.h1_tag}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}">Home</a></li>
            <li>About Ettyu Niikawa Kankouken</li>
        </ul>
    </div>
</div>

<div class="mainvisual">
    <img src="{$smarty.const.URL_ROOT_PATH}assets/img/about/main_img.png" alt="越中にいかわ観光圏イメージ">
</div>

<article>
    <div data-lg>
        <div class="overview">
            <h2>About Ettyu Niikawa Kankouken</h2>
            <p>Uozu-shi, Kurobe-shi, Nyuzen-machi and Asahi-machi, located in the east of Toyama Prefecture. The sightseeing area consists of these 2 cities and 2 towns.<br>Water flows from mountains 3,000 meters high to deep sea that sinks 1,000 meters beneath the surface, making for a 4,000 meter difference between the highest and lowest points. The dynamism of this terrain is unusual even by global standards.<br>The water’s journey has blessed the Niikawa area with a variety of charms.</p>
        </div>
        <div class="map">
            <img src="/assets/img/about/map_en.png" alt="Ettyu Niikawa Kankouken">
        </div>
        <div class="point">
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>1</i>
                    </div>
                    <div class="text">
                        <h3>The allure of Japan’s number one v-shaped canyon, Kurobe Gorge</h3>
                        <p>From hydroelectric dams to perpetual snow, there are a number of superb views that you can enjoy from the trolley train running through majestic nature</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>2</i>
                    </div>
                    <div class="text">
                        <h3>The allure of Toyama Bay’s "Sea of Mystery”</h3>
                        <p>A variety of mysterious, visionary and beautiful scenic sights such as mirages, bioluminescent firefly squid and the Uozu Buried Forest</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>3</i>
                    </div>
                    <div class="text">
                        <h3>The allure of rich food from the mountains, river and sea</h3>
                        <p>Toyama Bay is known as a natural fish preserve so there is of course a plentiful amount of seafood, as well as other unique foods such as jumbo watermelons and Meisui Pork</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>4</i>
                    </div>
                    <div class="text">
                        <h3>The allure of a variety of hot springs among the mountains, river and sea</h3>
                        <p>There are a number of hot springs located from the seaside to the mountains, including Unazuki Onsen which is known as Japan’s clearest hot spring</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>5</i>
                    </div>
                    <div class="text">
                        <h3>The allure of water travelling from the mountains to the sea</h3>
                        <p>There is deep ocean water rich in minerals, as well as spring water that descends from the mountains and overflows through to the Kurobe River</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>

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


{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>