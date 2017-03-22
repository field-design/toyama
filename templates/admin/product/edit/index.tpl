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
              <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}product"><span>商品管理</span></a></li>
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
    <section class="input-area message">
        <h2 class="conts-ttl subtitle message-header">
            基本情報
            <span class="icon">
              <i class="fa fa-minus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <label class="label">タイトル</label>
            <p class="control">
                <input name ="title" class="input {if $data.title == ''}is-danger{/if}" type="text" placeholder="例：しんきろうロードサイクリングプラン" value="{$data.title|default:''}">
                {if isset($err_msg.title) && $err_msg.title != ''}
                <span class="error has-icon">{$err_msg.title}</span>
                {/if}
            </p>

            <label class="label">サブタイトル</label>
            <p class="control">
                <input name="SubTitle" class="input" type="text" placeholder="例：蜃気楼ガイドと行く！" value="{$data.SubTitle|default:''}">
            </p>

            <label class="label">説明文</label>
            <p class="control">
                <textarea name="ExplanatoryText" class="textarea {if $data.ExplanatoryText == ''}is-danger{/if}" placeholder="例：蜃気楼が見える街として有名な「魚津市」でのレンタサイクルプラン">{$data.ExplanatoryText|default:''}</textarea>
                {if isset($err_msg.ExplanatoryText) && $err_msg.ExplanatoryText != ''}
                <span class="error has-icon">{$err_msg.ExplanatoryText}</span>
                {/if}
            </p>

            <label class="label">
                メイン画像
                <span class="help">横幅1,000px以上の画像を登録してください。</span>
            </label>
            {foreach from=$data.main_photo item=url}
                {if $url != ''}
                {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_main_image.tpl' main_photo_url=$url}
                {/if}
            {/foreach}
            <p class="control">
                <label class="button {if $data.main_photo|implode:'' == ''}is-danger{/if}" for="main_img">画像を追加</label>
                <input type="file" name="main_img" id="main_img" style="display:none;">
                {if isset($err_msg.main_photo) && $err_msg.main_photo != ''}
                <span class="error has-icon">{$err_msg.main_photo}</span>
                {/if}
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

    <section id="price" class="input-area price message">
        <h2 class="conts-ttl subtitle message-header">
            料金
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <label class="label">料金
                <span class="help">最大5件まで追加可能</span>
            </label>
            <div id="price_container">
                {section name=i start=0 loop=count($data.plan_title)}
                    {assign var='index' value=$smarty.section.i.index}
                    {if $index == 0 || $data.plan_title[$index] != '' || $data.plan_Fee[$index] != '' || $data.plan_Kind[$index]}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_price.tpl' plan_title=$data.plan_title[$index] plan_Fee=$data.plan_Fee[$index] plan_Kind=$data.plan_Kind[$index] }
                    {/if}
                {/section}
            </div>
            {if isset($err_msg.plan_Fee) && $err_msg.plan_Fee != ''}
            <span class="error has-icon">{$err_msg.plan_Fee}</span>
            {/if}
            <p class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>料金を追加</span>
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

    <section class="input-area calendar message">
        <h2 class="conts-ttl subtitle message-header">
            カレンダー
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">

            <div class="control">
                <label class="label">プランの種類</label>
                <p class="control">
                    <label class="radio">
                        <input type="radio" name="plan_type" value="1" {if $data.plan_type==1}checked="checked"{/if}> 通常プラン
                    </label>
                    <label class="radio">
                        <input type="radio" name="plan_type" value="2" {if $data.plan_type==2}checked="checked"{/if}> リクエストプラン
                    </label>
                </p>
            </div>

            <hr>

            <div class="calendar-wrap">
                <label class="label">
                    在庫設定
                    <span class="help">各日程に在庫を入力してください。</span>
                </label>

                <div class="input-table">
                    <div class="control is-grouped">
                        <p class="control has-addons">
                            <a id="stock_calendar_current" class="button">
                              <span>今月</span>
                            </a>
                        </p>
                        <p class="control has-addons">
                            <a id="stock_calendar_prev" class="button">
                              <span class="icon">
                                <i class="fa fa-angle-left"></i>
                              </span>
                            </a>
                            <a id="stock_calendar_picker" class="button">
                              <span>2017年3月</span>
                            </a>
                            <a id="stock_calendar_next" class="button">
                              <span class="icon">
                                <i class="fa fa-angle-right"></i>
                              </span>
                            </a>
                        </p>
                    </div>
                    <div id="stock_calendars">
                    </div>
                    <p id="calen_input_all" class="control has-addons">
                      <input class="input has-text-centered" type="number" placeholder="" min="0">
                      <a class="button">
                        一括入力
                      </a>
                    </p>
                </div>
                
            </div>

            <hr>

            <div class="control">
                <label class="label">
                    手仕舞い日（申込締切日）
                    <span class="help">当日の場合は0日前と入力してください。</span>
                </label>
                <div class="">
                    <p class="control has-addons">
                      <input class="input {if $data.ClosingOut_date == ''}is-danger{/if}" name="ClosingOut_date" type="number" min="0" placeholder="例：3" value="{$data.ClosingOut_date|default:''}">
                      <span class="button is-disabled">日前</span>
                      <input class="input js-timepicker" name="ClosingOut_time" type="text" placeholder="時間" value="{$data.ClosingOut_time|default:''}">
                      <span class="button is-disabled">時まで</span>
                    </p>
                    {if isset($err_msg.ClosingOut_date) && $err_msg.ClosingOut_date != ''}
                    <span class="error has-icon">{$err_msg.ClosingOut_date}</span>
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

    <section id="product_course" class="input-area message plan-detail">
        <h2 class="conts-ttl subtitle message-header">
            コースの内容
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <div id="course_container" class="control sortable">
                {section name=i start=0 loop=count($data.CourseTitle)}
                    {assign var='index' value=$smarty.section.i.index}
                    {assign var='err_msg_CourseTitle' value='CourseTitle'|cat:$index}
                    {if !isset($err_msg.$err_msg_CourseTitle)}
                        {$err_msg.$err_msg_CourseTitle = ''}
                    {/if}
                    {if $index == 0 || $data.photo[$index] != '' || $data.CourseTitle[$index] != '' || $data.CourseDetail[$index] != '' || $data.CourseRink[$index] != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_course.tpl' number=$index+1 photo=$data.photo[$index] title=$data.CourseTitle[$index] detail=$data.CourseDetail[$index] link=$data.CourseRink[$index] err_msg=$err_msg.$err_msg_CourseTitle}
                    {/if}
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

    <section id="plan_info" class="input-area message">
        <h2 class="conts-ttl subtitle message-header">
            プラン情報
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <label class="label">期間</label>
            <div class="control is-grouped">
                <p class="control has-icon has-icon-right is-expanded">
                    <input name="StartDate" class="input {if $data.StartDate == ''}is-danger{/if} js-datepicker" type="text" placeholder="開始日" value="{$data.StartDate|default:''}">
                    <span class="icon is-small">
                      <i class="fa fa-calendar"></i>
                    </span>
                    {if isset($err_msg.StartDate) && $err_msg.StartDate != ''}
                    <span class="error has-icon">{$err_msg.StartDate}</span>
                    {/if}
                </p>
                <p class="control has-icon has-icon-right is-expanded">
                    <input name="EndDate" class="input {if $data.EndDate == ''}is-danger{/if} js-datepicker" type="text" placeholder="終了日" value="{$data.EndDate|default:''}">
                    <span class="icon is-small">
                      <i class="fa fa-calendar"></i>
                    </span>
                    {if isset($err_msg.EndDate) && $err_msg.EndDate != ''}
                    <span class="error has-icon">{$err_msg.EndDate}</span>
                    {/if}
                </p>
            </div>

            <label class="label">除外日</label>
            <p class="control">
                <textarea name="WhetExclusion" class="textarea" placeholder="例：2016年12月28日～2017年1月5日">{$data.WhetExclusion|default:''}</textarea>
            </p>

            <label class="label">ご旅行・プラン代金に含まれるもの
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="plan_included_container" class="control sortable">
                {foreach from=$data.plan_included item=value name=count}
                    {if $smarty.foreach.count.index == 0 || $value != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_single.tpl' placeholder='例：タクシー乗車代' input_name='plan_included[]' value=$value}
                    {/if}
                {/foreach}
            </div>
            <p class="control add-btn">
              <a class="button is-primary">
                <span class="icon">
                  <i class="fa fa-plus-circle"></i>
                </span>
                <span>行を追加</span>
              </a>
            </p>

            <div class="columns">
                <div class="column">
                    <label class="label">最少受付人員</label>
                    <p class="control has-icon has-icon-right">
                        <input name="minimumMember" class="input {if $data.minimumMember == ''}is-danger{/if}" type="text" placeholder="例：2" value="{$data.minimumMember|default:''}">
                        <span class="icon is-small">
                          名
                        </span>
                        {if isset($err_msg.minimumMember) && $err_msg.minimumMember != ''}
                        <span class="error has-icon">{$err_msg.minimumMember}</span>
                        {/if}
                    </p>
                </div>
                <div class="column">
                    <label class="label">最少催行人員</label>
                    <p class="control has-icon has-icon-right">
                        <input name="minimumDeparts" class="input {if $data.minimumDeparts == ''}is-danger{/if}" type="text" placeholder="例：2" value="{$data.minimumDeparts|default:''}">
                        <span class="icon is-small">
                          名
                        </span>
                        {if isset($err_msg.minimumDeparts) && $err_msg.minimumDeparts != ''}
                        <span class="error has-icon">{$err_msg.minimumDeparts}</span>
                        {/if}
                    </p>
                </div>
                <div class="column">
                    <label class="label">最大申込人員</label>
                    <p class="control has-icon has-icon-right">
                        <input name="largestMember" class="input {if $data.largestMember == ''}is-danger{/if}" type="text" placeholder="例：9" value="{$data.largestMember|default:''}">
                        <span class="icon is-small">
                          名
                        </span>
                        {if isset($err_msg.largestMember) && $err_msg.largestMember != ''}
                        <span class="error has-icon">{$err_msg.largestMember}</span>
                        {/if}
                    </p>
                </div>
            </div>

            <label class="label">運行会社</label>
            <p class="control">
                <input name="Operation" class="input" type="text" placeholder="例：〇〇交通" value="{$data.Operation|default:''}">
            </p>

            <label class="label">予約締切</label>
            <p class="control">
                <input name="contractDead" class="input {if $data.contractDead == ''}is-danger{/if}" type="text" placeholder="例：ご旅行出発日前日の０時間前" value="{$data.contractDead|default:''}">
                {if isset($err_msg.contractDead) && $err_msg.contractDead != ''}
                <span class="error has-icon">{$err_msg.contractDead}</span>
                {/if}
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

    <section class="input-area message">
        <h2 class="conts-ttl subtitle message-header">
            集合場所
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <label class="label">集合場所</label>
            <p class="control">
                <input name="locationname" class="input {if $data.locationname == ''}is-danger{/if}" type="text" placeholder="例：JR富山駅 新幹線改札前　9:20集合" value="{$data.locationname|default:''}">
                {if isset($err_msg.locationname) && $err_msg.locationname != ''}
                <span class="error has-icon">{$err_msg.locationname}</span>
                {/if}
            </p>

            <label class="label">座標</label>
            <span class="help">地図のピンを動かして位置を調整してください。</span>
            <div id="location-map"></div>
            <p class="control">
                <input id="coordinate" name="Coordinate" class="input" type="text" value="{$data.Coordinate|default:''}">
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
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="caution_container" class="control sortable">
                {foreach from=$data.importantPoints item=value name=count}
                    {if $smarty.foreach.count.index == 0 || $value != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_multi.tpl' placeholder='例：おとな1名 こども1名でお申込みの場合は、おとな2名での価格として取り扱いさせていただきます。' input_name='importantPoints[]' value=$value}
                    {/if}
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
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="other_container" class="control sortable">
                {foreach from=$data.Other item=value name=count}
                    {if $smarty.foreach.count.index == 0 || $value != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_multi.tpl' placeholder='例：ます寿し1/8カットサイズの試食ができます。店舗は当日のお任せになります。' input_name='Other[]' value=$value}
                    {/if}
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

    <section class="input-area category message">
        <h2 class="conts-ttl subtitle message-header">
            エリア・カテゴリ
            <span class="icon">
              <i class="fa fa-plus-circle"></i>
            </span>
        </h2>
        <div class="conts-body message-body">
            <label class="label">
                エリア
                <span class="help">複数選択可能</span>
            </label>
            <p class="control">
              <label class="checkbox">
                <input type="checkbox" name="area[]" value="1" {if in_array('1', $data.area)}checked='checked'{/if}>
                魚津市
              </label>
              <label class="checkbox">
                <input type="checkbox" name="area[]" value="2" {if in_array('2', $data.area)}checked='checked'{/if}>
                黒部市
              </label>
              <label class="checkbox">
                <input type="checkbox" name="area[]" value="3" {if in_array('3', $data.area)}checked='checked'{/if}>
                入善町
              </label>
              <label class="checkbox">
                <input type="checkbox" name="area[]" value="4" {if in_array('4', $data.area)}checked='checked'{/if}>
                朝日町
              </label>
            </p>

            <label class="label">
                カテゴリ
                <span class="help">複数選択可能</span>
            </label>
            <p class="control">
              <label class="checkbox">
                <input type="checkbox" name="Category[]" value="1" {if in_array('1', $data.Category)}checked='checked'{/if}>
                体験する
              </label>
              <label class="checkbox">
                <input type="checkbox" name="Category[]" value="2" {if in_array('2', $data.Category)}checked='checked'{/if}>
                見る
              </label>
              <label class="checkbox">
                <input type="checkbox" name="Category[]" value="3" {if in_array('3', $data.Category)}checked='checked'{/if}>
                食べる
              </label>
              <label class="checkbox">
                <input type="checkbox" name="Category[]" value="4" {if in_array('4', $data.Category)}checked='checked'{/if}>
                買う
              </label>
            </p>
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
                            {$data.mt_disp_text|default:''}
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
                                <input name="date[]" class="input js-datepicker {if $data.date[0] == ''}is-danger{/if}" type="text" placeholder="公開日" value="{$data.date[0]|default:''}">
                                <input name="date[]" class="input js-timepicker {if $data.date[1] == ''}is-danger{/if}" type="text" placeholder="時間" value="{$data.date[1]|default:''}">
                            </p>
                            {if isset($err_msg.date) && $err_msg.date != ''}
                            <span class="error has-icon">{$err_msg.date}</span>
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
                            {if $data.mt_disp == 1}
                            <a href="{$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH}niikawa/plan/?ProductID={$data.ProductID}" target="_blank">
                                {$protocol}{$smarty.server.SERVER_NAME}{$smarty.const.URL_ROOT_PATH}niikawa/plan/?ProductID={$data.ProductID}
                                <span class="icon is-small"><i class="fa fa-fw fa-external-link"></i></span>
                            </a>
                            {/if}
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="control" style="overflow: hidden;">
                {if $is_admin}
                    <a class="button is-danger is-outlined">
                        <span>このプランを削除</span>
                        <span class="icon is-small">
                            <i class="fa fa-times"></i>
                        </span>
                    </a>
                {/if}
                {if $data.mt_disp == 1}
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
        <input type="hidden" name="mt_disp" value="{$data.mt_disp|default:'3'}" />
        <input type="hidden" name="mt_disp_pre" value="{$data.mt_disp|default:'3'}"/>

    </section>

    <input type="hidden" name="ProductID" value="{$data.ProductID|default:''}" />
    <input type="hidden" name="PersonID" value="{$data.PersonID|default:''}" />
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
    {/literal}
    var init_lat = {$smarty.const.ADMIN_INIT_LAT};
    var init_lng = {$smarty.const.ADMIN_INIT_LNG};
    {literal}
    var input_pos = $('#coordinate').val().split(',');
    if(input_pos.length > 1) {
        init_lat = input_pos[0];
        init_lng = input_pos[1];
    }

    // マップの初期化
    var init_center = new google.maps.LatLng(init_lat, init_lng);
    var map = new google.maps.Map(document.getElementById('location-map'), {
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
		$('#coordinate').val(ev.latLng.lat() + ',' + ev.latLng.lng());
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
        $( ".sortable" ).sortable();
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

    function menuScroll(index) {
        var target = $('.js-accordion section:nth-child(' + index + ')');
        var position = target.offset().top + 45;
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
                        menuScroll(oldIndex + 1);
                    } else {
                        menuScroll(newIndex);
                    }
                }
            },
            activate: function(event, ui) {
                initMap();
            }
        });
        //$('.menu-product li:nth-child(' + start_section + ') a').addClass('is-active');
    });
    $(window).load(function(){
        $('form').animate({opacity: 1}, 300);
        if(start_section > 0) {
            menuScroll(start_section + 1);
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
            $('input[name=mt_disp_pre]').val('3');
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
            $('input[name=mt_disp_pre]').val('1');
            $('form').submit();
        });
        $('#private').click(function(){
            $('form').attr('action', location.pathname);
            $('form').attr('target', '');
            $('input[name=nextsection]').val('0');
            $('input[name=mt_disp_pre]').val('3');
            $('form').submit();
        });
        $('#post_preview').click(function(){
            $('form').attr('action', '{/literal}{$smarty.const.URL_ROOT_PATH_ADMIN}{literal}preview/');
            $('form').attr('target', '_blank');
            $('form').submit();
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
        $('#price .add-btn a').click(function(){
            partsapi.addParts('price', '#price_container');
        });
        $('#product_course .add-btn a').click(function(){
            partsapi.addParts('product_course', '#course_container', setUploadEvent);
        });
        $('#plan_info .add-btn a').click(function(){
            partsapi.addParts('plan_info', '#plan_included_container');
        });
        $('#caution_other #caution_add a').click(function(){
            partsapi.addParts('caution', '#caution_container');
        });
        $('#caution_other #other_add a').click(function(){
            partsapi.addParts('other', '#other_container');
        });
        /***************************
        カレンダー設定
        stockmanager.js
        ****************************/
        var stockmanager = new StockManager();
        stockmanager.setButton('#stock_calendar_picker');
        {/literal}
        {foreach from=$data.stock_calen_ym item=ym}
            {assign var='stock_calen_data' value='stock_calen_data_'|cat:$ym}
            var data = {$data.$stock_calen_data|@json_encode};
            var dt = new Date('{$ym|substr:0:4}/{$ym|substr:4:6}/01');
		    stockmanager.changeCalendar(dt, data);
        {/foreach}
        {literal}
        $('#calen_input_all a').click(function(){
            $('#stock_calendars > div').each(function(){
                if($(this).css('opacity') == 1) {
                    $(this).find('td input').val($('#calen_input_all input').val());
                    return false;
                }
            });
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