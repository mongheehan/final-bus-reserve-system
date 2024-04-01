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
<title>버스톡톡</title>
<!-- jquery(공통) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- CSS 부트스트랩 적용(공통) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- font(공통) -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1:wght@200&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<!-- Font Awesome 라이브러리(공통) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<!-- CSS(공통) -->
<link rel="stylesheet" href="/resources/css/busStyle.css" type="text/css">

<!-- 자바스크립트 부분(개인) -->
<script src="/resources/js/manager.js"></script>
<script src="/resources/js/reserve.js"></script>
<!-- <script src="/resources/js/pay.js"></script> -->
</head>
<body>
<!-- header.jsp 시작 -->
<div id="header">
	<!-- 상단 메뉴(고정) -->
	<nav class="navbar navbar-expand-lg fixed-top bg-body-tertiary">
		<div class="container-fluid">
			<!-- 로고 -->
			<a class="navbar-brand" href="../reserve/reserve_main.do"><img src="/resources/img/logo.png"/></a>
			<!-- 화면 줄어들면 나오는 메뉴 버튼 -->
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
		  		<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 메뉴 -->
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="../reserve/reserve_main.do">승차권예매</a></li>
					<li class="nav-item"><a class="nav-link" href="../reserve/reserve_list.do">조회/변경/취소</a></li>
					<li id="myInfo" class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href='#' role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<!-- 로그인한 사용자 표시(인증x) -->
								<sec:authorize access="isAnonymous()">
									로그인
								</sec:authorize>
								<!-- 로그인한 사용자 표시(인증o) -->
								<sec:authorize access="isAuthenticated()">
									<p><sec:authentication property="principal.user.name"/>님</p>						
								</sec:authorize>
							</a>
						<ul class="dropdown-menu">
							<!-- 로그인 권한 설정(인증x) -->
							<sec:authorize access="isAnonymous()">
								<li><a class="dropdown-item" href='<c:url value="/member/login"/>'>로그인</a></li>
							</sec:authorize>
							<!-- 로그아웃 권한 설정(인증O) -->
							<sec:authorize access="isAuthenticated()">
								<form id="logoutForm" action="<c:url value='/logout'/>"
									method="post">
									<li><a class="dropdown-item" href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a></li>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								</form>
							</sec:authorize>
							<!-- 회원가입 권한 설정(인증x) -->
							<sec:authorize access="isAnonymous()">
								<li><a class="dropdown-item" href='<c:url value="/member/memberjoin"/>'>회원가입</a></li>
							</sec:authorize>
	
							<!-- 마이페이지 권한 설정(회원) -->
							<sec:authorize access="hasRole('ROLE_member')">
								<li><a class="dropdown-item" href='<c:url value="/mypage/mypage_info"/>'>마이페이지</a></li>
							</sec:authorize>
	
							<!-- 관리자페이지 권한 설정(관리자) -->
							<sec:authorize access="hasRole('ROLE_admin')">
								<li><a class="dropdown-item" href='<c:url value="/manager/manager_info"/>'>관리자페이지</a></li>
							</sec:authorize>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</div>