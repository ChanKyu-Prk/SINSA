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

.navbar_category1 {
	color: white;
	font-weight: bold !important;
	font-size: 20px !important;
	padding: 0px 0px 0px 14px;
}

.button_cart{
	background-color:white;
	border: 1px solid white !important;
}
</style>

</head>
<body>
	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="${path}/resources/img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="../jjimList/1"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="../cart.do"><i class="fa fa-shopping-bag"></i>
						<span>3</span></a></li>
			</ul>

		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__auth">
				<ul>
					<%
						if (session.getAttribute("user") == null) {
					%>
					<li><a href="login.do">로그인</a></li>

					<%
						} else {
					%>
					<li><a href="logout.do">로그아웃</a></li>
					<%
						}
					%>

					<li><a href="join.do">회원가입</a></li>
					<li><a href="#">주문조회</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>

			</div>

		</div>
		<!-- 		<ul class="list-group list-group-flush"> -->
		<!-- 			<li class="list-group-item"><a href="#">brand</a></li> -->
		<!-- 			<li class="list-group-item"><a href="#">ALL</a></li> -->
		<!-- 			<li class="list-group-item"><a href="#">men</a></li> -->
		<!-- 			<li class="list-group-item"><a href="#">women</a></li> -->
		<!-- 			<li class="list-group-item"><a href="#">new</a></li> -->
		<!-- 			<li class="list-group-item"><a href="#">best</a></li> -->
		<!-- 		</ul> -->



		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li><a href="#">brand</a></li>
				<li><a href="#">ALL</a></li>
				<li><a href="#">men</a>
					<ul class="header__menu__dropdown">
						<li><a href="/product/List/men/newest/sneakers/1">스니커즈</a></li>
						<li><a href="/product/List/men/newest/converse/1">캔버스화</a></li>
						<li><a href="/product/List/men/newest/slipon/1">슬립온</a></li>
						<li><a href="/product/List/men/newest/mule/1">뮬</a></li>
						<li><a href="/product/List/men/newest/running/1">런닝화</a></li>
						<li><a href="/product/List/men/newest/basketball/1">농구화</a></li>
						<li><a href="/product/List/men/newest/golf/1">골프화</a></li>
						<li><a href="/product/List/men/newest/outdoor/1">등산화</a></li>
						<li><a href="/product/List/men/newest/soccer/1">축구화</a></li>
					</ul></li>
				<li><a href="#">women</a>
					<ul class="header__menu__dropdown">
						<li><a href="/product/List/women/newest/sneakers/1">스니커즈</a></li>
						<li><a href="/product/List/women/newest/converse/1">캔버스화</a></li>
						<li><a href="/product/List/women/newest/slipon/1">슬립온</a></li>
						<li><a href="/product/List/women/newest/mule/1">뮬</a></li>
						<li><a href="/product/List/women/newest/running/1">런닝화</a></li>
						<li><a href="/product/List/women/newest/basketball/1">농구화</a></li>
						<li><a href="/product/List/women/newest/golf/1">골프화</a></li>
						<li><a href="/product/List/women/newest/outdoor/1">등산화</a></li>
						<li><a href="/product/List/women/newest/soccer/1">축구화</a></li>
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


							<%
								if (session.getAttribute("user") == null) {
							%>
							<div class="header__top__right__auth">
								<a href="/login.do">로그인</a>
							</div>
							<div class="header__top__right__auth">
								<a href="/join.do">회원가입</a>
							</div>
							<%
								} else {
							%>
							<div class="header__top__right__auth">
								<a href="/logout.do">로그아웃</a>

							</div>


							<%
								}
							%>
							<div class="header__top__right__auth">
								<a href="/myOrderList/1">주문조회</a>
							</div>
							<div class="header__top__right__auth">
								<a href="/myOrderList/1">마이페이지</a>
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

					<a href="/"><img class="header_sinsa_logo"
						src="${path}/resources/img/sinsa_logo.png" alt="ddd"></a>

				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li><a href="/getProductBrandPage">brand</a></li>
							<li><a href="/product/List/all/newest/all/1">ALL</a></li>
							<li><a href="/product/List/men/newest/all/1">men</a>
								<ul class="header__menu__dropdown">
									<li><a href="#" class="navbar_category1">운동화</a></li>
									<li><a href="/product/List/men/newest/sneakers/1">스니커즈</a></li>
									<li><a href="/product/List/men/newest/converse/1">캔버스화</a></li>
									<li><a href="/product/List/men/newest/slipon/1">슬립온</a></li>
									<li><a href="/product/List/men/newest/mule/1">뮬</a></li>
									<li><div>
											<br>
										</div></li>
									<li><a href="#" class="navbar_category1">스포츠</a></li>
									<li><a href="/product/List/men/newest/running/1">런닝화</a></li>
									<li><a href="/product/List/men/newest/basketball/1">농구화</a></li>
									<li><a href="/product/List/men/newest/golf/1">골프화</a></li>
									<li><a href="/product/List/men/newest/outdoor/1">등산화</a></li>
									<li><a href="/product/List/men/newest/soccer/1">축구화</a></li>
								</ul></li>
							<li><a href="/product/List/women/newest/all/1/">women</a>
								<ul class="header__menu__dropdown">
									<li><a href="#" class="navbar_category1">운동화</a></li>
									<li><a href="/product/List/women/newest/sneakers/1">스니커즈</a></li>
									<li><a href="/product/List/women/newest/converse/1">캔버스화</a></li>
									<li><a href="/product/List/women/newest/slipon/1">슬립온</a></li>
									<li><a href="/product/List/women/newest/mule/1">뮬</a></li>

									<li><div>
											<br>
										</div></li>
									<li><a href="#" class="navbar_category1">스포츠</a></li>
									<li><a href="/product/List/women/newest/running/1">런닝화</a></li>
									<li><a href="/product/List/women/newest/basketball/1">농구화</a></li>
									<li><a href="/product/List/women/newest/golf/1">골프화</a></li>
									<li><a href="/product/List/women/newest/outdoor/1">등산화</a></li>
									<li><a href="/product/List/women/newest/soccer/1">축구화</a></li>
								</ul></li>
							<!-- <li><a href="/product/List/new/newest/all/1">new</a></li> -->
							<li><a href="/product/List/best/newest/all/1">best</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="/jjimList/1"><i class="fa fa-heart"></i> <span>1</span></a></li>
							<li><button class="button_cart"><a class="cart_login_check" onclick="cart_login_check();">
									<i class="fa fa-shopping-bag"></i> <span>3</span>
								</a></button></li>
								
								
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

	<script>
		function cart_login_check(){
// 			var checkLogin = confirm('로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?');
			<%if(session.getAttribute("user") != null){%>
				location.href="/cart.do";
				return false;
				
			<%}%>
			
			if(confirm('로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?') == true){
				location.href="/login.do";
				return false;
			}
		}
	</script>


</body>
</html>