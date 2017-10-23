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

<title>商品一覧</title>
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
              <li><span>商品一覧</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
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
    <!--
    <div class="filter section">
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
    </div>
    -->
    <div class="products columns is-multiline is-desktop sortable">
        {foreach from=$data_list item=data}
        <div id="container_{$data.product_id}" class="column is-one-third">
            <div class="card">
              <div class="card-image">
                <figure class="image is-4by3">
                  <a href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit?ProductID={$data.product_id}"><img src="{$data.main_photo1}" alt="Image"></a>
                </figure>
              </div>
              <div class="card-content">
                <div class="content">
                  <div class="editor">
                      <small>{$settings_list[$data.person_id]['company_name']}</small>
                  </div>
                  <div class="plan-ttl">
                  {$data.sub_title}<br />
                  <span class="product_title">{$data.title}</span>
                  </div>
                  <div><small>{$data.regist_date}</small></div>
                  <div class="category">
                      <ul>
                          {foreach from=$data.area_text item=area}
                          <li><span class="tag">{$area}</span></li>
                          {/foreach}
                          {foreach from=$data.category_text item=cat}
                          <li><span class="tag">{$cat}</span></li>
                          {/foreach}
                      </ul>
                  </div>
                </div>
              </div>
              <footer class="card-footer">
                {if $data.publish_status == 1}
                    {if array_key_exists('area1', $data.area)}
                    <a class="card-footer-item" href="{$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$data.product_id}" target="_blank">
                    {else}
                    <a class="card-footer-item" href="{$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH}plan/?plan={$data.product_id}" target="_blank">
                    {/if}
                        <span class="icon is-small"><i class="fa fa-external-link"></i></span>
                        表示
                    </a>
                {else}
                <span class="card-footer-item">
                    非公開
                </span>
                {/if}
                <a class="card-footer-item" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit?ProductID={$data.product_id}">
                    <span class="icon is-small"><i class="fa fa-edit"></i></span>
                    編集
                </a>
              </footer>
              <footer class="card-footer">
                <a class="card-footer-item is-danger button-delete" href="javascript:void(0);" data-id="{$data.product_id}">
                    <span class="icon is-small"><i class="fa fa-trash"></i></span>
                    削除
                </a>
                <a class="card-footer-item is-light button-copy" href="javascript:void(0);" data-id="{$data.product_id}">
                    <span class="icon is-small"><i class="fa fa-copy"></i></span>
                    複製
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
<div id="dialog" title="確認"></div>
<form method="POST">
</form>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' product='is-active' is_admin=$is_admin}
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
<style>
.ui-dialog {
    z-index: 101;
}
.ui-widget-overlay {
    background: #666666;
    opacity: .5;
    filter: Alpha(Opacity=50);
}

.ui-widget-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.ui-widget-content {
    background: #fff;
    color: #333333;
}

.ui-draggable .ui-dialog-titlebar {
    cursor: move;
}
.ui-dialog .ui-dialog-titlebar {
    padding: .4em 1em;
    position: relative;
    border-bottom: 1px solid #aaa;
}
.ui-dialog .ui-dialog-titlebar .ui-dialog-titlebar-close {
    display: none;
}

/*
.ui-widget-header {
    background: #363636;
    color: #ffffff;
    font-weight: bold;
}
*/
.ui-helper-clearfix {
    min-height: 0;
}

.ui-dialog .ui-dialog-content {
    position: relative;
    border: 0;
    padding: .5em 1em;
    background: none;
    overflow: auto;
}

.ui-dialog .ui-dialog-buttonpane {
    text-align: left;
    border-width: 1px 0 0 0;
    background-image: none;
    margin-top: .5em;
    padding: .3em 1em .5em .4em;
    overflow: hidden;
   
}

.ui-dialog .ui-dialog-buttonpane .ui-dialog-buttonset {
    float: right;
}

.ui-dialog .ui-dialog-buttonpane button {
    margin: .5em .6em .5em 0;
    cursor: pointer;
}

</style>
{literal}
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
    /***************************
    ダイアログ設定
    ****************************/
    function getDialogParams(okcallback) {
        var params = {   
              modal: true,
              open: function() {
                  //ボタンスタイル用
                  $('.ui-dialog .ui-dialog-buttonpane button').addClass('button');
                  $( this ).siblings('.ui-dialog-buttonpane').find('button:eq(1)').focus();
              },
              buttons:[
                  {
                      text: "OK",
                      click: okcallback
                  },
                  {
                      text: "Cancel",
                      click: function(){
                          $( this ).dialog( "close" );
                      }
                  }
              ]
          };

        return params;
    }
</script>
<script>
    $(function() {
        /***************************
        submitボタン設定
        ****************************/
        $('a.button-delete').click(function(){
            var product_id = $(this).attr('data-id');
            var params = getDialogParams(function(){
              $('form').append($('<input/>', {type: 'hidden', name: 'proc', value: 'delete'}));
              $('form').append($('<input/>', {type: 'hidden', name: 'product_id', value: product_id}));
              $('form').submit();
            });
            $("#dialog").html('次の商品を削除しますか？<br>' + $('#container_' + product_id).find('.product_title').html());
            $("#dialog").dialog(params);
        });
        $('a.button-copy').click(function(){
            var product_id = $(this).attr('data-id');
            var params = getDialogParams(function(){
              $('form').append($('<input/>', {type: 'hidden', name: 'proc', value: 'copy'}));
              $('form').append($('<input/>', {type: 'hidden', name: 'product_id', value: product_id}));
              $('form').append($('<input/>', {type: 'hidden', name: 'publish_status_pre', value: '3'}));
              $('form').submit();
            });
            $("#dialog").html('次の商品を複製しますか？<br>' + $('#container_' + product_id).find('.product_title').html());
            $("#dialog").dialog(params);
        });
    });
</script>
{/literal}



</body>
</html>