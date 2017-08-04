{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　guideページ
機能名：
  guideページ
******************************************************}
<!DOCTYPE html>
<html lang="en">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>Site Guide | {Constant::$siteName}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/guide.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="{Constant::$siteName}">
<meta property="og:type" content="website">
<meta property="og:title" content="Site Guide">
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
            <li><a href="{$smarty.const.URL_ROOT_PATH}">Home</a></li>
            <li>Site Guide</li>
        </ul>
    </div>
</div>

<article>
    <h2><span>Site Guide</span></h2>
    <h3>The process from searching for a product through to departure</h3>
    <div class="flow" data-lg>
        <div class="flow-inner cf">
            <div class="flow-1">
                <div class="wrap">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img10.png" alt="Search for a plan">
                        <h4>Search for a plan</h4>
                        <p>You can search for a plan by genre or area.</p>
                    </div>
                </div>
            </div>
            <div class="flow-2">
                <div class="wrap">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img11.png" alt="Plan page">
                        <h4>Plan page</h4>
                        <p>Check the details of the plan and participation conditions.</p>
                    </div>
                </div>
            </div>
            <div class="flow-3 cf">
                <div class="wrap left blue">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img12.png" alt="Plans available for immediate reservation">
                        <h4>Plans available for immediate reservation</h4>
                    </div>
                </div>
                <div class="wrap right green">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img13.png" alt="Request-based reservation plans">
                        <h4>Request-based reservation plans</h4>
                    </div>
                </div>
            </div>
            <div class="flow-4 cf">
                <div class="wrap left"></div>
                <div class="wrap right green">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img14.png" alt="Send a request">
                        <h4>Send a request</h4>
                    </div>
                </div>
            </div>
            <div class="flow-5 cf">
                <div class="wrap left"></div>
                <div class="wrap right green">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img15.png" alt="Response to your request">
                        <h4>Response to your request</h4>
                        <p>An operator will contact you on the result of your request.</p>
                    </div>
                </div>
            </div>
            <div class="flow-6 cf">
                <div class="wrap irregular-wrap left"></div>
                <div class="irregular irregular-wrap cf">
                    <div class="wrap center green">
                        <div class="frame">
                            <img src="//cdn.visit-town.com/common/img/guide/flow_img12.png" alt="Reservation approved">
                            <h4>Reservation approved</h4>
                            <p>We will send you an email to confirm payment.</p>
                        </div>
                    </div>
                    <div class="wrap right green">
                        <div class="frame">
                            <img src="//cdn.visit-town.com/common/img/guide/flow_img16.png" alt="Reservation not approved">
                            <h4>Reservation not approved</h4>
                            <p>Your reservation will not be approved if the conditions of conduct are not met.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="flow-7">
            <div class="wrap">
                <div class="frame">
                    <img src="//cdn.visit-town.com/common/img/guide/flow_img17.png" alt="Payment">
                    <h4>Payment</h4>
                    <p>Either credit card or convenient store payment can be selected.</p>
                </div>
            </div>
        </div>
        <div class="flow-8">
            <div class="wrap">
                <div class="frame">
                    <img src="//cdn.visit-town.com/common/img/guide/flow_img18.png" alt="Contract confirmed">
                    <h4>Contract confirmed</h4>
                    <p>Contract will be confirmed upon payment.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="cancel" data-lg>
        <p class="ttl">Refund After Cancellation/Change of Reservation</p>
        <p>Refund (bank transfer) will be made to the customer's designated bank account.<br>For customers who chose to pay by credit card, we can cancel your payment only when it is possible according to the regulations of each credit card company.<br>If a refund (bank transfer) is made due to the customer's personal circumstances, we will return a sum with the bank transfer processing fee subtracted from the travel price.<br>(* Bank transfer processing fee will be at the customer's expense. Thank you for your understanding.)<br>Postage costs for the return or the exchange of coupons or tickets will be at the customer's expense when the change or cancellation of the reservation is made due to the customer's personal circumstances.</p>
    </div>
    <div class="contract">
        <h4><span>Usage Policy</span></h4>
        <p data-lg><span>“Imakara Eraberu TRAVEL in Toyama” website (referred to from hereon as “this website”) is a search engine and reservation website operated by Tourism Sales Systems Co., Ltd. (referred to from hereon as “we”) for sightseeing optional tours and experience programs in Japan. It can be used free of charge to search for sightseeing programs, make an inquiry with the organizer or make/change/cancel a reservation. Users of this website must agree with the content of the user policy.</span></p>
    </div>
    <div class="disclaimer">
        <h5>Exception Clause</h5>
        <p>　Customers are responsible for their use and viewing of this website and we do not guarantee the accuracy, recentness or the protection of the rights of third parties regarding the content of product information or other related information. Information regarding tourism products on this website are published as provided by the organizing companies. We do not guarantee the accuracy or recentness of the contents of tourism product information, as it is the responsibility of each organizing company. We will also not be held liable for any damage caused due to the use of information retrieved from this website.</p>
        <p>The information on this website may be subject to change without notice.<br>Operation of a whole or part of this website may also be subject to suspension or cancellation. Thank you for your understanding. Regardless of the reason, we will not be held liable for any damage caused to the user due to changes in information, or suspension or cancellation of website operation.</p>
        <h5>About External Links</h5>
        <p>　We do not manage or supervise the contents of other external websites linked from this website. We will not be held liable for any damage or disadvantage caused to the user due to the content of external websites.</p>
        <h5>Regarding Copyright</h5>
        <p>　Tourism Sales Systems Co., Ltd. and our partners who provide this content own the copyright for the content of this website, including articles, photographs, each piece of information and groups of information. It is forbidden to partially or wholly copy, publish, send, distribute, transfer, lend, translate, adapt, license, reprint or reuse content from this website without the written approval of Tourism Sales Systems Co., Ltd., listing companies or advertisers etc. unless it is for private use.</p>
        <h5>System Requirements</h5>
        <p>We recommend the specifications below for smooth viewing of this website.<br>Information on this website may still be accessible but certain functions may be limited if these specifications are not met. Thank you for your understanding.<br><When Accessing From PC><br>• Windows: Internet Explorer 11 or later, Latest version of Edge, Google Chrome, Firefox<br>• Mac: Latest version of Safari<br>* Web browsers not stated above (Opera etc.) may not function normally for some services.</p>
        <p><When Accessing From Smartphone/Tablet (Android/iOS)><br>• Android: Android 4.0 or later<br>• iPhone/iPad: iOS8 or later</p>
        <h5>Applicable Laws</h5>
        <p>This website is managed by Tourism Sales Systems Co., Ltd.<br>Although users can access this website from all over the world where different laws apply, it is assumed that the users of this website as well as Tourism Sales Systems Co., Ltd. have both agreed to be bound by the laws of Japan in regard to the use of this website, regardless of any differences in legal principles.<br>Furthermore, Tourism Sales Systems Co., Ltd. will not state or display on this website whether the content of this site is appropriate for the customer's environment.</p>
        <h5>About the Use of Cookies</h5>
        <p>Cookies function to store data, such as visits to websites, onto the user's computer.<br>To provide our service, we may use cookies (which includes similar technologies).<br>Data collected from cookies do not contain “personal identification information” such as email addresses and names.<br>Most website browsers are setup to accept cookies.<br>Users can change the settings of their web browser to not accept cookies, however in this case some functions on this website will not work properly.<br>For inquiries regarding web browser settings, please contact the corresponding software manufacturer.</p>
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