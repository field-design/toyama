<header class="global-header">
    <h1>{$h1_tag|default:''}</h1>
    <div class="logo">
        <a href="{$smarty.const.URL_ROOT_PATH}"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/common/{$logo_pref|default:''}logo.svg" alt="{$smarty.const.SITE_TITLE_FRONT}"></a>
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
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/">越中にいかわ観光圏</a></li>
                    <li class="nav-dropdown">
                        <a href="{$smarty.const.URL_ROOT_PATH}niikawa/about/">越中にいかわ観光圏とは</a>
                    </li>
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">ツアーを購入する</a></li>
                    <li class="nav-dropdown">
                        <a href="#" data-toggle="dropdown">地域でえらぶ</a>
                        <ul class="drawer-dropdown-menu">
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=area1_1">魚津市</a></li>
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=area1_2">黒部市</a></li>
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=area1_3">入善町</a></li>
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area=area1_4">朝日町</a></li>
                        </ul>
                    </li>
                    <li class="nav-dropdown ddm-last">
                        <a href="#" data-toggle="dropdown">ジャンルでえらぶ</a>
                        <ul class="drawer-dropdown-menu">
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=cat1">体験する</a></li>
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=cat2">見る</a></li>
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=cat3">食べる</a></li>
                            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category=cat4">買う</a></li>
                        </ul>
                    </li>
                    <li class="inquiry"><a href="{$smarty.const.URL_ROOT_PATH}contact/"><i class="fa fa-envelope-o" aria-hidden="true"></i>お問い合わせ</a></li>
                    <li class="sub"><a href="{$smarty.const.URL_ROOT_PATH}guide/">サイトのご利用案内</a></li>
                    <li class="sub"><a href="https://www.kanko-pro.co.jp/privacy/" target="_blank">プライバシーポリシー</a></li>
                </ul>
            </nav>
        </div>
    </nav>
    <!-- END global-nav -->
    
</header>