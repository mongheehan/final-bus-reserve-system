<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>

<!-- 회원가입 form css 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 자바 스크립트 -->
<script type="text/javascript">
	
  	$(function(){
  		
		//birth 형식 변환
		function formatDateTimeFromInput(inputValue) {
		    // inputValue 형식은 "YYYY-MM-DD"
		    // 시간, 분, 초를 각각 '00'으로 설정하여 날짜만 가지도록 변환
		    const formatted = inputValue + '00:00:00';
		    return formatted;
		}
		
		/* 회원가입 정보(id, password등)이 입력안되면 회원가입 실행 불가 */
		$('#sineUp').on("click", function(){
			
			//XMLHttpRequest 객체 생성 
			const xhr = new XMLHttpRequest();
			//입력값 변수에 저장
			var dateTimeInputValue = $('#birth').val();
	        //가져온 값을 형식에 맞게 변환
	        var formattedDepartureTime = formatDateTimeFromInput(dateTimeInputValue);
		
	    	//CSRF 토큰 설정
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            
	        var obj = {
		            id : $('#id').val(),
		            password : $('#password').val(),
		            name : $('#name').val(),
		          	birth : formattedDepartureTime,
		            phoneNo : $('#phoneNo').val(),
		            email : $('#email').val()
		         };
	        
	    	//AJAX 요청 보내기
			$.ajax({
				type: 'post',
				url: '/register',				
				dataType: 'text',
				data: JSON.stringify(obj),
				contentType: 'application/json; charset=utf-8',
				//csrf 값을 요청 전에 헤더에 담아서 보낸다.
				beforeSend: function(xhr) {
					if (token && header) {
                        xhr.setRequestHeader(header, token);
                    }
				},
				success: function(data){
					console.log(data);
				},
				error: function(xhr, status, er){
					console.log("error: " + er);
				}
			})//ajax end
	     });//sineup end
		
		/* 취소 버튼 클릭시 메인페이지로 이동 */
		$('#cancel').on("click", function(){
			location.href = "/ticket/ticket_main"; 
		});
		
	 });

</script>
	
<!-- container -->
<div id="join_content1">
<!-- 큰제목 -->
	<div class="content_title"><i class="fa-solid fa-address-book title_icon"></i>회원가입</div>
	<!-- head 태그 내에 csrf meta tag를 추가 -->
	<meta name="_csrf_header" th:content="${_csrf.headerName}">
	<meta name="_csrf" th:content="${_csrf.token}">

	<form method="post">
		<div class="form-group has-feedback">
			<label class="control-label" for="userId">아이디</label>
			<input class="form-control" type="text" id="id" name="id" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userPassword">비밀번호</label>
			<input class="form-control" type="password" id="password" name="password" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userName">이름</label>
			<input class="form-control" type="text" id="name" name="name" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userBirth">생년월일</label>
			<input class="form-control" type="date" id="birth" name="birth" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userPhonNo">휴대폰번호</label>
			<input class="form-control" type="tel" id="phoneNo" name="phoneNo" />
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userEmail">이메일</label>
			<input class="form-control" type="email" id="email" name="email" />
		</div>												
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="sineUp">회원가입</button>
			<!-- FORM태그 전송시 CSRF토큰 전달 -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button class="cencle btn btn-danger" type="button" id="cancel">취소</button>
		</div>
	</form>
<!-- container 끝부분 -->
</div>
<!-- JS 부트스트랩 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	
<!-- footer -->
<%@include file="../includes/footer.jsp"%>
