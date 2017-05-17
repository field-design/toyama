{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　富山ページ設定
機能名：
　富山ページ設定
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>in富山</title>
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
              <li><span>in富山</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' page_toyama='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>
    <form method="post">
      <h2 class="title is-3">in富山</h2>

    <section id="slide_photo" class="section">
        <div class="control">
            <h3 class="subtitle">スライドショー</h3>
            <label class="label">
                <span class="must">必須</span>
                <span class="help">横幅1,400px以上の画像を1枚以上登録してください。横長画像を推奨。最大5枚。</span>
            </label>

            <div id="slide_photo_container" class="control sortable" data-option="{count($data.slide_photo)}">
                {section name=i start=0 loop=count($data.slide_photo)}
                    {assign var='index' value=$smarty.section.i.index}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/page_slide_photo.tpl'
                             number=$index+1
                             photo=$data.slide_photo[$index]}
                {/section}
            </div>
            {if isset($err_msg.slide_photo) && $err_msg.slide_photo != ''}
            <span class="error has-icon">{$err_msg.slide_photo}</span>
            {/if}
            <div class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>スライドを追加</span>
              </a>
              <span class="help">最大5件まで追加可能</span>
            </div>

        </div>
    </section>

    <section class="section">
          <div class="control">
              <h3 class="subtitle">表示順設定</h3>
              <p>
                  一覧表示では1ヶ月間の間で閲覧数（ページビュー）が多い記事が上位に表示されますが、優先的に表示したい商品がある場合は下記のフィールドで設定してください。<span class="help">最大20件まで設定可能</span><br />
              </p>
          </div>
          <select id="custom-select" multiple="multiple">
              {foreach from=$product_list item=product}
              <option value="{$product.product_id}" {if in_array($product.product_id, $data.product_order)}selected{/if}>{$product.title}</option>
              {/foreach}
          </select>​
    </section>

    <section class="section">
        <div class="control">
            <h3 class="subtitle">SEO関連設定</h3>
        </div>

        <label class="label">H1タグ</label>
        <div class="control">
            <div class="help counter">残り<span class="count">64</span>文字</strong></div>
            <input name="h1_tag" class="input limited" type="text" placeholder="例：富山県を楽しむツアーをいますぐ購入" maxlength="64" value="{$data.h1_tag|default:''}">
        </div>

        <label class="label">titleタグ</label>
        <div class="control">
            <div class="help counter">残り<span class="count">64</span>文字</strong></div>
            <input name="title_tag" class="input limited" type="text" placeholder="例：いまからえらべるTRAVEL" maxlength="64" value="{$data.title_tag|default:''}">
        </div>

        <label class="label">descriptionタグ</label>
        <div class="control">
            <div class="help counter">残り<span class="count">128</span>文字</strong></div>
            <textarea name="description_tag" class="textarea limited" placeholder="例：越中にいかわ観光圏は、富山県の魚津市・黒部市・入善町・朝日町が参加する、水との関わりが深いエリア。VISIT富山県のエリア特集「越中にいかわ観光圏」では、水をテーマにした、各市町村の現地観光プランをご紹介します！" maxlength="128">{$data.description_tag|default:''}</textarea>
        </div>
    </section>

    <div class="control save-point">
        <p class="has-text-centered">
            <a class="button is-success">
                <span class="icon">
                    <i class="fa fa-save"></i>
                </span>
                <span>変更を保存</span>
            </a>
        </p>
    </div>

      <input type="hidden" name="page_id" value={$data.page_id|default:''} />
    </form>
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
<link rel="stylesheet" type="text/css" href="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/css/multi.min.css">
<script src="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/js/multi.min.js"></script>
{literal}

<script>
/***************************
custom select
****************************/
var select_element = document.getElementById( 'custom-select' );
multi( select_element, {
    'enable_search': true,
    'search_placeholder': '検索...',
});
$( '#custom-select' ).multi();


/***************************
並び替え
****************************/
$( function() {
    $( ".sortable" ).sortable();
    $( ".sortable" ).disableSelection();
} );

$( function() {
    $( ".selected-wrapper" ).sortable();
    $( ".selected-wrapper" ).disableSelection();
} );
</script>
<script>
    $(function() {
        /***************************
        並び替えデータ復元
        ****************************/
        {/literal}
        var product_ids = {if isset($data.product_order)}{$data.product_order|@json_encode}{else}[]{/if}
        {literal}
        var sort_data = [];
        for(i = 0; i < product_ids.length; i++) {
            sort_data.push($('.selected-wrapper a.item[data-value=' + product_ids[i] + ']'));
        }
        $( ".selected-wrapper" ).html('');
        for(i = 0; i < sort_data.length; i++) {
            $( ".selected-wrapper" ).append(sort_data[i]);
        }
        /***************************
        submitボタン設定
        ****************************/
        $('.save-point .button').click(function(){
            $('.selected-wrapper a.item').each(function(){
                $('form').append($('<input/>', {type: 'hidden', name: 'product_order[]', value: $(this).attr('data-value')}));
            });
            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('form').submit();
        });

        /***************************
        ファイルのアップロードイベント設定
        fileapi.js
        ****************************/
        var setUploadEvent = function() {
            var fileapi = new FileApi();
            $('[id^="slide_img"]').each(function(){
                var fileapi = new FileApi();
                var _this = this;
                fileapi.setUpload(
                    _this,
                    'slide_image',
                    {
                        afterupload : function(response) {
                            $(_this).val('');
                            $(_this).parents('.box.notification').find('div.main-image').show();
                            $(_this).parents('.box.notification').find('figure.image img').attr('src', response['url'][0]);
                            $(_this).parents('.box.notification').find('figure.image').next('input').val(response['url'][0]);
                        }
                    }
                );
            });
            
        }
        setUploadEvent();

        /***************************
        追加ボタン処理
        partsapi.js
        ****************************/
        var partsapi = new PartsApi();
        $('#slide_photo .add-btn a').click(function(){
            partsapi.addParts('slide_photo', '#slide_photo_container', setUploadEvent);
            var incre = parseInt($('#slide_photo_container').attr('data-option')) + 1;
            $('#slide_photo_container').attr('data-option', incre);
        });

    });
</script>
{/literal}



</body>
</html>