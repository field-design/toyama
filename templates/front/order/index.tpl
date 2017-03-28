{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（人数・オプション）ページ
機能名：
　申込（人数・オプション）ページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>お申し込み | {$smarty.const.SITE_TITLE_FRONT}</title>
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
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header.tpl'}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="/">トップページ</a></li>
            <li>お申し込み</li>
        </ul>
    </div>
</div>

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step current"><span>人数・オプション選択</span></li>
                <li class="step"><span>お客様情報入力</span></li>
                <li class="step"><span>ご予約内容確認</span></li>
            </ul>
        </div>

        <form method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">

            <h2><span>人数・オプション選択</span></h2>

            {if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

            <section class="order-style">
                <h3 class="order-ttl">お申し込みプラン</h3>

                <table class="order-table">
                    <tbody>
                        <tr>
                            <th class="text-center">主催者</th>
                            <td class="text-left">{$settings_data.display_name}</td>
                        </tr>
                        <tr>
                            <th class="text-center">プラン名</th>
                            <td class="text-left">{$product_data.title}</td>
                        </tr>
                        <tr>
                            <th class="text-center">出発日</th>
                            <td class="text-left">{$order_data.oderDate_text}</td>
                        </tr>
                        <tr>
                            <th class="text-center">集合場所</th>
                            <td class="text-left">{$product_data.locationname}</td>
                        </tr>
                    </tbody>
                </table>
                <ul class="notes-list">
                    <li>本プランは上記主催者との契約になります。</li>
                </ul>
            </section>
            <section class="order-cart">
                <h3 class="product-ttl">人数選択</h3>
                <p class="order-desc">お申し込みされる人数を入力してください。</p>
                <table class="order-table">
                    <thead>
                        <tr>
                            <th class="text-center">内訳</th>
                            <th class="text-center">単価</th>
                            <th class="text-center">人数</th>
                            <th class="text-center">小計</th>
                        </tr>
                    </thead>
                    <tbody>
                        {section name=i start=0 loop=count($product_data.plan_title)}
                        {assign var='index' value=$smarty.section.i.index}
                        {assign var='volume' value='volume'|cat:($index + 1)}
                        {if $product_data.plan_title[$index] != '' || $product_data.plan_Fee[$index] != '' || $product_data.plan_Kind[$index] != ''}
                        <tr>
                            <td class="text-left">{$product_data.plan_title_text[$index]}{if $product_data.plan_Kind_text[$index] != ''}({$product_data.plan_Kind_text[$index]}){/if}</td>
                            <td class="text-right"><span>{$product_data.plan_Fee[$index]|default:0|number_format}</span>円</td>
                            <td class="text-center">
                                <div class="input-field">
                                    <span class="select">
                                        <select class="amount" name="amount[]">
                                            {section name=j start=0 loop=11}
                                            {assign var='index_j' value=$smarty.section.j.index}
                                            <option value="{$index_j}" {if ($order_data.$volume|default:0) == $index_j}selected{/if}>{$index_j}</option>
                                            {/section}
                                        </select>
                                    </span>
                                </div>
                                {if isset($err_msg.$volume) && $err_msg.$volume != ''}
                                <br /><span class="error has-icon">{$err_msg.$volume}</span>
                                {/if}
                            </td>
                            <td class="text-right"><span class="sum">{$product_data.plan_Fee[$index]|default:0 * $order_data.$volume|default:0}</span>円</td>
                        </tr>
                        {/if}
                        {/section}
                    </tbody>
                    <tfoot>
                        <tr>
                        <th class="text-center" colspan="3">合計</th>
                        <th class="text-center"><span id="total">0</span>円</th>
                        </tr>
                    </tfoot>
                </table>
            </section>

            <div class="pagenation">
                <div class="back">
                    <button type="button" onclick="javascript:location.href='{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$product_data.ProductID}'">戻る</button>
                </div>
                <div class="next">
                    <button name="next" type="submit" id="submit">次へ</button>
                </div>
            </div>
            <input name="plan" type="hidden" value="{$order_data.ProductID}" />
            <input name="ymd" type="hidden" value="{$order_data.oderDate}" />
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