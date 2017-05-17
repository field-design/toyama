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

    <section class="profile">
        <h2 class="conts-ttl subtitle">
            会社情報
        </h2>

        <div class="control">
            <label class="label">会社名<span class="must">必須</span></label>
            <p class="control">
            <input name="company_name" class="input {if $data.company_name == ''}is-danger{/if}" type="text" placeholder="例：株式会社観光販売システムズ" value="{$data.company_name|default:''}">
            {if isset($err_msg.company_name) && $err_msg.company_name != ''}
            <span class="error has-icon">{$err_msg.company_name}</span>
            {/if}
            </p>
        </div>

        <div class="control">
            <label class="label">表示名</label>
            <p class="control">
                <input name="display_name" class="input is-outlined" type="text" placeholder="例：観光販売システムズ" value="{$data.display_name|default:''}">
            </p>
        </div>

        <div class="control">
            <label class="label">画像</label>
            <p class="control">
                <label class="button is-outlined" for="main_img"><i class="fa fa-fw fa-picture-o"></i>画像を選択してください</label>
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
                <label class="button is-outlined" for="logo_img"><i class="fa fa-fw fa-picture-o"></i>画像を選択してください</label>
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
            <label class="label">郵便番号<span class="must">必須</span></label>
            <div class="control is-horizontal">
                <div class="control is-grouped">
                    <p class="control is-expanded">
                        <input name="zipcode[]" class="input {if $data.zipcode[0] == ''}is-danger{/if}" type="number" min="0" placeholder="例：123" value="{$data.zipcode[0]|default:''}" />
                        {if isset($err_msg.zipcode) && $err_msg.zipcode != ''}
                        <span class="error has-icon">{$err_msg.zipcode}</span>
                        {/if}
                    </p>
                    <p class="control is-expanded">
                        <input name="zipcode[]" class="input {if $data.zipcode[1] == ''}is-danger{/if}" type="number" min="0" placeholder="例：4567" value="{$data.zipcode[1]|default:''}" />
                    </p>
                </div>
            </div>

            <label class="label">都道府県<span class="must">必須</span></label>
            <p class="control">
            <span class="select">
                <select name="pref" class="{if $data.pref == ''}is-danger{/if}">
                    <option value="">都道府県</option>
                    {foreach from=$const_pref item=pref key=key}
                    <option value="{$pref}" {if $data.pref==$pref}selected{/if}>{$pref}</option>
                    {/foreach}
                </select>
            </span>
            {if isset($err_msg.pref) && $err_msg.pref != ''}
            <span class="error has-icon">{$err_msg.pref}</span>
            {/if}
            </p>

            <label class="label">市区町村、丁目・番地、ビル・マンション名等<span class="must">必須</span></label>
            <p class="control">
                <input name="address" class="input {if $data.address == ''}is-danger{/if}" type="text" placeholder="例：〇〇市〇〇 1丁目123 〇〇ビル101" value="{$data.address|default:''}" />
                {if isset($err_msg.address) && $err_msg.address != ''}
                <span class="error has-icon">{$err_msg.address}</span>
                {/if}
            </p>
        </div>

        <hr>

        <div class="control">
            <label class="label">電話番号</label>
            <div class="control is-horizontal">
                <div class="control is-grouped">
                    <p class="control is-expanded">
                        <input name="tel_[]" class="input {if $data.tel_[0] == ''}is-danger{/if} is-outlined" type="number" min="0" placeholder="例：123" value="{$data.tel_[0]|default:''}" />
                        {if isset($err_msg.tel_) && $err_msg.tel_ != ''}
                        <span class="error has-icon">{$err_msg.tel_}</span>
                        {/if}
                    </p>
                    <p class="control is-expanded">
                        <input name="tel_[]" class="input {if $data.tel_[1] == ''}is-danger{/if} is-outlined" type="number" min="0" placeholder="例：4567" value="{$data.tel_[1]|default:''}" />
                    </p>
                    <p class="control is-expanded">
                        <input name="tel_[]" class="input {if $data.tel_[2] == ''}is-danger{/if} is-outlined" type="number" min="0" placeholder="例：8901" value="{$data.tel_[2]|default:''}" />
                    </p>
                </div>
            </div>
        </div>

        <div class="control">
            <label class="label">FAX番号</label>
            <div class="control is-horizontal">
                <div class="control is-grouped">
                    <p class="control is-expanded">
                        <input name="fax_[]" class="input" type="number" min="0" placeholder="例：123" value="{$data.fax_[0]|default:''}" />
                    </p>
                    <p class="control is-expanded">
                        <input name="fax_[]" class="input" type="number" min="0" placeholder="例：4567" value="{$data.fax_[1]|default:''}" />
                    </p>
                    <p class="control is-expanded">
                        <input name="fax_[]" class="input" type="number" min="0" placeholder="例：8901" value="{$data.fax_[2]|default:''}" />
                    </p>
                </div>
            </div>
        </div>

        <div class="control">
            <label class="label">営業時間</label>
            <p class="control">
            <input name="service_time" class="input {if $data.service_time == ''}is-danger{/if}" type="text" placeholder="例：平日9:00〜17:00" value="{$data.service_time|default:''}" />
            {if isset($err_msg.service_time) && $err_msg.service_time != ''}
            <span class="error has-icon">{$err_msg.service_time}</span>
            {/if}
            </p>
        </div>

        <hr>

        <div class="control">
            <label class="label">ホームページ URL</label>
            <p class="control">
            <input name="website_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.website_url|default:''}" />
            </p>
        </div>

        <div class="control">
            <label class="label">Facebookページ URL</label>
            <p class="control">
            <input name="facebook_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.facebook_url|default:''}" />
            </p>
        </div>

        <div class="control">
            <label class="label">Twitter URL</label>
            <p class="control">
            <input name="twitter_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.twitter_url|default:''}" />
            </p>
        </div>

        <div class="control">
            <label class="label">Instagram URL</label>
            <p class="control">
            <input name="instagram_url" class="input" type="text" placeholder="例：http://example.com" value="{$data.instagram_url|default:''}" />
            </p>
        </div>

        <hr>

    </section>

    <hr>

    <section class="staff">
        <h2 class="conts-ttl subtitle">
            担当者情報
        </h2>

        <div class="control">
            <label class="label">担当者名<span class="must">必須</span></label>
            <div class="control is-horizontal">
                <div class="control is-grouped">
                    <p class="control is-expanded">
                        <input name="name01" class="input {if $data.name01 == ''}is-danger{/if} is-outlined" type="text" placeholder="姓" value="{$data.name01|default:''}" />
                        {if isset($err_msg.name01) && $err_msg.name01 != ''}
                        <span class="error has-icon">{$err_msg.name01}</span>
                        {/if}
                    </p>
                    <p class="control is-expanded">
                        <input name="name02" class="input {if $data.name02 == ''}is-danger{/if} is-outlined" type="text" placeholder="名" value="{$data.name02|default:''}" />
                        {if isset($err_msg.name02) && $err_msg.name02 != ''}
                        <span class="error has-icon">{$err_msg.name02}</span>
                        {/if}
                    </p>
                </div>
            </div>
        </div>

        <div class="control">
            <label class="label">フリガナ<span class="must">必須</span></label>
            <div class="control is-horizontal">
                <div class="control is-grouped">
                    <p class="control is-expanded">
                        <input name="kana01" class="input {if $data.kana01 == ''}is-danger{/if}" type="text" placeholder="セイ" value="{$data.kana01|default:''}" />
                        {if isset($err_msg.kana01) && $err_msg.kana01 != ''}
                        <span class="error has-icon">{$err_msg.kana01}</span>
                        {/if}
                    </p>
                    <p class="control is-expanded">
                        <input name="kana02" class="input {if $data.kana02 == ''}is-danger{/if}" type="text" placeholder="メイ" value="{$data.kana02|default:''}" />
                        {if isset($err_msg.kana02) && $err_msg.kana02 != ''}
                        <span class="error has-icon">{$err_msg.kana02}</span>
                        {/if}
                    </p>
                </div>
            </div>
        </div>

        <div class="control">
            <label class="label">メールアドレス<span class="must">必須</span></label>
            <p class="control">
                <input name="email" class="input {if $data.email == ''}is-danger{/if} is-outlined" type="email" placeholder="例：sample@firld-desing.jp" value="{$data.email|default:''}" />
                {if isset($err_msg.email) && $err_msg.email != ''}
                <span class="error has-icon">{$err_msg.email}</span>
                {/if}
            </p>
        </div>
    </section>

    <hr>

    <section class="agency">
        <h2 class="conts-ttl subtitle">
            旅行業について
        </h2>

        <div class="control">
            <label class="label">旅行業に基づく旅行商品の取り扱い<span class="must">必須</span></label>
            <p class="control">
                <label class="radio">
                    <input type="radio" name="agency" value="1" {if $data.agency==1}checked='checked'{/if}> 取り扱いあり
                </label>
                <label class="radio">
                    <input type="radio" name="agency" value="0" {if $data.agency==0}checked='checked'{/if}> 取り扱いなし
                </label>
            </p>
        </div>

        <div class="travel-agency-input">
            <div class="control">

                <label class="label">登録先<span class="must">必須</span></label>
                <p class="control">
                  <span class="select">
                    <select name="Registered" class="{if $data.Registered == ''}is-danger{/if}">
                        <option value="" selected>選択してください</option>
                        {foreach from=ConstantMy::$aryGovernor item=item key=key}
                        <option value="{$key}" {if $data.Registered==$key}selected{/if}>{$item}</option>                                       
                        {/foreach}
                    </select>
                  </span>
                  {if isset($err_msg.Registered) && $err_msg.Registered != ''}
                  <span class="error has-icon">{$err_msg.Registered}</span>
                  {/if}
                </p>

                <label class="label">企画旅行業者の登録番号<span class="must">必須</span></label>
                <p class="control has-addons">
                    <span class="select">
                      <select name="Travel" class="{if $data.Travel == ''}is-danger{/if}">
                          <option value="" selected>選択してください</option>
                          {foreach from=ConstantMy::$aryTravel item=item key=key}
                          <option value="{$key}" {if $data.Travel==$key}selected{/if}>{$item}</option>                                       
                          {/foreach}
                      </select>
                    </span>
                    <span class="button is-disabled">第</span>
                    <input name="projectNumber" class="input {if $data.projectNumber == ''}is-danger{/if}" type="number" placeholder="例：1" value="{$data.projectNumber|default:''}"/>
                    <span class="button is-disabled">号</span>
                    {if isset($err_msg.Travel) && $err_msg.Travel != ''}
                    <span class="error has-icon" style="margin-left:10px;">{$err_msg.Travel}</span>
                    {elseif isset($err_msg.projectNumber) && $err_msg.projectNumber != ''}
                    <span class="error has-icon" style="margin-left:10px;">{$err_msg.projectNumber}</span>
                    {/if}
                </p>

                <label class="label">氏名又は名称<span class="must">必須</span></label>
                <p class="control">
                    <input name="marketer_type" class="input {if $data.marketer_type == ''}is-danger{/if}" type="text" placeholder="例：観光販売システムズ" value="{$data.marketer_type|default:''}"/>
                    {if isset($err_msg.marketer_type) && $err_msg.marketer_type != ''}
                    <span class="error has-icon">{$err_msg.marketer_type}</span>
                    {/if}
                </p>

                <label class="label">本社所在地<span class="must">必須</span></label>
                <p class="control">
                    <input name="projectAddress" class="input {if $data.projectAddress == ''}is-danger{/if}" type="text" placeholder="例：愛知県名古屋市中村区名駅3丁目21番7号　名古屋三交ビル9階" value="{$data.projectAddress|default:''}"/>
                    {if isset($err_msg.projectAddress) && $err_msg.projectAddress != ''}
                    <span class="error has-icon">{$err_msg.projectAddress}</span>
                    {/if}
                </p>

                <label class="label">旅行取扱管理者<span class="must">必須</span></label>
                <p class="control">
                    <input name="TravelAdmin" class="input {if $data.TravelAdmin == ''}is-danger{/if}" type="text" placeholder="例：観光 健斗" value="{$data.TravelAdmin|default:''}"/>
                    {if isset($err_msg.TravelAdmin) && $err_msg.TravelAdmin != ''}
                    <span class="error has-icon">{$err_msg.TravelAdmin}</span>
                    {/if}
                </p>

                <label class="label">営業所1</label>
                <p class="control">
                    <input name="SalesOffice1" class="input" type="text" placeholder="例：愛知県名古屋市中村区名駅3丁目21番7号　名古屋三交ビル9階" value="{$data.SalesOffice1|default:''}"/>
                </p>

                <label class="label">営業所2</label>
                <p class="control">
                    <input name="SalesOffice2" class="input" type="text" placeholder="例：愛知県名古屋市中村区名駅3丁目21番7号　名古屋三交ビル9階" value="{$data.SalesOffice2|default:''}"/>
                </p>

                <label class="label">営業所3</label>
                <p class="control">
                    <input name="SalesOffice3" class="input" type="text" placeholder="例：愛知県名古屋市中村区名駅3丁目21番7号　名古屋三交ビル9階" value="{$data.SalesOffice3|default:''}"/>
                </p>

                <label class="label">約款<span class="must">必須</span></label>
                <p class="control">
                    <label class="radio">
                        <input type="radio" name="Clause" value="1" {if $data.Clause==1}checked='checked'{/if}> 標準旅行業約款を使用する
                    </label>
                    <label class="radio">
                        <input type="radio" name="Clause" value="2" {if $data.Clause==2}checked='checked'{/if}> PDFファイルをアップロードする
                    </label>
                    <label class="radio">
                        <input type="radio" name="Clause" value="3" {if $data.Clause==3}checked='checked'{/if}> URLリンクを入力する
                    </label>
                </p>

                <div class="control agreement-pdf">
                    <label class="label">約款 PDF<span class="must">必須</span></label>
                    <p class="control">
                        <label class="button is-outlined" for="pdf_file2">ファイルを選択してください</label>
                        <input type="file" name="pdf_file2" id="pdf_file2" style="display:none;">
                    </p>
                    {if $data.file2 != ''}
                        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_pdf_file.tpl' input_name="file2" url=$data.file2}
                    {/if}
                    {if isset($err_msg.file2) && $err_msg.file2 != ''}
                    <div><span class="error has-icon">{$err_msg.file2}</span></div>
                    {/if}
                </div>

                <div class="control agreement-url">
                    <label class="label">約款 URL<span class="must">必須</span></label>
                    <p class="control">
                      <input name="ClauseURL" class="input {if $data.ClauseURL == ''}is-danger{/if}" type="text" placeholder="例：http://example.com" value="{$data.ClauseURL|default:''}"/>
                      {if isset($err_msg.ClauseURL) && $err_msg.ClauseURL != ''}
                      <span class="error has-icon">{$err_msg.ClauseURL}</span>
                      {/if}
                    </p>
                </div>

                <label class="label">旅行条件書<span class="must">必須</span></label>
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
                        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_pdf_file.tpl' input_name="file" url=$data.file}
                    {/if}
                </div>

                <div class="control condition-url">
                    <label class="label">旅行条件書 URL</label>
                    <p class="control">
                    <input class="input {if $data.condition_url == ''}is-danger{/if}" name="condition_url" type="text" placeholder="例：http://example.com" value="{$data.condition_url|default:''}">
                    {if isset($err_msg.condition_url) && $err_msg.condition_url != ''}
                    <span class="error has-icon">{$err_msg.condition_url}</span>
                    {/if}
                    </p>
                </div>

                <label class="label">プライバシーポリシー<span class="must">必須</span></label>
                <p class="control">
                    <label class="radio">
                        <input type="radio" name="privacypolicy" value="1" {if $data.privacypolicy==1}checked="checked"{/if} /> PDFファイルをアップロードする
                    </label>
                    <label class="radio">
                        <input type="radio" name="privacypolicy" value="2" {if $data.privacypolicy==2}checked="checked"{/if} /> URLリンクを入力する
                    </label>
                </p>

                <div class="control policy-pdf">
                    <label class="label">プライバシーポリシー PDF</label>
                    <p class="control">
                        <label class="button is-outlined" for="pdf_file3">ファイルを選択してください</label>
                        <input type="file" name="pdf_file3" id="pdf_file3" style="display:none;">
                    </p>
                    {if $data.file3 != ''}
                        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_pdf_file.tpl' input_name="file3" url=$data.file3}
                    {/if}
                </div>

                <div class="control policy-url">
                    <label class="label">プライバシーポリシー URL<span class="must">必須</span></label>
                    <p class="control">
                      <input name="PrivacyURL" class="input {if $data.PrivacyURL == ''}is-danger{/if}" type="text" placeholder="例：http://example.com" value="{$data.PrivacyURL|default:''}"/>
                      {if isset($err_msg.PrivacyURL) && $err_msg.PrivacyURL != ''}
                      <span class="error has-icon">{$err_msg.PrivacyURL}</span>
                      {/if}
                    </p>
                </div>

                <label class="label">旅行業務取扱料金表<span class="must">必須</span></label>
                <p class="control">
                    <label class="radio">
                        <input type="radio" name="TravelPriceList" value="1" {if $data.TravelPriceList==1}checked="checked"{/if} /> PDFファイルをアップロードする
                    </label>
                    <label class="radio">
                        <input type="radio" name="TravelPriceList" value="2" {if $data.TravelPriceList==2}checked="checked"{/if} /> URLリンクを入力する
                    </label>
                </p>

                <div class="control charges-pdf">
                    <label class="label">旅行業務取扱料金表 PDF<span class="must">必須</span></label>
                    <p class="control">
                        <label class="button is-outlined" for="pdf_file4">ファイルを選択してください</label>
                        <input type="file" name="pdf_file4" id="pdf_file4" style="display:none;">
                    </p>
                    {if $data.file4 != ''}
                        {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_pdf_file.tpl' input_name="file4" url=$data.file4}
                    {/if}
                </div>

                <div class="control charges-url">
                    <label class="label">旅行業務取扱料金表 URL<span class="must">必須</span></label>
                    <p class="control">
                      <input name="PricelistURL" class="input {if $data.PricelistURL == ''}is-danger{/if}" type="text" placeholder="例：http://example.com" value="{$data.PricelistURL|default:''}"/>
                      {if isset($err_msg.PricelistURL) && $err_msg.PricelistURL != ''}
                      <span class="error has-icon">{$err_msg.PricelistURL}</span>
                      {/if}
                    </p>
                </div>

                <label class="label">加入旅行業協会名（加入会社のみ）</label>
                <p class="control">
                    <input name="projectName" class="input" type="text" placeholder="例：一般社団法人日本旅行業協会（JATA）正会員" value="{$data.projectName|default:''}"/>
                </p>
            </div>
        </div>
    </section>

    <hr>

    <section id="cancel" class="cancel">
        <h2 class="conts-ttl subtitle">
            取消料
        </h2>
        <div class="conts-body">

            <label class="label">
                料率<span class="must">必須</span>
                <span class="help">最大10件まで追加可能</span>
            </label>
            <div id="cancel_container" class="sortable">
                {section name=i start=0 loop=count($data.mt_cancel_text)}
                    {assign var='index' value=$smarty.section.i.index}
                    {if $index == 0 || $data.mt_cancel_text[$index] != ''}
                    {include file=$smarty.const.ADMIN_DIR|cat:'addparts/settings_cancel.tpl' MtCancelRatio=$data.MtCancelRatio[$index] mt_cancel_text=$data.mt_cancel_text[$index]}
                    {/if}
                {/section}
            </div>
            {if isset($err_msg.mt_cancel_text) && $err_msg.mt_cancel_text != ''}
            <div><span class="error has-icon">{$err_msg.mt_cancel_text}</span></div>
            {/if}
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

    <section class="payment">
        <h2 class="conts-ttl subtitle">
            決済関連設定
        </h2>

        <label class="label">取扱決済<span class="must">必須</span></label>
        <p class="control">
            <label class="checkbox">
                <input type="checkbox" class="settlement" name="settlement[]" value="1" {if in_array('1', $data.settlement)}checked="checked"{/if} /> クレジットカード
            </label>
            <label class="checkbox">
                <input type="checkbox" class="settlement" name="settlement[]" value="2" {if in_array('2', $data.settlement)}checked="checked"{/if} /> コンビニ
            </label>
            {if isset($err_msg.settlement) && $err_msg.settlement != ''}
            <span class="error has-icon" style="margin-left: 10px;">{$err_msg.settlement}</span>
            {/if}
        </p>

        <section class="receipt">
            <h3 class="conts-ttl subtitle is-6">
                コンビニレシートに記載の問い合わせ先
            </h3>
            <div class="control has-icon">
                <label class="label">問い合わせ先<span class="must">必須</span></label>
                <p class="control">
                    <input name="info" class="input {if $data.info == ''}is-danger{/if}" type="text" placeholder="例：株式会社観光販売システムズ" value="{$data.info|default:''}"/>
                    <span class="icon is-small">
                        <i class="fa fa-user"></i>
                    </span>
                    {if isset($err_msg.info) && $err_msg.info != ''}
                    <span class="error has-icon">{$err_msg.info}</span>
                    {/if}
                </p>
            </div>

            <div class="control has-icon">
                <label class="label">電話番号<span class="must">必須</span><p class="help is-danger">最大半角12文字</p></label>
                <p class="control">
                    <input name="tel_2" class="input {if $data.tel_2 == ''}is-danger{/if}" type="text" maxlength="12" placeholder="例：05037754727"  value="{$data.tel_2|default:''}"/>
                    <span class="icon is-small">
                        <i class="fa fa-user"></i>
                    </span>
                    {if isset($err_msg.tel_2) && $err_msg.tel_2 != ''}
                    <span class="error has-icon">{$err_msg.tel_2}</span>
                    {/if}
                </p>
            </div>

            <div class="control has-icon">
                <label class="label">受付時間<span class="must">必須</span><p class="help is-danger">最大半角11文字</p></label>
                <p class="control">
                    <input name="informationTime" class="input {if $data.informationTime == ''}is-danger{/if}" type="text" maxlength="11" placeholder="例：10:00-18:30" value="{$data.informationTime|default:''}"/>
                    <span class="icon is-small">
                        <i class="fa fa-user"></i>
                    </span>
                    {if isset($err_msg.informationTime) && $err_msg.informationTime != ''}
                    <span class="error has-icon">{$err_msg.informationTime}</span>
                    {/if}
                </p>
            </div>
        </section>
    </section>

    <hr {if !$is_admin}style="display: none;"{/if}>

    <section class="payment-gmo" {if !$is_admin}style="display: none;"{/if}>
        <h2 class="conts-ttl subtitle">
            GMOペイメントゲートウェイ接続設定
        </h2>

        <div class="control has-icon">
            <label class="label">サイトID<span class="must">必須</span></label>
            <p class="control">
                <input name="siteID" class="input {if $data.siteID == ''}is-danger{/if}" type="text" placeholder="例：mst2000008479" value="{$data.siteID|default:''}"/>
                <span class="icon is-small">
                    <i class="fa fa-user"></i>
                </span>
                {if isset($err_msg.siteID) && $err_msg.siteID != ''}
                <span class="error has-icon">{$err_msg.siteID}</span>
                {/if}
            </p>
        </div>

        <div class="control has-icon">
            <label class="label">ショップID<span class="must">必須</span></label>
            <p class="control">
                <input name="shopID" class="input {if $data.shopID == ''}is-danger{/if}" type="text" placeholder="例：9101003936690" value="{$data.shopID|default:''}"/>
                <span class="icon is-small">
                    <i class="fa fa-user"></i>
                </span>
                {if isset($err_msg.shopID) && $err_msg.shopID != ''}
                <span class="error has-icon">{$err_msg.shopID}</span>
                {/if}
            </p>
        </div>

        <div class="control has-icon">
            <label class="label">パスワード<span class="must">必須</span></label>
            <p class="control">
                <input name="pass2" class="input {if $data.pass2 == ''}is-danger{/if}" type="text" placeholder="例：2kkm86ac" value="{$data.pass2|default:''}"/>
                <span class="icon is-small">
                    <i class="fa fa-lock"></i>
                </span>
                {if isset($err_msg.pass2) && $err_msg.pass2 != ''}
                <span class="error has-icon">{$err_msg.pass2}</span>
                {/if}
            </p>
        </div>

        <div class="control has-icon">
            <label class="label">決済選択呼出しAPI 接続先URL<span class="must">必須</span></label>
            <p class="control">
                <input name="APIurl" class="input {if $data.APIurl == ''}is-danger{/if}" type="text" placeholder="例：https://p01.mul-pay.jp/link/9101003936690/Multi/Entry" value="{$data.APIurl|default:''}"/>
                <span class="icon is-small">
                    <i class="fa fa-globe"></i>
                </span>
                {if isset($err_msg.APIurl) && $err_msg.APIurl != ''}
                <span class="error has-icon">{$err_msg.APIurl}</span>
                {/if}
            </p>
        </div>
    </section>

    <hr {if !$is_admin}style="display: none;"{/if}>

    <section class="password" {if !$is_admin}style="display: none;"{/if}>
        <h2 class="conts-ttl subtitle">
            パスワード再設定
        </h2>

        <div class="control has-icon">
            <label class="label">新しいパスワード</label>
            <p class="control">
                <input class="input" name="pass" type="password" placeholder="●●●●●●●●" />
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
                <input class="input" name="pass_confirm" type="password" placeholder="●●●●●●●●" />
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
/*
  CKEDITOR.replace('ckeditor01', {
    language: 'ja',
    uiColor: '#ffffff',
  });
*/
</script>

<script>

    $(function() {
        // 旅行業に基づく旅行商品の取り扱い
        if ($('[name=agency]:eq(0)').prop('checked')) {
            $('.travel-agency-input').fadeIn();
        } else {
            $('.travel-agency-input').fadeOut();
        }
        $('[name=agency]').click(function() {
            if ($('[name=agency]:eq(0)').prop('checked')) {
                $('.travel-agency-input').fadeIn();
            } else {
                $('.travel-agency-input').fadeOut();
            }
        });

        // 取扱決済
        if ($('.settlement:eq(1)').prop('checked')) {
            $('.receipt').fadeIn();
        } else {
            $('.receipt').fadeOut();
        }
        $('.settlement').click(function() {
            if ($('.settlement:eq(1)').prop('checked')) {
                $('.receipt').fadeIn();
            } else {
                $('.receipt').fadeOut();
            }
        });

        // $('[name=travel-agency-available]').change(function() {
        //     if ($(this).is(':checked')) {
        //         $('.travel-agency-input').fadeIn();
        //     } else {
        //         $('.travel-agency-input').fadeOut();
        //     }
        // }).trigger('change');

        // 約款
        $('[name=Clause]').change(function() {
            if ($("input:radio[name='Clause']:checked").val() == "1") {
                $('.agreement-default').show();
                $('.agreement-pdf').hide();
                $('.agreement-url').hide();
            } else if ($("input:radio[name='Clause']:checked").val() == "2") {
                $('.agreement-pdf').show();
                $('.agreement-default').hide();
                $('.agreement-url').hide();
            } else if ($("input:radio[name='Clause']:checked").val() == "3") {
                $('.agreement-url').show();
                $('.agreement-default').hide();
                $('.agreement-pdf').hide();
            }
        }).trigger('change');

        // 旅行条件書
        $('[name=file_select]').change(function() {
            if ($("input:radio[name='file_select']:checked").val() == "1") {
                $('.condition-pdf').show();
                $('.condition-url').hide();
            } else if ($("input:radio[name='file_select']:checked").val() == "2") {
                $('.condition-url').show();
                $('.condition-pdf').hide();
            }
        }).trigger('change');

        // プライバシーポリシー
        $('[name=privacypolicy]').change(function() {
            if ($("input:radio[name='privacypolicy']:checked").val() == "1") {
                $('.policy-pdf').show();
                $('.policy-url').hide();
            } else if ($("input:radio[name='privacypolicy']:checked").val() == "2") {
                $('.policy-url').show();
                $('.policy-pdf').hide();
            }
        }).trigger('change');

        // 旅行業務取扱料金表
        $('[name=TravelPriceList]').change(function() {
            if ($("input:radio[name='TravelPriceList']:checked").val() == "1") {
                $('.charges-pdf').show();
                $('.charges-url').hide();
            } else if ($("input:radio[name='TravelPriceList']:checked").val() == "2") {
                $('.charges-url').show();
                $('.charges-pdf').hide();
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

        var fileapi4 = new FileApi();
        fileapi4.setUpload(
            '#pdf_file2',
            'pdf_file2',
            {
                afterupload : function(response) {
                    $('#pdf_file2').val('');
                    $('#pdf_file2').parent().next().remove();
                    $('#pdf_file2').parent().after(response);
                }
            }
        );

        var fileapi5 = new FileApi();
        fileapi5.setUpload(
            '#pdf_file3',
            'pdf_file3',
            {
                afterupload : function(response) {
                    $('#pdf_file3').val('');
                    $('#pdf_file3').parent().next().remove();
                    $('#pdf_file3').parent().after(response);
                }
            }
        );

        var fileapi6 = new FileApi();
        fileapi6.setUpload(
            '#pdf_file4',
            'pdf_file4',
            {
                afterupload : function(response) {
                    $('#pdf_file4').val('');
                    $('#pdf_file4').parent().next().remove();
                    $('#pdf_file4').parent().after(response);
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
