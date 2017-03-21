{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　口座設定
機能名：
　口座設定
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>title</title>
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
              <li><span>口座設定</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' bank='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">口座設定</h2>

    <div class="control">
        <label class="label">銀行名</label>
        <p class="control">
            <input class="input is-danger is-outlined" type="text" placeholder="例：〇〇銀行">
        </p>
    </div>

    <div class="control">
        <label class="label">支店名</label>
        <p class="control">
            <input class="input is-danger is-outlined" type="text" placeholder="例：〇〇支店">
        </p>
    </div>

    <div class="control">
        <label class="label">口座の種類</label>
        <p class="control">
            <label class="radio">
                <input type="radio" name="account_type" value="savings" checked="checked"> 普通
            </label>
            <label class="radio">
                <input type="radio" name="account_type" value="current"> 当座
            </label>
        </p>
    </div>

    <div class="control">
        <label class="label">口座番号</label>
        <p class="control">
            <input class="input is-danger is-outlined" type="number" min="0" placeholder="例：1234567">
        </p>
    </div>

    <div class="control">
        <label class="label">口座名義</label>
        <p class="control">
            <input class="input is-danger is-outlined" type="text" placeholder="例：ヤマダ タロウ">
        </p>
    </div>

    <div class="control save-point">
        <p class="has-text-centered">
            <a class="button is-success">
                <span class="icon">
                    <i class="fa fa-save"></i>
                </span>
                <span>変更を保存</span>
            </a>
        </p>
    </div>
</main>
<!-- END main -->
        </div>
    </div>
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
<!-- Page Script -->
{literal}

{/literal}


</body>
</html>
