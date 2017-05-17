{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　商品追加・編集
機能名：
　商品追加・編集
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>{if $edit_type == 'new'}商品追加{else}商品編集{/if}</title>
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
              <li>
                {if $edit_type == 'new'}
                <span>商品追加</span>
                {else}
                <span>商品編集</span>
                {/if}
              </li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>
    {if $edit_type == 'new'}
    <h2 class="title is-3">商品追加</h2>
    {else}
    <h2 class="title is-3">商品編集</h2>
    {/if}
<form method="post" style="opacity: 0;">
<div class="js-accordion">
    <section class="input-area message plan-outline">
        <h2 class="conts-ttl subtitle message-header">
            基本情報
            <span class="icon">
              <i class="fa fa-minus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">

            <div class="control">
                <label class="label">サブタイトル</label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <input name="sub_title" class="input limited" type="text" placeholder="例：蜃気楼ガイドと行く！" maxlength="64" value="{$data.sub_title|default:''}">
                </div>
            </div>

            <div class="control">
                <label class="label">タイトル<span class="must">必須</span></label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <input name ="title" class="input {if $data.title == ''}is-danger{/if} is-bold limited" type="text" placeholder="例：しんきろうロードサイクリングプラン" maxlength="32" value="{$data.title|default:''}">
                    {if isset($err_msg.title) && $err_msg.title != ''}
                    <span class="error has-icon">{$err_msg.title}</span>
                    {/if}
                </div>
            </div>

            <div class="control">
                <label class="label">説明文<span class="must">必須</span></label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <textarea name="description" class="textarea {if $data.description == ''}is-danger{/if} limited" placeholder="例：蜃気楼が見える街として有名な「魚津市」でのレンタサイクルプラン" maxlength="64">{$data.description|default:''}</textarea>
                    {if isset($err_msg.description) && $err_msg.description != ''}
                    <span class="error has-icon">{$err_msg.description}</span>
                    {/if}
                </div>
            </div>

            <div class="control numbering">
                <label class="label">
                    メイン画像<span class="must">必須</span>
                    <span class="help">横幅1,000px以上の画像を1枚以上登録してください。横長画像を推奨。最大5枚。</span>
                </label>
                {foreach from=$data.main_photo item=url}
                    {if $url != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_main_image.tpl' main_photo_url=$url}
                    {/if}
                {/foreach}
                <div class="control">
                    <label class="button {if $data.main_photo|implode:'' == ''}is-danger{/if}" for="main_img">画像を追加</label>
                    <input type="file" name="main_img" id="main_img" style="display:none;">
                    {if isset($err_msg.main_photo) && $err_msg.main_photo != ''}
                    <span class="error has-icon">{$err_msg.main_photo}</span>
                    {/if}
                </div>
            </div>

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
        </div>
    </section>

    <section id="plan_info" class="input-area message plan-detail">
        <h2 class="conts-ttl subtitle message-header">
            プラン詳細
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">

            <div class="columns control">
                <div class="column is-4">
                    <label class="label">開始日<span class="must">必須</span></label>
                    <p class="control has-icon has-icon-right">
                        <input name="period_from" class="input {if $data.period_from == ''}is-danger{/if} js-datepicker" type="text" placeholder="開始日" value="{$data.period_from|default:''}">
                        <span class="icon is-small">
                        <i class="fa fa-calendar"></i>
                        </span>
                        {if isset($err_msg.period_from) && $err_msg.period_from != ''}
                        <span class="error has-icon">{$err_msg.period_from}</span>
                        {/if}
                    </p>
                </div>
                <div class="column is-4">
                    <label class="label">終了日<span class="must">必須</span></label>
                    <p class="control has-icon has-icon-right">
                        <input name="period_to" class="input {if $data.period_to == ''}is-danger{/if} js-datepicker" type="text" placeholder="終了日" value="{$data.period_to|default:''}">
                        <span class="icon is-small">
                        <i class="fa fa-calendar"></i>
                        </span>
                        {if isset($err_msg.period_to) && $err_msg.period_to != ''}
                        <span class="error has-icon">{$err_msg.period_to}</span>
                        {/if}
                    </p>
                </div>
            </div>

            <div class="control">
                <span class="must">必須</span>
                <div class="control">
                    <div class="help counter">残り<span class="count">128</span>文字</strong></div>
                    <textarea name="period_note" class="textarea limited {if $data.period_note == ''}is-danger{/if}" placeholder="例：上記期間の火曜、木曜" maxlength="128">{$data.period_note|default:''}</textarea>
                    {if isset($err_msg.period_note) && $err_msg.period_note != ''}
                    <span class="error has-icon">{$err_msg.period_note}</span>
                    {/if}
                </div>
            </div>

            <div class="control">
                <label class="label">除外日</label>
                <div class="control">
                    <div class="help counter">残り<span class="count">128</span>文字</strong></div>
                    <textarea name="period_exclusion" class="textarea limited" placeholder="例：2016年12月28日～2017年1月5日" maxlength="128">{$data.period_exclusion|default:''}</textarea>
                </div>
            </div>

            <div class="control">
                <label class="label">ご旅行・プラン代金に含まれるもの
                    <span class="help">最大10件まで追加可能</span>
                </label>
                <div id="plan_included_container" class="control sortable">
                    {foreach from=$data.price_include item=val}
                        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_single.tpl' placeholder='例：タクシー乗車代' input_name='price_include[]' value=$val}
                    {/foreach}
                </div>
                <div class="control add-btn plan-included">
                <a class="button is-primary">
                    <span class="icon">
                    <i class="fa fa-plus-circle"></i>
                    </span>
                    <span>行を追加</span>
                </a>
                </div>
            </div>

            <div class="columns control">
                <div class="column">
                    <label class="label">最少受付人員<span class="must">必須</span></label>
                    <p class="control has-icon has-icon-right">
                        <input name="min_member" class="input {if $data.min_member == ''}is-danger{/if}" type="text" placeholder="例：2" value="{$data.min_member|default:''}">
                        <span class="icon is-small">
                        名
                        </span>
                        {if isset($err_msg.min_member) && $err_msg.min_member != ''}
                        <span class="error has-icon">{$err_msg.min_member}</span>
                        {/if}
                    </p>
                </div>
                <div class="column">
                    <label class="label">最少催行人員<span class="must">必須</span></label>
                    <p class="control has-icon has-icon-right">
                        <input name="min_depart" class="input {if $data.min_depart == ''}is-danger{/if}" type="text" placeholder="例：2" value="{$data.min_depart|default:''}">
                        <span class="icon is-small">
                        名
                        </span>
                        {if isset($err_msg.min_depart) && $err_msg.min_depart != ''}
                        <span class="error has-icon">{$err_msg.min_depart}</span>
                        {/if}
                    </p>
                </div>
                <div class="column">
                    <label class="label">最大申込人員<span class="must">必須</span></label>
                    <p class="control has-icon has-icon-right">
                        <input name="max_order" class="input {if $data.max_order == ''}is-danger{/if}" type="text" placeholder="例：9" value="{$data.max_order|default:''}">
                        <span class="icon is-small">
                        名
                        </span>
                        {if isset($err_msg.max_order) && $err_msg.max_order != ''}
                        <span class="error has-icon">{$err_msg.max_order}</span>
                        {/if}
                    </p>
                </div>
            </div>

            <div class="control">
                <label class="label">運行会社</label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <input name="operator" class="input limited" type="text" placeholder="例：〇〇交通" maxlength="64" value="{$data.operator|default:''}">
                </div>
            </div>

            <div class="control">
                <div class="control">
                    <label class="label">添乗員</label>
                    <div class="control">
                        <label class="radio">
                            <input type="radio" name="conductor_flg" value="1" {if $data.conductor_flg == 0}checked="checked"{/if}> 有り
                        </label>
                        <label class="radio">
                            <input type="radio" name="conductor_flg" value="0" {if $data.conductor_flg == 0}checked="checked"{/if}> 無し
                        </label>
                    </div>
                </div>
            </div>

            <div class="control">
                <label class="label">スタート時間</label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <input name="start_time" class="input limited" type="text" placeholder="例：10：00スタート" maxlength="64" value="{$data.start_time|default:''}">
                </div>
            </div>

            <div class="control">
                <label class="label">所要時間</label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <input name="tour_time" class="input limited" type="text" placeholder="例：約3時間" maxlength="64" value="{$data.tour_time|default:''}">
                </div>
            </div>

            <div class="control">
                <label class="label">予約締切<span class="must">必須</span></label>
                <div class="control">
                    <div class="help counter">残り<span class="count"></span>文字</strong></div>
                    <input name="order_deadline" class="input {if $data.order_deadline == ''}is-danger{/if} limited" type="text" placeholder="例：ご旅行出発日前日の０時間前" maxlength="64" value="{$data.order_deadline|default:''}">
                    {if isset($err_msg.order_deadline) && $err_msg.order_deadline != ''}
                    <span class="error has-icon">{$err_msg.order_deadline}</span>
                    {/if}
                </div>
            </div>

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
        </div>
    </section>

    <section id="location" class="input-area message meeting-place">
        <h2 class="conts-ttl subtitle message-header">
            集合場所
            <span class="icon">
            <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">

            <div id="location_container" class="control sortable numbering">
                {section name=i start=0 loop=count($data.meeting_place)}
                    {assign var='index' value=$smarty.section.i.index}
                    {assign var='err_msg_meeting_place' value='meeting_place'|cat:$index}
                    {if !isset($err_msg.$err_msg_meeting_place)}
                        {$err_msg.$err_msg_meeting_place = ''}
                    {/if}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_map.tpl'
                             meeting_place=$data.meeting_place[$index]
                             meeting_place_address=$data.meeting_place_address[$index]
                             coordinate=$data.coordinate[$index]
                             err_msg_meeting_place=$err_msg.$err_msg_meeting_place}
                {/section}
            </div>

            <div class="control add-btn">
            <a class="button is-primary">
                <span class="icon">
                <i class="fa fa-plus-circle"></i>
                </span>
                <span>集合場所を追加</span>
            </a>
            <span class="help">最大3件まで追加可能</span>
            </div>

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
        </div>
    </section>

    <section id="caution_other" class="input-area cautions message">
        <h2 class="conts-ttl subtitle message-header">
            注意事項・その他
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <label class="label">
                注意事項
                <span class="help">最大5件まで追加可能</span>
            </label>
            <div id="caution_container" class="control sortable">
                {foreach from=$data.notes item=val}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_multi.tpl' placeholder='例：おとな1名 こども1名でお申込みの場合は、おとな2名での価格として取り扱いさせていただきます。' input_name='notes[]' value=$val}
                {/foreach}
            </div>
            <p id="caution_add" class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>行を追加</span>
              </a>
            </p>

            <label class="label">
                その他
                <span class="help">最大5件まで追加可能</span>
            </label>
            <div id="other_container" class="control sortable">
                {foreach from=$data.others item=val}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_multi.tpl' placeholder='例：ます寿し1/8カットサイズの試食ができます。店舗は当日のお任せになります。' input_name='others[]' value=$val}
                {/foreach}
            </div>
            <p id="other_add" class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>行を追加</span>
              </a>
            </p>

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
        </div>
    </section>

    <section id="cancel" class="cancel input-area message">
        <h2 class="conts-ttl subtitle message-header">
            取消料
            <span class="icon">
            <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">

            <label class="label">
                料率
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="cancel_rate_container" class="sortable">
                {section name=i start=0 loop=count($data.cancel_charge_rate)}
                    {assign var='index' value=$smarty.section.i.index}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_cancel.tpl'
                             cancel_charge_text=$data.cancel_charge_text[$index]
                             cancel_charge_rate=$data.cancel_charge_rate[$index]}
                {/section}
            </div>
            <p class="control add-btn cancel_rate">
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
            <div id="cancel_note_container" class="control sortable">
                {foreach from=$data.cancel_notes item=val}
                {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_multi.tpl' placeholder='例：オプショナルプランも上記取消料率による取消料が利用日を基準として別途適用されます。ただし、旅行開始後の取消料は100％となります。' style='style="min-height: 60px; min-width: auto;"' input_name='cancel_notes[]' value=$val}
                {/foreach}
            </div>
            <p class="control add-btn cancel_note">
            <a class="button is-primary">
                <span class="icon">
                <i class="fa fa-plus-circle"></i>
                </span>
                <span>行を追加</span>
            </a>
            </p>

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
        </div>
    </section>

    <section id="product_course" class="input-area message plan-course">
        <h2 class="conts-ttl subtitle message-header">
            お申し込み
            <span class="icon">
            <i class="fa fa-minus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">

            <div class="control">
                <label class="label">コース</label>
                <div id="product_course_container" class="control sortable">
                    {section name=i start=0 loop=count($data.course_name)}
                    {assign var='index' value=$smarty.section.i.index}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_course.tpl' course_id=$data.course_id[$index] course_name=$data.course_name[$index] product_id=$data.product_id number=$index+1}
                    {/section}
                </div>
                {if isset($err_msg.course_name) && $err_msg.course_name != ''}
                <span class="error has-icon">{$err_msg.course_name}</span>
                {/if}
                <div class="control add-btn product-course">
                <a class="button is-primary">
                    <span class="icon">
                    <i class="fa fa-plus-circle"></i>
                    </span>
                    <span>コースを追加</span>
                </a>
                </div>
            </div>

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
        </div>
    </section>

    <section id="product_plan" class="input-area message plan-point">
        <h2 class="conts-ttl subtitle message-header">
            プラン内容
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <div id="plan_container" class="control sortable numbering" data-option={count($data.detail_title)}>
                {section name=i start=0 loop=count($data.detail_title)}
                    {assign var='index' value=$smarty.section.i.index}
                    {assign var='err_msg_detail_title' value='detail_title'|cat:$index}
                    {if !isset($err_msg.$err_msg_detail_title)}
                        {$err_msg.$err_msg_detail_title = ''}
                    {/if}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_plan.tpl'
                             number=$index+1
                             photo=$data.detail_photo[$index]
                             title=$data.detail_title[$index]
                             detail=$data.detail_description[$index]
                             link=$data.detail_link[$index]
                             err_msg_detail_title=$err_msg.$err_msg_detail_title}
                {/section}
            </div>
            <p class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>詳細を追加</span>
              </a>
              <span class="help">最大10件まで追加可能</span>
            </p>

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
        </div>
    </section>

    <section class="input-area category message">
        <h2 class="conts-ttl subtitle message-header">
            エリア・カテゴリ
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <div class="area">
                <label class="label">エリア<span class="help">複数選択可能</span></label>
                <div class="control area-group">
                    {foreach from=ConstantMy::$aryArea key=key item=val}
                    <label class="checkbox"><input name="area[]" type="checkbox" value="{$key}" data-group="area{$key}" {if in_array($key, $data.area)}checked='checked'{/if}>{$val}</label>
                    {/foreach}
                </div>
                <div class="control area-detail">
                    {foreach from=ConstantMy::$aryAreaDetail key=key item=val}
                    <div class="area{$key}">
                        {foreach from=$val key=detail_key item=detail_val}
                        {assign var='area_detail' value='area'|cat:$key}
                        <label class="checkbox"><input name="area{$key}[]" value="{$detail_key}" type="checkbox" {if isset($data.$area_detail) && in_array($detail_key, $data.$area_detail)}checked='checked'{/if}>{$detail_val}</label>
                        {/foreach}
                    </div>
                    {/foreach}
                </div>
            </div>

            <hr>

            <div class="category">
                <label class="label">カテゴリ<span class="help">複数選択可能</span></label>
                <div class="control">
                    {foreach from=ConstantMy::$aryCategory key=key item=val}
                    <label class="checkbox"><input name="category[]" value="{$key}" type="checkbox" {if in_array($key, $data.category)}checked='checked'{/if}>{$val}</label>
                    {/foreach}
                </div>
            </div>
        </div>
    </section>

    <section class="release message is-info">
        <h2 class="subtitle message-header">
            公開設定
        </h2>
        <div class="conts-body message-body">
            <table class="table">
                <tbody>
                    <tr>
                        <th>
                            <span class="icon is-small"><i class="fa fa-refresh"></i></span>
                            <span>ステータス</span>
                        </th>
                        <td>
                            {$data.publish_status_text|default:''}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="icon is-small"><i class="fa fa-calendar"></i></span>
                            <span>公開日時</span>
                        </th>
                        <td>
                            <!--
                            2016年5月11日 11:30
                            <a class="button is-small is-primary is-inverted">
                              <span class="icon is-small">
                                <i class="fa fa-edit"></i>
                              </span>
                              <span>編集</span>
                            </a> -->
                            <p class="control has-addons">
                                <input name="publish_date[]" class="input js-datepicker {if $data.publish_date[0] == ''}is-danger{/if}" type="text" placeholder="公開日" value="{$data.publish_date[0]|default:''}">
                                <input name="publish_date[]" class="input js-timepicker {if $data.publish_date[1] == ''}is-danger{/if}" type="text" placeholder="時間" value="{$data.publish_date[1]|default:''}">
                            </p>
                            {if isset($err_msg.publish_date) && $err_msg.publish_date != ''}
                            <span class="error has-icon">{$err_msg.publish_date}</span>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="icon is-small"><i class="fa fa-link"></i></span>
                            <span>下書きURL</span>
                        </th>
                        <td>
                            <a id="post_preview">
                                {$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH_ADMIN}preview/
                                <span class="icon is-small"><i class="fa fa-fw fa-external-link"></i></span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span class="icon is-small"><i class="fa fa-link"></i></span>
                            <span>公開URL</span>
                        </th>
                        <td>
                            {if $data.publish_status == 1}
                            <a href="{$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$data.product_id}" target="_blank">
                                {$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$data.product_id}
                                <span class="icon is-small"><i class="fa fa-fw fa-external-link"></i></span>
                            </a>
                            {/if}
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="control" style="overflow: hidden;">
                {if $is_admin}
                    <a class="button is-danger is-outlined button-delete">
                        <span>このプランを削除</span>
                        <span class="icon is-small">
                            <i class="fa fa-times"></i>
                        </span>
                    </a>
                {/if}
                {if $data.publish_status == 1}
                    {if $is_admin}
                        <a id="private" class="button is-danger is-pulled-right">
                            <span class="icon is-small">
                                <i class="fa fa-check"></i>
                            </span>
                            <span>非公開</span>
                        </a>
                    {/if}
                    <a id="publish" class="button is-info is-pulled-right">
                        <span class="icon is-small">
                            <i class="fa fa-check"></i>
                        </span>
                        <span>公開</span>
                    </a>
                {else}
                    {if $is_admin}
                        <a id="publish" class="button is-info is-pulled-right">
                            <span class="icon is-small">
                                <i class="fa fa-check"></i>
                            </span>
                            <span>公開</span>
                        </a>
                    {else}
                        <a id="request" class="button is-success is-pulled-right">
                            <span class="icon is-small">
                                <i class="fa fa-check"></i>
                            </span>
                            <span>公開リクエスト</span>
                        </a>
                    {/if}
                    <a id="draft" class="button is-primary is-pulled-right">
                        <span class="icon is-small">
                            <i class="fa fa-check"></i>
                        </span>
                        <span>下書き保存</span>
                    </a>
                {/if}

            </div>
        </div>
        <input type="hidden" name="nextsection" />
        <input type="hidden" name="request" />
        <input type="hidden" name="publish_status" value="{$data.publish_status|default:'3'}" />
        <input type="hidden" name="publish_status_pre" value="{$data.publish_status|default:'3'}"/>

    </section>

    <input type="hidden" name="product_id" value="{$data.product_id|default:''}" />
    <input type="hidden" name="person_id" value="{$data.person_id|default:''}" />
