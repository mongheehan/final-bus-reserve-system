<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
	<div id="page_title">
		<h5>승차권 예매 > 로그인</h5>
	</div>
	<!-- reserve_login 시작 -->
	<div id="reserve_login_content1">
		<form method="post">
	        <input type="text" name="birth" placeholder="생년월일 8자리" maxlength="8" pattern="[0-9]{8}">
	        <br>
	        <input type="text" name="phoneNo" placeholder="핸드폰번호" maxlength="11" pattern="[0-9]{11}">
	        <button type="submit">제출</button>
    	</form>
	</div> 
	<!-- reserve_login 끝 -->

<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>