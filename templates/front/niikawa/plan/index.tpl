{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　postページ
機能名：
　postページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>{$data.title|default:''} | {Constant::$siteNameNiikawa}</title>
<meta name="description" content="{$page_data.description_tag|default:''}">
<meta name="keywords" content="{$page_data.keyword_tag|default:''}">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/post.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="{Constant::$siteNameNiikawa}">
<meta property="og:type" content="website">
<meta property="og:title" content="{$data.title|default:''}">
<meta property="og:description" content="{$data.ExplanatoryText|default:''}">
<meta property="og:url" content="{$smarty.const.URL_ROOT_PATH_FULL}">
<meta property="og:image" content="{$smarty.const.URL_ROOT_PATH_HOST}{$data.main_photo[0]|default:''}">
<meta property="fb:app_id" content="">
<!-- Twitter Card -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/twitter_card.tpl'}
</head>

<body class="drawer drawer--right" id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


{include file=$smarty.const.FRONT_DIR|cat:'includes/head/loading.tpl'}


<!-- START global-header -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header_niikawa.tpl' h1_tag=$data.title|default:''|cat:'　|　'|cat:Constant::$siteNameNiikawa}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="{$smarty.const.URL_ROOT_PATH}">トップページ</a></li>
            <li><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">ツアーを購入する</a></li>
            <li>{$data.title}</li>
        </ul>
    </div>
</div>

<div class="mainvisual">
    <div class="bxslider">
        {foreach from=$data.main_photo item=url}
        {if $url != ''}
        <div class="slide" style="background-image: url({$url|default:''});"></div>
        {/if}
        {/foreach}
    </div>
</div>

{include file=$smarty.const.FRONT_DIR|cat:'includes/head/sns_share.tpl' url="{$smarty.const.URL_ROOT_PATH_FULL}" title={$data.title|default:''}}


<div class="overview">
    <div data-lg>
        <div class="title">
<!--
            <div class="now">
                <img src="{$smarty.const.URL_ROOT_PATH}assets/img/post/now.svg" alt="いますぐ買える">
            </div>
-->
            <p class="sub-ttl">{$data.sub_title|default:''}</p>
            <h2>{$data.title|default:''}</h2>
            <p>{$data.description|default:''|nl2br}</p>
            <ul class="keyword">
                {section name=i start=0 loop=count($data.area_id)}
                    {assign var='index' value=$smarty.section.i.index}
                    <li class="area"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={$data.area_id[$index]|default:''}">{$data.area_text[$index]|default:''}</a></li>
                {/section}
                {section name=i start=0 loop=count($data.category_id)}
                    {assign var='index' value=$smarty.section.i.index}
                    <li class="genre"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={$data.category_id[$index]|default:''}">{$data.category_text[$index]|default:''}</a></li>
                {/section}
            </ul>
        </div>
        <div class="cost caption">
            <h3>代 金</h3>
            {if $data.disp_price_page == 1}
                {section name=i start=0 loop=count($data.disp_course)}
                    {assign var='index' value=$smarty.section.i.index}
                    <div class="cost-group">
                        <h4>{$data.disp_course[$index]|default:''}</h4>
                        <p>{$data.disp_price_title[$index]|default:''}</p>
                        <table>
                            <tbody>
                                {section name=j start=0 loop=count($data.disp_price_type[$index])}
                                    {assign var='j_index' value=$smarty.section.j.index}
                                    {if isset($data.disp_price_condition) && is_array($data.disp_price_condition) && array_key_exists($index, $data.disp_price_condition) && array_key_exists($j_index, $data.disp_price_condition[$index])}
                                        {assign var='condition' value=$data.disp_price_condition[$index][$j_index]}            
                                    {else}
                                        {assign var='condition' value=array()}            
                                    {/if}
                                    <tr>
                                        <th>{$data.disp_price_type_text[$index][$j_index]}</th>
                                        <td>
                                            <span class="price"><span class="num3">{$data.disp_price_value[$index][$j_index]}</span>円</span>
                                            {foreach from=$condition item=value}
                                            {if $value != ''}<span class="remarks">{$value}</span>{/if}
                                            {/foreach}
                                        </td>
                                    </tr>
                                {/section}
                            </tbody>
                        </table>
                    </div>
                {/section}
            {else}
                {section name=i start=0 loop=count($data.course_id)}
                    {assign var='index' value=$smarty.section.i.index}
                    <div class="cost-group">
                        <h4>{$data.course_name[$index]|default:''}</h4>
                        <p>{$price_list[$index].price_title[0]}</p>
                        <table>
                            <tbody>
                                {section name=j start=0 loop=count($price_list[$index].price_type_text)}
                                    {assign var='j_index' value=$smarty.section.j.index}
                                    <tr>
                                        <th>{$price_list[$index].price_type_text[$j_index]}</th>
                                        <td>
                                            <span class="price"><span class="num3">{$price_list[$index].price_value[$j_index]}</span>円</span>
                                            {foreach from=$price_list[$index].price_condition[$j_index] item=value}
                                            {if $value != ''}<span class="remarks">{$value}</span>{/if}
                                            {/foreach}
                                        </td>
                                    </tr>
                                {/section}
                            </tbody>
                        </table>
                    </div>
                {/section}
            {/if}
        </div>
        <div class="information caption">
            <h3>プラン詳細</h3>
            <table>
                <tbody>
                    <tr>
                        <th>期間</th>
                        <td>
                            {$data.period_from_text|default:''}～{$data.period_to_text|default:''}<br />
                            {$data.period_note|default:''}
                        </td>
                    </tr>
                    {if $data.period_exclusion != ''}
                    <tr>
                        <th>除外日</th>
                        <td>{$data.period_exclusion|default:''|nl2br}</td>
                    </tr>
                    {/if}
                    {if count($data.price_include) > 0}
                    <tr>
                        <th>ご旅行・プラン代金に含まれるもの</th>
                        <td>
                            {foreach from=$data.price_include item=value}
                            {if $value != ''}
                            ・{$value}<br>
                            {/if}
                            {/foreach}
                        </td>
                    </tr>
                    {/if}
                    <tr>
                        <th>最少受付人員</th>
                        <td>{$data.min_member|default:''}名</td>
                    </tr>
                    <tr>
                        <th>最少催行人員</th>
                        <td>{$data.min_depart|default:''}名</td>
                    </tr>
                    <tr>
                        <th>最大申込人員</th>
                        <td>{$data.max_order|default:''}名</td>
                    </tr>
                    {if $data.operator != ''}
                    <tr>
                        <th>運行会社</th>
                        <td>{$data.operator|default:''}</td>
                    </tr>
                    {/if}
                    <tr>
                        <th>添乗員の有無</th>
                        <td>{if $data.conductor_flg == 1}あり{else}なし{/if}</td>
                    </tr>
                    {if $data.start_time != ''}
                    <tr>
                        <th>スタート時間</th>
                        <td>{$data.start_time|default:''}</td>
                    </tr>
                    {/if}
                    {if $data.tour_time != ''}
                    <tr>
                        <th>所要時間</th>
                        <td>{$data.tour_time|default:''}</td>
                    </tr>
                    {/if}
                    <tr>
                        <th>予約締切</th>
                        <td>{$data.order_deadline|default:''}</td>
                    </tr>
                    <tr>
                        <th>決済方法</th>
                        <td>{$person.settlement_text|implode:','}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="map caption">
        <h5>ー集合場所ー</h5>
        <p>場所を選択すると住所が表示されます。</p>
        <div id="contenido">
            <div id="lado" data-lg><div id="side_bar"></div></div>
            <div id="cuerpo"><div id="map_canvas"></div></div>
        </div>
    </div>
    <div data-lg>
        {if $data.notes|implode:'' != ''}
        <div class="caution caption">
            <h5>ー注意事項ー</h5>
            <ul>
                {foreach from=$data.notes item=value}
                {if $value != ''}
                <li>{$value|nl2br}</li>
                {/if}
                {/foreach}
            </ul>
        </div>
        {/if}
        {if $data.others|implode:'' != ''}
        <div class="other caption">
            <h5>ーその他ー</h5>
            <ul>
                {foreach from=$data.others item=value}
                {if $value != ''}
                <li>{$value|nl2br}</li>
                {/if}
                {/foreach}
            </ul>
        </div>
        {/if}
        <div class="cancel caption">
            <h5>ー取消料ー</h5>
            {if $data.cancel_description != ''}
            <p>{$data.cancel_description|default:''}</p>
            {else}
            <p>契約成立後、お客様のご都合で契約を解除する場合、旅行代金に対してお客様1名につき下記の料率で取消料をいただきます。なお、複数人数のご参加で、一部のお客様が契約を解除される場合は、ご参加のお客様から運送・宿泊機関等の（1台・1室あたりの）ご利用人数の変更に対する差額代金をそれぞれいただきます。</p>
            {/if}
            <table>
                <thead>
                    <tr>
                        {assign var="cnt" value=0}
                        {foreach from=$data.cancel_charge_text item=value}
                            {if $value != ''}
                            <th>{$value|default:''}</th>
                            {assign var="cnt" value=$cnt + 1}
                            {/if}
                        {/foreach}
                        {if $cnt == 0}
                            {foreach from=$person.mt_cancel_text item=value}
                                {if $value != ''}
                                <th>{$value|default:''}</th>
                                {/if}
                            {/foreach}
                        {/if}
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        {if $cnt != 0}
                        {foreach from=$data.cancel_charge_rate_text item=value}
                            {if $value != ''}
                            <td>{$value|default:''}</td>
                            {/if}
                        {/foreach}
                        {/if}
                        {if $cnt == 0}
                            {foreach from=$person.MtCancelRatio_text item=value}
                                {if $value != ''}
                                <td>{$value|default:''}</td>
                                {/if}
                            {/foreach}
                        {/if}
                    </tr>
                </tbody>
            </table>
            <ul>
                {if $cnt != 0}
                    {foreach from=$data.cancel_notes item=value}
                        {if $value != ''}
                        <li>{$value|default:''}</li>
                        {/if}
                    {/foreach}
                {/if}
                {if $cnt == 0}
                    {foreach from=$person.mt_cancel_note item=value}
                        {if $value != ''}
                        <li>{$value|default:''}</li>
                        {/if}
                    {/foreach}
                {/if}
            </ul>
        </div>

        <div class="planning caption">
            <h5>ー企画実施会社ー</h5>
            {if $person.agency == 1}
                <p>{$person.marketer_type|default:''}<br>{$person.projectAddress|default:''}<br>旅行業登録：{$person.Registered_text|default:''}{$person.Travel_text|default:''}第{$person.projectNumber|default:''}号<br>総合旅行業務取扱管理者：{$person.TravelAdmin|default:''}</p>
                <ul>
                    {if $person.Clause == 2}
                        <li><a href="{$person.file2|default:''}" target="_blank">約款</a></li>
                    {else if $person.Clause == 3}
                        <li><a href="{$person.ClauseURL|default:''}" target="_blank">約款</a></li>
                    {else}
                        <li><a href="{$smarty.const.DEFAULT_CLAUSE}" target="_blank">約款</a></li>
                    {/if}

                    {if $person.file_select == 1}
                        <li><a href="{$person.file|default:''}" target="_blank">旅行条件書</a></li>
                    {else}
                        <li><a href="{$person.condition_url|default:''}" target="_blank">旅行条件書</a></li>
                    {/if}

                    {if $person.privacypolicy == 1}
                        <li><a href="{$person.file3|default:''}" target="_blank">個人情報保護方針</a></li>
                    {else}
                        <li><a href="{$person.PrivacyURL|default:''}" target="_blank">個人情報保護方針</a></li>
                    {/if}

                    {if $person.TravelPriceList == 1}
                        <li><a href="{$person.file4|default:''}" target="_blank">旅行業務取扱料金表</a></li>
                    {else}
                        <li><a href="{$person.PricelistURL|default:''}" target="_blank">旅行業務取扱料金表</a></li>
                    {/if}

                </ul>
            {else}
                <p>{$person.display_name|default:''}<br>〒{$person.zipcode|implode:'-'|default:''} {Constant::$aryPref[$person.pref]|default:''}{$person.address|default:''}</p>                
            {/if} 
            <p>お問い合わせ先TEL：<a href="tel:{$person.tel_|implode:''|default:''}">{$person.tel_|implode:'-'|default:''}</a></p>
        </div>

        <div class="calendar caption" id="entry">
            <h3>お申し込み</h3>
            <div class="order-table-section">
                <div class="course-select">
                    <p class="label"><span>コースを選択してください</span></p>
                    <select name="select" id="course_select">
                		<option value="" selected="selected">コースを選択してください</option>
                        {section name=i start=0 loop=count($data.course_id)}
                            {assign var='index' value=$smarty.section.i.index}
                            <option value="{$data.course_id[$index]}">{$data.course_name[$index]}</option>
                        {/section}
                	</select>
                </div>
                <div id="calendar">
                </div>
            </div>
        </div>
        <div class="details caption">
            <h3>プラン内容</h3>
            <div class="accordion">
                {section name=i start=0 loop=count($data.detail_title)}
                    {assign var='index' value=$smarty.section.i.index}
                    <div class="detail">
                        {if $data.detail_photo[$index] != ''}
                        <p><img src="{$data.detail_photo[$index]}" alt=""></p>
                        {/if}
                        {if $data.detail_title[$index] != ''}
                        <h4>{$data.detail_title[$index]}</h4>
                        {/if}
                        {if $data.detail_description[$index] != ''}
                        <p>{$data.detail_description[$index]|nl2br}</p>
                        {/if}
                        {if $data.detail_link[$index] != ''}
                        <div class="more">
                            <a href="{$data.detail_link[$index]}" target="_blank">詳しくはこちらへ<i class="fa fa-fw fa-external-link"></i></a>
                        </div>
                        {/if}
                    </div>
                {/section}
            </div>
        </div>
    </div>
    {if isset($recommend_data) && count($recommend_data) > 1}
    <div class="recommend">
        <div data-lg>
            <h4>このプランを見た人はこんなプランも見ています</h4>
            <div class="wrap cf">
                {foreach from=$recommend_data item=item}
                {if $item.product_id != $data.product_id}
                <div class="item">
                    <div class="image" style="background-image: url({$item.main_photo1|default:''});"></div>
                    <div class="text">
                        <h5>{$item.title|default:''}</h5>
                        <p>{$item.description|default:''}</p>
                        <div class="more">
                            <a href="{$smarty.const.URL_ROOT_PATH}niikawa/plan/?plan={$item.product_id|default:''}"><span>このプランを詳しく見る</span></a>
                        </div>
                    </div>
                </div>
                {/if}
                {/foreach}
            </div>
        </div>
    </div>
    {/if}
</div>

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
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/jquery.bxslider.min.css">
<script src="{$smarty.const.URL_ROOT_PATH}assets/js/jquery.bxslider.min.js"></script>
{literal}
<script>
    {/literal}
    var display_type = '{$type|default:''}';
    {literal}
    $(function() {
        /***************************
        表示設定
        ****************************/
        if(display_type == 'schedule') {
            $('.global-header').hide();
            $('main > *').each(function(){
                if(!$(this).hasClass('overview')) {
                    $(this).hide();
                }
            });
            $('main .overview > div > *').each(function(){
                if(!$(this).hasClass('calendar')) {
                    $(this).hide();
                } else {
                    $(this).children('h3').hide();
                }
            });
            $('main .overview > .recommend').hide();
            $('.global-footer').hide();
        }
    });
</script>
<script type="text/javascript">
    $(function(){
        var sliderImg = $('.bxslider .slide').length;
        if(sliderImg > 1){
            $('.bxslider').bxSlider({
                mode: 'fade',
                auto: true,
                speed: 2000,
                pause: 6000,
                // pager: false,
                controls: false,
                adaptiveHeight: true,
                adaptiveHeightSpeed: 0,
                touchEnabled: false,
            });
        }
    });
</script>
<script>
    $(function(){
        $(".details .btn-hide").on("click", function() {
            $(this).next().slideToggle();
            $(this).toggleClass("active");//追加部分
        });
    });
    $(function(){
        $(".details .btn-hide").click(function () {
            $(this).text(function(i, text){
                return text === "コースの内容を見る" ? "コースの内容を隠す" : "コースの内容を見る";
            })
        });
    })
</script>
<script>
    // select center寄せ
    $('.course-select select').on('change', function(){
        var $this = $(this)
        var $option = $this.find('option:selected');
        $('.label span').text($option.text());
        // onchange後にフォーカスしてるのが嫌な場合
        $this.blur();
    });

    // matchHeight
    $(function() {
        $('.recommend .item .text h5').matchHeight();
        $('.recommend .item .text p').matchHeight();
    });
</script>
<script type="text/javascript">
    var side_bar_html = '';
    var gmarkers = [];
    var i = 0;
    var map = null;
    var infowindow;
    var coordinate = [];
    function inicializar() {
        var styles = [{
            stylers: [
                {"hue": "#00a5b3"},
                {"saturation": -100}
            ],
        }];
        {/literal}
        {if count($data.coordinate) > 0}
            {assign var="map" value=","|explode:$data.coordinate[0]}
            {if count($map) > 1}
                google.maps.visualRefresh = true;
                infowindow = new google.maps.InfoWindow();
                var myOptions = {
                    zoom: 16,
                    //追加
                    center: new google.maps.LatLng({$map[0]}, {$map[1]}),
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    scrollwheel: false,
                    // draggable: false,
                    styles: styles
                };
                {literal}
                map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
                google.maps.event.addListener(map, 'click', function() {infowindow.close();});
                {/literal}  
            {/if}
        {/if}
        {section name=i start=0 loop=count($data.coordinate)}
            {assign var='index' value=$smarty.section.i.index}
            {assign var="map" value=","|explode:$data.coordinate[$index]}
            var point = new google.maps.LatLng({$map[0]}, {$map[1]});
            var marker = crearMarcador(point, '{$data.meeting_place[$index]|default:""}', '<strong>{$data.meeting_place_address[$index]|default:""}</strong><br><a href="https://maps.google.com/maps?q={$map[0]},{$map[1]}" target="_blank">google mapで見る</a>');
        {/section}
    }
    {literal}
    function crearMarcador(latlng, label, html) {
    	var marker = new google.maps.Marker({position: latlng, map: map, title: label});
    	google.maps.event.addListener(marker, 'click', function() {
    		infowindow.setContent(html);
    		infowindow.open(map, marker);
    		map.panTo(point);
    	});
    	gmarkers[i] = marker;
    	side_bar_html += '<a href="javascript:myclick('+i+')"><i class="fa fa-map-marker" aria-hidden="true"></i>'+label+'<\/a><br>';
    	document.getElementById('side_bar').innerHTML = side_bar_html;
    	i++;
    	return marker;
    }
    function myclick(i) {
    	google.maps.event.trigger(gmarkers[i], 'click');
    }
    //function loadScript() {
    //	var script = document.createElement('script');
    //	script.type = 'text/javascript';
    //	script.src = script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&region=jp&' + 'callback=inicializar';
    //	document.body.appendChild(script);
    //}

    window.onload = inicializar;
</script>
<script>
    $(function() {
        /***************************
        カレンダー処理
        stockcalendar_front.js
        ****************************/
        {/literal}
        var few = {$smarty.const.FEW_THRESHOLD};
        var plan = '{$data.product_id}';
        var now_ym = '{$smarty.now|date_format:'%Y-%m-01'}';
        var url_root = '{$smarty.const.URL_ROOT_PATH}';
        var display_type = '{$type|default:''}';
        {literal}
        function setStockCalendar(ym, cls, couse_change){
            $.ajax({
                type: "POST",
                url: location.pathname,
                data: { 'addtype' : 'calendar', 'ym' : ym, 'course_id' : $('#course_select').val(), 'couse_change': couse_change },
                success: function(data){
                    $('#calendar').stockcalendar({
                        'start':data.disp_ym,
                        'data':data,
                        'few':few,
                        'url_root':url_root,
                        'plan':plan,
                        'course':$('#course_select').val(),
                        'display_type':display_type
                    });
                    $('#calendar a.button.prev').click(function() {
                        setStockCalendar(data.prevMonth, false, false);
                    });
                    $('#calendar a.button.next').click(function() {
                        setStockCalendar(data.nextMonth, false, false);
                    });
                    if(cls) {
                        $('#calendar').addClass('pre');
                    } else {
                        $('#calendar').removeClass('pre');
                    }
                }
            });
        }
        $('#course_select').change(function(){
            setStockCalendar(now_ym, false, true);
        });
        setStockCalendar(now_ym, true, false);
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>