<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 시큐리티:권한 설정 태그(마이페이지, 매니저페이지) -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/bus.css" type="text/css">

<!-- 자바스크립트 부분 -->
<script src="/resources/js/manager.js"></script>
<script src="/resources/js/reserve.js"></script>
<script src="/resources/js/pay.js"></script>

<!-- CSS 부트스트랩 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
<!-- main_wrap 시작 -->
<div id="main_wrap">
		<!-- header 시작 -->
		<div id="header">
			<div id="header_top_nav">
				<div id="info_nav">
					<ul>
						<!-- 로그인 권한 설정(인증x) -->
						<sec:authorize access="isAnonymous()">
							<li><a href='<c:url value="/member/login"/>'>로그인</a></li>
						</sec:authorize>

						<!-- 로그아웃 권한 설정(인증O) -->
						<sec:authorize access="isAuthenticated()">
							<form id="logoutForm" action="<c:url value='/logout'/>"
								method="post">
								<li><a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a></li>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
						</sec:authorize>

						<!-- 회원가입 권한 설정(인증x) -->
						<sec:authorize access="isAnonymous()">
							<li><a href='<c:url value="/member/memberjoin"/>'>회원가입</a></li>
						</sec:authorize>

						<!-- 마이페이지 권한 설정(회원) -->
						<sec:authorize access="hasRole('ROLE_member')">
							<li><a href='<c:url value="/mypage/mypage_info"/>'>마이페이지</a></li>
						</sec:authorize>

						<!-- 관리자페이지 권한 설정(관리자) -->
						<sec:authorize access="hasRole('ROLE_admin')">
							<li><a href='<c:url value="/manager/manager_info"/>'>관리자페이지</a></li>
						</sec:authorize>
					</ul>
				</div>  
				<div id="logo"><img src="/resources/img/logo.png"/></div>
				<div id="menu_nav">
					<ul>
						<li><a href="../reserve/reserve_main.do">승차권예매</a></li>
						<li><a href="../reserve/reserve_list.do">조회/변경/취소</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- header 끝 -->
		<!-- container 시작 -->
		
		
