{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　管理画面トップページ
機能名：
　管理画面トップページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>ダッシュボード</title>
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
<!-- START main -->
<main>
    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="section">
        <h2 class="title is-4">商品管理</h2>
        <div class="tile is-ancestor">
            <div class="tile is-parent">
                <a class="button is-info is-outlined is-medium is-fullwidth" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit">
                    <span class="icon">
                        <i class="fa fa-plus-circle"></i>
                    </span>
                    <span>新規追加</span>
                </a>
            </div>
            <div class="tile is-parent">
                <a class="button is-info is-outlined is-medium is-fullwidth" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product">
                    <span class="icon">
                        <i class="fa fa-list-ul"></i>
                    </span>
                    <span>商品一覧</span>
                </a>
            </div>
            <!-- <div class="tile is-parent">
                <a class="button is-medium is-fullwidth" href="/standard">
                    <span class="icon">
                        <i class="fa fa-cog"></i>
                    </span>
                    <span>規格管理</span>
                </a>
            </div> -->
        </div>

    </div>
    <div class="section">
        <h2 class="title is-4">新規受注</h2>
        <table class="order-list table">
          <thead>
            <tr>
              <th class="order-image"></th>
              <th class="order-date">受注日</th>
              <th class="order-number">注文番号</th>
              <th class="order-name">お名前</th>
              <th class="order-payment">支払方法</th>
              <th class="order-amount">合計金額</th>
              <th class="order-status">対応状況</th>
              <th class="order-edit">詳細</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$orderlist item=order}
            <tr>
              <td class="order-image">
                  <p class="image is-64x64">
                    <img src="{$order.main_photo|default:''}">
                  </p>
              </td>
              <td class="order-date">{$order.registDate|replace:' ':'<br />'}</td>
              <td class="order-number">{$order.OrderNumber|string_format:'%06d'}</td>
              <td class="order-name">{$order.nameSei} {$order.nameMei}</td>
              <td class="order-payment">{$order.settlementType}</td>
              <td class="order-amount">{($order.plan_Fee1 * $order.volume1 + $order.plan_Fee2 * $order.volume2 + $order.plan_Fee3 * $order.volume3 + $order.plan_Fee4 * $order.volume4 + $order.plan_Fee5 * $order.volume5)|number_format}</td>
              <td class="order-status">{$order.Correspondence}</td>
              <td class="order-edit"><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}order/edit/?OderID={$order.OderID}">詳細</a></td>
            </tr>
            {/foreach}
          </tbody>
        </table>
        <p class="control">
          <a class="button is-primary is-pulled-right" href="{$smarty.const.URL_ROOT_PATH_ADMIN}order">
            <span class="icon">
              <i class="fa fa-angle-right"></i>
            </span>
            <span>さらに見る</span>
          </a>
          </p>
    </div>
    <div class="section">
        <h2 class="title is-4">今月の売上</h2>
        <div class="section">
            <h3 class="title is-5">{$smarty.now|date_format:'%G/%m'}</h3>
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
        <div class="section">
            <h3 class="title is-5">商品別 TOP5</h3>
            <canvas id="myChart" width="400" height="300"></canvas>
        </div>
        <p class="control">
          <a class="button is-primary is-pulled-right" href="{$smarty.const.URL_ROOT_PATH_ADMIN}sales">
            <span class="icon">
              <i class="fa fa-angle-right"></i>
            </span>
            <span>さらに見る</span>
          </a>
          </p>
    </div>

</main>
<!-- END main -->
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
    type: 'polarArea',
    data: {
        {/literal}
        labels: ["{$salessum.product5|default:''}"],
        {literal}
        datasets: [{
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