</div>
</form>

<div class="status-info section">
    <progress id="progress" class="progress is-success is-small" value="30" max="100">30%</progress>
    <!-- <div class="status has-text-centered">
        <a class="button is-success is-loading">Loading</a>
        <a class="button is-success">
            <span class="icon">
                <i class="fa fa-check"></i>
            </span>
            <span>保存しました</span>
        </a>
        <a class="button is-success">
            <span class="icon">
                <i class="fa fa-check"></i>
            </span>
            <span>リクエストを送信しました</span>
        </a>
        <a class="button is-info">
            <span class="icon is-small">
                <i class="fa fa-check"></i>
            </span>
            <span>公開しました</span>
        </a>
    </div> -->
</div>
<div id="dialog" title="確認"></div>
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
<style>
    #location .conts-body {
        height: auto !important;
    }
    #location .location-map{
        width: 100%;
        height: 300px;
    }
</style>
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

.ui-widget-content[role=dialog] {
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
<script>
  function initMap(box) {
    {/literal}
    var init_lat = {$smarty.const.ADMIN_INIT_LAT};
    var init_lng = {$smarty.const.ADMIN_INIT_LNG};
    {literal}
    var input_pos = box.find('input.coordinate').val().split(',');
    if(input_pos.length > 1) {
        init_lat = input_pos[0];
        init_lng = input_pos[1];
    }

    // マップの初期化
    var init_center = new google.maps.LatLng(init_lat, init_lng);
    var location_map = box.find('.location-map').get(0);
    var map = new google.maps.Map(location_map, {
      zoom: 13,
      center: init_center,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var marker = new google.maps.Marker({
        position: init_center,
        draggable: true,
        map: map
    });

    google.maps.event.addListener( marker, 'dragend', function(ev){
		box.find('.coordinate').val(ev.latLng.lat() + ',' + ev.latLng.lng());
	});

  }

  //$( function() {
  //  initMap();
  //});
  //window.onload = initMap();
</script>
<script>
    /***************************
    並び替え
    ****************************/
    $( function() {
        $( ".sortable" ).sortable({
            handle: ".sortable_button"
        });
        $( ".sortable" ).disableSelection();
        // $( ".button.remove" ).click(function() {
        //     $( this ).parent().remove();
        // });
    } );

    /***************************
    アコーディオン
    ****************************/
    {/literal}
    var start_section = {$data.nextsection};
    {literal}

    function menuScroll(index, adj) {
        var target = $('.js-accordion section:nth-child(' + index + ')');
        var position = target.offset().top + adj;
        $('body,html').animate({scrollTop:position}, 400, 'swing');
    }
    $('.menu-product li:not(last-child) a').click(function(){
        var index = $('.menu-product li').index($(this).parent());
        $('.js-accordion').accordion({
            active: index
        });
        
    });
    var cnt = 0;
    $('.menu-product li:last-child a').click(function(){
        $('.js-accordion').accordion({
            active : false,
            collapsible : true
        });
        if(cnt == 0) {
            cnt++;
            $(this).click();
        }
    });

    $(document).ready( function() {
    	$('.js-accordion').accordion({
            header: ".conts-ttl",
            active: start_section,
            heightStyle: "content",
            collapsible: true,
            icons: {
                header: "ui-icon-pin-w",
                activeHeader: "ui-icon-circle-arrow-s"
            },
            beforeActivate: function(event, ui) {
                //アコーディオンクローズ
                if(ui.oldHeader[0]) {
                    var objOldHeader = $('#' + ui.oldHeader[0].id);
                    objOldHeader.find('i').removeClass('fa-minus-circle');
                    objOldHeader.find('i').addClass('fa-plus-circle');
                    var oldIndex = $('.js-accordion section').index(objOldHeader.parents('section'));
                    $('.menu-product li:nth-child(' + (oldIndex + 1) + ') a').removeClass('is-active');
                } else {
                    $('.menu-product li:last-child a').removeClass('is-active');
                }
                
                //アコーディオンオープン
                if(ui.newHeader[0]) {
                    var objNewHeader = $('#' + ui.newHeader[0].id);
                    objNewHeader.find('i').removeClass('fa-plus-circle');
                    objNewHeader.find('i').addClass('fa-minus-circle');
                    var newIndex = $('.js-accordion section').index(objNewHeader.parents('section'));
                    $('.menu-product li:nth-child(' + (newIndex + 1) + ') a').addClass('is-active');
                } else {
                    $('.menu-product li:last-child a').addClass('is-active');
                }
                if(oldIndex !== undefined && newIndex !== undefined) {
                    if(oldIndex < newIndex) {
                        menuScroll(oldIndex + 1, 55);
                    } else {
                        menuScroll(newIndex, 55);
                    }
                }
            },
            activate: function(event, ui) {
                $('#location_container .box').each(function(){
                    initMap($(this));
                });
            },
            create: function(event, ui) {
                //menuScroll(parseInt(start_section) - 2);
                $('#location_container .box').each(function(){
                    initMap($(this));
                });
            }
        });
        //$('.menu-product li:nth-child(' + start_section + ') a').addClass('is-active');
    });
    $(window).load(function(){
        $('form').animate({opacity: 1}, 300);
        if(start_section > 0) {
            menuScroll(start_section + 1, -5);
        }
        $('.menu-product li:nth-child(' + (start_section + 1) + ') a').addClass('is-active');
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
エリア選択
****************************/
var area = [];
var area_select = [];
{/literal}
{foreach from=ConstantMy::$aryArea key=key item=val}

area.push('{$key}');

{if in_array($key, $data.area)}
area_select.push('{$key}');
{/if}

{/foreach}
{literal}

for($i=0; $i<area.length; $i++) {
    if($.inArray(area[$i], area_select) == -1) {
        $('.area' + area[$i]).hide();
    }
}

$('.area-group').click(function() {
    for($i=0; $i<area.length; $i++) {
        if ($('[data-group=area' + area[$i] + ']').prop('checked')) {
            $('.area' + area[$i]).fadeIn();
        } else {
            $('.area' + area[$i]).fadeOut();
        }
    }
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
        $('.save-point .button').click(function(){
            var next_section = $('.save-point .button').index(this) + 1;

            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('input[name=nextsection]').val(next_section);
            $('form').submit();
        });
        $('#draft').click(function(){
            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('input[name=nextsection]').val('0');
            $('input[name=publish_status_pre]').val('3');
            $('form').submit();
        });
        $('#request').click(function(){
            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('input[name=nextsection]').val('0');
            $('input[name=request]').val('1');
            $('form').submit();
        });
        $('#publish').click(function(){
            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('input[name=nextsection]').val('0');
            $('input[name=publish_status_pre]').val('1');
            $('form').submit();
        });
        $('#private').click(function(){
            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('input[name=nextsection]').val('0');
            $('input[name=publish_status_pre]').val('3');
            $('form').submit();
        });
        $('#post_preview').click(function(){
            $('form').attr('action', '{/literal}{$smarty.const.URL_ROOT_PATH_ADMIN}{literal}preview/');
            $('form').attr('target', '_blank');
            $('form').submit();
        });
        $('a.button-delete').click(function(){
            var params = getDialogParams(function(){
              $('form').append($('<input/>', {type: 'hidden', name: 'proc', value: 'delete'}));
              $('form').submit();
            });
            $("#dialog").html('商品を削除しますか？');
            $("#dialog").dialog(params);
        });
        /***************************
        ファイルのアップロードイベント設定
        fileapi.js
        ****************************/
        var setUploadEvent = function() {
            var fileapi = new FileApi();
            fileapi.setUpload(
                '#main_img',
                'main_image',
                {
                    afterupload : function(response) {
                        if($('#main_img').parent().prevAll('.main-image').length < 5) {
                            $('#main_img').parent().before(response);
                        } else {
                            alert('メイン画像は５枚以下で設定してください。');
                        }
                    }
                }
            );
            $('[id^="course_img"]').each(function(){
                var fileapi = new FileApi();
                var _this = this;
                fileapi.setUpload(
                    _this,
                    'course_image',
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
        /*
        $('#price .add-btn.add-price a').click(function(){
            partsapi.addParts('price', '#price_container', function(){
                $('#price .add-btn.add-condition a').unbind('click');
                $('#price .add-btn.add-condition a').click(function(){
                    partsapi.addParts('price_condition', $(this).parent().prevAll('.price_condition_container'));
                });
            });
        });
        $('#price .add-btn.add-condition a').click(function(){
            partsapi.addParts('price_condition', $(this).parent().prevAll('.price_condition_container'));
        });
        */
        $('#plan_info .add-btn.plan-included a').click(function(){
            partsapi.addParts('plan_info_included', '#plan_included_container');
        });
        $('#product_course .add-btn.product-course a').click(function(){
            partsapi.addParts('product_course', '#product_course_container');
        });
        $('#location .add-btn a').click(function(){
            partsapi.addParts('location', '#location_container', function(){
                $('#location_container > .box').each(function(){
                    initMap($(this));
                });
            });
        });
        $('#caution_other #caution_add a').click(function(){
            partsapi.addParts('caution', '#caution_container');
        });
        $('#caution_other #other_add a').click(function(){
            partsapi.addParts('other', '#other_container');
        });
        $('#product_plan .add-btn a').click(function(){
            partsapi.addParts('product_plan', '#plan_container', setUploadEvent);
            var incre = parseInt($('#plan_container').attr('data-option')) + 1;
            $('#plan_container').attr('data-option', incre);
        });
        $('#cancel .add-btn.cancel_rate a').click(function(){
            partsapi.addParts('cancel_rate', '#cancel_rate_container');
        });
        $('#cancel .add-btn.cancel_note a').click(function(){
            partsapi.addParts('cancel_note', '#cancel_note_container');
        });

        /***************************
        プログレスバー処理
        ****************************/
        var section_count = $('section.input-area').length;
        var input_count = 0;
        $('section.input-area').each(function(){
            $(this).find(':input').each(function() {
                if($(this).val()) {
                    input_count += 1;
                    return false;
                }
            });
        });
        $('#progress').val( (input_count / section_count) * 100 );

    });
</script>
{/literal}



</body>
</html>