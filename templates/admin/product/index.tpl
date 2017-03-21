{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　商品一覧
機能名：
　商品一覧
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
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}"><span class="icon is-small"><i class="fa fa-home" aria-hidden="true"></i></span></a></li>
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}product"><span>商品管理</span></a></li>
              <li><span>商品一覧</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' product='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">商品一覧</h2>

    <div class="actions columns">
        <div class="column is-4">
            <a class="button is-info is-outlined is-fullwidth" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit/">
                <span class="icon">
                    <i class="fa fa-plus-circle"></i>
                </span>
                <span>新規追加</span>
            </a>
        </div>
    </div>

    <!-- <div class="filter section">
        <nav class="panel">
          <p class="panel-heading">
            絞り込み検索
          </p>
        <p class="panel-block">エリア</p>
          <a class="panel-block">
            <span class="panel-icon">
              <i class="fa fa-book"></i>
            </span>
            エリア2
          </a>
          <a class="panel-block">
            <span class="panel-icon">
              <i class="fa fa-book"></i>
            </span>
            エリア3
          </a>
        <p class="panel-block">カテゴリ</p>
          <a class="panel-block">
            <span class="panel-icon">
              <i class="fa fa-book"></i>
            </span>
            カテゴリ1
          </a>
          <a class="panel-block">
            <span class="panel-icon">
              <i class="fa fa-code-fork"></i>
            </span>
            カテゴリ2
          </a>
          <a class="panel-block">
            <span class="panel-icon">
              <i class="fa fa-code-fork"></i>
            </span>
            カテゴリ3
          </a>
        <p class="panel-block">キーワード検索</p>
          <div class="panel-block">
              <p class="control has-addons">
                <input class="input is-expanded" type="text" placeholder="キーワードを入力">
                <a class="button is-info">
                  検索
                </a>
              </p>
          </div>
        </nav>
    </div> -->

    <div class="products columns is-multiline is-desktop sortable">
        {foreach from=$data_list item=data}
        <div class="column is-one-third">
            <div class="card">
              <div class="card-image">
                <figure class="image is-4by3">
                  <a href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit?ProductID={$data.ProductID}"><img src="{$data.main_photo1}" alt="Image"></a>
                </figure>
              </div>
              <div class="card-content">
                <div class="content">
                  {$data.SubTitle}<br />
                  {$data.title}
                  <div class="category">
                      <ul class="is-clearfix">
                          {foreach from=$data.area item=area}
                          <li><small>{$area}</small></li>
                          {/foreach}
                          {foreach from=$data.Category item=cat}
                          <li><small>{$cat}</small></li>
                          {/foreach}
                      </ul>
                  </div>
                  <small>{$data.registDate}</small>
                </div>
              </div>
              <footer class="card-footer">
                <a class="card-footer-item">
                    <span class="icon is-small"><i class="fa fa-external-link"></i></span>
                    表示
                </a>
                <a class="card-footer-item" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit?ProductID={$data.ProductID}">
                    <span class="icon is-small"><i class="fa fa-edit"></i></span>
                    編集
                </a>
              </footer>
            </div>
        </div>
        {/foreach}
    </div>

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