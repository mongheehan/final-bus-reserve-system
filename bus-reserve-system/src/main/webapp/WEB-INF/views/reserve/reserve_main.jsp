<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 시큐리티:권한 설정 태그(마이페이지, 매니저페이지) -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- header -->
<%@include file="../includes/header.jsp"%>
<!-- 승차권 예매 페이지 시작 -->
<div id="page_title">
	<h5>승차권 예매 > 예매정보</h5>
</div>
<!-- 승차권 조회 부분(#reserve_content1) -->
	<div id="reserve_content1">
		<div id="reserve_search">
			<h5>승차권 예매</h5>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="true">편도</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="false">왕복</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
			<!-- 편도탭 조회 목록 -->
				<div class="tab-pane fade show active" id="home-tab-pane"
					role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<table>
						<tr>
							<td colspan="2" class="departureTerminal">출발지: <input type="text"
								class=txt id=start_point value="출발지를 선택해주세요.">
								<button class="button1" id=choice_terminal>선택</button>
							</td>
						</tr>
						<tr>
							<td class="arrivalTerminal">도착지: <input type="text"
								class=txt id=end_point value="도착지를 선택해주세요.">
								<button class="button1" id=choice_terminal2>선택</button>
							</td>
							<td>
								<div class="search_date">날짜: <input type="text" id="datepicker"></div>
							</td>
						</tr>
					</table>
					<button class="button1 btn_get_dispatches">배차정보조회하기</button>
				</div>
				<!-- 왕복탭 조회 목록 -->
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">...</div>
			</div>
		</div>
	</div>
	<!-- #reserve_content1 끝 -->
	
	<!-- 조회 목록 선택 후 배자 목록(#reserve_content2) -->
	<div id="reserve_content2">
	<!-- 조회 조건에 대한 배차정보 -->
		<table id = "dispatch">
			
		</table>
	</div>
	<!-- #reserve_content2 끝 -->
	
	<!-- 출발지터미널, 도착지터미널 검색 modal -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">터미널 선택</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div name = "startLayer">
						<strong>출발지 터미널</strong>
						<table>
							<c:forEach items ="${terminals}" var = "terminal">
								<tr>
									<td class = "obj_visible">
										<a href ="#" class = "terminal-link">[${terminal.region}]${terminal.terminalName}</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div name = "endLayer">
						<strong>도착지 터미널</strong>
						<table id ="destinationTerminal">
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">저장</button>
					<button type="button" class="btn btn-reset">초기화</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 출발지터미널, 도착지터미널 검색 modal 끝 -->
	
	
	<!-- 입력정보확인(예매내역) 모달창 -->
   <div class="modal fade" id="seatInfoModal" tabindex="-1" role="dialog" aria-labelledby="seatInfoModalLabel" aria-hidden="true">
     <div class="modal-dialog" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <h1 class="modal-title fs-5" id="seatInfoModalLabel">예매정보확인</h1>
             <span aria-hidden="true">&times;</span>
         </div>
         <div class="modal-body">
           <!-- 좌석 정보가 여기에 표시됩니다. -->
         </div>
         <div class="modal-footer">
            <p><strong>위 정보가 맞습니까?</strong></p>
            <button type="button" class="btn btn-primary">예</button>
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
         </div>
       </div>
     </div>
   </div>
	
	
<!-- 승차권예매 페이지 끝 -->
<script>
	//출발지 선택 클릭 이벤트 
	var choice_terminal;
	document.getElementById('choice_terminal').addEventListener('click', function(){
	 	choice_terminal = new bootstrap.Modal(document.getElementById('myModal'));
	 	alert(choice_terminal);
		choice_terminal.show();  //point1
	})
	//도착지 선택 클릭 이벤트
		document.getElementById('choice_terminal2').addEventListener('click', function(){
		choice_terminal = new bootstrap.Modal(document.getElementById('myModal'));
		choice_terminal.show();  //point1
	})
</script>
<script>
	$(function(){
		$('.terminal-link').click(function(event){
			event.preventDefault();
			$(this).parent().parent().siblings().addClass('hidden');
			$(this).addClass('choiced');
			var terminalName = $(this).text().replace(/\[.*?\]/g, '').trim();
			console.log(this);//test
	        console.log(terminalName);//test
	        
	        $.ajax({
	            type: 'GET',
	            url: '/reserve/start', 
	            data: { terminalName: terminalName },
	            dataType: 'json',
	            success: function(candidates) {
	            	console.log("success바로 밑에 줄" + candidates);//test
	                $('#destinationTerminal').empty();
	                $('#destinationTerminal').append($('<b>').text('"'+terminalName+'"'+ '에 대한 도착 정보입니다... 원하시는 목적지를 선택해주세요.'));
	                $.each(candidates, function(index, candidate) {
	                	console.log("each문 바로 밑에 줄" + candidates);//test
	                    var newRow = $('<tr>').append(
	                        $('<td>').addClass('obj_visible').append(
	                            $('<a>').attr('href', '#').addClass('terminal-link').text('[' + candidate.endRegion + ']' + candidate.endTerminal)
	                        )
	                    );
	                    $('#destinationTerminal').append(newRow);
	                });
	            }//end sucess
	        });//end $.ajax
		});//end $('.terminal-link').click
		
		$('#destinationTerminal').on('click','.terminal-link',function(event){
			event.preventDefault();
			$(this).parent().parent().siblings().addClass('hidden');
			$(this).addClass('choiced');
			var terminalName = $(this).text().replace(/\[.*?\]/g, '').trim();
			console.log(this);//test
	        console.log(terminalName);//test
		});//end $('#destinationTerminal').click
		
		$('.btn-secondary').click(function(){ //닫기 버튼
			$('.terminal-link').parent().parent().siblings().removeClass('hidden');
			$('.terminal-link').removeClass('choiced');
			$('#destinationTerminal').empty();
		});//end $('.btn-secondary').click 
		
		$('.btn-primary').click(function(){  //저장 버튼
			var startPoint = $('div[name="startLayer"] .terminal-link.choiced').text();
			var endPoint = $('div[name="endLayer"] .terminal-link.choiced').text();
			console.log(startPoint);//test
			console.log(endPoint);//test
			
			$('#start_point').val(startPoint);
			$('#end_point').val(endPoint);
			
			choice_terminal.hide(); //모달숨김
			
		});//end $.('.btn-primary').click
		
		$('.btn-reset').click(function(){  //초기화버튼
			$('.terminal-link').parent().parent().siblings().removeClass('hidden');
			$('.terminal-link').removeClass('choiced');
			$('#destinationTerminal').empty();
		});
		
		$('.btn_get_dispatches').click(function(){  //[배차정보 조회하기] 버튼 클릭 >  배차정보 출력(동적)
			var startTerminal = $('#start_point').val().replace(/\[.*?\]/g, '').trim();
			var endTerminal = $('#end_point').val().replace(/\[.*?\]/g, '').trim();
			var date = $('#datepicker').val();
			console.log(startTerminal);//test
			console.log(endTerminal);//test
			console.log(date);//test
			
			var searchData = {
				startTerminal : startTerminal,
				endTerminal : endTerminal,
				departureTime : date
			};
			
			var jsonData = JSON.stringify(searchData);//test
			
			console.log(jsonData);//test
			
		        $.ajax({
	            type: 'POST',
	            url: '/reserve/dispatch', 
	            data: jsonData,
	            contentType: 'application/json',
	            dataType: 'json',
	            success: function(dispatches) {
	               console.log("success: " + dispatches);//test
	               $('#reserve_content2').empty();
	               $('#reserve_content2').append('<b>입력하신 정보에 대한 배차조회 결과에요.</b>');
	               $.each(dispatches, function(index, dispatch){
	            	   alert("success안 each문 성공: " + dispatches);//test
	            	   var newRow = $('<tr class = "dis-info-elem">');
	            	   newRow.append('<td><b>' +'['+ dispatch.busType +']' +dispatch.busNo +'번  /// '+  '</b></td>');
	                   newRow.append('<td>' +'<b>&nbsp&nbsp출발시간:</b>'+ dispatch.departureTime + '</td>');
	                   newRow.append('<td>' + '<b>&nbsp&nbsp출발지:</b>' + '[' + dispatch.startRegion + ']'+dispatch.startTerminal + '</td>');
	                   newRow.append('<td>' + '<b>&nbsp&nbsp도착지:</b>' + '[' + dispatch.endRegion +']' + dispatch.endTerminal + '</td>');
	                   newRow.append('<td>' +'<b>&nbsp&nbsp총좌석수:</b>'+ dispatch.totalSeat + '</td>');
	                   newRow.append('<td>&nbsp&nbsp<button type="button" id="get_seats">좌석선택</button></td>');
	                   newRow.append('<td class = "hidden">'+dispatch.dispatchNo + '</td></tr>');
	            	   $('#reserve_content2').append(newRow);
	               }); //end $.each
	            }//end success
	        });//end $.ajax     
		});//end $('.btn_get_dispatches').click
		
		$('#reserve_content2').on('click', '#get_seats', function(){
			var superSeatTable = ''+
		    '<table class="seat-table">' +
			    '<thead>' +
				    '<tr>' +
					    '<th colspan="2"><img src="/resources/img/driver.png" alt="운전석">운전석</th>' +
					    '<th></th>' +
					    '<th></th>' +
					    '<th>출입구</th>' +
				    '</tr>' +
			    '</thead>' +
			    '<tbody>' +
				    '<tr>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>1</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>2</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>3</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>4</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>5</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>6</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>7</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>8</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>9</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>10</span></div></td>' +
					    '<td></td>'+
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>11</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>12</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>13</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>14</span></div></td>' +
				    	'<td>통로</td>'+
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>15</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>16</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>17</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>18</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>19</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>20</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>21</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>22</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>23</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>24</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>25</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>26</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>27</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>28</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>29</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>30</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>31</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>32</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>33</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>34</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>35</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>36</span></div></td>' +
				    '</tr>' +
				    '<tr>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>37</span></div></td>' +
				    	'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>38</span></div></td>' +
					    '<td></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>39</span></div></td>' +
					    '<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>40</span></div></td>' +
				    '</tr>' +
				 	'<tr>' +
				 		'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>41</span></div></td>' +
				 		'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>42</span></div></td>' +
				 		'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>43</span></div></td>' +
				 		'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>44</span></div></td>' +
				 		'<td><div class="seat-container"><img src="/resources/img/empty_seat.png" alt="좌석"><span>45</span></div></td>' +
				    '</tr>' +
			    '</tbody>' +
		    '</table>';
		    $('.seat-table').remove();
			$(this).parent().parent().after(superSeatTable); 
			
			var dispatchNo = $(this).parent().parent().find('td.hidden').text(); 
            //var dispatchNo = $('#container tr.dis-info-elem td.hidden').text(); //2836
            console.log("배차번호 : "+ dispatchNo); //test
            $.ajax({ //이미 예약된 좌석 표시하기
                  type: 'GET',
                  url: '/reserve/seat-number', 
                  data: { dispatchNo: dispatchNo},
                  dataType : 'json',
                  success: function(tickets) {
                      
                     $.each(tickets, function(index,ticket){
                        console.log("티켓정보");//test
                        var seatImg = $('.seat-container').find('span').filter(function(){
                           return $(this).text() == ticket.seatNo;
                        }).closest('.seat-container').find('img');
                        
                        seatImg.attr('src',"/resources/img/reserved_seat.png");
                        $('.seat-container').find('span').filter(function(){
                           return $(this).text() == ticket.seatNo;
                        }).text(' ');
                     });//end $.each
                  }//end sucess
            }); //end $.ajax
		});//end $('#container').on('click') 
		
		
		 $('#reserve_content2').on('mouseenter', '.seat-container img', function() { //마우소 올렸을 때
             var originalSrc = $(this).attr('src');
             if (originalSrc.includes('/resources/img/empty_seat.png')) {
                 $(this).attr('src', '/resources/img/choiced_seat.png');
             }
         }).on('mouseleave', '.seat-container img', function() {   //마우스 내렸을 때
             var originalSrc = $(this).attr('src');
             if (originalSrc.includes('/resources/img/choiced_seat.png')) {
                 $(this).attr('src', '/resources/img/empty_seat.png');
             }
         });
         
         $('#reserve_content2').on('click', '.seat-container img', function() {  //클릭했을 때
             var originalSrc = $(this).attr('src');
            if(originalSrc.includes('/resources/img/reserved_seat.png')){
               return;
            }
             var seatNo = $(this).closest('td').find('span').text();
               var result = false;
               result = confirm(seatNo+"번 좌석을 선택할까요?" );
               if(result){
                  //alert("예매내역확인으로 이동");
               var startTerminal = $('.seat-table').prev('.dis-info-elem').children('td').eq(2).text();
               var endTerminal = $('.seat-table').prev('.dis-info-elem').children('td').eq(3).text();
               var busNo = $('.seat-table').prev('.dis-info-elem').children('td').eq(0).text();
               var departureTime = $('.seat-table').prev('.dis-info-elem').children('td').eq(1).text();
               var seatNo = $(this).siblings('span').text();
               
               var regex = /\[(.*?)\](.*)/;
               var matches = startTerminal.match(regex);
               var startRegion = matches[1]; // "서울"과 같은 문자열을 얻습니다.
               var startTerminal = matches[2]; // "서울고속버스터미널"과 같은 문자열을 얻습니다.
               
               var matches2 = endTerminal.match(regex);
               var endRegion = matches2[1];
               var endTerminal = matches2[2];
                  
                  var busNo= busNo.match(/\d+/)[0];
               var departureTime =  departureTime.match(/출발시간:(.*)/)[1].trim();
/*
               //test
               console.log(startRegion);
               console.log(startTerminal);
               console.log(endRegion);
               console.log(endTerminal);
               console.log(busNo);
               console.log(seatNo);
               console.log(departureTime);
*/
               var modalContent = "<p><strong>출발지:</strong>[" + startRegion + "]" + startTerminal + "</p>" +
                    "<p><strong>도착지:</strong>[" + endRegion + "]" + endTerminal + "</p>" +
                    "<p><strong>버스 번호:</strong> " + busNo + "</p>" +
                    "<p><strong>좌석:</strong> " + seatNo + " 번</p>" +
                    "<p><strong>인원:</strong> 1명</p>" +
                    "<p><strong>출발 일시:</strong> " + departureTime + "</p>"+
                    "<p><strong>금액:</strong> 1,000,000 원</p>";
 
                // 모달 내용 업데이트
                $('#seatInfoModal .modal-body').html(modalContent);
               
                // 모달 표시
                $('#seatInfoModal').modal('show');
               
               
             }else{
                return;
             }
         });
		
		
		
		
	});//end func

</script>



<!-- JS 부트스트랩 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- footer -->
<%@include file="../includes/footer.jsp"%>