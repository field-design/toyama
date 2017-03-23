{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（ご予約内容確認）ページ
機能名：
　申込（ご予約内容確認）ページ
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

{if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step"><span>人数・オプション選択</span></li>
                <li class="step"><span>お客様情報入力</span></li>
                <li class="step current"><span>ご予約内容確認</span></li>
            </ul>
        </div>

        <h2><span>ご予約内容確認</span></h2>
        <section class="order-check cart">
            <h3 class="product-ttl">{$order_data.title}</h3>
            <table class="order-table">
                <thead>
                    <tr>
                        <th class="text-center">内訳</th>
                        <th class="text-center">単価</th>
                        <th class="text-center">数量</th>
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
                            <td class="text-center"><span class="amount">{$order_data.$volume|default:0|number_format}</span></td>
                            <td class="text-right"><span class="sum"></span>円</td>
                        </tr>
                        {/if}
                    {/section}
                </tbody>
                <tfoot>
                    <tr>
                      <th class="text-center" colspan="3">合計</th>
                      <th class="text-center"><span id="total"></span>円</th>
                    </tr>
                </tfoot>
            </table>
        </section>

        <section class="order-check input">
            <h3 class="product-ttl">お申込者様の情報</h3>
            <table class="order-table">
                <tbody>
                    <tr>
                        <th class="text-center">お名前</th>
                        <td class="text-left">{$order_data.nameSei} {$order_data.nameMei}</td>
                    </tr>
                    <tr>
                        <th class="text-center">フリガナ</th>
                        <td class="text-left">{$order_data.kanaSei} {$order_data.kanaMei}</td>
                    </tr>
                    <tr>
                        <th class="text-center">メールアドレス</th>
                        <td class="text-left">{$order_data.mail}</td>
                    </tr>
                    <tr>
                        <th class="text-center">ご住所</th>
                        <td class="text-left">
                            〒{$order_data.zipCode[0]}-{$order_data.zipCode[1]}<br />
                            {$order_data.pref} {$order_data.adress}
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">お電話番号</th>
                        <td class="text-left">{$order_data.tel_[0]}-{$order_data.tel_[1]}-{$order_data.tel_[2]}</td>
                    </tr>
                    <tr>
                        <th class="text-center">携帯電話番号</th>
                        <td class="text-left">{$order_data.mobile[0]}-{$order_data.mobile[1]}-{$order_data.mobile[2]}</td>
                    </tr>
                    <tr>
                        <th class="text-center">ご生年月日</th>
                        <td class="text-left">{$order_data.birthday[0]}年{$order_data.birthday[1]}月{$order_data.birthday[2]}日</td>
                    </tr>
                    <tr>
                        <th class="text-center">性別</th>
                        <td class="text-left">{$order_data.gender_text}</td>
                    </tr>
                    <tr>
                        <th class="text-center">ご職業</th>
                        <td class="text-left">{$order_data.job_text}</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section class="order-check payment">
            <h3 class="product-ttl">お支払方法</h3>
            <table class="order-table">
                <tbody>
                    <tr>
                        <th class="text-center">決済種別</th>
                        <td class="text-left">クレジットカード決済</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <div class="conditions">
            <h5>旅行条件書</h5>
            <ul>
                <li>お申込み前に必ず <a href="https://www.kanko-pro.co.jp/agreement/agreement23.php" target="_blank">旅行条件書</a> をお読みください。</li>
                <li>旅行条件書を保存するには（画面上部）ブラウザメニューの「ファイル」を選択、次に「名前をつけて保存」を選択します。</li>
                <li>保存する場所、ファイル名を指定し、ファイルの種類を「WEBページ、HTMLのみ」もしくは「テキストファイル」にして「保存」を選択します。</li>
            </ul>
        </div>

        <div class="mod_form_importance_btn row">
            <div class="check">
                <p>
	                <input type="checkbox" id="privacy" name="privacy" value="同意する">
	                <label class="privacy" for="privacy">旅行条件書を保存し旅行条件書の内容に同意する。</label>
	            </p>
            </div>
            <p class="note">※上部チェックボックスに同意いただいた方のみお申し込みが可能です。</p>
        </div>

        <div class="pagenation">
            <div class="back">
                <button type="button" onclick="javascript:location.href='{$smarty.const.URL_ROOT_PATH}order/input/'">戻る</button>
            </div>
            <div class="next">
                <button type="submit" id="submit">決済画面へ移動</button>
            </div>
        </div>
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