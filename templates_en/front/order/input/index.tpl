{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（お客様情報入力）ページ
機能名：
　申込（お客様情報入力）ページ
******************************************************}
<!DOCTYPE html>
<html lang="en">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>Application | {Constant::$siteName}</title>
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
{if in_array('area1', $product_data.area)}
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header_niikawa.tpl'}
{else}
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header.tpl'}
{/if}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="/">Home</a></li>
            <li>Application</li>
        </ul>
    </div>
</div>

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step"><span>Select Number of People/Options</span></li>
                <li class="step current"><span>Enter Customer Information</span></li>
                <li class="step"><span>Confirm Application Content</span></li>
            </ul>
        </div>

        <h2><span>Enter Customer Information</span></h2>

        {if isset($global_message)}{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

        <form method="post" action="{$smarty.server.PHP_SELF|replace:'index.php':''}">

            <section class="order-input">
                <h3 class="product-ttl">Enter Customer Information</h3>
                <div class="input-wrap">

                    <div class="input-area">
                        <label class="label">Name<span class="must">* Required</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="nameSei" class="input medium" type="text" placeholder="Last name" value="{$order_data.nameSei|default:''}">
                            </div>
                            <div class="input-field">
                                <input name="nameMei" class="input medium" type="text" placeholder="First name" value="{$order_data.nameMei|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.nameSei) && $err_msg.nameSei != ''}
                        <span class="error has-icon">{$err_msg.nameSei}</span>
                        {elseif isset($err_msg.nameMei) && $err_msg.nameMei != ''}
                        <span class="error has-icon">{$err_msg.nameMei}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Furigana<span class="must"></span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="kanaSei" class="input medium" type="text" placeholder="Last name" value="{$order_data.kanaSei|default:''}">
                            </div>
                            <div class="input-field">
                                <input name="kanaMei" class="input medium" type="text" placeholder="First name" value="{$order_data.kanaMei|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.kanaSei) && $err_msg.kanaSei != ''}
                        <span class="error has-icon">{$err_msg.kanaSei}</span>
                        {elseif isset($err_msg.kanaMei) && $err_msg.kanaMei != ''}
                        <span class="error has-icon">{$err_msg.kanaMei}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Email Address<span class="must">* Required</span></label>
                        <div class="input-field">
                            <input name="mail" class="input long" type="email" placeholder="ex: sample@example.com" value="{$order_data.mail|default:''}">
                        </div>
                        {if isset($err_msg.mail) && $err_msg.mail != ''}
                        <div><span class="error has-icon">{$err_msg.mail}</span><div>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Post Code<span class="must">* Required</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="zipCode[]" class="input short" type="number" min="0" placeholder="ex: 123" value="{$order_data.zipCode[0]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="zipCode[]" class="input short" type="number" min="0" placeholder="ex: 4567" value="{$order_data.zipCode[1]|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.zipCode) && $err_msg.zipCode != ''}
                        <span class="error has-icon">{$err_msg.zipCode}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Prefecture<span class="must">* Required</span></label>
                        <div class="input-group">
                            <span class="select input-field">
                                <select name="pref" class="short">
                                    <option value="">Prefecture</option>
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
                        <label class="label">City/Ward/Town, Lot/Street Number, Name of Building/Apartment etc.<span class="must">* Required</span></label>
                        <div class="input-field">
                            <input name="adress" class="input full" type="text" placeholder="ex: city 1-123 building101" value="{$order_data.adress|default:''}">
                            {if isset($err_msg.adress) && $err_msg.adress != ''}
                            <span class="error has-icon">{$err_msg.adress}</span>
                            {/if}
                        </div>
                    </div>

                    <div class="input-area">
                        <label class="label">Mobile Phone Number<span class="must">* Required</span></label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="mobile[]" class="input short" type="number" min="0" placeholder="ex: 123" value="{$order_data.mobile[0]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="mobile[]" class="input short" type="number" min="0" placeholder="ex: 4567" value="{$order_data.mobile[1]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="mobile[]" class="input short" type="number" min="0" placeholder="ex: 8901" value="{$order_data.mobile[2]|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.mobile) && $err_msg.mobile != ''}
                        <span class="error has-icon">{$err_msg.mobile}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Phone Number</label>
                        <div class="input-group">
                            <div class="input-field">
                                <input name="tel_[]" class="input short" type="number" min="0" placeholder="ex: 123" value="{$order_data.tel_[0]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="tel_[]" class="input short" type="number" min="0" placeholder="ex: 4567" value="{$order_data.tel_[1]|default:''}">
                            </div>
                            <span class="notes">ー</span>
                            <div class="input-field">
                                <input name="tel_[]" class="input short" type="number" min="0" placeholder="ex: 8901" value="{$order_data.tel_[2]|default:''}">
                            </div>
                        </div>
                        {if isset($err_msg.tel_) && $err_msg.tel_ != ''}
                        <span class="error has-icon">{$err_msg.tel_}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Date of Birth</label>
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
                                <span class="notes">/</span>
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
                                <span class="notes">/</span>
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
                                <span class="notes"></span>
                            </div>
                        </div>
                        {if isset($err_msg.birthday) && $err_msg.birthday != ''}
                        <span class="error has-icon">{$err_msg.birthday}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Sex</label>
                        <div class="input-field">
                            <input type="radio" id="male" name="gender" value="1" {if ($order_data.gender|default:1) == 1}checked="checked"{/if}> <label for="male" class="radio">{Constant::$aryGender['1']}</label>
                            <input type="radio" id="female" name="gender" value="2" {if ($order_data.gender|default:1) == 2}checked="checked"{/if}> <label for="female" class="radio">{Constant::$aryGender['2']}</label>
                        </div>
                        {if isset($err_msg.gender) && $err_msg.gender != ''}
                        <span class="error has-icon">{$err_msg.gender}</span>
                        {/if}
                    </div>

                    <div class="input-area">
                        <label class="label">Profession</label>
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
                <h3 class="product-ttl">Companion Information</h3>

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
                        <span>Add a companion</span>
                    </a>
                    <p class="help">Up to 10 companions can be added</p>
                </div>
            </section>

            <section class="order-input">
                <h3 class="product-ttl">Additional Remarks</h3>
                <div class="input-wrap">

                    <div class="input-area">
                        <div class="input-field">
                            <textarea class="full" name="note" placeholder="If you have any requests or questions, please write here.">{$order_data.note|default:''}</textarea>
                        </div>
                    </div>

                </div>
                <div class="input-area">
                    <label class="label">Are you sure you want to deliver an e-mail notifying you of useful information etc. from this site?</label>
                    <div class="input-field">
                        <input type="radio" id="mail-yes" name="mail_send_flg" value="1" {if $order_data.mail_send_flg==1}checked{/if}> <label for="mail-yes" class="radio">Yes</label>
                        <input type="radio" id="mail-no" name="mail_send_flg" value="0" {if $order_data.mail_send_flg==0}checked{/if}> <label for="mail-no" class="radio">No</label>
                    </div>
                </div>
            </section>

            <div class="pagenation">
                <div class="back">
                    <button name="prev" type="submit">Previous</button>
                </div>
                <div class="next">
                    <button name="next" type="submit">Next</button>
                </div>
            </div>

        </form>
    </div>
</article>

</main>
<!-- END main -->


<!-- START global-footer -->
{if in_array('area1', $product_data.area)}
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer_niikawa.tpl'}
{else}
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer.tpl'}
{/if}
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