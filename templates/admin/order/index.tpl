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

    <div class="filter section">
        <form method="POST">
            <table class="table is-narrow">
                <tr>
                    <th>申込番号</th>
                    <td>
                        <p class="control">
                        <input name="order_id" class="input" type="text" placeholder="" value="{$search_params.order_id|default:''}">
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>対応状況</th>
                    <td>
                        <p class="control">
                        <span class="select">
                            <select name="order_status">
                            <option value="">指定しない</option>
                            {foreach from=ConstantMy::$aryCorrespondence item=value key=key}
                            <option value="{$key}" {if ($search_params.order_status|default:'') == $key}selected{/if}>{$value}</option>
                            {/foreach}
                            </select>
                        </span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>お名前</th>
                    <td>
                        <div class="columns">
                            <div class="column is-5">
                                <p class="control">
                                <input name="simei_sei" class="input" type="text" placeholder="姓" value="{$search_params.simei_sei|default:''}">
                                </p>
                            </div>
                            <div class="column is-5">
                                <p class="control">
                                <input name="simei_mei" class="input" type="text" placeholder="名" value="{$search_params.simei_mei|default:''}">
                                </p>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>フリガナ</th>
                    <td>
                        <div class="columns">
                            <div class="column is-5">
                                <p class="control">
                                <input name="simei_kana_sei" class="input" type="text" placeholder="セイ" value="{$search_params.simei_kana_sei|default:''}">
                                </p>
                            </div>
                            <div class="column is-5">
                                <p class="control">
                                <input name="simei_kana_mei" class="input" type="text" placeholder="メイ" value="{$search_params.simei_kana_mei|default:''}">
                                </p>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>メールアドレス</th>
                    <td>
                        <p class="control">
                        <input name="mail" class="input" type="text" placeholder="" value="{$search_params.mail|default:''}">
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td>
                        <p class="control">
                        <input name="tel" class="input" type="text" placeholder="" value="{$search_params.tel|default:''}">
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>携帯番号</th>
                    <td>
                        <p class="control">
                        <input name="mobile" class="input" type="text" placeholder="" value="{$search_params.mobile|default:''}">
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>予約日</th>
                    <td>
                        <div class="columns">
                            <div class="column is-5">
                                <p class="control has-icon has-icon-right">
                                    <input name="order_date_from" class="input js-datepicker" type="text" placeholder="日付範囲" value="{$search_params.order_date_from|default:''}">
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
                                    <input name="order_date_to" class="input js-datepicker" type="text" placeholder="日付範囲" value="{$search_params.order_date_to|default:''}">
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
                        {foreach from=ConstantMy::$arySettlementType item=value key=key}
                        <label class="checkbox">
                            <input name="settlement_type[]" type="checkbox" value="{$key}" {if isset($search_params.settlement_type) && in_array($key, $search_params.settlement_type)}checked="checked"{/if}>
                            {$value}
                        </label>
                        {/foreach}
                        </p>
                    </td>
                </tr>
                <tr>
                    <th>商品名</th>
                    <td>
                        <p class="control">
                        <input name="title" class="input" type="text" placeholder="" value="{$search_params.title|default:''}">
                        </p>
                    </td>
                </tr>
            </table>
            <div class="panel-block">
            <button id="search_button" class="button is-primary is-outlined is-fullwidth">
                この条件で絞り込む
            </button>
            </div>
        </form>
    </div>

    <table class="order-list table">
      <thead>
        <tr>
          <th class="order-image"></th>
          <th class="order-date">受注日</th>
          <th class="order-number">申込番号</th>
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
            <td class="order-number">{$order.OderID}</td>
            <td class="order-name">{$order.nameSei} {$order.nameMei}</td>
            <td class="order-payment">{$order.settlement_type_text}</td>
            <td class="order-amount">{$order.total|number_format}</td>
            <td class="order-status">{$order.order_status_text}</td>
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
<script>
    $(function() {
        /***************************
        submitボタン設定
        ****************************/
        $('#search_button').click(function(){
            $('form').submit();
        });
    });
</script>
{/literal}



</body>
</html>