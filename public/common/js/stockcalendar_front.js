
(function($){
    $.fn.stockcalendar = function(options) {
        var settings = $.extend( {
        'week'      : ["日", "月", "火", "水", "木", "金", "土"],
        'week_en'   : ["sun", "mon", "tue", "wed", "thu", "fri", "sat"],
        'roop'      : 1,
        'prefix'    : 'mycld_',   //カレンダーで使われる変数名 他と被らないようユニークに
        'delimiter' : '-',        //送信時の日付の区切り文字 yyy/mm/dd
        'data'      : {},
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
        var s_Date     = settings.start.split("/");
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
            html +='                <i class="fa fa-fw fa-angle-left"></i>前月';
            html +='            </span>';
            html +='        </a>';
            html +='        <a class="button current">';
            html +='            <span>' + input_data.productDate + '</span>';
            html +='        </a>';
            html +='        <a class="button next" href="javascript:void(0);" >';
            html +='            <span class="icon">';
            html +='                翌月<i class="fa fa-fw fa-angle-right"></i>';
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
                          ymd = s_yy + settings.delimiter + s_mm + settings.delimiter + setDay;
                        } else {
                          day = '';
                        }
                    }
                    var id = settings.prefix + ymd;
                    html +='  <td class="' + class_td + ' ' + settings.week_en[d] + '" id="' + id + '">';
                    html +='      <span>' + day + '</span>';

                    if(day) {
                        var status = 'not';
                        var stock_value = eval('input_data.stock' + day);
                        var t_date = new Date(yyyy, (mmmm - 1) + i, day);
                        var now = new Date();
                        var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());

                        if( t_date < today ) {
                            //期限切れ
                            status = 'out';
                        } else if(settings.plan_type == 2) {
                            //リクエストプラン
                            status = 'ask';
                        } else {
                            if(stock_value <= 0) {
                                status = 'not';
                            } else if(stock_value <= settings.few) {
                                //残りわずか
                                status = 'few';
                            } else {
                                status = 'many';
                            }
                        }

                        html +='      <div class="order-status">';
                        html +='          <div class="' + status + '"></div>';
                        html +='      </div>';
                    }

                    html +='  </td>';
                }
                html +='</tr>';
            }
            html +='    </tbody>';
            html +='</table>';

            html +='<ul class="notes">';
            html +='    <li><p class="many">予約可能</p></li>';
            html +='    <li><p class="few">残りわずか</p></li>';
            html +='    <li><p class="not">空きなし</p></li>';
            html +='    <li><p class="out">期間外</p></li>';
            html +='    <li><p class="ask">お申し込み後、主催会社から受け入れ可否の連絡</p></li>';
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
