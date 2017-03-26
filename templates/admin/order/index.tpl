{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　受注一覧
機能名：
　受注一覧
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>受注一覧</title>
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
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}order"><span>受注管理</span></a></li>
              <li><span>受注一覧</span></li>
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

    <h2 class="title is-3">受注一覧</h2>

    <!-- <div class="filter section">
        <table class="table is-narrow">
            <tr>
                <th>注文番号</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>対応状況</th>
                <td>
                    <p class="control">
                      <span class="select">
                        <select>
                          <option>承認待ち</option>
                          <option>入金待ち</option>
                          <option>キャンセル</option>
                          <option>入金済み</option>
                          <option>決済処理中</option>
                        </select>
                      </span>
                    </p>
                </td>
            </tr>
            <tr>
                <th>お名前</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>フリガナ</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>電話番号</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>携帯番号</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>受注日</th>
                <td>
                    <div class="columns">
                        <div class="column is-5">
                            <p class="control has-icon has-icon-right">
                                <input class="input js-datepicker" type="text" placeholder="日付範囲">
                                <span class="icon is-small">
                                  <i class="fa fa-calendar"></i>
                                </span>
                            </p>
                        </div>
                        <div class="column is-1">
                            <p>〜</p>
                        </div>
                        <div class="column is-5">
                            <p class="control has-icon has-icon-right">
                                <input class="input js-datepicker" type="text" placeholder="日付範囲">
                                <span class="icon is-small">
                                  <i class="fa fa-calendar"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <th>支払方法</th>
                <td>
                    <p class="control">
                      <label class="checkbox">
                        <input type="checkbox" checked="">
                        クレジットカード決済
                      </label>
                      <label class="checkbox">
                        <input type="checkbox" checked="">
                        コンビニ決済
                      </label>
                    </p>
                </td>
            </tr>
            <tr>
                <th>購入金額</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
            <tr>
                <th>購入商品名</th>
                <td>
                    <p class="control">
                      <input class="input" type="text" placeholder="">
                    </p>
                </td>
            </tr>
        </table>
        <div class="panel-block">
          <button class="button is-primary is-outlined is-fullwidth">
            この条件で絞り込む
          </button>
        </div>
    </div> -->

    <table class="order-list table">
      <thead>
        <tr>
          <th class="order-image"></th>
          <th class="order-date">受注日</th>
          <th class="order-number">注文番号</th>
          <th class="order-name">お名前</th>
          <th class="order-payment">決済種別</th>
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
            <td class="order-edit"><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}order/edit?OderID={$order.OderID}">詳細</a></td>
        </tr>
        {/foreach}
      </tbody>
    </table>

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