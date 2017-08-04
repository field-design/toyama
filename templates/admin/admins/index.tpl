{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　事業者一覧
機能名：
　事業者一覧
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>事業者一覧</title>
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
              <li><span>事業者一覧</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
          {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' users='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">事業者一覧</h2>

    <div class="actions columns">
        <div class="column is-4">
            <a class="button is-info is-outlined is-fullwidth" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit">
                <span class="icon">
                    <i class="fa fa-plus-circle"></i>
                </span>
                <span>新規追加</span>
            </a>
        </div>
    </div>

    <table class="admin-list table">
      <thead>
        <tr>
          <th class="admin-image"></th>
          <th class="admin-number">事業者名</th>
          <th class="admin-date">事業者ID</th>
          <th class="admin-status">権限</th>
          <th class="admin-status">言語</th>
          <th class="admin-edit">詳細</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$settingslist item=settings}
        <tr>
          <td class="admin-image">
              <p class="image is-64x64">
                <img src="{$settings.logomark}">
              </p>
          </td>
          <td class="admin-name">
              {$settings.display_name}<br />
              <small>{$settings.company_name}</small>
          </td>
          <td class="admin-number">{$settings.PersonID}</td>
          <td class="admin-status">{$settings.authority}</td>
          <td class="admin-status">{Constant::$aryLang[$settings.language]|default:''}</td>
          <td class="admin-edit"><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit?PersonID={$settings.PersonID}">詳細</a></td>
        </tr>
        {/foreach}
      </tbody>
    </table>

</main>
<!-- END main -->
        </div>
    </div>
</div>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' users='is-active' is_admin=$is_admin}
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


</body>
</html>
