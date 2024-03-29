<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<div id="page_title">
	<h5>관리자 페이지 > 배차관리</h5>
</div>
<!-- manager_route1 시작 -->
<div id="manager_route_content1">
	사이드바
</div>
<!-- manager_route1 끝 -->

<!-- manager_route2 시작 -->
<div id="manager_route_content2">
	<table id="dispatch_list" class="table table-hover">
		<thead>
			<tr>
				<th>배차번호</th>
				<th>버스번호</th>
				<th>출발지</th>
				<th>도착지</th>
				<th colspan="2">출발일시</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dispatchList}" var="dispatch">
				<tr>
					<td><c:out value="${dispatch.dispatchNo}" /></td>
					<td><c:out value="${dispatch.busNo}" /></td>
					<td><c:out value="${dispatch.startPointName}" /></td>
					<td><c:out value="${dispatch.endPointName}" /></td>
					<td><c:out value="${dispatch.departureTime}" /></td>
					<td><button type="button" class="btn removeBtn btn-secondary btn-sm">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<button id="dispatch_insert_modal" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	배차등록</button>
</div>
<!-- manager_route2 끝 -->

<!-- 배차등록 모달페이지 -->
<!-- 배차 등록 창 시작 -->
<div class="modal fade" id="dispatchModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">배차등록</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form>
					<input type="text" id="dispatchNo" name="dispatchNo"/>
					<div class="route_select">
						<p class="select_title">버스번호</p>
						<select id="busNumberSelect" class="form-select" name="busNumberSelect"
							aria-label="Default select example">
							<option selected disabled>버스번호선택</option>
							<c:forEach items="${busList}" var="bus">
								<option><c:out value="${bus.busNo}" /></option>
							</c:forEach>
						</select>
					</div>
					<div class="route_select">
						<p class="select_title">출발지</p>
						<select id="departureRegionSelect" class="form-select"
							aria-label="Default select example">
							<option selected>지역선택</option>
							<c:forEach items="${region}" var="region">
								<option value="${region}"><c:out value="${region}" /></option>
							</c:forEach>
						</select> <select id="departureTerminalSelect" class="form-select"
							aria-label="Default select example"
							name="departureTerminalSelect">
							<option selected>터미널선택</option>
							<c:forEach items="${terminalList}" var="terminalManager">
								<option value="${terminalManager.terminalName}"
									data-region="${terminalManager.region}" style="display: none;">
									<c:out value="${terminalManager.terminalName}" /></option>
							</c:forEach>
						</select>
					</div>
					<div class="route_select">
						<p class="select_title">도착지</p>
						<select id="destinationRegionSelect" class="form-select"
							aria-label="Default select example">
							<option selected>지역선택</option>
							<c:forEach items="${region}" var="region">
								<option value="${region}"><c:out value="${region}" /></option>
							</c:forEach>
						</select> <select id="destinationTerminalSelect" class="form-select"
							aria-label="Default select example"
							name="destinationTerminalSelect">
							<option selected>터미널선택</option>
							<c:forEach items="${terminalList}" var="terminalManager">
								<option value="${terminalManager.terminalName}"
									data-region="${terminalManager.region}" style="display: none;">
									<c:out value="${terminalManager.terminalName}" /></option>
							</c:forEach>
						</select>
					</div>
					<div class="route_select">
						<p class="select_title" style="width: 90px">출발일시</p>
						<input class="form-control" type="datetime-local" id="dateTimeInput" name="dateTimeInput"><br>
						<br>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<button type="button" id="modifyBtn" class="btn btn-primary">수정</button>
				<button class="btn btn-primary" id="saveBtn" type="button" data-dismiss="modal">저장</button>
				<button class="btn btn-primary" id="modifySaveBtn" type="button" data-dismiss="modal">수정완료</button>
			</div>
		</div>
	</div>
</div>
<!-- 배차 등록 창 끝 -->

