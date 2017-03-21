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

<title>title</title>
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
              <li><a href="/"><span class="icon is-small"><i class="fa fa-home" aria-hidden="true"></i></span></a></li>
              <li><a href="/order"><span>受注管理</span></a></li>
              <li><span>詳細情報</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' order='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">詳細情報</h2>

    <section>
        <h3 class="title is-5">決済情報</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            <tr>
                <th>決済種別</th>
                <td>{$data.settlementType|default:''}</td>
            </tr>
            <tr>
                <th>与信承認番号</th>
                <td>{$data.CreditNumber|default:''}</td>
            </tr>
            <tr>
                <th>支払方法</th>
                <td>{$data.Payment|default:''}</td>
            </tr>
            <tr>
                <th>決済金額</th>
                <td>{$data.settlement|default:''}円</td>
            </tr>
          </tbody>
        </table>
    </section>

    <section>
        <h3 class="title is-5">受注ステータス</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            <tr>
                <th>受注番号</th>
                <td>{$data.OrdersNumber|default:''}</td>
            </tr>
            <tr>
                <th>受注日</th>
                <td>{$data.oderDate|default:''}</td>
            </tr>
            <tr>
                <th>対応状況</th>
                <td>
                    {$data.Correspondence|default:''}
                    {if $data.request == 1}
                    <a class="button is-success is-outlined is-small">
                      <span class="icon is-small">
                        <i class="fa fa-check"></i>
                      </span>
                      <span>承認する</span>
                    </a>
                    {/if}
                </td>
            </tr>
            <tr>
                <th>入金日</th>
                <td>{$data['paymentDate']}</td>
            </tr>
          </tbody>
        </table>
    </section>

    <section>
        <h3 class="title is-5">注文者情報</h3>
        <hr>
        <table class="order-edit table is-bordered">
          <tbody>
            <tr>
                <th>会員ID</th>
                <td>{$data.MemberID|default:''}</td>
            </tr>
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
          </tbody>
        </table>
    </section>

    <section>
        <h3 class="title is-5">受注詳細</h3>
        <hr>
        <table class="order-list table">
          <thead>
            <tr>
              <th class="order-product-name">商品名</th>
              <th class="order-amount">単価</th>
              <th class="order-number">数量</th>
              <th class="order-edit">小計</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th class="order-date" colspan="3">合計</th>
              <th class="order-amount">18,000円</th>
            </tr>
        </tfoot>
          <tbody>
            {section name=i start=0 loop=5}
                {assign var='index' value=$smarty.section.i.index}
                {assign var='plan_title' value='plan_title'|cat:($index+1)}
                {assign var='plan_Fee' value='plan_Fee'|cat:($index+1)}
                {assign var='plan_Kind' value='plan_Kind'|cat:($index+1)}
                {assign var='volume' value='volume'|cat:($index+1)}
                {if $data.$plan_title != '' || $data.$plan_Fee != '' || $data.$plan_Kind}
                <tr>
                <td class="order-product-name">{$data.$plan_title}({$data.$plan_Kind})</td>
                <td class="order-amount">{$data.$plan_Fee}円</td>
                <td class="order-number">{$data.$volume}</td>
                <td class="order-amount">{$data.$plan_Fee * $data.$volume}円</td>
                </tr>
                {/if}
            {/section}
          </tbody>
        </table>
    </section>

</main>
<!-- END main -->
        </div>
    </div>
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
{/literal}



</body>
</html>