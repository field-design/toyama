<header class="global-header">
    <h1>{$h1_tag|default:''}</h1>
    <div class="logo">
        <a href="{$smarty.const.URL_ROOT_PATH}niikawa/"><img src="{$smarty.const.URL_ROOT_PATH}assets/img/common/{$logo_pref|default:''}logo.svg" alt="{$smarty.const.SITE_TITLE_FRONT}"></a>
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
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}">Home</a></li>
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/">Ettyu Niikawa Kankouken</a></li>
                    <li class="nav-dropdown">
                        <a href="{$smarty.const.URL_ROOT_PATH}niikawa/about/">About Ettyu Niikawa Kankouken</a>
                    </li>
                    <li class="nav-main"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">Buy a tour</a></li>
                    <li class="nav-dropdown">
                        <a href="#" data-toggle="dropdown">Choose by region</a>
                        <ul class="drawer-dropdown-menu">
                            {section name=i start=0 loop=count(Constant::$aryAreaDetail['area1'])}
                                {assign var='index' value=$smarty.section.i.index}
                                {if $index < 4}
                                <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], $index, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], $index, 1, true))}</a></li>
                                {/if}
                            {/section}
                        </ul>
                    </li>
                    <li class="nav-dropdown ddm-last">
                        <a href="#" data-toggle="dropdown">Choose by genre</a>
                        <ul class="drawer-dropdown-menu">
                            {section name=i start=0 loop=count(Constant::$aryCategory)}
                                {assign var='index' value=$smarty.section.i.index}
                                <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, $index, 1, true))}">{current(array_slice(Constant::$aryCategory, $index, 1, true))}</a></li>
                            {/section}
                        </ul>
                    </li>
                    <li class="inquiry"><a href="{$smarty.const.URL_ROOT_PATH}contact/"><i class="fa fa-envelope-o" aria-hidden="true"></i>Inquiries</a></li>
                    <li class="sub"><a href="{$smarty.const.URL_ROOT_PATH}guide/">Site Guide</a></li>
                    <li class="sub"><a href="https://www.kanko-pro.co.jp/privacy/" target="_blank">Privacy Policy</a></li>
                    <li class="sub"><a href="{$smarty.const.URL_ROOT_PATH}law/">Notation based on the Specified Commercial Transaction Act</a></li>
                    <li class="translate">
                        {if strpos($smarty.const.URL_ROOT_PATH_FULL, 'lang=') !== false}
                            {assign var='url' value=$smarty.const.URL_ROOT_PATH_FULL|regex_replace:'/lang\=\d/':''}
                        {elseif strpos($smarty.const.URL_ROOT_PATH_FULL, '?') !== false}
                            {assign var='url' value=$smarty.const.URL_ROOT_PATH_FULL|cat:'&'}
                        {else}
                            {assign var='url' value=$smarty.const.URL_ROOT_PATH_FULL|cat:'?'}
                        {/if}
                        <div><a href="{$url}lang=1">JP(日本語)</a></div>
                        <div><a href="{$url}lang=2">EN(English)</a></div>
                    </li>
                </ul>
            </nav>
        </div>
    </nav>
    <!-- END global-nav -->
    
</header>