<!-- 배차등록 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		
		//삭제(구현안됨...)
		 $(".removeBtn").on("click", function(e){
	            $(this).closest('tr').remove(); // 해당 버튼이 속한 행을 삭제
	            // 추가로 필요한 작업 수행
	        });
		 
 	    // #dispatch_list tbody의 모든 tr 요소를 선택
        var rows = document.querySelectorAll("#dispatch_list tbody tr");

        // 각 행에 대한 이벤트 리스너 추가
        rows.forEach(function(row) {
            // 각 행을 클릭할 때 실행될 함수
            row.addEventListener("click", function() {
            	
            	$('#dispatchModal').modal("show");
            	
                // 해당 행의 데이터를 가져와서 조회 등의 작업 수행
                var dispatchNo = row.cells[0].textContent;
                var busNo = row.cells[1].textContent;
                var startPoint = row.cells[2].textContent;
                var endPoint = row.cells[3].textContent;
                var departureTime = row.cells[4].textContent;

                $('#dispatchNo').val(dispatchNo);
                //선택 요소 비활성화
                $('#busNumberSelect').val(busNo).prop('disabled', true);
                $('#departureTerminalSelect').val(startPoint).prop('disabled', true);
                $('#destinationTerminalSelect').val(endPoint).prop('disabled', true);
                $('#dateTimeInput').val(departureTime).prop('disabled', true);
                //버튼 숨김
                $('#departureRegionSelect').hide();
                $('#destinationRegionSelect').hide();
                $('#saveBtn').hide();
                $('#modifySaveBtn').hide();
            });
        }); 
		 
        //수정
        $('#modifyBtn').click(function(){
        	// 선택 요소의 활성화
            $('#busNumberSelect').prop('disabled', false);
            $('#dateTimeInput').prop('disabled', false);
            $('#modifyBtn').hide();
            $('#modifySaveBtn').show();
         });
        
        //수정완료 버튼
        $('#modifySaveBtn').click(function(e){
        	
        	e.preventDefault();
			
        	// input에서 날짜-시간 값을 가져옴
			var dateTimeInputValue = $('#dateTimeInput').val();
		
			// 가져온 값을 형식에 맞게 변환
			var formattedDepartureTime = formatDateTimeFromInput(dateTimeInputValue);
		
			var formData = {
				dispatchNo : $('input[name="dispatchNo"]').val(),
				busNo : $('select[name="busNumberSelect"]').val(),
				departureTime : formattedDepartureTime
			};
			
			 //배차수정 ajax
			$.ajax({
				type : 'PUT',
				url : '/manager/manager_route',
				contentType : 'application/json; charset=UTF-8',
				data : JSON.stringify(formData),
				success : function(response) {
					console.log(response);
					// 성공적으로 처리된 경우 실행할 코드
					alert("수정성공" + formData);
				}, //success 끝
				error : function(error) {
					console.error('Error:', error);
					// 에러가 발생한 경우 실행할 코드
					alert("수정실패"+formData);
				} //error 끝
			}); //ajax 끝 
        });
        
		//배차등록버튼 클릭 이벤트
		$('#dispatch_insert_modal').click(function(e) {//디폴트 값으로 바꿔주기
            
			e.preventDefault();
			$('#dispatchModal').modal("show");
			$('#modifyBtn').hide();
			$('#saveBtn').show();
			$('#departureRegionSelect').show();
            $('#destinationRegionSelect').show();
            $('#modifySaveBtn').hide();
            
            // 버스번호 초기값 설정
            $('#busNumberSelect').val('버스번호선택');
            // 출발지 지역 초기값 설정
            $('#departureRegionSelect').val('지역선택');
            // 출발지 터미널 초기값 설정
            $('#departureTerminalSelect').val('터미널선택');
            // 도착지 지역 초기값 설정
            $('#destinationRegionSelect').val('지역선택');
            // 도착지 터미널 초기값 설정
            $('#destinationTerminalSelect').val('터미널선택');
            // 출발일시 초기값 설정
            $('#dateTimeInput').val('');
		});
		
		//선택한 지역에 속하는 터미널만 표시하는 함수
		const departureRegionSelect = document.getElementById('departureRegionSelect');
		const departureTerminalSelect = document.getElementById('departureTerminalSelect');
		const destinationRegionSelect = document.getElementById('destinationRegionSelect');
		const destinationTerminalSelect = document.getElementById('destinationTerminalSelect');
		
		//선택한 지역에 속하는 터미널만 표시하는 함수
		function filterTerminals(regionSelect, terminalSelect) {
			const selectedRegion = regionSelect.value;
			const terminals = terminalSelect.querySelectorAll('option');
			terminals.forEach(function(option) {
				if (option.dataset.region === selectedRegion || option.dataset.region === '') {
					option.style.display = 'block';
				} else {
					option.style.display = 'none';
				}
			});//forEach 끝
		}//filterTerminals function 끝
		
		//출발지 지역 선택시 해당 지역에 속하는 터미널을 표시
		departureRegionSelect.addEventListener('change', function() {
			filterTerminals(departureRegionSelect, departureTerminalSelect);
		});
		
		//도착지 지역 선택시 해당 지역에 속하는 터미널을 표시
		destinationRegionSelect.addEventListener('change', function() {
			filterTerminals(destinationRegionSelect, destinationTerminalSelect);
		});
		
		// 사용자 입력 값을 가져와서 형식을 변환하는 함수
		function formatDateTimeFromInput(inputValue) {
			// inputValue 형식은 "YYYY-MM-DDTHH:MM"
			// "T"를 공백으로, ":MM"에 ":MM:00"을 추가하여 초를 '00'으로 설정
			const formatted = inputValue.replace('T', ' ') + ':00';
			return formatted;
		}
		
		//배차저장 버튼 클릭 이벤트
		$('#saveBtn').click(function(e) {
            
			e.preventDefault();
			
			// input에서 날짜-시간 값을 가져옴
			var dateTimeInputValue = $('#dateTimeInput').val();
		
			// 가져온 값을 형식에 맞게 변환
			var formattedDepartureTime = formatDateTimeFromInput(dateTimeInputValue);
		
			var formData = {
				busNo : $('select[name="busNumberSelect"]').val(),
				startPointName : $('select[name="departureTerminalSelect"]').val(),
				endPointName : $('select[name="destinationTerminalSelect"]').val(),
				departureTime : formattedDepartureTime
			};
		
			//배차등록 
			$.ajax({
				type : 'POST',
				url : '/manager/manager_route',
				contentType : 'application/json; charset=UTF-8',
				data : JSON.stringify(formData),
				success : function(response) {
					console.log(response);
					// 성공적으로 처리된 경우 실행할 코드
					alert("성공" + formData);
				}, //success 끝
				error : function(error) {
					console.error('Error:', error);
					// 에러가 발생한 경우 실행할 코드
					alert("실패"+JSON.stringify(formData));
				} //error 끝
			}); //ajax 끝

		});//$('#saveBtn').click function 끝
	});//최상단 function 끝
</script>

<!-- JS 부트스트랩 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>