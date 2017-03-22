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

{if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step current"><span>人数・オプション選択</span></li>
                <li class="step"><span>お客様情報入力</span></li>
                <li class="step"><span>ご予約内容確認</span></li>
            </ul>
        </div>

        <h2><span>人数・オプション選択</span></h2>
        <section class="order-cart">
            <h3 class="product-ttl">富山入善 ます寿し手作り体験</h3>
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
                    <tr>
                        <td class="text-left">おとな</td>
                        <td class="text-right">1,800円</td>
                        <td class="text-center"><input class="input" type="number" min="0" value="1"></td>
                        <td class="text-right">3,600円</td>
                    </tr>
                    <tr>
                        <td class="text-left">こども(幼児) </td>
                        <td class="text-right">1,800円</td>
                        <td class="text-center"><input class="input" type="number" min="0"></td>
                        <td class="text-right">1,800円</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                      <th class="text-center" colspan="3">合計</th>
                      <th class="text-center">5,400円</th>
                    </tr>
                </tfoot>
            </table>
        </section>

        <div class="pagenation">
            <div class="back">
                <button onclick="history.back()">戻る</button>
            </div>
            <div class="next">
                <button type="submit" id="submit">次へ</button>
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


{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>