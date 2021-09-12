<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SINSA 네이버 연동 완료</title>
<style type="text/css">
.product .section-title h2 {
	width: 100%;
}

.btnCon {
	text-align: center;
}

.primary-btn {
	width: 200px;
	border: 2px solid #7fad39;
}

.shopBtn.primary-btn {
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

<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">
	<jsp:include page="../header.jsp" />
	<section class="product spad payCompleteCon">
		<div class="container">
			<div class="section-title product__discount__title">
				<h3 class="text-center font-weight-bold mt-5 mb-5">연동이 정상적으로
					완료되었습니다.</h3>
				<div class="btnCon">
					<button class="primary-btn shopBtn" onclick="location.href='/'">메인
						화면으로 가기</button>
					<button class="primary-btn"
						onclick="location.href='/product/List/all/newest/all/1'">쇼핑하러
						가기</button>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="../footer.jsp" />
	<!-- Footer Section End -->
</body>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</html>