<header class="global-header">
    <h1>{$h1_tag|default:''}</h1>
    <div class="logo">
        <a href="{$smarty.const.URL_ROOT_PATH}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/common/global_logo.svg" alt="{$smarty.const.SITE_TITLE_FRONT}"></a>
    </div>
    <!-- START global-nav -->
    <nav class="global-nav">
        <div class="draw_nav" role="banner">
            <button type="button" class="drawer-toggle drawer-hamburger">
                <span class="sr-only">toggle navigation</span>
                <span class="drawer-hamburger-icon"></span>
                <span class="menu_sign"></span>
            </button>
            <nav class="drawer-nav" role="navigation">
                <ul class="drawer-menu">
                    <!-- <li class="sns-btn">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    </li> -->
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}">トップページ</a></li>
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">ツアーを購入する</a></li>
                    <li class="inquiry"><a href="{$smarty.const.URL_ROOT_PATH}contact/"><i class="fa fa-envelope-o" aria-hidden="true"></i>お問い合わせ</a></li>
                    <li class="sub"><a href="{$smarty.const.URL_ROOT_PATH}guide/">サイトのご利用案内</a></li>
                    <li class="sub"><a href="https://www.kanko-pro.co.jp/privacy/" target="_blank">プライバシーポリシー</a></li>
                </ul>
            </nav>
        </div>
    </nav>
    <!-- END global-nav -->
    
</header>