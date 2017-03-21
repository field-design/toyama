{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　規格
機能名：
　規格
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

<div class="status-info section">
    <progress class="progress is-success is-small" value="30" max="100">30%</progress>
    <div class="status has-text-centered">
        <a class="button is-success is-loading">Loading</a>
        <a class="button is-success">
            <span class="icon">
                <i class="fa fa-check"></i>
            </span>
            <span>保存しました</span>
        </a>
        <a class="button is-info">
            <span class="icon is-small">
                <i class="fa fa-check"></i>
            </span>
            <span>公開しました</span>
        </a>
    </div>
</div>
    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' standard='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">規格管理</h2>

    <section id="edit_standard" class="input-area">

        <div class="conts-body message-body">

            <label class="label">規格
                <span class="help">最大30件</span>
            </label>
            <div class="control sortable" id="standard_container">
                <p class="control has-addons">
                    <a class="button">
                      <i class="fa fa-navicon"></i>
                    </a>
                    <input class="input is-expanded" type="text" placeholder="例：タクシー乗車代" value="Aコース">
                    <a class="button remove" onclick="((this).parentNode.remove())">
                      <i class="fa fa-close"></i>
                    </a>
                </p>
                <p class="control has-addons">
                    <a class="button">
                      <i class="fa fa-navicon"></i>
                    </a>
                    <input class="input is-expanded" type="text" placeholder="例：タクシー乗車代" value="Bコース">
                    <a class="button remove" onclick="((this).parentNode.remove())">
                      <i class="fa fa-close"></i>
                    </a>
                </p>
                <p class="control has-addons">
                    <a class="button">
                      <i class="fa fa-navicon"></i>
                    </a>
                    <input class="input is-expanded" type="text" placeholder="例：タクシー乗車代" value="Cコース">
                    <a class="button remove" onclick="((this).parentNode.remove())">
                      <i class="fa fa-close"></i>
                    </a>
                </p>
                <p class="control has-addons">
                    <a class="button">
                      <i class="fa fa-navicon"></i>
                    </a>
                    <input class="input is-expanded" type="text" placeholder="例：タクシー乗車代" value="Dコース">
                    <a class="button remove" onclick="((this).parentNode.remove())">
                      <i class="fa fa-close"></i>
                    </a>
                </p>
            </div>
            <p class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>追加</span>
              </a>
            </p>

        </div>

    </section>

    <div class="control save-point">
        <p class="control has-addons has-addons-centered">
            <a class="button is-success">
                <span class="icon">
                    <i class="fa fa-save"></i>
                </span>
                <span>変更を保存</span>
            </a>
        </p>
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
        // $( ".button.remove" ).click(function() {
        //     $( this ).parent().remove();
        // });
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
        追加ボタン処理
        partsapi.js
        ****************************/
        var partsapi = new PartsApi();
        $('#edit_standard .add-btn a').click(function(){
            partsapi.addParts('standard', '#standard_container');
        });
    });
</script>
{/literal}



</body>
</html>
