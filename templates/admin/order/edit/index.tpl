{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　受注詳細
機能名：
　受注詳細
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>受注詳細</title>
<meta name="description" content="">

<!-- icons -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/stylesheet.tpl'}
<!-- Modernizr -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/dns_prefetch.tpl'}

</head>

<body id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


<!-- START global-header -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_header.tpl'}
<!-- END global-header -->


<!-- START global-nav -->
<div class="global-nav">
    <div class="container">

    </div>
</div>
<!-- END global-nav -->


<div class="container">

    <div class="breadcrumbs section">
        <div class="notification">
            <ul class="is-clearfix">
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}"><span class="icon is-small"><i class="fa fa-home" aria-hidden="true"></i></span></a></li>
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}order"><span>受注一覧</span></a></li>
              <li><span>詳細情報</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' order='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">詳細情報</h2>

    <section class="order-edit-detail">
        <h3 class="title is-5">受注ステータス</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            <tr>
                <th>予約番号</th>
                <td>{$data.OderID|default:''}</td>
            </tr>
            <tr>
                <th>受注日</th>
                <td>{$data.registDate_a|default:''}</td>
            </tr>
            <tr>
                <th>対応状況</th>
                <td>
                    {$data.order_status_text|default:''}
                    {if $data.request_flg == 1}
                    <a class="button is-success is-outlined is-small">
                      <span class="icon is-small">
                        <i class="fa fa-check"></i>
                      </span>
                      <span>承認する</span>
                    </a>
                    <a class="button is-danger is-outlined is-small">
                      <span class="icon is-small">
                        <i class="fa fa-check"></i>
                      </span>
                      <span>承認しない</span>
                    </a>
                    {/if}
                </td>
            </tr>
            <tr>
                <th>入金日</th>
                <td>{$data['pay_date']|default:''}</td>
            </tr>
            {if $data.request_flg == 1 || $data.request_flg == 2}
            <tr>
                <th>決済ページURL</th>
                <td class="word-break">
                    <a href="{$data.payment_url|default:''}" target="_blank">{$data.payment_url|default:''}</a>
                </td>
            </tr>
            {/if}
          </tbody>
        </table>
    </section>

    <section class="order-edit-detail">
        <h3 class="title is-5">注文者情報</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            <tr>
                <th>お名前</th>
                <td>{$data.nameSei|default:''} {$data.nameMei|default:''}</td>
            </tr>
            <tr>
                <th>フリガナ</th>
                <td>{$data.kanaSei|default:''} {$data.kanaMei|default:''}</td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td>{$data.mail|default:''}</td>
            </tr>
            <tr>
                <th>電話番号</th>
                <td>{$data.tel_|default:''}</td>
            </tr>
            <tr>
                <th>携帯番号</th>
                <td>{$data.mobile|default:''}</td>
            </tr>
            <tr>
                <th>住所</th>
                <td>
                    {$data.zipCode|default:''}<br />
                    {$data.pref|default:''}{$data.adress|default:''}
                </td>
            </tr>
            <tr>
                <th>生年月日</th>
                <td>{$data.birthday|default:''}</td>
            </tr>
            <tr>
                <th>性別</th>
                <td>{$data.gender|default:''}</td>
            </tr>
            <tr>
                <th>職業</th>
                <td>{$data.job_|default:''}</td>
            </tr>
            <tr>
                <th>備考欄</th>
                <td>
                    {$data.note|default:''}
                </td>
            </tr>
          </tbody>
        </table>
    </section>

    {if count($data.withSei) > 0}
    <section class="order-edit-detail">
        <h3 class="title is-5">同行者情報</h3>
        <hr>
        {section name=i start=0 loop=count($data.withSei)}
            {assign var='index' value=$smarty.section.i.index}
            <table class="order-edit table is-bordered with">
            <caption>同行者</caption>
            <tbody>
                <tr>
                    <th>お名前</th>
                    <td>{$data.withSei[$index]|default:''} {$data.withMei[$index]|default:''}</td>
                </tr>
                <tr>
                    <th>フリガナ</th>
                    <td>{$data.withKanaSei[$index]|default:''} {$data.withKanaMei[$index]|default:''}</td>
                </tr>
                <tr>
                    <th>生年月日</th>
                    <td>{$data.withBirthday[$index]|default:''}</td>
                </tr>
                <tr>
                    <th>性別</th>
                    <td>{$data.withGender[$index]|default:''}</td>
                </tr>
            </tbody>
            </table>
        {/section}
    </section>
    {/if}

    <section>
        <h3 class="title is-5">受注詳細</h3>
        <hr>
        <table class="order-edit table is-bordered">
            <tbody>
            <tr>
                <th>商品名</th>
                <td>{$product_data.title}<br /><small>{$course_data.course_name[0]}</small></td>
            </tr>
            <tr>
                <th>予約日</th>
                <td>{$data.oderDate}</td>
            </tr>
            </tbody>
        </table>
        <table class="order-list table">
          <thead>
            <tr>
              <th class="order-product-name">商品名</th>
              <th class="order-amount">単価</th>
              <th class="order-number">数量</th>
              <th class="order-edit">小計</th>
            </tr>
          </thead>
          <tbody>
            {assign var="sales" value=0}
            {section name=i start=0 loop=count($price_data.price_type)}
                {assign var='index' value=$smarty.section.i.index}
                <tr>
                <td class="order-product-name">{$price_data.price_type_text[$index]|default:''}</td>
                <td class="order-amount">{$price_data.price_value[$index]|default:0|number_format}円</td>
                <td class="order-number">{$data.amount[$index]|default:0|number_format}</td>
                <td class="order-amount">{($price_data.price_value[$index]|default:0 * $data.amount[$index]|default:0)|number_format}円</td>
                </tr>
                {assign var="sales" value=$sales + $price_data.price_value[$index] * $data.amount[$index]}
            {/section}
          </tbody>
          <tfoot>
            <tr>
              <th class="order-date" colspan="3">合計</th>
              <th class="order-amount">{$sales|number_format}円</th>
            </tr>
          </tfoot>
        </table>
    </section>

    {if isset($product_data.question)}
    <section class="order-edit-detail">
        <h3 class="title is-5">質問事項</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            {section name=i start=0 loop=count($product_data.question)}
                {assign var='index' value=$smarty.section.i.index}
                <tr>
                    <th>{$product_data.question[$index]}</th>
                    <td>
                        {$data.question[$index]|default:''}
                    </td>
                </tr>
            {/section}
          </tbody>
        </table>
    </section>
    {/if}

    <section>
        <h3 class="title is-5">決済情報</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            <tr>
                <th>決済種別</th>
                <td>{$data.settlement_type_text|default:''}</td>
            </tr>
            {if $data.settlement_type == 0}
            <tr>
                <th>与信承認番号</th>
                <td>{$data.credit_number|default:''}</td>
            </tr>
            <tr>
                <th>支払方法</th>
                <td>{$data.payment_text|default:''}</td>
            </tr>
            {elseif $data.settlement_type == 3}
            <tr>
                <th>コンビニ名</th>
                <td>{$data.settlement_name|default:''}</td>
            </tr>
            {/if}
            <tr>
                <th>決済金額</th>
                <td>{$data.settlement|number_format|default:''}円</td>
            </tr>
          </tbody>
        </table>
    </section>

    <form method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">
        <input name="OderID" type="hidden" value="{$data.OderID}" />
    </form>
