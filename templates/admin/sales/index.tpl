{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　売上一覧
機能名：
　売上一覧
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>売上一覧</title>
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
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}order"><span>売上管理</span></a></li>
              <li><span>売上一覧</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' sales='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">売上一覧</h2>

    <section class="hero">
        <!-- Hero content: will be in the middle -->
        <div class="hero-body">
            <h1 class="title is-4">
              月間売上
            </h1>
            <h2 class="subtitle">
              {$smarty.now|date_format:'%G/%m'}
            </h2>
            <nav class="level">
              <div class="level-item has-text-centered">
                <div>
                    <p class="heading">合計売上</p>
                    <p class="title">{$salessum.sales|number_format}円</p>
                </div>
              </div>
              <div class="level-item has-text-centered">
                <div>
                    <p class="heading">合計件数</p>
                    <p class="title">{$salessum.amount|number_format}</p>
                </div>
              </div>
            </nav>
        </div>
    </section>

    <section class="section">
        <h1 class="title is-4">
          商品別 TOP5
        </h1>
        <canvas id="myChart" width="400" height="300"></canvas>
    </section>

    <section class="section">
        <h1 class="title is-4">
          売上一覧
        </h1>
        <table class="order-list table">
          <thead>
            <tr>
              <th class="order-date">入金日</th>
              <th class="order-number">注文番号</th>
              <th class="order-product-name">商品名</th>
              <th class="order-name">購入者</th>
              <th class="order-number">購入件数</th>
              <th class="order-amount">売上金額</th>
              <th class="order-edit">詳細</th>
            </tr>
          </thead>

          <tbody>
            {foreach from=$saleslist item=sales}
            <tr>
              <td class="order-date">{$sales.pay_date|replace:' ':'<br />'}</td>
              <td class="order-number">{$sales.order_id|default:''}</td>
              <td class="order-product-name">{$sales.title}</td>
              <td class="order-name">{$sales.nameSei} {$sales.nameMei}</td>
              <td class="order-number">{$sales.amount_total|number_format}</td>
              <td class="order-amount">{$sales.price_total|number_format}</td>
              <td class="order-edit"><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}order/edit?OderID={$sales.order_id}">詳細</a></td>
            </tr>
            {/foreach}
          </tbody>
          <tfoot>
            <tr>
              <th class="order-date" colspan="4">合計</th>
              <th class="order-number">{$salessum.amount|number_format}</th>
              <th class="order-amount">{$salessum.sales|number_format}円</th>
              <th></th>
            </tr>
          </tfoot>
        </table>
    </section>

</main>
<!-- END main -->
        </div>
    </div>
</div>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' sales='is-active' is_admin=$is_admin}
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
var ctx = document.getElementById("myChart");
var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        {/literal}
        labels: ["{$salessum.product5|default:''}"],
        {literal}
        datasets: [{
            label: "2017/03/01〜2017/03/31",
            {/literal}
            data: [{$salessum.sales5|default:0}],
            {literal}
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
{/literal}


</body>
</html>