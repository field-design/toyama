{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（人数・オプション）ページ
機能名：
　申込（人数・オプション）ページ
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

        <div class="steps">
            <ul>
                <li class="step current"><span>Select Number of People/Options</span></li>
                <li class="step"><span>Enter Customer Information</span></li>
                <li class="step"><span>Confirm Application Content</span></li>
            </ul>
        </div>

        <form method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">

            <h2><span>Select Number of People/Options</span></h2>

            {if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

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
                            <td class="text-left">{$order_data.oderDate_text}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Meeting Place</th>
                            <td class="text-left">
                                {foreach from=$product_data.meeting_place item=value}
                                {$value}<br>
                                {/foreach}
                            </td>
                        </tr>
                    </tbody>
                </table>
                <ul class="notes-list">
                    <li>This plan is through a contract made with the above organizer.</li>
                </ul>
            </section>
            <section class="order-cart">
                <h3 class="product-ttl">Select Number of People</h3>
                <p class="order-desc">Input the number of people.</p>
                <table class="order-table">
                    <thead>
                        <tr>
                            <th class="text-center">Content</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Number of People</th>
                            <th class="text-center">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        {section name=i start=0 loop=count($price_data.price_type)}
                        {assign var='index' value=$smarty.section.i.index}
                        <tr>
                            <td class="text-left">{$price_data.price_type_text[$index]}</td>
                            <td class="text-right"><span>{$price_data.price_value[$index]|default:0|number_format}</span>Yen</td>
                            <td class="text-center">
                                <div class="input-field">
                                    <span class="select">
                                        <select class="amount" name="amount[]">
                                            <option value="0" {if ($order_data.amount[$index]|default:0) == 0}selected{/if}>0</option>
                                            {section name=j start=$product_data.min_member loop=$product_data.max_order + 1}
                                            {assign var='index_j' value=$smarty.section.j.index}
                                            <option value="{$index_j}" {if ($order_data.amount[$index]|default:0) == $index_j}selected{/if}>{$index_j}</option>
                                            {/section}
                                        </select>
                                    </span>
                                </div>
                            </td>
                            <td class="text-right"><span class="sum">{$price_data.price_value[$index]|default:0 * $order_data.amount[$index]|default:0}</span>Yen</td>
                        </tr>
                        {/section}
                    </tbody>
                    <tfoot>
                        <tr>
                        <th class="text-center" colspan="3">Total</th>
                        <th class="text-center"><span id="total">0</span>Yen</th>
                        </tr>
                    </tfoot>
                </table>
            </section>

            {if isset($product_data.question)}
            <section class="order-input">
                <h3 class="product-ttl">Questions</h3>
                <div class="input-wrap">
                    {section name=i start=0 loop=count($product_data.question)}
                    {assign var='index' value=$smarty.section.i.index}
                    <div class="input-area">
                        <label for="">{$product_data.question[$index]}</label>
                        <div class="input-field">
                            <textarea class="full" name="question[]" placeholder="Please write your answer here.">{$order_data.question[$index]|default:''}</textarea>
                        </div>
                    </div>
                    {/section}
                </div>
            </section>
            {/if}

            <div class="pagenation">
                <div class="back">
                    <button type="button" onclick="javascript:location.href='{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$product_data.product_id}'">Previous</button>
                </div>
                <div class="next">
                    <button name="next" type="submit" id="submit">Next</button>
                </div>
            </div>
            <input name="plan" type="hidden" value="{$order_data.ProductID}" />
            <input name="course" type="hidden" value="{$order_data.course_id}" />
            <input name="ymd" type="hidden" value="{$order_data.oderDate}" />
        </form>
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
        var fee = parseInt($(obj).parents('td').prev().find('span').html().replace(',', ''));
        var volume = parseInt($(obj).val());
        if(!fee) {
            fee = 0;
        }
        if(!volume) {
            volume = 0;
        }
        var sum = fee * volume;
        $(obj).parents('td').next().find('span').html(String(sum).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));

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
    $(function(){
        $('select.amount').change(function(){
            calc(this);
        });
    });
    $('select.amount').each(function() {
        calc(this);
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>