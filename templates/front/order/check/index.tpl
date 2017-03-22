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
                        <td class="text-center">2</td>
                        <td class="text-right">3,600円</td>
                    </tr>
                    <tr>
                        <td class="text-left">こども(幼児) </td>
                        <td class="text-right">1,800円</td>
                        <td class="text-center">1</td>
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

        <section class="order-check input">
            <h3 class="product-ttl">お申込者様の情報</h3>
            <table class="order-table">
                <tbody>
                    <tr>
                        <th class="text-center">お名前</th>
                        <td class="text-left">山田 太郎</td>
                    </tr>
                    <tr>
                        <th class="text-center">フリガナ</th>
                        <td class="text-left">ヤマダ タロウ</td>
                    </tr>
                    <tr>
                        <th class="text-center">メールアドレス</th>
                        <td class="text-left">sample@example.com</td>
                    </tr>
                    <tr>
                        <th class="text-center">ご住所</th>
                        <td class="text-left">
                            〒000-0000<br />
                            富山県 富山市 〇〇町 0-0-0 〇〇ビル3F
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">お電話番号</th>
                        <td class="text-left">000-0000-0000</td>
                    </tr>
                    <tr>
                        <th class="text-center">携帯電話番号</th>
                        <td class="text-left">000-0000-0000</td>
                    </tr>
                    <tr>
                        <th class="text-center">ご生年月日</th>
                        <td class="text-left">1980年01月01日</td>
                    </tr>
                    <tr>
                        <th class="text-center">性別</th>
                        <td class="text-left">男性</td>
                    </tr>
                    <tr>
                        <th class="text-center">ご職業</th>
                        <td class="text-left">会社員</td>
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
                <button onclick="history.back()">戻る</button>
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


{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>