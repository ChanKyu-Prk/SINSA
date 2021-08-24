<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SINSA</title>
<style type="text/css">
.product .section-title h2 {
	width: 100%;
}
.btnCon{
	text-align: center;
}
.primary-btn{
	width: 200px;
	border: 2px solid #7fad39;
}
.shopBtn.primary-btn{
	background: transparent;
	color: #7fad39;
}

.payCompleteCon a:hover {
	color: #0e4a8b;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<jsp:include page="../header.jsp" />
	<section class="product spad payCompleteCon">
		<div class="container">
			<div class="section-title product__discount__title">
				<h2 class="mb-5">결제완료</h2>
				<h3 class="text-center font-weight-bold mt-5 mb-5">구매가 정상적으로
					완료되었습니다.</h3>
				<table class="table table-bordered">
					<tr>
						<th rowspan="2" class="text-center align-middle">주문번호<p class="mb-0">${ORDER_NUM}</p></th>
						<th class="pl-4">총 결제 금액</th>
						<th class="text-right pr-4">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />
							<span>원</span>
						</th>
					</tr>
					<tr>
						<td class="pl-4">포인트 사용</td>
						<td class="text-right pr-4">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${usePoint}" />
							<span>P</span>
						</td>
					</tr>
				</table>
				<p class="mb-5">자세한 구매내역 확인 및 환불, 취소 등의 서비스는 사이트 우측 상단의 <a href="/myOrderList.do">마이페이지>주문 내역 조회</a>에서 이용 가능합니다.</p>
				<div class="btnCon">
					<button class="primary-btn shopBtn" onclick="location.href='/getProductListPage?num=1&condition=all'">쇼핑 계속하기</button>
					<button class="primary-btn" onclick="location.href='/myOrderList.do'">주문 내역 조회</button>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="../footer.jsp" />
	<!-- Footer Section End -->
</body>
<script type="text/javascript">
window.history.forward(); function noBack(){ window.history.forward(); }
</script>
</html>