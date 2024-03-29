<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- header -->
<%@include file="../includes/header.jsp"%>
	<div id="page_title">
		<h5>승차권 예매 > 결제</h5>
	</div>
	<!-- reserve_pay_content1 시작 -->
	<div id="reserve_pay_content1">
		<form method="post">
		<input type="hidden" name="payNo" value="${payNo }"> 
		<input type="hidden" name="id" value="${id }"> 
		<input type="hidden" name="amount" value="15000"> 
		<input type="hidden" name="paymentDate" value="${paymentDate }"> 
		<input type="hidden" name="payStatus" value="${payStatus }"> 
		<input type="text" name="cardNo" placeholder="카드번호" maxlength="16" pattern="[0-9]{16}"> 
		<br> 
		<input type="text" name="birth" placeholder="생년월일 8자리" maxlength="8" value="${birth}" pattern="[0-9]{8}">
		<br> 
		<input type="text" name="phoneNo" placeholder="핸드폰번호" maxlength="11" value="${phoneNo}" pattern="[0-9]{11}">
		<button type="submit" id="payInsert">제출</button>
	</form>
	</div>
	<!-- reserve_pay_content1 끝 -->

<script type="text/javascript">
	$("#payInsert").on("click", function(e) {
	    function formatCardNo(cardNo) {
	        return cardNo.replace(/(\d{4})(\d{4})(\d{4})(\d{4})/, '$1-$2-$3-$4');
	    }

	    function formatPhoneNo(phoneNo) {
	        return phoneNo.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	    }
	    
	    function formatDate(birth) {
	        return birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
	    }
		
		var pay = {
			payNo : $("input[name='payNo']").val(),
			id : $("input[name='id']").val(),
			amount : $("input[name='amount']").val(),
			paymentDate : $("input[name='paymentDate']").val(),
			payStatus : $("input[name='payStatus']").val(),
			cardNo : formatCardNo($("input[name='cardNo']").val()),
			birth : formatDate($("input[name='birth']").val()),
			phoneNo : formatPhoneNo($("input[name='phoneNo']").val())
		};

		console.log("pay호출"+pay);

		payInsertService.insert(pay, function(result) {
			console.log("pay호출 insert"+pay);
			
			console.log("결제가 성공적으로 등록되었습니다.");

			//window.location.href = "payTicket.jsp";
		});
		e.preventDefault();

	});

</script>


<!-- JS 부트스트랩 적용 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

<!-- footer -->
<%@include file="../includes/footer.jsp"%>