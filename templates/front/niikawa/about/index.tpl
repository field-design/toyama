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

<title>ページタイトル | サイト名</title>
<meta name="description" content="ディスクリプション">
<meta name="keywords" content="キーワード,キーワード,キーワード">
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
            <p>富山県の東部に位置する、魚津市、黒部市、入善町、朝日町の2市2町で構成されています。<br>にいかわ地域の特徴は、富山湾深海1,000mから3,000mの山岳峡谷までの高低差4,000mとそこに係る個性的な「水」であり、にいかわ観光圏のブランド「4,000mの高低差！山・川・海をまるごと満喫する『水の旅』」を展開します。</p>
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
                        <h3>神秘の海「富山湾」固有の不思議</h3>
                        <p>蜃気楼・埋没林・海底林・ヒスイ海岸など</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>2</i>
                    </div>
                    <div class="text">
                        <h3>海洋深層水と湧水の魅力</h3>
                        <p>清浄でミネラル豊富な深層水、生地の清水、沢スギなど</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>3</i>
                    </div>
                    <div class="text">
                        <h3>食の豊かさ</h3>
                        <p>海産物（漁種の多さと蒲鉾・昆布文化）、農産物（水稲、ジャンボ西瓜、名水ポーク）など</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>4</i>
                    </div>
                    <div class="text">
                        <h3>温泉郷</h3>
                        <p>透明度日本一の宇奈月温泉をはじめ、海岸から山岳まで多様な温泉の連続</p>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="inner">
                    <div class="number">
                        <i>5</i>
                    </div>
                    <div class="text">
                        <h3>黒部渓谷と山岳の魅力</h3>
                        <p>水源の固有林を走るtロッコ列車、水力発電ダム群、万年雪など</p>
                    </div>
                </div>
            </div>
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