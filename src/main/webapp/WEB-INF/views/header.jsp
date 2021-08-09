<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/style.css"
	type="text/css">

<style>
.header_sinsa_logo {
	height: 80px;
	width: 210px;
}
</style>

</head>
<body>
	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="index.do"><img src="${path}/resources/img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="cart.do"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>

		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__auth">
				<ul>
					<%if(session.getAttribute("user") == null){%>
					<li><a href="login3.do">로그인</a></li>

					<% }else{%>
					<li><a href="logout.do">로그아웃</a></li>
					<% }%>

					<li><a href="#">회원가입</a></li>
					<li><a href="#">주문조회</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>

			</div>

		</div>


				<nav class="humberger__menu__nav mobile-menu">
					<ul>
						<li><a href="#">brand</a></li>
						<li><a href="#">ALL</a></li>
						<li><a href="#">men</a>
							<ul class="header__menu__dropdown">
								<li><a href="#">스니커즈</a></li>
								<li><a href="#">캔버스화</a></li>
								<li><a href="#">슬립온</a></li>
								<li><a href="#">뮬</a></li>
							</ul></li>
						<li><a href="#">women</a>
							<ul class="header__menu__dropdown">
								<li><a href="#">스니커즈</a></li>
								<li><a href="#">캔버스화</a></li>
								<li><a href="#">슬립온</a></li>
								<li><a href="#">뮬</a></li>
							</ul></li>
						<li><a href="#">new</a></li>
						<li><a href="#">best</a></li>
					</ul>
				</nav>

		<div id="mobile-menu-wrap"></div>

	</div>
	<!-- Humberger End -->


	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6"></div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">


								<%if(session.getAttribute("user") == null){%>
							<div class="header__top__right__auth">
								<a href="login.do">로그인</a>
								</div>
								<div class="header__top__right__auth"><a href="#">회원가입</a></div>
								<% }else{%>
								<div class="header__top__right__auth">
								<a href="logout.do">로그아웃</a>
								
							</div>
							
							
							<% }%>
							<div class="header__top__right__auth">
								<a href="#">주문조회</a>
							</div>
							<div class="header__top__right__auth">
								<a href="#">마이페이지</a>
							</div>
							<div class="header__top__right__auth">
								<a href="#">고객센터</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

					<a href="index.do"><img class="header_sinsa_logo"
						src="${path}/resources/img/sinsa_logo.png" alt="ddd"></a>

				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li><a href="#">brand</a></li>
							<li><a href="#">ALL</a></li>
							<li><a href="#">men</a>
								<ul class="header__menu__dropdown">
									<li><a href="#">스니커즈</a></li>
									<li><a href="#">캔버스화</a></li>
									<li><a href="#">슬립온</a></li>
									<li><a href="#">뮬</a></li>
								</ul></li>
							<li><a href="#">women</a>
								<ul class="header__menu__dropdown">
									<li><a href="#">스니커즈</a></li>
									<li><a href="#">캔버스화</a></li>
									<li><a href="#">슬립온</a></li>
									<li><a href="#">뮬</a></li>
								</ul></li>
							<li><a href="#">new</a></li>
							<li><a href="#">best</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
							<li><a href="cart.do"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->




</body>
</html>