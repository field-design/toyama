{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　contactページ
機能名：
　contactページ
******************************************************}
<!DOCTYPE html>
<html lang="en">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>Inquiries | {Constant::$siteName}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="/assets/css/contact.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="{Constant::$siteName}">
<meta property="og:type" content="website">
<meta property="og:title" content="Inquiries">
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
            <li><a href="/">Home</a></li>
            <li>Inquiries</li>
        </ul>
    </div>
</div>

{if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

<article>
    <div data-lg>
        <h2><span>Inquiries</span></h2>
        <form method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">
            <dl>
                <dt>Name</dt>
                <dd>
                    <input type="text" name="simei" value="{$smarty.post.simei|default:''}">
                    {if isset($err_msg.simei) && $err_msg.simei != ''}
                    <span class="error has-icon">{$err_msg.simei}</span>
                    {/if}
                </dd>
            </dl>
            <dl>
                <dt>Email Address</dt>
                <dd>
                    <input type="email" data-type="email" name="email" value="{$smarty.post.email|default:''}">
                    {if isset($err_msg.email) && $err_msg.email != ''}
                    <span class="error has-icon">{$err_msg.email}</span>
                    {/if}
                </dd>
            </dl>
            <dl>
                <dt>For confirming Email Address</dt>
                <dd>
                    <input type="email" data-type="email" name="email_confirm" value="{$smarty.post.email_confirm|default:''}">
                    {if isset($err_msg.email_confirm) && $err_msg.email_confirm != ''}
                    <span class="error has-icon">{$err_msg.email_confirm}</span>
                    {/if}
                </dd>
            </dl>
            <dl>
                <dt>Phone Number</dt>
                <dd>
                    <input type="tel" data-type="tel" name="tel" value="{$smarty.post.tel|default:''}">
                    {if isset($err_msg.tel) && $err_msg.tel != ''}
                    <span class="error has-icon">{$err_msg.tel}</span>
                    {/if}
                </dd>
            </dl>
            <dl>
                <dt>Your Message</dt>
                <dd>
                    <textarea name="naiyo" rows="5">{$smarty.post.naiyo|default:''}</textarea>
                    {if isset($err_msg.naiyo) && $err_msg.naiyo != ''}
                    <span class="error has-icon">{$err_msg.naiyo}</span>
                    {/if}
                </dd>
            </dl>
            <div class="send"><button name="send" type="submit">SEND</button></div>
        </form>
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