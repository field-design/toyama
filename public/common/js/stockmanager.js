function StockManager() {

	var selectY;
	var selectM;
	var calenNum = 0;
	var dpInput;

	var THIS = this;

	/**
	 * ボタンにカレンダー処理を設定
	 */
	THIS.setButton = function(selector) {
		var _this = $(selector);
		//datepicker用input作成
		dpInput = $('<input>').attr({
							type: 'text',
							style: 'position:absolute;z-index:-1;opacity:0;padding: 0;border: 0'
					});
		dpInput.css('top', _this.offset().top);
		dpInput.css('left', _this.offset().left);
		dpInput.height(_this.outerHeight());
		_this.after(dpInput);

		dpInput.datepicker(
			{
				onSelect: function(dateText, inst){
					var dt = new Date(dateText);
					THIS.changeCalendar(dt);
				}
			}
		);

		// 年月指定ボタン
		_this.click(function() {
			dpInput.datepicker('show');
		});

		// 前月ボタン
		$('#stock_calendar_prev').click(function(){
			var dt = new Date(dpInput.val());
			dt.setMonth(dt.getMonth() - 1);
			THIS.changeCalendar(dt);
		});

		// 当月ボタン
		$('#stock_calendar_current').click(function(){
			var dt = new Date();
			THIS.changeCalendar(dt);
		});

		// 次月ボタン
		$('#stock_calendar_next').click(function(){
			var dt = new Date(dpInput.val());
			dt.setMonth(dt.getMonth() + 1);
			THIS.changeCalendar(dt);
		});

		//当月設定
		//var dt = new Date();
		//THIS.changeCalendar(dt);
	}

	/**
	 * カレンダー変更時処理
	 */
	THIS.changeCalendar = function(dt, data={}) {
		var dt_y = dt.getFullYear();
		var dt_m = dt.getMonth() + 1;
		var dt_d = dt.getDate();
		var dt_ym = dt_y + '-' + getLeftZero(dt_m, 2);
		var dt_ymd = dt_y + '/' + getLeftZero(dt_m, 2) + '/' + getLeftZero(dt_d, 2);

		// 対象年月文字設定
		$('#stock_calendar_picker span').html(dt_y + '年' + dt_m + '月');
		if(dpInput) {
			dpInput.val(dt_ymd);
		}

		// 各月を非表示
		$('#stock_calendars').children().each(function() {
			$(this).hideCalendar();
		});

		// 対象年月作成
		if(!$("." + dt_ym).length) {
			// カレンダーがなければ作成
			setCalendar(dt_ym, '', data);
		} else {
			// カレンダーがあれば既存のものを表示
			$("." + dt_ym).showCalendar();
		}
	}

	/**
	 * カレンダー作成
	 */
	function setCalendar(ym, value, data) {
		//idには連番を付与
		calenNum++;

		//カレンダー作成位置設定
		var ins_pos = 0;
		$('#stock_calendars').children().each(function() {
			if( $(this).attr('class') < ym) {
				ins_pos++;
			}
		});

		if(ins_pos == 0) {
			$('#stock_calendars').prepend('<div id="stock_calendar' + calenNum + '" class="' + ym +'" ></div>');
		} else {
			$('#stock_calendars > div:nth-child(' + ins_pos + ')').after('<div id="stock_calendar' + calenNum + '" class="' + ym +'" ></div>');
		}

		//カレンダー作成
		$('#stock_calendar' + calenNum).stockcalendar({
			'start' : ym,
			'prefix': 'calen' + calenNum + '_',
			'data'  : data 
		});

	}

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
}