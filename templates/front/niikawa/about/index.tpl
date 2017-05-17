{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　aboutページ
機能名：
  aboutページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>越中にいかわ観光圏とは | {$smarty.const.SITE_TITLE_FRONT}</title>
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
            <li>越中にいかわ観光圏とは</li>
        </ul>
    </div>
</div>

<div class="mainvisual">
    <img src="{$smarty.const.URL_ROOT_PATH}assets/img/about/main_img.png" alt="越中にいかわ観光圏イメージ">
</div>

<article>
    <div data-lg>
        <div class="overview">
            <h2>越中にいかわ観光圏とは</h2>
            <p>富山県東部に位置する魚津市・黒部市・入善町・朝日町。この2市2町からなる観光地域です。<br>標高3,000ｍの山々から水深1,000ｍの深海まで、高低差4,000ｍという世界的にも稀有でダイナミックな地形を流れる「水」。<br>「水」の旅路でもたらす、多くの恵みがにいかわ地域にさまざまな魅力を与えてくれました。</p>
        </div>
        <div class="map">
            <img src="{$smarty.const.URL_ROOT_PATH}assets/img/about/map.svg" alt="越中にいかわ観光圏">
        </div>
        <div class="point">
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>1</i>
                    </div>
                    <div class="text">
                        <h3>日本一のV字峡、黒部峡谷の魅力</h3>
                        <p>水力発電ダム群や万年雪など壮大な自然の中を走るトロッコ電車から味わう絶景の数々</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>2</i>
                    </div>
                    <div class="text">
                        <h3>「神秘の海」富山湾の魅力</h3>
                        <p>蜃気楼、ホタルイカ群遊海面、魚津埋没林など、神秘的で幻想的な美しい風景の数々</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>3</i>
                    </div>
                    <div class="text">
                        <h3>山・川・海の幸と豊かな食の魅力</h3>
                        <p>「天然のいけす」富山湾の豊富な海産物はもちろんのこと、ジャンボ西瓜や名水ポークなど個性的な食の数々</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>4</i>
                    </div>
                    <div class="text">
                        <h3>山・川・海 各所多様な温泉郷の魅力</h3>
                        <p>「透明度日本一」の宇奈月温泉をはじめ、海岸から山岳まで連続する温泉の数々</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>5</i>
                    </div>
                    <div class="text">
                        <h3>山から海へ、旅する水の魅力</h3>
                        <p>ミネラル豊富な海洋深層水や山々から黒部川を下りあちこちで湧き出る湧水の数々</p>
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