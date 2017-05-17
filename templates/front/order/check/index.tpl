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

{if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

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
                      <td class="text-left">{$course_data.course_name[0]}</td>
                  </tr>
                  <tr>
                      <th class="text-center">出発日</th>
                      <td class="text-left">{$order_data.oderDate_text}</td>
                  </tr>
                  <tr>
                      <th class="text-center">集合場所</th>
                      <td class="text-left">
                        {foreach from=$product_data.meeting_place item=value}
                        {$value}<br>
                        {/foreach}
                      </td>
                  </tr>
              </tbody>
          </table>
          <ul class="notes-list">
              <li>本プランは上記主催者との契約になります。</li>
          </ul>
        </section>

        <section class="order-style order-check cart">
            <h3 class="product-ttl">人数・ご旅行代金</h3>
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
                    {section name=i start=0 loop=count($price_data.price_type)}
                        {assign var='index' value=$smarty.section.i.index}
                        <tr>
                            <td class="text-left">{$price_data.price_type_text[$index]}</td>
                            <td class="text-right"><span>{$price_data.price_value[$index]|default:0|number_format}</span>円</td>
                            <td class="text-center"><span class="amount">{$order_data.amount[$index]|default:0|number_format}</span></td>
                            <td class="text-right"><span class="sum"></span>円</td>
                        </tr>
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

        <section class="order-style order-check input">
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

        <div class="conditions">
            <h5>旅行条件書</h5>
            <ul>
                <li>お申込み前に必ず <a href="https://www.kanko-pro.co.jp/agreement/agreement23.php" target="_blank">旅行条件書</a> をお読みください。</li>
                <li>旅行条件書を保存するには（画面上部）ブラウザメニューの「ファイル」を選択、次に「名前をつけて保存」を選択します。</li>
                <li>保存する場所、ファイル名を指定し、ファイルの種類を「WEBページ、HTMLのみ」もしくは「テキストファイル」にして「保存」を選択します。</li>
            </ul>
        </div>

        <div class="agreement mod_form_importance_btn">
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
            {if $request_flg}
            <div class="next mod_form_btn">
                <button type="button" id="submit">リクエスト依頼</button>
            </div>
            {else}
            <div class="next mod_form_btn">
                <button type="button" id="submit">決済画面へ移動</button>
            </div>
            {/if}
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
// 送信ボタン表示制御
$(function(){
	//送信ボタンの無効、チェックボックスを外す
	$(".mod_form_btn button").css({opacity:"0.5",cursor:"default"}).attr("disabled","disabed");
	$(".mod_form_importance_btn input:checkbox").attr('checked',false);
	//チェックボックスがクリックされると送信ボタン有効
	$(".mod_form_importance_btn label,.mod_form_importance_btn input").click(function(){
		if($(".mod_form_importance_btn input:checkbox").is(':checked')){
			$(".mod_form_btn button").css({opacity:"1",cursor:"pointer"}).removeAttr("disabled");
		}else{
			 $(".mod_form_btn button").css({opacity:"0.5",cursor:"default"}).attr("disabled","disabed");
	}
	})
});
</script>
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
<script>
$(function(){
    /*********************
    登録ボタン処理
    **********************/
    $('#submit').click(function(){
        $.ajax({
            type: "POST",
            url: location.pathname,
            data: { 'create_order' : '1' },
            error: function(){
                alert('データ登録に失敗しました。');
            },
            success: function(response){
                if(!response.status) {
                    alert(response);
                    return;
                };

                var form = $('<form/>', {action: response.action , method: 'post'});
                Object.keys(response).forEach(function (key) {
                    form.append($('<input/>', {type: 'hidden', name: key, value: response[key]}));
                });
                form.appendTo(document.body).submit();
            }
        });
    });

});
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>