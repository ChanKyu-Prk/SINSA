<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="../${path}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="../${path}/resources/css/style.css"
	type="text/css">
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark sticky-top order-lg-2"
		style="background-color: rgba(0, 0, 0, 0.8); position: sticky;">
		<a class="navbar-brand" href="${pageContext.request.contextPath}"
			style="font-family: arial; font-weight: 800; color: #ff7200" title="메인페이지로 이동">SINSA 관리자모드</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
			
				<li class="nav-item"><a class="nav-link" href="prdList" title="캠핑상품으로 이동">상품관리</a></li>
				<li class="nav-item"><a class="nav-link" href="stockList" title="예약하기로 이동">재고현황</a></li>
				<li class="nav-item"><a class="nav-link" href="stockAdd" title="고객후기로 이동">상품입고</a></li>
				<li class="nav-item"><a class="nav-link" href="customerList" title="문의하기로 이동">고객관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#" title="공지사항으로 이동">리뷰관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#" title="고객후기로 이동">문의관리</a></li>
				<li class="nav-item"><a class="nav-link" href="noticeList" title="공지사항으로 이동">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="#" title="고객후기로 이동">자주하는질문</a></li>
				<li class="nav-item"><a class="nav-link" href="#" title="고객후기로 이동">${AdminVO}</a></li>
	           	
			</ul>
			
		<c:if test="${empty AdminVO}">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="nav-link" data-toggle="modal" href="adminLogin">로그인</a></li>
			</ul>
		</c:if>
			
		<c:if test="${!empty AdminVO}">
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="adminLogout" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" > ${AdminVO.ADID}님, 로그아웃 </a>
	      			
					
					</div>
				</li>
			</ul>
		</c:if>
		</div>
	</nav>
</body>
</html>