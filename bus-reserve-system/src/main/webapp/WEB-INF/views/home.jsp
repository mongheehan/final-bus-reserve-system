<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<!-- CSS 부트스트랩 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
<style type="text/css">
.navbar{
	background-color:#68B3CE !important;
}
.content1{
	margin-top:56px;
	width:100%;
}
#reserve_search{
	width:70%;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	width: 75%;
	clear: both;
}
button.nav-link{
	background-color:#68B3CE;
}
#myTabContent
{
	background-color:#68B3CE;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">승차권예매</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">조회/변경/취소</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            로그인
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">마이페이지</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="content1">
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
					편도탭 조회 목록
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