</main>
<!-- END main -->
        </div>
    </div>
</div>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' order='is-active' is_admin=$is_admin}
</div>

<!-- START global-footer -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/global_footer.tpl'}
<!-- END global-footer -->


<!-- WEB Fonts -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/webfont.tpl'}

<!-- Optional Stylesheets -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/stylesheet.tpl'}

<!-- Common Script -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/script.tpl'}

<!-- Google map javascript api v3 -->
{include file=$smarty.const.ADMIN_DIR|cat:'includes/foot/google_script.tpl'}

<!-- Page Script -->
{literal}
<script>
  function initMap() {

    // マップの初期化
    var map = new google.maps.Map(document.getElementById('location-map'), {
      zoom: 13,
      center: {lat: 36.38992, lng: 139.06065}
    });

    // クリックイベントを追加
    map.addListener('click', function(e) {
      getClickLatLng(e.latLng, map);
    });
  }

  function getClickLatLng(lat_lng, map) {

    // 座標を表示
    document.getElementById('lat').textContent = lat_lng.lat();
    document.getElementById('lng').textContent = lat_lng.lng();

    // マーカーを設置
    var marker = new google.maps.Marker({
      position: lat_lng,
      map: map
    });

    // 座標の中心をずらす
    // http://syncer.jp/google-maps-javascript-api-matome/map/method/panTo/
    map.panTo(lat_lng);
  }
</script>
<script>
    // 並び替え機能
    $( function() {
        $( ".sortable" ).sortable();
        $( ".sortable" ).disableSelection();
        $( ".button.remove" ).click(function() {
            $( this ).parent().remove();
        });
    } );

    // アコーディオン
    $(document).ready( function() {
    	$('.js-accordion').accordion({
            header: ".conts-ttl",
            active: 2,
            heightStyle: "content",
            icons: {
                header: "ui-icon-pin-w",
                activeHeader: "ui-icon-circle-arrow-s"
            },
            change: function(event, ui) {
        		alert(ui.newContent.context.id);
        	}
        });
    });
</script>
<script>
    $(function() {
        $('.js-datepicker').datepicker();
        $('.js-timepicker').timepicker({
            'timeFormat': 'H:i',
            'scrollDefault': 'now',
            'step': 15
        });
    });
</script>
<script>
    $(function() {
        /***************************
        submitボタン設定
        ****************************/
        $('a.button.is-success').click(function(){
            $('form').append($('<input/>', {type: 'hidden', name: 'approval', value: 'ok'}));
            $('form').submit();
        });
        $('a.button.is-danger').click(function(){
            $('form').append($('<input/>', {type: 'hidden', name: 'approval', value: 'cancel'}));
            $('form').submit();
        });
    });
</script>
{/literal}



</body>
</html>