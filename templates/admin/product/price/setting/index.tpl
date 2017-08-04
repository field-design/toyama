{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　商品代金・設定
機能名：
　商品代金・設定
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/meta.tpl'}

<title>代金設定</title>
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
              <li><span>代金設定</span></li>
            </ul>
        </div>
    </div>

    {if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

    <div class="columns section">
        <div class="column is-3 is-hidden-mobile">
            {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' price='is-active' is_admin=$is_admin}
        </div>
        <div class="column is-9">
<!-- START main -->
<main>

    <h2 class="title is-3">代金設定</h2>

    <div class="conts-body">

        <form method="post">

            <div class="calendar-wrap">
                <label class="label">
                    <span class="help">コース毎に代金を設定してください。</span>
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
                <section id="price" class="input-area price">
                    <div class="conts-body">

                        <label class="label">代金タイトル<span class="must">必須</span></label>
                        <div class="control">
                            <div class="help counter">残り<span class="count"></span>文字</strong></div>
                            <input name="price_title[]" class="input limited price_title" type="text" placeholder="例：おひとりさま" maxlength="16" value="">
                            {if isset($err_msg.price_title) && $err_msg.price_title != ''}
                            <span class="error has-icon">{$err_msg.price_title}</span>
                            {/if}
                        </div>

                        <div id="price_container" data-option="0">
                        </div>
                        <div style="margin-top: 1.5rem;"></div>
                        <div class="control add-btn add-price">
                            <a class="button is-primary">
                                <span class="icon">
                                <i class="fa fa-plus-circle"></i>
                                </span>
                                <span>代金を追加</span>
                            </a>
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
                
            </div>

            <input type="hidden" name="product_id" value="{$data_course.product_id|default:''}" />
            <input type="hidden" name="price_count" value="" />

        </form>
    </div>

</main>
<!-- END main -->
        </div>
    </div>
</div>
<div id="dialog" title="確認">
    現在の設定を保存せず、コースを変更しますか？
</div>

<div class="section sitemap is-hidden-desktop">
    {include file=$smarty.const.ADMIN_DIR|cat:'includes/aside/menu.tpl' price='is-active' is_admin=$is_admin}
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
    代金設定
    ****************************/
    {/literal}
    var init_course_id = {$data.course_id};
    var select_course_id;
    var err_msg = {$err_msg|@json_encode};
    {literal}
    
    renewData(init_course_id);

    function setPrice(course_id) {
        $.ajax({
            type: "POST",
            url: location.pathname,
            data: { 'addtype' : 'price_list', 'course_id' : course_id },
            success: function(response){
                $('input.price_title').val(response['price_title'][0]);
                if(err_msg['price_title0'] && err_msg['price_title0'] != '') {
                    $('input.price_title').after('<span class="error has-icon">' + err_msg['price_title0'] + '</span>');
                } else {
                    $('input.price_title').next().remove();
                }
                for(var i=0; i<response['price_type'].length; i++) {
                    price_data = [response['price_type'][i], response['price_value'][i]];
                    price_condition_data = response['price_condition'][i];
                    err = err_msg['price_value' + i];
                    addPrice(price_data, price_condition_data, i, err);
                }
            }
        });
    }

    /***************************
    追加ボタン処理
    partsapi.js
    ****************************/
    var partsapi = new PartsApi();
    $('#price .add-btn.add-price a').click(function(){
        addPrice(null, null, null, null);
    });
    $('#price .add-btn.add-condition a').click(function(){
        addPriceCondition(this, null, null);
    });
    function addPrice(price_data, price_condition_data, number, err) {

        //料金件数設定
        var incre = parseInt($('#price_container').attr('data-option')) + 1;
        $('#price_container').attr('data-option', incre);
        $('input[name=price_count]').val(incre);

        partsapi.addParts('price', '#price_container', function(){

            //イベント設定
            $('#price .add-btn.add-condition a').unbind('click');
            $('#price .add-btn.add-condition a').click(function(){
                partsapi.addParts('price_condition', $(this).parent().prevAll('.price_condition_container'));
            });

            //値設定
            if(price_data) {
                if(price_data[0] != '') {
                    $('select.price_type:eq(' + number + ')').val(price_data[0]);
                }
                if(price_data[1] != '') {
                    $('input.price_value:eq(' + number + ')').val(price_data[1]);
                } else if(err && err != '') {
                    $('input.price_value:eq(' + number + ')').parent().append('<span class="error has-icon">' + err +'</span>');
                }
            }

            //代金条件設定
            if(price_condition_data) {
                for(var i=0; i<price_condition_data.length; i++) {
                    obj = $('#price .add-btn.add-condition a').get(number);
                    addPriceCondition(obj, price_condition_data[i], i);
                }
            }

            //イベント再設定
            setChangeEvent();
            
        });
    }
    function addPriceCondition(obj, value, number) {
        //イベント設定
        partsapi.addParts('price_condition', $(obj).parent().prevAll('.price_condition_container'), function(){
            if(value) {
                $(obj).parent().prev().find('p:nth-child(' + (number + 1) + ') input').val(value);
            }
        });
    }

    /***************************
    コース変更時の再設定処理
    ****************************/
    function renewData(course_id) {
        if($('#price_container').height() != 0) {
            $('#price_container').css('height', $('#price_container').height());
        }
        $('#price_container').animate({opacity: 0}, 100);
        $('#price_container').html('');
        $('#price_container').attr('data-option', '0');
        setPrice(course_id);
        $('#price_container').animate({opacity: 1}, 100, function(){
            $('#price_container').css('height', '');
        });
        edit_flg = false;
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
                        err_msg = [];
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
        if(edit_flg) {
            $("#dialog").dialog('open');
        } else {
            err_msg = [];
            renewData(change_id);
        }
        
    });

    var edit_flg = false;
    if( Object.keys(err_msg).length > 0 ) {
        edit_flg = true;
    }
    function setChangeEvent() {
        $( ".sortable" ).sortable({
            handle: ".sortable_button"
        });
        $( ".sortable" ).disableSelection();
        $(":not(#course_id):input").unbind('change');
        $(":not(#course_id):input").change(function(){
            edit_flg = true;
        });
    }

});
</script>

{/literal}


</body>
</html>
