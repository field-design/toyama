
(function($){
    $.fn.stockcalendar = function(options) {
        var settings = $.extend( {
        'week'      : ["日", "月", "火", "水", "木", "金", "土"],
        'week_en'   : ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
        'roop'      : 1,
        'prefix'    : 'mycld_',   //カレンダーで使われる変数名 他と被らないようユニークに
        'delimiter' : '-',        //送信時の日付の区切り文字 yyy/mm/dd
        'data'      : {},
        'lang'      : 1,
    }, options);

    $(this).html('');//カレンダー展開場所の中身をクリア
    
    var $div      = $(this);
    var str_Date = null;
    var end_Date  = null;

    var class_td         = settings.prefix+'td';
    var class_month_on   = settings.prefix+'month_on';
    var class_month_off  = settings.prefix+'month_off';
    var class_month_del  = settings.prefix+'month_del';

    var input_data       = settings.data;


    /*
    * 開始日を設定
    */
    if(settings.start){
        var s_Date     = settings.start.split("-");
        str_Date = new Date(s_Date[0],s_Date[1]-1,1);
    }　else　{
        var sdate = new Date();
        var s_yy  = sdate.getFullYear();
        var s_mm  = sdate.getMonth()+1;
        var s_dd  = sdate.getDate();
        str_Date = new Date(s_yy,s_mm-1,s_dd);
    }

    var y = str_Date.getFullYear();
    var m = str_Date.getMonth()+1;

    /*
    * 言語設定
    */
    var text_prev_month = '前月';
    var text_next_month = '翌月';
    var text_yaer = '年';
    var text_month = '月';
    var text_mark_title = 'ーカレンダーの見方ー';
    var text_many = '予約可能';
    var text_few = '残りわずか';
    var text_not = '空きなし';
    var text_out = '期間外';
    var text_ask = 'お申し込み後、主催会社から受け入れ可否の連絡';
    if(settings.lang == 2) {
        text_prev_month = 'last month';
        text_next_month = 'next month';
        text_yaer = '/';
        text_month = '';
        settings.week = settings.week_en;
        text_mark_title = '- How to read the calendar -';
        text_many = 'Reservation Available';
        text_few = 'Limited Places Remaining';
        text_not = 'Sold Out';
        text_out = 'Outside of Time Frame';
        text_ask = 'After you apply, the operating company will contact you on the result of your application';
    }

    /*
     * リンクウィンドウ設定
     */
    var link_target = '';
    if (settings.display_type == 'schedule') {
        link_target = 'target="_blank"';
    }

    /*
    * カレンダー展開
    */
    var Calendar = function(obj,yyyy,mmmm){
        var week = settings.week;
        var html = '';

        //カレンダー作成
        for(var i=0; i<settings.roop; i++){
            var sdate = new Date(yyyy, (mmmm - 1) + i, 1);
            var s_yy  = sdate.getFullYear(); //年
            var s_mm  = sdate.getMonth() + 1;  //月
            var blank = sdate.getDay()|0;           //月始めの空白欄数
            var last = lastDay(s_yy, s_mm)|0;        //月末の日
            var cal  = Math.ceil( (blank+last) / 7 ); //行数を求める
          
            var table_ID = settings.prefix + s_yy + getLeftZero(s_mm, 2);

            html +='<div class="month-pager">';
            html +='    <div class="wrap cf">';
            html +='        <a class="button prev" href="javascript:void(0);" >';
            html +='            <span class="icon">';
            html +='                <i class="fa fa-fw fa-angle-left"></i>' + text_prev_month;
            html +='            </span>';
            html +='        </a>';
            html +='        <a class="button current">';
            html +='            <span>' + s_yy + text_yaer + s_mm + text_month + '</span>';
            html +='        </a>';
            html +='        <a class="button next" href="javascript:void(0);" >';
            html +='            <span class="icon">';
            html +='                ' + text_next_month + '<i class="fa fa-fw fa-angle-right"></i>';
            html +='            </span>';
            html +='        </a>';
            html +='    </div>';
            html +=' </div>';

            html +='<table class="order-table">';
            html +='    <thead>';
            html +='        <tr>';
            html +='            <th class="' + settings.week_en[0] + '"><span>' + settings.week[0] + '</span></th>';
            html +='            <th class="' + settings.week_en[1] + '"><span>' + settings.week[1] + '</span></th>';
            html +='            <th class="' + settings.week_en[2] + '"><span>' + settings.week[2] + '</span></th>';
            html +='            <th class="' + settings.week_en[3] + '"><span>' + settings.week[3] + '</span></th>';
            html +='            <th class="' + settings.week_en[4] + '"><span>' + settings.week[4] + '</span></th>';
            html +='            <th class="' + settings.week_en[5] + '"><span>' + settings.week[5] + '</span></th>';
            html +='            <th class="' + settings.week_en[6] + '"><span>' + settings.week[6] + '</span></th>';
            html +='        </tr>';
            html +='    </thead>';
            html +='    <tbody>';

            //行数分をループ
            var setDay = 0;
            for (var r = 0; r<cal; r++){
                html +='<tr>';
                //一週間分をループ
                for (var d=0; d<7; d++){
                    var day = '';
                    var ymd = '';
                    if (r==0 && d<blank){
                        day = '';
                    } else {
                        setDay++;
                        if (setDay <= last){
                          day = setDay;
                          ymd = s_yy + '-' + getLeftZero(s_mm, 2) + '-' + getLeftZero(setDay, 2);
                        } else {
                          day = '';
                        }
                    }
                    var id = settings.prefix + ymd;
                    html +='  <td class="' + class_td + ' ' + settings.week_en[d] + '" id="' + id + '">';
                    html +='      <span>' + day + '</span>';

                    if(day) {
                        var status = 'not';
                        var stock_type = input_data.stock_type[day - 1];
                        var stock_value = input_data.stock_value[day - 1];
                        var stock_option = input_data.stock_option[day - 1];
                        var t_date = new Date(yyyy, (mmmm - 1) + i, day);
                        var now = new Date();
                        var now_ymd = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                        var now_time = getLeftZero(now.getHours(), 2) + getLeftZero(now.getMinutes(), 2);
                        var now_plus_closingout = new Date(now.getFullYear(), now.getMonth(), now.getDate() + input_data.close_date);
                        var now_plus_openingout_from = new Date(now.getFullYear(), now.getMonth(), now.getDate() + input_data.open_date_from);
                        var now_plus_openingout = new Date(now.getFullYear(), now.getMonth(), now.getDate() + input_data.open_date);

                        if (input_data.reservation_type == 2) {
                            //申込可能期間入力
                            if (t_date.getTime() > now_plus_openingout.getTime() ) {
                                //申込可能期間外は期限切れ
                                status = 'out';
                            } else if (t_date.getTime() < now_plus_openingout_from.getTime()) {
                                //当日未満は期限切れ
                                status = 'out';
                            } else if (t_date.getTime() == now_plus_openingout_from.getTime() && now_time >= input_data.open_date_from_limit ) {
                                //申込可能期間の初日、指定時刻以降は期限切れ
                                status = 'out';
                            } else {
                                if (stock_type == null) {
                                    //期間外
                                    status = 'out';
                                } else if (stock_type == 1) {
                                    //リクエストプラン
                                    status = 'ask';
                                } else if (stock_type == 2) {
                                    //在庫なし
                                    status = 'not';
                                } else if (stock_value <= 0) {
                                    //在庫なし
                                    status = 'not';
                                } else if (stock_value <= settings.few) {
                                    //残りわずか
                                    status = 'few';
                                } else {
                                    status = 'many';
                                }
                            }

                        } else {

                            //手仕舞い日入力
                            if( t_date.getTime() < now_plus_closingout.getTime() ) {
                                //手じまい日未満は期限切れ
                                status = 'out';
                            } else if( t_date.getTime() == now_plus_closingout.getTime() && now_time >= input_data.close_time ) {
                                //手じまい日の手じまい時刻以降は期限切れ
                                if(stock_option == 1) {
                                    status = 'ask';
                                } else {
                                    status = 'out';
                                }
                            } else {
                                if(stock_type == null) {
                                    //期間外
                                    status = 'out';
                                } else if(stock_type == 1) {
                                    //リクエストプラン
                                    status = 'ask';
                                } else if(stock_type == 2) {
                                    //在庫なし
                                    status = 'not';
                                } else if(stock_value <= 0) {
                                    //在庫なし
                                    status = 'not';
                                } else if(stock_value <= settings.few) {
                                    //残りわずか
                                    status = 'few';
                                } else {
                                    status = 'many';
                                }
                            }

                        }

                        html +='      <div class="order-status">';
                        if( status == 'ask' || status == 'few' || status == 'many' ) {
                            html += '          <a href="' + settings.url_root + 'order/?plan=' + settings.plan + '&course=' + settings.course + '&ymd=' + ymd + '" ' + link_target + '><div class="' + status + '"></div></a>';
                        } else {
                            html +='          <div class="' + status + '"></div>';
                        }
                        html +='      </div>';
                    }

                    html +='  </td>';
                }
                html +='</tr>';
            }
            html +='    </tbody>';
            html +='</table>';

            html +='<h4>' + text_mark_title + '</h4>';
            html +='<ul class="notes">';
            html +='    <li><p class="many">'+ text_many +'</p></li>';
            html +='    <li><p class="few">'+ text_few +'</p></li>';
            html +='    <li><p class="not">'+ text_not +'</p></li>';
            html +='    <li><p class="out">'+ text_out +'</p></li>';
            html +='    <li><p class="ask">'+ text_ask +'</p></li>';
            html +='</ul>';
        }

        obj.html(html);
    };
    
    /*
    * 月末を得る
    */
    var lastDay = function(y, m){
      var dt = new Date(y, m, 0);
      return dt.getDate();
    };   
    
    return Calendar($(this),y,m);
  };

  /**
   * ゼロ埋め処理
   *
   * @param {number} number  数値
   * @param {number} keta    ゼロ埋め後の桁数
   *
   * @return {string} ゼロ埋め後の文字列
   */
  function getLeftZero(number, keta)
  {
    var number = String(number);
  
    if (number.length > keta) {
      return number;
    }
  
    //乗算により0を追加後、指定桁数分切り出し
    temp = Math.pow(10, keta) + number;
    return temp.slice(keta * -1);
  }
})(jQuery);
