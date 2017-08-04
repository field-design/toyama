<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>特定商取引法に基づく表記 | {Constant::$siteName}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/law.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="{Constant::$siteName}">
<meta property="og:type" content="website">
<meta property="og:title" content="特定商取引法に基づく表記">
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
            <li><a href="/">トップページ</a></li>
            <li>特定商取引法に基づく表記</li>
        </ul>
    </div>
</div>

<article>
    <h2><span>特定商取引法に基づく表記</span></h2>
    <div data-lg>
        <div class="law-table">
            <table>
                <tbody>
                    <tr>
                        <th>販売事業者</th>
                        <td>各販売事業者のページをご確認ください。</td>
                    </tr>
                    <tr>
                        <th>販売責任者</th>
                        <td>各販売事業者のページをご確認ください。</td>
                    </tr>
                    <tr>
                        <th>所在地</th>
                        <td>各販売事業者のページをご確認ください。</td>
                    </tr>
                    <tr>
                        <th>お問い合わせ連絡先</th>
                        <td>各販売事業者のページをご確認ください。</td>
                    </tr>
                    <tr>
                        <th>販売価格</th>
                        <td>各商品毎に掲載しております。</td>
                    </tr>
                    <tr>
                        <th>商品代金以外の必要料金</th>
                        <td>商品代金以外の必要料金	消費税、利用税等が必要な場合は、詳細は別途記載または事前にご連絡致します。</td>
                    </tr>
                    <tr>
                        <th>申込みの有効期限</th>
                        <td>旅行業約款に記載の条項に準じます。</td>
                    </tr>
                    <tr>
                        <th>申込みの方法</th>
                        <td>お電話、ＦＡＸ、メール、お申込みフォームよりお申込みください。</td>
                    </tr>
                    <tr>
                        <th>契約成立時期</th>
                        <td>当社からの申込みの承諾とお客様からの申込金のご入金・申込書の提出をもって、契約の成立となります。</td>
                    </tr>
                    <tr>
                        <th>決済方法について</th>
                        <td>
                            銀行振込、クレジットカード、コンビニ支払い<br />
                            ※銀行振込の場合は、お振込手数料はお客様負担となります。
                        </td>
                    </tr>
                    <tr>
                        <th>お支払い期限</th>
                        <td>
                            旅行業約款に記載の条項に準じます。<br />
                            取消料・期限について 旅行業約款に記載の条項に準じます。<br />
                            既に、チケット等をお受取後の場合は、速やかに弊社宛にチケットのご返却をお願いいたします。（送料はお客様負担）<br />
                            代金の払戻しがある場合は、お客様の銀行口座へお振り込みによりご返金いたします。 （振込手数料はお客様負担）
                        </td>
                    </tr>
                    <tr>
                        <th>プライバシーポリシー</th>
                        <td>各販売事業者のページをご確認ください。</td>
                    </tr>
                </tbody>
            </table>
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
<script>
$(function(){
    $('.flow-4 .wrap').matchHeight();
    $('.flow-5 .wrap').matchHeight();
    $('.flow-6 .irregular-wrap').matchHeight();
    $('.flow .frame').matchHeight();
});
</script>

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>
