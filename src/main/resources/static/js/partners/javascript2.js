/* bid */



/* bid_detail */
$(function () {
	//오늘 날짜를 출력
	$("#today").text(new Date().toLocaleDateString());

	//datepicker 한국어로 사용하기 위한 언어설정
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	// 시작일(est_start)은 종료일(est_end) 이후 날짜 선택 불가
	// 종료일(est_end)은 시작일(est_start) 이전 날짜 선택 불가

	//시작일.
	$('#bid_start').datepicker({
		showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
		buttonImage: "images/calendar.gif", // 버튼 이미지
		buttonImageOnly: true,             // 버튼 이미지만 표시할지 여부
		buttonText: "",             // 버튼의 대체 텍스트
		dateFormat: "yy-mm-dd",             // 날짜의 형식
		changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
		//minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
		onClose: function (selectedDate) {
			// 시작일(est_start) datepicker가 닫힐때
			// 종료일(est_end)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			$("#bid_end").datepicker("option", "minDate", selectedDate);
		}
	});

	//종료일
	$('#bid_end').datepicker({
		showOn: "both",
		buttonImage: "images/calendar.gif",
		buttonImageOnly: true,
		buttonText: "",
		dateFormat: "yy-mm-dd",
		changeMonth: true,
		//minDate: 0, // 오늘 이전 날짜 선택 불가
		onClose: function (selectedDate) {
			// 종료일(est_end) datepicker가 닫힐때
			// 시작일(est_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
			$("#bid_start").datepicker("option", "maxDate", selectedDate);
		}
	});
});


		
	
	
	