{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　ログイン画面
機能名：
　ログイン画面
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>ログイン</title>
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

<body id="top" class="login">
<!-- Google Tag Manager -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->



<section class="hero is-fullheight is-dark is-bold">

    <!-- START global-header -->
    <header class="global-header">
        <nav class="nav has-shadow" id="top">
          <div class="container">
            <div class="nav-left">
              <a class="nav-item" href="{$smarty.const.URL_ROOT_PATH_ADMIN}">
                <h1 class="title is-5">いまからえらべるTRAVEL</h1>
              </a>
            </div>
          </div>
        </nav>
    </header>
    <!-- END global-header -->

    <div class="hero-body">
        <div class="container">
            <div class="columns is-vcentered">
                <div class="column is-4 is-offset-4">
                    <h2 class="title is-4">ログイン</h2>
                    <form class="box" method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">
                        <label class="label">メールアドレス</label>
                        <p class="control">
                            <input name ="mail" class="input" type="text" placeholder="user@example.org" value="{$mail|default:''}">
                            {if $err_msg_mail != ''}
                                <span class="error has-icon" style="text-align: center;">{$err_msg_mail}</span>
                            {/if}
                        </p>
                        <label class="label">パスワード</label>
                        <p class="control">
                            <input name="passwd" class="input" type="password" placeholder="●●●●●●●">
                            {if $err_msg_passwd != ''}
                                <span class="error has-icon" style="text-align: center;">{$err_msg_passwd}</span>
                            {/if}
                        </p>
                        {if $err_msg != ''}
                            <p class="control">
                                <span class="error has-icon" style="text-align: center;">{$err_msg}</span>
                            </p>
                        {/if}
                        <hr>
                        <p class="control">
                            <button class="button is-primary" oncluck="submit();">ログイン</button>
                            <button class="button is-default">キャンセル</button>
                        </p>
                    </form>
                    <!-- <p class="has-text-centered">
                        <a href="#">パスワードを忘れたら</a>
                        |
                        <a href="#">登録希望の方はこちら</a>
                    </p> -->
                </div>
            </div>
        </div>
    </div>

<!-- START global-footer -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/global_footer.tpl'}
<!-- END global-footer -->


</section>

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

</script>




</body>
</html>
