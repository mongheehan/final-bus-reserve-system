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
<!-- <script src="/resources/js/manager.js"></script>
<script src="/resources/js/reserve.js"></script>
<script src="/resources/js/pay.js"></script> -->
</head>
<body>
<!-- header.jsp 시작 -->
<div id="header">
	<!-- 상단 메뉴(고정) -->
	<nav class="navbar navbar-expand-lg fixed-top bg-body-tertiary">
		<div class="container-fluid">
			<!-- 로고 -->
			<a class="navbar-brand" href="#"><img src="/resources/img/logo.png"/></a>
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
							로그인</a>
						<ul class="dropdown-menu">
							<!-- 로그인 권한 설정(인증x) -->
							<sec:authorize access="isAnonymous()">
								<li><a href='<c:url value="/member/login"/>'>로그인</a></li>
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


<!-- 메인_조회부분 -->
<div class="reserve_content1">
	<div id="reserve_search">
		<div class="content_title"><i class="title_icon fa-solid fa-magnifying-glass"></i>승차권 예매</div>
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
							<td colspan="2" class="departureTerminal">
								<input type="text" class="txt form-control" id="start_point" placeholder="출발지를 선택해주세요." aria-label="default input example">
								<button class="button1 btn btn-secondary" id="choice_terminal"><i class="fa-solid fa-magnifying-glass"></i></button>
							</td>
						</tr>
						<tr>
							<td class="arrivalTerminal">도착지: 
								<input type="text" class=txt id=end_point value="도착지를 선택해주세요.">
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
					aria-labelledby="profile-tab" tabindex="0">왕복탭 조회 목록</div>
			</div>
		</div>
</div>


<div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>asd<br><br><br><br><br><br><br><br><br><br></div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</body>
</html>
