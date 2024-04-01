<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 시큐리티:권한 설정 태그(마이페이지, 매니저페이지) -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- header -->
<%@include file="../includes/header.jsp"%>

	<!-- mypage_info1 시작 -->
	<div id="mypage_info_content1">
	<!-- 로그인한 사용자의 정보 조회 -->
		<%-- <p>principal: <sec:authentication property="principal"/></p>
			<p>UserVo: <sec:authentication property="principal.user"/></p>  --%>
		<!-- 큰제목 -->
		<div class="content_title"><i class="fa-solid fa-circle-user title_icon"></i>마이페이지</div>
		<!-- 작은제목 -->
		<div class="content_title2"><i class="fa-solid fa-circle-user title_icon"></i>회원정보</div>
		<table class="table myInfo">
			<tr>
				<th>아이디</th>
				<td><sec:authentication property="principal.user.id"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><sec:authentication property="principal.user.name"/></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><sec:authentication property="principal.user.phoneNo"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><sec:authentication property="principal.user.email"/></td>
			</tr>			
		</table>
	</div>
  
	<div id="mypage_info_content2">
		<div class="content_title2"><i class="fa-regular fa-credit-card title_icon"></i>자주쓰는 카드</div>
		<table></table>   	
	</div>
	<!-- mypage_info1 끝 -->
	
<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>