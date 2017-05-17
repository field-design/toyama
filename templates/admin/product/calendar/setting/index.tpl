{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　予約カレンダー・設定
機能名：
　予約カレンダー・設定
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>予約カレンダー</title>
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
              <li><a href="/"><span class="icon is-small"><i class="fa fa-home" aria-hidden="true"></i></span></a></li>
              <li><span>予約カレンダー</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' calendar='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">予約カレンダー</h2>

<section class="input-area calendar">

    <div class="conts-body">

        <form method="post">

            <div class="calendar-wrap">
                <label class="label">
                    催行日<span class="must">必須</span>
                    <span class="help">各日程に在庫設定又は、リクエスト受付可能日を入力してください。<br />コースを設定している場合はコース毎に設定してください。<br />必要に応じてオプションを選択してください。</span>
                </label>
                
                <div class="control">
                    <p class="control has-icon has-icon-right">
                        <span class="select is-fullwidth">
                            <select id="course_id" name="course_id">
                                {section name=i start=0 loop=count($data_course.course_id)}
                                    {assign var='index' value=$smarty.section.i.index}
                                    <option value="{$data_course.course_id[$index]}" {if $data.course_id == $data_course.course_id[$index]}selected{/if}>{$data_course.course_name[$index]}</option>
                                {/section}
                            </select>
                        </span>
                    </p>
                </div>
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
                                <span></span>
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
                
                    <div id="calen_val_all" class="control is-grouped">
                        <div class="control has-addons has-icon has-icon-right">
                            <span class="select">
                            <select>
                                <option value="">期間外</option>
                                <option value="-1">リクエスト</option>
                                <option value="-2">空きなし</option>
                                {section name=i start=1 loop=31}
                                    {assign var='index' value=$smarty.section.i.index}
                                    <option value="{$index}">{$index}</option>
                                {/section}
                            </select>
                            
                            </span>
                        </div>
                        <div class="control has-addons">
                            <a class="button">
                            一括入力
                            </a>
                        </div>
                    </div>
                
                    <div id="calen_option_all" class="control is-grouped">
                        <div class="control has-addons has-icon has-icon-right">
                            <span class="select">
                            <select>
                                <option value="0">なし</option>
                                <option value="1">オプション1</option>
                            </select>
                            
                            </span>
                        </div>
                        <div class="control has-addons">
                            <a class="button">
                            一括入力
                            </a>
                        </div>
                    </div>
                
                    <div class="message is-dark notes">
                        <div class="message-header">
                            <p>オプション説明</p>
                            <button class="delete" onclick="((this).parentNode.parentNode.remove())"></button>
                        </div>
                        <div class="message-body">
                            <ul>
                                <li>オプション1：手仕舞い日を切った場合は、リクエストプランに切り替えます。</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>

            <hr>

            <div class="control">
                <label class="label">
                    手仕舞い日（申込締切日）<span class="must">必須</span>
                    <span class="help">当日の場合は0日前と入力してください。</span>
                </label>
                <div class="">
                    <p class="control has-addons">
                    <input name="close_date" class="input" type="number" min="0" placeholder="例：3" value="">
                    <span class="button is-disabled">日前</span>
                    <input name="close_time" class="input js-timepicker" type="text" placeholder="時間" value="">
                    <span class="button is-disabled">時まで</span>
                    </p>
                    {if isset($err_msg.close_date) && $err_msg.close_date != ''}
                    <span class="error has-icon">{$err_msg.close_date}</span>
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

            <input type="hidden" name="product_id" value="{$data_course.product_id|default:''}" />

        </form>
    </div>
</section>


</main>
<!-- END main -->
        </div>
    </div>
</div>
<div id="dialog" title="確認">
    現在の設定を保存せず、コースを変更しますか？
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
<script>
/***************************
datepicker
****************************/
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
        $('form').attr('action', location.pathname);
        $('form').attr('target', '');
        $('form').submit();
    });

    /***************************
    カレンダー設定
    stockmanager.js
    ****************************/
    {/literal}
    var init_course_id = {$data.course_id};
    var select_course_id;
    {literal}
    var stockmanager = new StockManager();
    stockmanager.setButton('#stock_calendar_picker');
    
    renewData(init_course_id);
    
    function setStockCalendar(course_id) {
        $.ajax({
            type: "POST",
            url: location.pathname,
            data: { 'addtype' : 'calendar', 'course_id' : course_id },
            success: function(response){
                var init_dt = '';
                Object.keys(response).forEach(function (key) {
                    var data = response[key];
                    var dt = new Date(key);
                    stockmanager.changeCalendar(dt, data, 'hide');
                    if(init_dt == '') {
                        init_dt = dt;
                    }
                });
                stockmanager.changeCalendar(init_dt);
                setChangeEvent();
            }
        });
    }

    /***************************
    手じまい日設定
    ****************************/
    function setCourseClose(course_id) {
        $.ajax({
            type: "POST",
            url: location.pathname,
            data: { 'addtype' : 'close', 'course_id' : course_id },
            success: function(response){
                $('input[name=close_date]').val(response.close_date);
                if(response.close_date == '') {
                    $('input[name=close_date]').addClass('is-danger');
                } else {
                    $('input[name=close_date]').removeClass('is-danger');
                }
                $('input[name=close_time]').val(response.close_time);
            }
        });
    }

    /***************************
    コース変更時の再設定処理
    ****************************/
    function renewData(course_id) {
        if($('#stock_calendars').height() != 0) {
            $('#stock_calendars').css('height', $('#stock_calendars').height());
        }
        $('#stock_calendars').animate({opacity: 0}, 100);
        $('#stock_calendars').html('');
        setStockCalendar(course_id);
        setCourseClose(course_id);
        $('#stock_calendars').animate({opacity: 1}, 100, function(){
            $('#stock_calendars').css('height', '');
        });
        $edit_flg = false;
        select_course_id = course_id;
    }

    /***************************
    ダイアログ設定
    ****************************/
    $("#dialog").dialog(
        {   
            autoOpen: false,
            modal: true,
            open: function() {
                $( this ).siblings('.ui-dialog-buttonpane').find('button:eq(1)').focus();
            },
            buttons:[
                {
                    text: "OK",
                    click: function(){
                    $( this ).dialog( "close" );
                        renewData($('#course_id').val());
                    }
                },
                {
                    text: "Cancel",
                    click: function(){
                    $( this ).dialog( "close" );
                        $('#course_id').val(select_course_id);
                    }
                }
            ]
        }
    );
    //ボタンスタイル用
    $('.ui-dialog .ui-dialog-buttonpane button').addClass('button');

    /***************************
    ページ内イベント設定
    ****************************/
    $('#course_id').change(function(){
        var change_id = $(this).val();
        if($edit_flg) {
            $("#dialog").dialog('open');
        } else {
            renewData(change_id);
        }
        
    });
    $('#calen_val_all a').click(function(){
        $('#stock_calendars > div').each(function(){
            if($(this).css('opacity') == 1) {
                $(this).find('td select.calen_val').val($('#calen_val_all select').val());
                return false;
            }
        });
    });
    $('#calen_option_all a').click(function(){
        $('#stock_calendars > div').each(function(){
            if($(this).css('opacity') == 1) {
                $(this).find('td select.calen_option').val($('#calen_option_all select').val());
                return false;
            }
        });
    });

    $edit_flg = false;
    function setChangeEvent() {
        $(":not(#course_id):input").unbind('change');
        $(":not(#course_id):input").change(function(){
            $edit_flg = true;
        });
    }

});
</script>

{/literal}


</body>
</html>
