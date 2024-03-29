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
		<div id="mypage_info_content1">
	<!-- 로그인한 사용자의 정보 조회 -->
<%-- 	<p>principal: <sec:authentication property="principal"/></p>
	<p>UserVo: <sec:authentication property="principal.user"/></p>   --%>
    <h2 align="center">마이페이지</h2>
   		<table>
			<tr>
				<td>아이디: </td>
				<td><sec:authentication property="principal.user.id"/></td>
			</tr>
			<tr>
				<td>이름: </td>
				<td><sec:authentication property="principal.user.name"/></td>
			</tr>
			<tr>
				<td>휴대폰: </td>
				<td><sec:authentication property="principal.user.phoneNo"/></td>
			</tr>
			<tr>
				<td>이메일: </td>
				<td><sec:authentication property="principal.user.email"/></td>
			</tr>			
		</table>
    </div>
    
    <div>
 		<table></table>   	
    </div>
	</div>
	<!-- mypage_info1 끝 -->
	
<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>