{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　プロフィール
機能名：
　プロフィール
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>プロフィール</title>
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

{literal}
<style>
.image_wrap {
    padding: 1.25rem 2.5rem 1.25rem 1.5rem;
    position: relative;
    display: inline-block;
}
.image_wrap .delete {
    position: absolute;
    right: .5em;
    top: .5em;
}
</style>
{/literal}
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
              <li><span>プロフィール</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' settings='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
{if !$err_flg}
<main>

    <h2 class="title is-3">プロフィール</h2>

    <form method="POST">
    
    <div class="control">
        <label class="label">表示名</label>
        <p class="control">
            <input name="display_name" class="input {if $data.display_name == ''}is-danger{/if} is-outlined" type="text" placeholder="例：観光販売システムズ" value="{$data.display_name|default:''}">
            {if isset($err_msg.display_name) && $err_msg.display_name != ''}
            <span class="error has-icon">{$err_msg.display_name}</span>
            {/if}
        </p>
    </div>

    <div class="control">
        <label class="label">画像</label>
        <p class="control">
            <label class="button {if $data.photo_text == ''}is-danger{/if} is-outlined" for="main_img"><i class="fa fa-fw fa-picture-o"></i>画像を選択してください</label>
            <input type="file" name="main_img" id="main_img" style="display:none;">
            {if isset($err_msg.photo_text) && $err_msg.photo_text != ''}
            <span class="error has-icon">{$err_msg.photo_text}</span>
            {/if}
        </p>
        {if $data.photo_text != ''}
        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_image.tpl' input_name='photo_text' image_url=$data.photo_text}
        {/if}
    </div>

    <div class="control">
        <label class="label">ロゴマーク</label>
        <p class="control">
            <label class="button {if $data.logomark == ''}is-danger{/if} is-outlined" for="logo_img"><i class="fa fa-fw fa-picture-o"></i>画像を選択してください</label>
            <input type="file" name="logo_img" id="logo_img" style="display:none;">
            {if isset($err_msg.logomark) && $err_msg.logomark != ''}
            <span class="error has-icon">{$err_msg.logomark}</span>
            {/if}
        </p>
        {if $data.logomark != ''}
        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_image.tpl' input_name='logomark' image_url=$data.logomark}
        {/if}
    </div>

    <hr>

    <div class="control">
        <label class="label">担当者名</label>
        <div class="control is-horizontal">
            <div class="control is-grouped">
                <p class="control is-expanded">
                    <input name="name01" class="input {if $data.name01 == ''}is-danger{/if} is-outlined" type="text" placeholder="姓" value="{$data.name01|default:''}">
                    {if isset($err_msg.name01) && $err_msg.name01 != ''}
                    <span class="error has-icon">{$err_msg.name01}</span>
                    {/if}
                </p>
                <p class="control is-expanded">
                    <input name="name02" class="input {if $data.name02 == ''}is-danger{/if} is-outlined" type="text" placeholder="名" value="{$data.name02|default:''}">
                    {if isset($err_msg.name02) && $err_msg.name02 != ''}
                    <span class="error has-icon">{$err_msg.name02}</span>
                    {/if}
                </p>
            </div>
        </div>
    </div>

    <div class="control">
        <label class="label">フリガナ</label>
        <div class="control is-horizontal">
            <div class="control is-grouped">
                <p class="control is-expanded">
                    <input name="kana01" class="input" type="text" placeholder="セイ" value="{$data.kana01|default:''}">
                </p>
                <p class="control is-expanded">
                    <input name="kana02" class="input" type="text" placeholder="メイ" value="{$data.kana02|default:''}">
                </p>
            </div>
        </div>
    </div>

    <div class="control">
        <label class="label">メールアドレス</label>
        <p class="control">
            <input name="email" class="input {if $data.email == ''}is-danger{/if} is-outlined" type="email" placeholder="例：sample@firld-desing.jp" value="{$data.email|default:''}">
            {if isset($err_msg.email) && $err_msg.email != ''}
            <span class="error has-icon">{$err_msg.email}</span>
            {/if}
        </p>
    </div>

    <hr>

    <div class="control">
        <label class="label">会社名</label>
        <p class="control">
          <input name="company_name" class="input" type="text" placeholder="例：株式会社観光販売システムズ" value="{$data.company_name|default:''}">
        </p>
    </div>

    <div class="control">
        <label class="label">郵便番号</label>
        <div class="control is-horizontal">
            <div class="control is-grouped">
                <p class="control is-expanded">
                    <input name="zipcode[]" class="input" type="number" min="0" placeholder="例：123" value="{$data.zipcode[0]|default:''}">
                </p>
                <p class="control is-expanded">
                    <input name="zipcode[]" class="input" type="number" min="0" placeholder="例：4567" value="{$data.zipcode[1]|default:''}">
                </p>
            </div>
        </div>

        <label class="label">都道府県</label>
        <p class="control">
          <span class="select">
            <select name="pref">
                <option value="">都道府県</option>
                <option value="1" {if $data.pref=='北海道'}selected{/if}>北海道</option>
                <option value="2" {if $data.pref=='青森県'}selected{/if}>青森県</option>
                <option value="3" {if $data.pref=='岩手県'}selected{/if}>岩手県</option>
                <option value="4" {if $data.pref=='宮城県'}selected{/if}>宮城県</option>
                <option value="5" {if $data.pref=='秋田県'}selected{/if}>秋田県</option>
                <option value="6" {if $data.pref=='山形県'}selected{/if}>山形県</option>
                <option value="7" {if $data.pref=='福島県'}selected{/if}>福島県</option>
                <option value="8" {if $data.pref=='茨城県'}selected{/if}>茨城県</option>
                <option value="9" {if $data.pref=='栃木県'}selected{/if}>栃木県</option>
                <option value="10" {if $data.pref=='群馬県'}selected{/if}>群馬県</option>
                <option value="11" {if $data.pref=='埼玉県'}selected{/if}>埼玉県</option>
                <option value="12" {if $data.pref=='千葉県'}selected{/if}>千葉県</option>
                <option value="13" {if $data.pref=='東京都'}selected{/if}>東京都</option>
                <option value="14" {if $data.pref=='神奈川県'}selected{/if}>神奈川県</option>
                <option value="15" {if $data.pref=='新潟県'}selected{/if}>新潟県</option>
                <option value="16" {if $data.pref=='富山県'}selected{/if}>富山県</option>
                <option value="17" {if $data.pref=='石川県'}selected{/if}>石川県</option>
                <option value="18" {if $data.pref=='福井県'}selected{/if}>福井県</option>
                <option value="19" {if $data.pref=='山梨県'}selected{/if}>山梨県</option>
                <option value="20" {if $data.pref=='長野県'}selected{/if}>長野県</option>
                <option value="21" {if $data.pref=='岐阜県'}selected{/if}>岐阜県</option>
                <option value="22" {if $data.pref=='静岡県'}selected{/if}>静岡県</option>
                <option value="23" {if $data.pref=='愛知県'}selected{/if}>愛知県</option>
                <option value="24" {if $data.pref=='三重県'}selected{/if}>三重県</option>
                <option value="25" {if $data.pref=='滋賀県'}selected{/if}>滋賀県</option>
                <option value="26" {if $data.pref=='京都府'}selected{/if}>京都府</option>
                <option value="27" {if $data.pref=='大阪府'}selected{/if}>大阪府</option>
                <option value="28" {if $data.pref=='兵庫県'}selected{/if}>兵庫県</option>
                <option value="29" {if $data.pref=='奈良県'}selected{/if}>奈良県</option>
                <option value="30" {if $data.pref=='和歌山県'}selected{/if}>和歌山県</option>
                <option value="31" {if $data.pref=='鳥取県'}selected{/if}>鳥取県</option>
                <option value="32" {if $data.pref=='島根県'}selected{/if}>島根県</option>
                <option value="33" {if $data.pref=='岡山県'}selected{/if}>岡山県</option>
                <option value="34" {if $data.pref=='広島県'}selected{/if}>広島県</option>
                <option value="35" {if $data.pref=='山口県'}selected{/if}>山口県</option>
                <option value="36" {if $data.pref=='徳島県'}selected{/if}>徳島県</option>
                <option value="37" {if $data.pref=='香川県'}selected{/if}>香川県</option>
                <option value="38" {if $data.pref=='愛媛県'}selected{/if}>愛媛県</option>
                <option value="39" {if $data.pref=='高知県'}selected{/if}>高知県</option>
                <option value="40" {if $data.pref=='福岡県'}selected{/if}>福岡県</option>
                <option value="41" {if $data.pref=='佐賀県'}selected{/if}>佐賀県</option>
                <option value="42" {if $data.pref=='長崎県'}selected{/if}>長崎県</option>
                <option value="43" {if $data.pref=='熊本県'}selected{/if}>熊本県</option>
                <option value="44" {if $data.pref=='大分県'}selected{/if}>大分県</option>
                <option value="45" {if $data.pref=='宮崎県'}selected{/if}>宮崎県</option>
                <option value="46" {if $data.pref=='鹿児島県'}selected{/if}>鹿児島県</option>
                <option value="47" {if $data.pref=='沖縄県'}selected{/if}>沖縄県</option>
            </select>
          </span>
        </p>

        <label class="label">市区町村、丁目・番地、ビル・マンション名等</label>
        <p class="control">
            <input name="address" class="input" type="text" placeholder="例：〇〇市〇〇 1丁目123 〇〇ビル101" value="{$data.address|default:''}">
        </p>
    </div>

    <hr>

    <div class="control">
        <label class="label">電話番号</label>
        <div class="control is-horizontal">
            <div class="control is-grouped">
                <p class="control is-expanded">
                    <input name="tel_[]" class="input {if $data.tel_[0] == ''}is-danger{/if} is-outlined" type="number" min="0" placeholder="例：123" value="{$data.tel_[0]|default:''}">
                </p>
                <p class="control is-expanded">
                    <input name="tel_[]" class="input {if $data.tel_[1] == ''}is-danger{/if} is-outlined" type="number" min="0" placeholder="例：4567" value="{$data.tel_[1]|default:''}">
                </p>
                <p class="control is-expanded">
                    <input name="tel_[]" class="input {if $data.tel_[2] == ''}is-danger{/if} is-outlined" type="number" min="0" placeholder="例：8901" value="{$data.tel_[2]|default:''}">
                </p>
            </div>
        </div>
        {if isset($err_msg.tel_) && $err_msg.tel_ != ''}
        <span class="error has-icon">{$err_msg.tel_}</span>
        {/if}
    </div>

    <div class="control">
        <label class="label">FAX番号</label>
        <div class="control is-horizontal">
            <div class="control is-grouped">
                <p class="control is-expanded">
                    <input name="fax_[]" class="input" type="number" min="0" placeholder="例：123" value="{$data.fax_[0]|default:''}">
                </p>
                <p class="control is-expanded">
                    <input name="fax_[]" class="input" type="number" min="0" placeholder="例：4567" value="{$data.fax_[1]|default:''}">
                </p>
                <p class="control is-expanded">
                    <input name="fax_[]" class="input" type="number" min="0" placeholder="例：8901" value="{$data.fax_[2]|default:''}">
                </p>
            </div>
        </div>
    </div>

    <div class="control">
        <label class="label">営業時間</label>
        <p class="control">
          <input name="service_time" class="input" type="text" placeholder="例：平日9:00〜17:00" value="{$data.service_time|default:''}">
        </p>
    </div>

    <hr>

    <div class="control">
        <label class="label">ホームページ URL</label>
        <p class="control">
          <input name="website_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.website_url|default:''}">
        </p>
    </div>

    <div class="control">
        <label class="label">Facebookページ URL</label>
        <p class="control">
          <input name="facebook_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.facebook_url|default:''}">
        </p>
    </div>

    <div class="control">
        <label class="label">Twitter URL</label>
        <p class="control">
          <input name="twitter_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.twitter_url|default:''}">
        </p>
    </div>

    <div class="control">
        <label class="label">Instagram URL</label>
        <p class="control">
          <input name="instagram_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.instagram_url|default:''}">
        </p>
    </div>

    <hr>

    <section id="cancel" class="cancel">
        <h2 class="conts-ttl subtitle">
            取消料
        </h2>
        <div class="conts-body">
            <label class="label">説明文</label>
            <p class="control">
                <textarea name="cancel_version" class="textarea {if $data.cancel_version == ''}is-danger{/if}" placeholder="例：契約成立後、お客様のご都合で契約を解除する場合、旅行代金に対してお客様1名につき下記の料率で取消料をいただきます。なお、複数人数のご参加で、一部のお客様が契約を解除される場合は、ご参加のお客様から運送・宿泊機関等の（1台・1室あたりの）ご利用人数の変更に対する差額代金をそれぞれいただきます。">{$data.cancel_version|default:''}</textarea>
                {if isset($err_msg.cancel_version) && $err_msg.cancel_version != ''}
                <span class="error has-icon">{$err_msg.cancel_version}</span>
                {/if}
            </p>

            <label class="label">
                料率
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="cancel_container" class="sortable">
                {section name=i start=0 loop=count($data.mt_cancel_ttl)}
                    {assign var='index' value=$smarty.section.i.index}
                    {if $index == 0 || $data.mt_cancel_ttl[$index] != '' || $data.MtCancelRatio[$index] != ''}
                        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_cancel.tpl' mt_cancel_ttl=$data.mt_cancel_ttl[$index] MtCancelRatio=$data.MtCancelRatio[$index]}
                    {/if}
                {/section}
            </div>
            <p id="cancel_add" class="control add-btn">
                <a class="button is-primary">
                <span class="icon">
                    <i class="fa fa-plus-circle"></i>
                </span>
                <span>料率を追加</span>
                </a>
            </p>

            <label class="label">
                注釈
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="note_container" class="control sortable">
                {foreach from=$data.mt_cancel_note item=value name=count}
                    {if $smarty.foreach.count.index == 0 || $value != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_multi.tpl' style='style="min-height: 60px; min-width: auto;"' placeholder='例：オプショナルプランも上記取消料率による取消料が利用日を基準として別途適用されます。ただし、旅行開始後の取消料は100％となります。' input_name='mt_cancel_note[]' value=$value}
                    {/if}
                {/foreach}
            </div>
            <p id="note_add" class="control add-btn">
                <a class="button is-primary">
                <span class="icon">
                    <i class="fa fa-plus-circle"></i>
                </span>
                <span>行を追加</span>
                </a>
            </p>

        </div>
    </section>

    <hr>

    <div class="control">
        <label class="label">旅行業に基づく旅行商品の取り扱い</label>
        <span class="help is-danger">※旅行商品を取り扱う場合は、株式会社観光販売システムズとの契約が別途必要となります。</span>
        <p class="control">
            <label class="checkbox">
              <input type="checkbox" name="agency" value="1" {if $data.agency==1}checked='checked'{/if}>
              取り扱う
            </label>
        </p>
    </div>

    <div class="travel-agency-input">
        <div class="control">
            <label class="label">旅行条件書</label>
            <p class="control">
                <label class="radio">
                    <input type="radio" name="file_select" value="1" {if $data.file_select==1}checked="checked"{/if}> PDFファイルをアップロードする
                </label>
                <label class="radio">
                    <input type="radio" name="file_select" value="2" {if $data.file_select==2}checked="checked"{/if}> URLリンクを入力する
                </label>
            </p>

            <div class="control condition-pdf">
                <label class="label">旅行条件書 PDF</label>
                <p class="control">
                    <label class="button is-outlined" for="pdf_file">ファイルを選択してください</label>
                    <input type="file" name="pdf_file" id="pdf_file" style="display:none;">
                </p>
                {if $data.file != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_pdf_file.tpl' url=$data.file}
                {/if}
            </div>

            <div class="control condition-url">
                <label class="label">旅行条件書 URL</label>
                <p class="control">
                  <input class="input" name="condition_url" type="text" placeholder="例：http://example.com" value="{$data.condition_url|default:''}">
                </p>
            </div>

            <label class="label">企画旅行業者の氏名又は名称</label>
            <p class="control">
                <input class="input" name="marketer_type" type="text" placeholder="例：観光販売システムズ" value="{$data.marketer_type|default:''}">
            </p>

            <label class="label">企画旅行業者の住所</label>
            <p class="control">
                <input class="input" name="projectAddress" type="text" placeholder="例：愛知県名古屋市中村区名駅3丁目21番7号　名古屋三交ビル9階" value="{$data.projectAddress|default:''}">
            </p>

            <label class="label">企画旅行業者の登録番号</label>
            <p class="control has-addons">
                <span class="button is-disabled">観光庁長官登録旅行業第</span>
                <input class="input" name="projectNumber" type="number" placeholder="例：1600" value="{$data.projectNumber|default:''}">
                <span class="button is-disabled">号</span>
            </p>

            <label class="label">加入旅行業協会名（加入会社のみ）</label>
            <p class="control">
                <input class="input" name="projectName" type="text" placeholder="例：一般社団法人日本旅行業協会（JATA）正会員" value="{$data.projectName|default:''}">
            </p>
        </div>
    </div>

    <hr>

    <section class="password">
        <h2 class="conts-ttl subtitle">
            パスワード再設定
        </h2>

        <div class="control has-icon">
            <label class="label">新しいパスワード</label>
            <p class="control">
                <input class="input" name="pass" type="password" placeholder="●●●●●●●●">
                <span class="icon is-small">
                    <i class="fa fa-lock"></i>
                </span>
                {if isset($err_msg.pass) && $err_msg.pass != ''}
                <span class="error has-icon">{$err_msg.pass}</span>
                {/if}
            </p>
        </div>

        <div class="control has-icon">
            <label class="label">パスワードの確認</label>
            <p class="control">
                <input class="input" name="pass_confirm" type="password" placeholder="●●●●●●●●">
                <span class="icon is-small">
                    <i class="fa fa-lock"></i>
                </span>
                {if isset($err_msg.pass) && $err_msg.pass != ''}
                <span class="error has-icon">{$err_msg.pass}</span>
                {/if}
            </p>
        </div>
    </section>

    <hr>

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

    <input type="hidden" name="PersonID" value="{$data.PersonID|default:''}" />

    </form>
</main>
{/if}
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

<script src="//cdn.ckeditor.com/4.5.8/basic/ckeditor.js"></script>
<script>
  CKEDITOR.replace('ckeditor01', {
    language: 'ja',
    uiColor: '#ffffff',
  });
</script>

<script type="text/javascript">
$(function() {
    $('[name=agency]').change(function() {
        if ($(this).is(':checked')) {
            $('.travel-agency-input').fadeIn();
        } else {
            $('.travel-agency-input').fadeOut();
        }
    }).trigger('change');

    $('[name=file_select]').change(function() {
        if ($("input:radio[name='file_select']:checked").val() == "1") {
            $('.condition-url').fadeOut('normal', function(){ $('.condition-pdf').fadeIn(); });
        } else if ($("input:radio[name='file_select']:checked").val() == "2") {
            $('.condition-pdf').fadeOut('normal', function(){ $('.condition-url').fadeIn(); });
        }
    }).trigger('change');
});
</script>
<script>
    $(function() {
        /***************************
        submitボタン設定
        ****************************/
        $('.save-point .button').click(function(){
            $('form').attr('action', location.pathname);
            $('<input />').attr('type', 'hidden')
                          .attr('name', 'update')
                          .attr('value', '1')
                          .appendTo('form');
            $('form').submit();
        });

        /***************************
        ファイルのアップロードイベント設定
        fileapi.js
        ****************************/
        var fileapi = new FileApi();
        fileapi.setUpload(
            '#main_img',
            'main_img',
            {
                afterupload : function(response) {
                    $('#main_img').val('');
                    $('#main_img').parent().next().remove();
                    $('#main_img').parent().after(response);
                }
            }
        );

        var fileapi2 = new FileApi();
        fileapi2.setUpload(
            '#logo_img',
            'logo_img',
            {
                afterupload : function(response) {
                    $('#logo_img').val('');
                    $('#logo_img').parent().next().remove();
                    $('#logo_img').parent().after(response);
                }
            }
        );

        var fileapi3 = new FileApi();
        fileapi3.setUpload(
            '#pdf_file',
            'pdf_file',
            {
                afterupload : function(response) {
                    $('#pdf_file').val('');
                    $('#pdf_file').parent().next().remove();
                    $('#pdf_file').parent().after(response);
                }
            }
        );
        /***************************
        追加ボタン処理
        partsapi.js
        ****************************/
        var partsapi = new PartsApi();
        $('#cancel #cancel_add.add-btn a').click(function(){
            partsapi.addParts('calcel', '#cancel_container');
        });
        $('#cancel #note_add.add-btn a').click(function(){
            partsapi.addParts('note', '#note_container');
        });
    });

</script>
{/literal}


</body>
</html>
