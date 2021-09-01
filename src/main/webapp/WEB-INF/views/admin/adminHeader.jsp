<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SINSA관리자모드</title>

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
		<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/adminIndex"  
			style="font-family: arial; font-weight: 800; color: #cbe4ff" title="메인페이지로 이동">SINSA 관리자모드</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/orderList" title="주문관리페이지로 이동">주문관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/prdList" title="상품관리페이지로 이동">상품관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/stockList" title="재고현황페이지로 이동">재고현황</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/stockLog" title="상품입고내역으로 이동">입고내역</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/customerList" title="고객관리페이지로 이동">고객관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/reviewList" title="리뷰관리페이지로 이동">리뷰관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/qnaList" title="문의관리로 이동">문의관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/noticeList" title="공지사항으로 이동">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/faqList" title="고객후기로 이동">자주하는질문</a></li>

				
			</ul>
			
		<c:if test="${empty AdminVO}">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="nav-link" data-toggle="modal" href="${pageContext.request.contextPath}/adminLogin">로그인</a></li>
			</ul>
		</c:if>
			
		<c:if test="${!empty AdminVO}">
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item dropdown"><a
					class="nav-link" href="${pageContext.request.contextPath}/admin/adminLogout" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" > 관리자  로그아웃 </a>
	      			
					
				</li>
			</ul>
		</c:if>
		</div>
	</nav>
</body>
</html>