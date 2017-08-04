{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　予約カレンダー・商品一覧
機能名：
　予約カレンダー・商品一覧
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>予約カレンダー</title>
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
              <li><a href="/"><span class="icon is-small"><i class="fa fa-home" aria-hidden="true"></i></span></a></li>
              <li><span>予約カレンダー</span></li>
            </ul>
        </div>
    </div>


    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' calendar='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">予約カレンダー</h2>
    <p>予約設定を行う商品を選択してください。</p>

    <table class="product-list table">
          <thead>
            <tr>
              <th class="product-image"></th>
              <th class="product-name">商品名</th>
              <th class="product-date">登録日</th>
              <th class="product-edit"></th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$data_list item=data}
            {if $data.lang == 1 || $data.lang == ''}
            <tr>
              <td class="product-image">
                  <p class="image is-64x64">
                    <img src="{$data.main_photo1}">
                  </p>
              </td>
              <td class="product-name">{$data.title}</td>
              <td class="product-date">{$data.regist_date|replace:' ':'<br />'}</td>
              <td class="product-edit"><a class="button is-primary is-outlined" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/calendar/setting/?ProductID={$data.product_id}">予約設定</a></td>
            </tr>
            {/if}
            {/foreach}
          </tbody>
        </table>

</main>
<!-- END main -->
        </div>
    </div>
</div>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' calendar='is-active' is_admin=$is_admin}
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