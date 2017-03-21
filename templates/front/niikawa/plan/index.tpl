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

<title>ページタイトル | サイト名</title>
<meta name="description" content="ディスクリプション">
<meta name="keywords" content="キーワード,キーワード,キーワード">
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
<meta property="og:site_name" content="サイト名">
<meta property="og:type" content="website">
<meta property="og:title" content="ページタイトル">
<meta property="og:description" content="ディスクリプション">
<meta property="og:url" content="">
<meta property="og:image" content="">
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
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header.tpl'}
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

{include file=$smarty.const.FRONT_DIR|cat:'includes/head/sns_share.tpl'}


<div class="overview">
    <div data-lg>
        <div class="title">
            <div class="now">
                <img src="{$smarty.const.URL_ROOT_PATH}assets/img/post/now.svg" alt="いますぐ買える">
            </div>
            <p class="sub-ttl">{$data.SubTitle|default:''}</p>
            <h2>{$data.title|default:''}</h2>
            <p>{$data.ExplanatoryText|default:''|nl2br}</p>
        </div>
        <div class="cost caption">
            <h3>料 金</h3>
            <p>
                {$data.plan_title_text[0]}{if $data.plan_Kind_text[0] != ''}({$data.plan_Kind_text[0]}){/if} <span>{$data.plan_Fee[0]}</span>円
                {section name=i start=1 loop=count($data.plan_title)}
                    {assign var='index' value=$smarty.section.i.index}
                    {if $data.plan_title[$index] != '' || $data.plan_Fee[$index] != '' || $data.plan_Kind[$index]}
                     ／ {$data.plan_title_text[$index]}{if $data.plan_Kind_text[$index] != ''}({$data.plan_Kind_text[$index]}){/if} <span>{$data.plan_Fee[$index]}</span>円
                    {/if}
                {/section}
            </p>
        </div>
        <div class="calendar caption" id="entry">
            <h3>予約カレンダー</h3>
            <div class="order-table-section">
            </div>
        </div>
        <div class="details caption">
            <h3>プラン詳細</h3>
            <div class="btn-hide">
                コースの内容を隠す
            </div>
            <div class="accordion">
                {section name=i start=0 loop=count($data.CourseTitle)}
                    {assign var='index' value=$smarty.section.i.index}
                    {if !($data.photo[$index] == '' && $data.CourseTitle[$index] == '' && $data.CourseDetail[$index] == '' && $data.CourseRink[$index] == '')}
                        <div class="detail">
                            {if $data.photo != ''}
                            <p><img src="{$data.photo[$index]}" alt=""></p>
                            {/if}
                            {if $data.CourseTitle != ''}
                            <h4>{$data.CourseTitle[$index]}</h4>
                            {/if}
                            {if $data.CourseDetail != ''}
                            <p>{$data.CourseDetail[$index]|nl2br}</p>
                            {/if}
                            {if $data.CourseRink != ''}
                            <div class="more">
                                <a href="{$data.CourseRink[$index]}" target="_blank">詳しくはこちらへ<i class="fa fa-fw fa-external-link"></i></a>
                            </div>
                            {/if}
                        </div>
                    {/if}
                {/section}
            </div>
        </div>
        <div class="information caption">
            <h5>ープラン情報ー</h5>
            <table>
                <tbody>
                    <tr>
                        <th>期間</th>
                        <td>{$data.StartDate|default:''}～{$data.EndDate|default:''}</td>
                    </tr>
                    {if $data.WhetExclusion != ''}
                    <tr>
                        <th>除外日</th>
                        <td>{$data.WhetExclusion|default:''|nl2br}</td>
                    </tr>
                    {/if}
                    {if count($data.plan_included) > 0}
                    <tr>
                        <th>ご旅行・プラン代金に含まれるもの</th>
                        <td>
                            {foreach from=$data.plan_included item=value}
                            {if $value != ''}
                            ・{$value}<br>
                            {/if}
                            {/foreach}
                        </td>
                    </tr>
                    {/if}
                    <tr>
                        <th>最少受付人員</th>
                        <td>{$data.minimumMember|default:''}名</td>
                    </tr>
                    <tr>
                        <th>最少催行人員</th>
                        <td>{$data.minimumDeparts|default:''}名</td>
                    </tr>
                    <tr>
                        <th>最大申込人員</th>
                        <td>{$data.largestMember|default:''}名</td>
                    </tr>
                    <tr>
                        <th>運行会社</th>
                        <td>{$data.Operation|default:''}</td>
                    </tr>
                    <tr>
                        <th>予約締切</th>
                        <td>{$data.contractDead|default:''}</td>
                    </tr>
                    <tr>
                        <th>キーワード</th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="map caption">
        <h5>ー集合場所ー</h5>
        <div id="contenido">
            <div id="lado" data-lg><div id="side_bar"></div></div>
            <div id="cuerpo"><div id="map_canvas"></div></div>
        </div>
    </div>
    <div data-lg>
        <div class="caution caption">
            <h5>ー注意事項ー</h5>
            <ul>
                {foreach from=$data.importantPoints item=value}
                {if $value != ''}
                <li>{$value|nl2br}</li>
                {/if}
                {/foreach}
            </ul>
        </div>
        <div class="other caption">
            <h5>ーその他ー</h5>
            <ul>
                {foreach from=$data.Other item=value}
                {if $value != ''}
                <li>{$value|nl2br}</li>
                {/if}
                {/foreach}
            </ul>
        </div>
        <div class="cancel caption">
            <h5>ー取消料ー</h5>
            <p>契約成立後、お客様のご都合で契約を解除する場合、旅行代金に対してお客様1名につき下記の料率で取消料をいただきます。なお、複数人数のご参加で、一部のお客様が契約を解除される場合は、ご参加のお客様から運送・宿泊機関等の（1台・1室あたりの）ご利用人数の変更に対する差額代金をそれぞれいただきます。</p>
            <table>
                <thead>
                    <tr>
                        {foreach from=$person.mt_cancel_ttl_text item=value}
                        {if $value != ''}
                        <th>{$value|default:''}</th>
                        {/if}
                        {/foreach}
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        {foreach from=$person.MtCancelRatio_text item=value}
                        {if $value != ''}
                        <td>{$value|default:''}</td>
                        {/if}
                        {/foreach}
                    </tr>
                </tbody>
            </table>
            <ul>
                {foreach from=$person.mt_cancel_note item=value}
                {if $value != ''}
                <li>{$value|default:''}</li>
                {/if}
                {/foreach}
            </ul>
        </div>
        <div class="planning caption">
            <h5>ー企画実施会社ー</h5>
            <p>
                {$person.marketer_type|default:''} TEL {$person.tel_|implode:'-'|default:''}<br>
                {$person.projectAddress|default:''}<br>
                旅行業登録：観光庁長官登録旅行業第{$person.projectNumber|default:''}号<br>
                {$person.projectName|default:''}
            </p>
            <ul>
                <li><a href="https://www.kanko-pro.co.jp/agreement/agreement4.php" target="_blank">約款</a></li>
                {if $person.file_select == 1}
                    <li><a href="{$person.file|default:''}" target="_blank">旅行条件書</a></li>
                {else}
                    <li><a href="{$person.condition_url|default:''}" target="_blank">旅行条件書</a></li>
                {/if}
                <li><a href="https://www.kanko-pro.co.jp/privacy/" target="_blank">個人情報保護方針</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="btn-entry">
    <a href="#entry" data-smooth><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i>このツアーに申し込む</span></a>
