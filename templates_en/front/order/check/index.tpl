{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（ご予約内容確認）ページ
機能名：
　申込（ご予約内容確認）ページ
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

{if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step"><span>Select Number of People/Options</span></li>
                <li class="step"><span>Enter Customer Information</span></li>
                <li class="step current"><span>Confirm Application Content</span></li>
            </ul>
        </div>

        <h2><span>Confirm Application Content</span></h2>

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

        <section class="order-style order-check cart">
            <h3 class="product-ttl">Number of People/Price</h3>
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
                            <td class="text-center"><span class="amount">{$order_data.amount[$index]|default:0|number_format}</span></td>
                            <td class="text-right"><span class="sum"></span>Yen</td>
                        </tr>
                    {/section}
                </tbody>
                <tfoot>
                    <tr>
                      <th class="text-center" colspan="3">Total</th>
                      <th class="text-center"><span id="total"></span>Yen</th>
                    </tr>
                </tfoot>
            </table>
        </section>

        {if isset($product_data.question)}
        <section class="order-style order-check input">
            <h3 class="product-ttl">Questions</h3>
            {section name=i start=0 loop=count($product_data.question)}
                {assign var='index' value=$smarty.section.i.index}
                <div class="survey">
                    <h4 class="survey-ttl">{$product_data.question[$index]}</h4>
                    <p class="notes">
                        {$order_data.question[$index]|default:''}
                    </p>
                </div>
            {/section}
        </section>
        {/if}

        <section class="order-style order-check input">
            <h3 class="product-ttl">Applicant Information</h3>
            <table class="order-table">
                <tbody>
                    <tr>
                        <th class="text-center">Name</th>
                        <td class="text-left">{$order_data.nameSei} {$order_data.nameMei}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Furigana</th>
                        <td class="text-left">{$order_data.kanaSei} {$order_data.kanaMei}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Email Address</th>
                        <td class="text-left">{$order_data.mail}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Street address</th>
                        <td class="text-left">
                            〒{$order_data.zipCode[0]}-{$order_data.zipCode[1]}<br />
                            {Constant::$aryPref[$order_data.pref]|default:''} {$order_data.adress}
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center">Phone Number</th>
                        <td class="text-left">{$order_data.tel_[0]}-{$order_data.tel_[1]}-{$order_data.tel_[2]}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Mobile Phone Number</th>
                        <td class="text-left">{$order_data.mobile[0]}-{$order_data.mobile[1]}-{$order_data.mobile[2]}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Date of Birth</th>
                        <td class="text-left">{$order_data.birthday[0]}/
                        {$order_data.birthday[1]}/{$order_data.birthday[2]}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Sex</th>
                        <td class="text-left">{$order_data.gender_text}</td>
                    </tr>
                    <tr>
                        <th class="text-center">Profession</th>
                        <td class="text-left">{$order_data.job_text}</td>
                    </tr>
                </tbody>
            </table>
        </section>

        {if count($order_data.withSei) > 0}
        <section class="order-style order-check input">
            <h3 class="product-ttl">Companion Information</h3>
            {section name=i start=0 loop=count($order_data.withSei)}
                {assign var='index' value=$smarty.section.i.index}
                <table class="order-table">
                    <caption>Person</caption>
                    <tbody>
                        <tr>
                            <th class="text-center">Name</th>
                            <td class="text-left">{$order_data.withSei[$index]} {$order_data.withMei[$index]}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Furigana</th>
                            <td class="text-left">{$order_data.withKanaSei[$index]} {$order_data.withKanaMei[$index]}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Date of Birth</th>
                            <td class="text-left">{$order_data.withBirthdayYear[$index]}/{$order_data.withBirthdayMonth[$index]}/{$order_data.withBirthdayDay[$index]}</td>
                        </tr>
                        <tr>
                            <th class="text-center">Sex</th>
                            <td class="text-left">{$order_data.withGender_text[$index]}</td>
                        </tr>
                    </tbody>
                </table>
            {/section}
        </section>
        {/if}

        <section class="order-style order-check input">
            <h3 class="product-ttl">Additional Remarks</h3>
            <p class="notes">
                {$order_data.note|default:''}
            </p>
        </section>

        {if $settings_data.agency == 1}
        <div class="conditions">
            <h5>Travel Conditions</h5>
            <ul>
                {if $settings_data.file_select == 1}
                    <li>Please make sure to read <a href="{$settings_data.file|default:''}" target="_blank">the travel conditions document</a> before applying.</li>
                {else}
                    <li>Please make sure to read <a href="{$settings_data.condition_url|default:''}" target="_blank">the travel conditions document</a> before applying.</li>
                {/if}
                <li>To save the travel conditions document, select "File" in the web browser (at the top of the screen) and select "Save As...".</li>
                <li>Specify the folder and name of the file to save the document, select the document type as "Web Page, HTML Only" or "Text File" and click "Save".</li>
            </ul>
        </div>

        <div class="agreement mod_form_importance_btn">
            <div class="check">
                <p>
	                <input type="checkbox" id="privacy" name="privacy" value="agree">
	                <label class="privacy" for="privacy">Save the travel conditions document and agree with the content of the conditions.</label>
	            </p>
            </div>
            <p class="note">Only those who click the check box above will be able to make a reservation.</p>
        </div>
        {/if}

        <div class="pagenation">
            <div class="back">
                <button type="button" onclick="javascript:location.href='{$smarty.const.URL_ROOT_PATH}order/input/'">Back</button>
            </div>
            {if $request_flg}
            <div class="next {if $settings_data.agency == 1}mod_form_btn{/if}">
                <button type="button" id="submit">Send a request</button>
            </div>
            {else}
            <div class="next {if $settings_data.agency == 1}mod_form_btn{/if}">
                <button type="button" id="submit">Go to the payment page</button>
            </div>
            {/if}
        </div>
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