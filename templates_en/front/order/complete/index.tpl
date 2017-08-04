{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申し込み完了ページ
機能名：
　申し込み完了ページ
******************************************************}
<!DOCTYPE html>
<html lang="en">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>Application | {Constant::$siteNameNiikawa}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/order.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- Twitter Card -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/twitter_card.tpl'}
</head>

<body class="drawer drawer--right" id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


{include file=$smarty.const.FRONT_DIR|cat:'includes/head/loading.tpl'}


<!-- START global-header -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header_niikawa.tpl' h1_tag=$page_data.h1_tag}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="/">Home</a></li>
            <li>Application</li>
        </ul>
    </div>
</div>

<article>
    <div data-lg>

        <h2><span>Application completed</span></h2>

        {if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

{if $err_flg == false}
        <section class="order-style order-complete">
            <h3 class="complete-ttl">Your application is accepted.</h3>
            <p class="complete-desc">
              Thank you for your applying through Imasugu Eraberu Travel.<br />
              Your application is confirmed as follows.
            </p>
        </section>

        <div class="order-check cart">
            <section class="order-style">
                <h3 class="order-ttl">Application details</h3>
                <table class="order-table">
                    <tbody>
                        <tr>
                            <th class="text-center">Application Date</th>
                            <td class="text-left">{$data.registDate_text}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Application Number</th>
                            <td class="text-left">{$data.OderID}</td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <section class="order-style">
                <h3 class="order-ttl">Application Plan</h3>

                <table class="order-table">
                    <tbody>
                        <tr>
                            <th class="text-center">Organizer</th>
                            <td class="text-left">{$settings_data.display_name}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Name of Plan</th>
                            <td class="text-left">{$product_data.course_name[0]}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Departure Date</th>
                            <td class="text-left">{$data.oderDate_text}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Meeting Place</th>
                            <td class="text-left">
                                {foreach from=$product_data.meeting_place item=value}
                                {$value}<br>
                                {/foreach}
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center">Number of People</th>
                            <td class="text-left">
                            <ul>
                                {assign var="sum" value=0}
                                {section name=i start=0 loop=count($price_data.price_type)}
                                    {assign var='index' value=$smarty.section.i.index}
                                    <li>{$price_data.price_type_text[$index]}：{$data.amount[$index]|default:0|number_format}</li>
                                    {assign var="sum" value=$sum + $data.amount[$index]|default:0}
                                {/section}
                                <li>Total：{$sum|number_format}</li>
                            </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center">Price</th>
                            <td class="text-left">
                            <ul>
                                {assign var="sum" value=0}
                                {section name=i start=0 loop=count($price_data.price_type)}
                                    {assign var='index' value=$smarty.section.i.index}
                                    <li>{$price_data.price_type_text[$index]}：{$price_data.price_value[$index]|default:0|number_format}Yen×{$data.amount[$index]|default:0|number_format}＝{($price_data.price_value[$index]|default:0 * $data.amount[$index]|default:0)|number_format}Yen</li>
                                    {assign var="sum" value=$sum + ($price_data.price_value[$index]|default:0 * $data.amount[$index]|default:0)}
                                {/section}
                                <li>Total：{$sum|number_format}Yen</li>
                            </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <ul class="notes-list">
                    <li>This plan is through a contract made with the above organizer.</li>
                </ul>
            </section>
        </div>
        <section class="order-style order-contact">
            <h3 class="contact-ttl">Reservation Inquiries Contact</h3>
            <ul class="contact-info">
              <li><span>Organizer</span>{$settings_data.display_name}</li>
              <li><span>Phone Number</span>{$settings_data.tel_[0]}-{$settings_data.tel_[1]}-{$settings_data.tel_[2]}</li>
              <li><span>Street Address</span>〒{$settings_data.zipcode[0]}-{$settings_data.zipcode[1]} {Constant::$aryPref[$settings_data.pref]} {$settings_data.address}</li>
              <li><span>Email Address</span>{$settings_data.email}</li>
            </ul>
        </section>
{/if}
    </div>
</article>

</main>
<!-- END main -->


<!-- START global-footer -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer_niikawa.tpl'}
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
{literal}
<script>
    function calc(obj) {
        var fee = parseInt($(obj).parent().prev().find('span').html().replace(',', ''));
        var volume = parseInt($(obj).html().replace(',', ''));
        if(!fee) {
            fee = 0;
        }
        if(!volume) {
            volume = 0;
        }
        var sum = fee * volume;
        $(obj).parent().next().find('span').html(String(sum).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));

        var total = 0;
        $('span.sum').each(function(){
            var sum = parseInt($(this).html().replace(',', ''));
            if(!sum) {
                sum = 0;
            }
            total += sum;
        });
        $('#total').html(String(total).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'))
    }
    $('.amount').each(function() {
        calc(this);
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>