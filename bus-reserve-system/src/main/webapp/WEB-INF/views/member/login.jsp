<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
<style>
	body{height:100%;background-color:#F8F9FA;}
</style>
<!-- 로그인 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css"> -->

<!-- container -->
<!-- 에러메시지 표시 -->
	
<!-- login 시작 -->
<div class="login_content1">
	<div class="bg-light py-3 py-md-5">
		<div class="row justify-content-md-center">
			<div class="bg-white p-4 p-md-5 rounded shadow-sm">
				<div class="row">
					<div class="col-12">
						<div class="text-center mb-5">
							<a href="../reserve/reserve_main.do">
								<img src="/resources/img/logo2.png" width="175" height="57">
							</a>
						</div>
					</div>
				</div>
				<form action="/login" method="post">
					<div class="row gy-3 gy-md-4 overflow-hidden">
						<div class="col-12">
							<label for="email" class="form-label">id <span class="text-danger">*</span></label>
							<div class="input-group">
								<span class="input-group-text">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
										<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
									</svg>
								</span>
								<input type="text" class="form-control" name="loginId" id="loginId" required>
							</div>
						</div>
						<div class="col-12">
							<label for="password" class="form-label">Password <span class="text-danger">*</span></label>
							<div class="input-group">
								<span class="input-group-text">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
										<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z" />
										<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
									</svg>
								</span>
							<input type="password" class="form-control" name="loginPassword" id="password" value="" required>
							</div>
						</div>
						<div class="col-12">
							<div class="d-grid">
								<button class="btn btn-secondary btn-lg" type="submit">로그인</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</div>
						</div>
					</div>
				</form>
				<div class="row">
					<div class="col-12">
						<hr class="mt-5 mb-4 border-secondary-subtle">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- container 끝부분 -->

<!-- JS 부트스트랩 적용 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- footer -->
<%@include file="../includes/footer.jsp"%>




