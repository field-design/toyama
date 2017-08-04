{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（お客様情報入力）ページ
機能名：
　申込（お客様情報入力）ページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>お申し込み | {$smarty.const.SITE_TITLE_FRONT}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/order.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- Twitter Card -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/twitter_card.tpl'}
</head>

<body class="drawer drawer--right" id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


{include file=$smarty.const.FRONT_DIR|cat:'includes/head/loading.tpl'}


<!-- START global-header -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header_niikawa.tpl'}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="/">トップページ</a></li>
            <li>お申し込み</li>
        </ul>
    </div>
</div>

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step"><span>人数・オプション選択</span></li>
                <li class="step current"><span>お客様情報入力</span></li>
                <li class="step"><span>ご予約内容確認</span></li>
            </ul>
        </div>

        <h2><span>お客様情報入力</span></h2>

        {if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

        <form method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">

            <section class="order-input">
                <h3 class="product-ttl">お申込者様の情報</h3>
                <div class="input-wrap">

                    <div class="input-area">
                        <label class="label">お名前<span class="must">※必須入力</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="nameSei" class="input medium" type="text" placeholder="姓" value="{$order_data.nameSei|default:''}">
                            </div>
                            <div class="input-field">
                                <input name="nameMei" class="input medium" type="text" placeholder="名" value="{$order_data.nameMei|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.nameSei) && $err_msg.nameSei != ''}
                        <span class="error has-icon">{$err_msg.nameSei}</span>
                        {elseif isset($err_msg.nameMei) && $err_msg.nameMei != ''}
                        <span class="error has-icon">{$err_msg.nameMei}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">フリガナ<span class="must">※必須入力</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="kanaSei" class="input medium" type="text" placeholder="セイ" value="{$order_data.kanaSei|default:''}">
                            </div>
                            <div class="input-field">
                                <input name="kanaMei" class="input medium" type="text" placeholder="メイ" value="{$order_data.kanaMei|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.kanaSei) && $err_msg.kanaSei != ''}
                        <span class="error has-icon">{$err_msg.kanaSei}</span>
                        {elseif isset($err_msg.kanaMei) && $err_msg.kanaMei != ''}
                        <span class="error has-icon">{$err_msg.kanaMei}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">メールアドレス<span class="must">※必須入力</span></label>
                        <div class="input-field">
                            <input name="mail" class="input long" type="email" placeholder="例：sample@example.com" value="{$order_data.mail|default:''}">
                        </div>
                        {if isset($err_msg.mail) && $err_msg.mail != ''}
                        <div><span class="error has-icon">{$err_msg.mail}</span><div>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">郵便番号<span class="must">※必須入力</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="zipCode[]" class="input short" type="number" min="0" placeholder="例：123" value="{$order_data.zipCode[0]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="zipCode[]" class="input short" type="number" min="0" placeholder="例：4567" value="{$order_data.zipCode[1]|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.zipCode) && $err_msg.zipCode != ''}
                        <span class="error has-icon">{$err_msg.zipCode}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">都道府県<span class="must">※必須入力</span></label>
                        <div class="input-group">
                            <span class="select input-field">
                                <select name="pref" class="short">
                                    <option value="">都道府県</option>
                                    {foreach from=$const_pref item=pref key=key}
                                    <option value="{$key}" {if $order_data.pref==$key}selected{/if}>{$pref}</option>                                       
                                    {/foreach}
                                </select>
                            </span>
                        </div>
                        {if isset($err_msg.pref) && $err_msg.pref != ''}
                        <span class="error has-icon">{$err_msg.pref}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">市区町村、丁目・番地、ビル・マンション名等<span class="must">※必須入力</span></label>
                        <div class="input-field">
                            <input name="adress" class="input full" type="text" placeholder="例：〇〇市〇〇 1丁目123 〇〇ビル101" value="{$order_data.adress|default:''}">
                            {if isset($err_msg.adress) && $err_msg.adress != ''}
                            <span class="error has-icon">{$err_msg.adress}</span>
                            {/if}
                        </div>
                    </div>

                    <div class="input-area">
                        <label class="label">携帯電話番号<span class="must">※必須入力</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="mobile[]" class="input short" type="number" min="0" placeholder="例：123" value="{$order_data.mobile[0]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="mobile[]" class="input short" type="number" min="0" placeholder="例：4567" value="{$order_data.mobile[1]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="mobile[]" class="input short" type="number" min="0" placeholder="例：8901" value="{$order_data.mobile[2]|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.mobile) && $err_msg.mobile != ''}
                        <span class="error has-icon">{$err_msg.mobile}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">電話番号</label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="tel_[]" class="input short" type="number" min="0" placeholder="例：123" value="{$order_data.tel_[0]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="tel_[]" class="input short" type="number" min="0" placeholder="例：4567" value="{$order_data.tel_[1]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="tel_[]" class="input short" type="number" min="0" placeholder="例：8901" value="{$order_data.tel_[2]|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.tel_) && $err_msg.tel_ != ''}
                        <span class="error has-icon">{$err_msg.tel_}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">生年月日</label>
                        <div class="input-group">
                            <div class="input-field">
                                <span class="select">
                                    <select name="birthday[]" class="short">
                                        {section name=i start=1900 loop=($smarty.now|date_format:'%Y')}
                                        {assign var='index' value=$smarty.section.i.index}
                                        <option value="{$index}" {if ($order_data.birthday[0]|default:1980) == $index}selected{/if}>{$index}</option>
                                        {/section}
                                    </select>
                                </span>
                                <span class="notes">年</span>
                            </div>
                            <div class="input-field">
                                <span class="select">
                                    <select name="birthday[]" class="short">
                                        {section name=i start=1 loop=13}
                                        {assign var='index' value=$smarty.section.i.index}
                                        <option value="{$index}" {if ($order_data.birthday[1]|default:1) == $index}selected{/if}>{$index}</option>
                                        {/section}
                                    </select>
                                </span>
                                <span class="notes">月</span>
                            </div>
                            <div class="input-field">
                                <span class="select">
                                    <select name="birthday[]" class="short">
                                        {section name=i start=1 loop=32}
                                        {assign var='index' value=$smarty.section.i.index}
                                        <option value="{$index}" {if ($order_data.birthday[2]|default:1) == $index}selected{/if}>{$index}</option>
                                        {/section}
                                    </select>
                                </span>
                                <span class="notes">日</span>
                            </div>
                        </div>
                        {if isset($err_msg.birthday) && $err_msg.birthday != ''}
                        <span class="error has-icon">{$err_msg.birthday}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">性別</label>
                        <div class="input-field">
                            <input type="radio" id="male" name="gender" value="1" {if ($order_data.gender|default:1) == 1}checked="checked"{/if}> <label for="male" class="radio">男性</label>
                            <input type="radio" id="female" name="gender" value="2" {if ($order_data.gender|default:1) == 2}checked="checked"{/if}> <label for="female" class="radio">女性</label>
                        </div>
                        {if isset($err_msg.gender) && $err_msg.gender != ''}
                        <span class="error has-icon">{$err_msg.gender}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">職業</label>
                        <div class="input-field">
                            <span class="select">
                                <select name="job_" class="short">
                                    {foreach from=Constant::$aryProfession item=item key=key}
                                    <option value="{$key}" {if ($order_data.job_|default:1) == $key}selected{/if}>{$item}</option>
                                    {/foreach}
                                </select>
                            </span>
                        </div>
                        {if isset($err_msg.job_) && $err_msg.job_ != ''}
                        <span class="error has-icon">{$err_msg.job_}</span>
                        {/if}
                    </div>

                </div>
            </section>

            <section id="member" class="order-input">
                <h3 class="product-ttl">同行者様の情報</h3>

                <div id="member_container">
                    {section name=i start=0 loop=count($order_data.withSei)}
                        {assign var='index' value=$smarty.section.i.index}
                        {if !isset($err_msg)}
                            {assign var='err_msg' value=array()}
                        {/if}
                        {include file=$smarty.const.FRONT_DIR|cat:'addparts/order_input_member.tpl'
                                 num=$index
                                 order_data=$order_data
                                 err_msg=$err_msg}
                    {/section}
                </div>

                <div class="add-btn">
                    <a class="button">
                        <span class="icon">
                        <i class="fa fa-plus-circle"></i>
                        </span>
                        <span>同行者を追加</span>
                    </a>
                    <p class="help">最大10名まで追加可能</p>
                </div>
            </section>

            <section class="order-input">
                <h3 class="product-ttl">備考欄</h3>
                <div class="input-wrap">

                    <div class="input-area">
                        <div class="input-field">
                            <textarea class="full" name="note" placeholder="ご要望やご質問がございましたら、こちらにご記入ください。">{$order_data.note|default:''}</textarea>
                        </div>
                    </div>

                </div>
            </section>

            <div class="pagenation">
                <div class="back">
                    <button name="prev" type="submit">戻る</button>
                </div>
                <div class="next">
                    <button name="next" type="submit">次へ</button>
                </div>
            </div>

        </form>
    </div>
</article>

</main>
<!-- END main -->


<!-- START global-footer -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer_niikawa.tpl'}
<!-- END global-footer -->


<!-- WEB Fonts -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/webfont.tpl'}
<!-- icon Fonts -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/iconfont.tpl'}
<!-- Common Script -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/script.tpl'}
<!-- Google map javascript api v3 -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/google_script.tpl'}


<!-- Page Script -->
{literal}
<script>
    $(function() {
        /***************************
        追加ボタン処理
        partsapi.js
        ****************************/
        var partsapi = new PartsApi();

        $('#member .add-btn a').click(function(){
            partsapi.addParts('member', '#member_container');
        });
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>