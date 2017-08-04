{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　バナー掲載について
機能名：
　バナー掲載について
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>バナー掲載について</title>
<meta name="description" content="">

<!-- icons -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/stylesheet.tpl'}
<!-- Modernizr -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/dns_prefetch.tpl'}

</head>

<body id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


<!-- START global-header -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_header.tpl'}
<!-- END global-header -->


<!-- START global-nav -->
<div class="global-nav">
    <div class="container">

    </div>
</div>
<!-- END global-nav -->


<div class="container">

    <div class="breadcrumbs section">
        <div class="notification">
            <ul class="is-clearfix">
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}"><span class="icon is-small"><i class="fa fa-home" aria-hidden="true"></i></span></a></li>
              <li><span>バナー掲載について</span></li>
            </ul>
        </div>
    </div>

    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' banner='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">バナー掲載について</h2>
    <p style="margin-bottom:1.5em;">事業者様のWEB媒体（公式ホームページ等）へ、いまからえらべるTRAVELのバナーを掲載していただける場合は、下記のコードをご利用ください。</p>

    <section>
        <div class="banner box">
            <p><strong>バナーサイズ：468px × 60px</strong></p>
            <figure style="margin-bottom:10px;">
                <img src="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/img/common/nikawa_banner_468-60.jpg">
            </figure>
            <p><strong>html埋め込み用コード</strong></p>
<pre><code>&lt;a href=&quot;https://just-toyama.visit-town.com/&quot; target=&quot;_blank&quot; title=&quot;いまからえらべるTRAVEL&quot;&gt;&lt;img src=&quot;https://just-toyama.visit-town.com/assets/img/common/nikawa_banner_468-60.jpg&quot; alt=&quot;いまからえらべるTRAVEL&quot; border=&quot;0&quot; width=&quot;468&quot; height=&quot;60&quot; /&gt;&lt;/a&gt;</code></pre>
        </div>

        <div class="banner box">
            <strong>バナーサイズ：234px × 60px</strong>
            <figure style="margin-bottom:10px;">
                <img src="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/img/common/nikawa_banner_234x60.jpg">
            </figure>
            <strong>html埋め込み用コード</strong>
<pre><code>&lt;a href=&quot;https://just-toyama.visit-town.com/&quot; target=&quot;_blank&quot; title=&quot;いまからえらべるTRAVEL&quot;&gt;&lt;img src=&quot;https://just-toyama.visit-town.com/assets/img/common/nikawa_banner_234x60.jpg&quot; alt=&quot;いまからえらべるTRAVEL&quot; border=&quot;0&quot; width=&quot;234&quot; height=&quot;60&quot; /&gt;&lt;/a&gt;</code></pre>
        </div>

        <div class="banner box">
            <strong>バナーサイズ：200px × 40px</strong>
            <figure style="margin-bottom:10px;">
                <img src="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/img/common/nikawa_banner_200x40.jpg">
            </figure>
            <strong>html埋め込み用コード</strong>
<pre><code>&lt;a href=&quot;https://just-toyama.visit-town.com/&quot; target=&quot;_blank&quot; title=&quot;いまからえらべるTRAVEL&quot;&gt;&lt;img src=&quot;https://just-toyama.visit-town.com/assets/img/common/nikawa_banner_200x40.jpg&quot; alt=&quot;いまからえらべるTRAVEL&quot; border=&quot;0&quot; width=&quot;200&quot; height=&quot;40&quot; /&gt;&lt;/a&gt;</code></pre>
        </div>

        <!-- <div class="banner box">
            <strong>バナーサイズ：125px × 125px</strong>
            <figure style="margin-bottom:10px;">
                <img src="/assets/img/common/nikawa_banner_125x125.jpg">
            </figure>
            <strong>html埋め込み用コード</strong>
<pre><code>&lt;a href=&quot;https://just-toyama.visit-town.com/&quot; target=&quot;_blank&quot; title=&quot;いまからえらべるTRAVEL&quot;&gt;&lt;img src=&quot;/assets/img/common/nikawa_banner_125x125.jpg&quot; alt=&quot;いまからえらべるTRAVEL&quot; border=&quot;0&quot; width=&quot;125&quot; height=&quot;125&quot; /&gt;&lt;/a&gt;</code></pre>
        </div> -->

        <div class="banner box">
            <strong>バナーサイズ：120px × 60px</strong>
            <figure style="margin-bottom:10px;">
                <img src="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/img/common/nikawa_banner_120x60.jpg">
            </figure>
            <strong>html埋め込み用コード</strong>
<pre><code>&lt;a href=&quot;https://just-toyama.visit-town.com/&quot; target=&quot;_blank&quot; title=&quot;いまからえらべるTRAVEL&quot;&gt;&lt;img src=&quot;https://just-toyama.visit-town.com/assets/img/common/nikawa_banner_120x60.jpg&quot; alt=&quot;いまからえらべるTRAVEL&quot; border=&quot;0&quot; width=&quot;120&quot; height=&quot;60&quot; /&gt;&lt;/a&gt;</code></pre>
        </div>

        <style media="screen">
            pre {
                overflow: auto;
                white-space: pre-wrap;
                word-wrap: break-word;
            }
        </style>
    </section>

</main>
<!-- END main -->
        </div>
    </div>
</div>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' banner='is-active' is_admin=$is_admin}
</div>

<!-- START global-footer -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/global_footer.tpl'}
<!-- END global-footer -->


<!-- WEB Fonts -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/webfont.tpl'}

<!-- Optional Stylesheets -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/stylesheet.tpl'}

<!-- Common Script -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/script.tpl'}

<!-- Google map javascript api v3 -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/google_script.tpl'}


<!-- Page Script -->

<script>

/***************************
datepicker
****************************/
$(function() {
    $('.js-datepicker').datepicker();
    $('.js-timepicker').timepicker({
        'timeFormat': 'H:i',
        'scrollDefault': 'now',
        'step': 15
    });
});

</script>

</body>
</html>