//승차권 예매 관련 js
//달력최종 js
$(function(){
		$('#datepicker').datepicker({ 
			changeMonth: true, 
			changeYear: true,
			nextText: '다음 달',
			prevText: '이전 달',
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: "yy-mm-dd",
			minDate: 0,		// 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
		});
	});//end function
	
	