</div>

</main>
<!-- END main -->


<!-- START global-footer -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer.tpl'}
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
<script type="text/javascript">
    $(function(){
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
<script type="text/javascript">
    var side_bar_html = '';
    var gmarkers = [];
    var i = 0;
    var map = null;
    var infowindow;
    function inicializar() {
    var styles = [{
    	stylers: [
    		{"hue": "#00a5b3"},
    		{"saturation": -100}
    	],
    }];
    {/literal}  
    {assign var="map" value=","|explode:$data.Coordinate}
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
        var point = new google.maps.LatLng({$map[0]}, {$map[1]});
        var marker = crearMarcador(point, '{$data.locationname|default:""}', '<strong>{$data.locationname|default:""}</strong><br><a href="https://maps.google.com/maps?q={$map[0]},{$map[1]}" target="_blank">google mapで見る</a>');
    {/if}    
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
    function loadScript() {
    	var script = document.createElement('script');
    	script.type = 'text/javascript';
    	script.src = script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&region=jp&' + 'callback=inicializar';
    	document.body.appendChild(script);
    }
    window.onload = loadScript;
</script>
<script>
    $(function() {
        /***************************
        カレンダー処理
        stockcalendar_front.js
        ****************************/
        {/literal}
        var product_id = '{$data.ProductID|default:''}';
        var few = {$smarty.const.FEW_THRESHOLD};
        var plan_type = {$data.plan_type|default:1};
        var now_ym = '{$smarty.now|date_format:'%Y/%m'}';
        var closingout_date = {$data.ClosingOut_date|default:0};
        var closingout_time = '{$data.ClosingOut_time|replace:':':''|default:'2400'}';
        {literal}
        function setStockCalendar(ym){
            $.ajax({
                type: "POST",
                url: location.pathname,
                data: { 'addtype' : 'calendar', 'ym' : ym, 'ProductID' : product_id },
                success: function(data){
                    $('#entry .order-table-section').stockcalendar({'start':ym, 'data':data, 'few':few, 'plan_type':plan_type, 'closingout_date':closingout_date, 'closingout_time':closingout_time });
                    $('#entry .order-table-section a.button.prev').click(function() {
                        setStockCalendar(data.prevMonth);
                    });
                    $('#entry .order-table-section a.button.next').click(function() {
                        setStockCalendar(data.nextMonth);
                    });
                }
            });
        }
        setStockCalendar(now_ym);
    });
</script>
{/literal}

{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>