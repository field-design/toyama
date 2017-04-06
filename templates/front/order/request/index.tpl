{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　リクエスト完了ページ
機能名：
　リクエスト完了ページ
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

        <h2><span>リクエスト受付完了</span></h2>

        {if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

{if $err_flg == false}
        <section class="order-style order-complete">
            <h3 class="complete-ttl">リクエストを受け付けました。</h3>
            <p class="complete-desc">
                この度は、いますぐ選べるトラベルよりリクエスト頂きありがとうございます。<br />
                下記の内容にて、リクエストを承りました。<br />
                参加日より3日前までにお申し込みの場合24時間以内／参加日の前日・前々日にお申し込みの場合は3時間以内にご連絡いたします。（※上記時間内にご連絡がない場合は、お手数ですが各事業者の営業時間内にお電話でお問い合わせください。）
            </p>
        </section>

        <div class="order-check cart">
            <section class="order-style">
                <h3 class="order-ttl">リクエスト内容</h3>

                <table class="order-table">
                    <tbody>
                        <tr>
                            <th class="text-center">主催者</th>
                            <td class="text-left">{$settings_data.display_name}</td>
                        </tr>
                        <tr>
                            <th class="text-center">プラン名</th>
                            <td class="text-left">{$data.title}</td>
                        </tr>
                        <tr>
                            <th class="text-center">出発日</th>
                            <td class="text-left">{$data.oderDate_text}</td>
                        </tr>
                        <tr>
                            <th class="text-center">集合場所</th>
                            <td class="text-left">{$data.locationname}</td>
                        </tr>
                        <tr>
                            <th class="text-center">人数</th>
                            <td class="text-left">
                            <ul>
                                {assign var="sum" value=0}
                                {section name=i start=0 loop=5}
                                    {assign var='index' value=$smarty.section.i.index}
                                    {assign var='plan_title' value='plan_title'|cat:($index+1)}
                                    {assign var='plan_Fee' value='plan_Fee'|cat:($index+1)}
                                    {assign var='plan_Kind' value='plan_Kind'|cat:($index+1)}
                                    {assign var='volume' value='volume'|cat:($index+1)}
                                    {if $data.$plan_title != ''}
                                        <li>{$data.$plan_title}{if $data.$plan_Kind != ''}({$data.$plan_Kind}){/if} ：{$data.$volume|default:0|number_format}名</li>
                                        {assign var="sum" value=$sum + $data.$volume|default:0}
                                    {/if}
                                {/section}
                                <li>合計：{$sum|number_format}名</li>
                            </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center">ご旅行代金</th>
                            <td class="text-left">
                            <ul>
                                {assign var="sum" value=0}
                                {section name=i start=0 loop=5}
                                    {assign var='index' value=$smarty.section.i.index}
                                    {assign var='plan_title' value='plan_title'|cat:($index+1)}
                                    {assign var='plan_Fee' value='plan_Fee'|cat:($index+1)}
                                    {assign var='plan_Kind' value='plan_Kind'|cat:($index+1)}
                                    {assign var='volume' value='volume'|cat:($index+1)}
                                    {if $data.$plan_title != ''}
                                        <li>{$data.$plan_title}{if $data.$plan_Kind != ''}({$data.$plan_Kind}){/if}：{$data.$plan_Fee|default:0|number_format}円×{$data.$volume|default:0|number_format}名＝{($data.$plan_Fee|default:0 * $data.$volume|default:0)|number_format}円</li>
                                    {assign var="sum" value=$sum + ($data.$plan_Fee|default:0 * $data.$volume|default:0)}
                                {/if}
                                {/section}
                                <li>合計：{$sum|number_format}円</li>
                            </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>
        <section class="order-contact">
            <h3 class="contact-ttl">ご予約に関するお問い合わせ先</h3>
            <p>事業者情報（{$settings_data.display_name}・{$settings_data.tel_[0]}-{$settings_data.tel_[1]}-{$settings_data.tel_[2]}）</p>
            <ul class="contact-info">
              <li><span>事業者名</span>{$settings_data.display_name}</li>
              <li><span>電話</span>{$settings_data.tel_[0]}-{$settings_data.tel_[1]}-{$settings_data.tel_[2]}</li>
              <li><span>住所</span>〒{$settings_data.zipcode[0]}-{$settings_data.zipcode[1]}{$settings_data.pref}{$settings_data.address}</li>
              <li><span>メール</span>{$settings_data.email}</li>
            </ul>
        </section>
{/if}
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