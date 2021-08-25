<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SinSa</title>

<script src="http://code.jquery.com/jquery-3.3.1.min.js">
</script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<style type="text/css">
#brand-title {
	text-align: center;
	margin: 50px 0 20px 0;
}
.cursor {
	cursor: pointer;
}

#brand-name-box {
	width: 100%;
	height: 200px;
	margin: 50px auto 20px auto;
	table-layout: fixed;
	text-align: center;
}

#brand-name-box .col1 {
	width: 50px;
}

#brand-name-box .col2 {
	width: 50px;
}

#brand-name-box .col3 {
	width: 50px;
}

#brand-name-box .col4 {
	width: 50px;
}

#brand-name-box .col5 {
	width: 50px;
}

#brand-initial-box {
	width: 100%;
	margin: 50px auto 50px auto;
	table-layout: fixed;
	text-align: center;
}

#parents {
	width: 80%;
	margin: auto;
}

.brand-list {
	width: 95%;
	margin: auto;
	margin-top: 30px;
}

.brand-list div{
	display:inline-block;
	width: 200px;
	margin: 30px 0 50px 0;
}

</style>
</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="${path}/resources/img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<img src="${path}/resources/img/language.png" alt="">
				<div>English</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="#">Spanis</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
				<li>Free Shipping for all Order of $99</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<jsp:include page="../header.jsp" />
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__search d-flex justify-content-center">
						<div class="hero__search__form ">
							<form action="#">
								<input type="text" name="keyword" placeholder="찾으시는 상품을 검색해주세요">
								<button type="button" id="searchBtn" class="site-btn">검색</button>
								<script>
									document.getElementById("searchBtn").onclick = function() {
										let keyword = document
												.getElementsByName("keyword")[0].value;
										console.log("검색중...!");

										location.href = "/product/List/all/newest/all/1?keyWord="+keyword;
									};
								</script>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${path}/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Shoes Shop</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<div id="parents">
		<h1 id="brand-title">BRAND</h1>
		

		<table id="brand-name-box">
			<tr>
				<td class="col1"> 
					<a href="/product/List/all/newest/all/1?brand=nike">
						<img src="${path}/resources/img/나이키로고.png" alt="나이키로고">
					</a>
				</td>
				<td class="col2"> 
					<a href="/product/List/all/newest/all/1?brand=adidas">
						<img src="${path}/resources/img/아디다스로고.png" alt=" 아디다스로고">
					</a>
				</td>
				<td class="col3">
					<a href="/product/List/all/newest/all/1?brand=vans">
						<img src="${path}/resources/img/반스로고.png" alt="반스로고">
					</a> 
				</td>
				<td class="col4">
					<a href="/product/List/all/newest/all/1?brand=converse">
						<img src="${path}/resources/img/컨버스로고.png" alt="컨버스로고">
					</a> 
				</td>
				<td class="col5">
					<a href="/product/List/all/newest/all/1?brand=puma">
						<img src="${path}/resources/img/퓨마로고.png" alt="푸마로고">
					</a> 
				</td>
			</tr>
			<tr>
				<td> 
					<a href="/product/List/all/newest/all/1?brand=fila">
						<img src="${path}/resources/img/휠라로고.png" alt="휠라로고" >
					</a>
				</td>
				<td> 
					<a href="/product/List/all/newest/all/1?brand=newbalance">
						<img src="${path}/resources/img/뉴발란스 로고.png" alt="뉴발란스로고" >
					</a>
				</td>
				<td>
					<a href="/product/List/all/newest/all/1?brand=reebok">
						<img src="${path}/resources/img/리복로고.png" alt="리복로고" ></td>
					</a> 
				<td> 
					<a href="/product/List/all/newest/all/1?brand=lacoste">
						<img src="${path}/resources/img/라코스테로고.png" width="120px;"  alt="라코스테로고" >
					</a>
				</td>
				<td> 
					<a href="/product/List/all/newest/all/1?brand=asics">
						<img src="${path}/resources/img/아식스로고.png" width="150px;" alt="아식스로고" >
					</a>
				</td>
			</tr>

		</table>


		<table id="brand-initial-box">
			<tr>
				<td><a href="#targetA">A</a></td>
				<td><a href="#targetB">B</a></td>
				<td><a href="#targetC">C</a></td>
				<td><a href="#targetD">D</a></td>
				<td><a href="#targetE">E</a></td>
				<td><a href="#targetF">F</a></td>
				<td><a href="#targetG">G</a></td>
				<td><a href="#targetH">H</a></td>
				<td><a href="#targetI">I</a></td>
				<td><a href="#targetJ">J</a></td>
				<td><a href="#targetK">K</a></td>
				<td><a href="#targetL">L</a></td>
				<td><a href="#targetM">M</a></td>
				<td><a href="#targetN">N</a></td>
				<td><a href="#targetO">O</a></td>
				<td><a href="#targetP">P</a></td>
				<td><a href="#targetQ">Q</a></td>
				<td><a href="#targetR">R</a></td>
				<td><a href="#targetS">S</a></td>
				<td><a href="#targetT">T</a></td>
				<td><a href="#targetU">U</a></td>
				<td><a href="#targetV">V</a></td>
				<td><a href="#targetW">W</a></td>
				<td><a href="#targetX">X</a></td>
				<td><a href="#targetY">Y</a></td>
				<td><a href="#targetZ">Z</a></td>
				<td><a href="#target123">123</a></td>
			</tr>
		</table>

		<hr />
		<div class="brand-list">
			<h2><a name="targetA">A</a></h2>
			<div class="cursor">AKIII CLASSIC</div class="cursor"><div class="cursor">ADIDAS</div><div class="cursor">ASICS</div>
		</div>
		<hr />
		<div class="brand-list">
			<h2><a name="targetB">B</a></h2>
			<div class="cursor">BALENCIAGA</div> <div class="cursor">BMS FRANCE</div> <div class="cursor">BURBERRY</div>
		</div>
		<hr />
		<div class="brand-list">
			<h2><a name="targetC">C</a></h2>
			<div class="cursor">CATCHBALL</div> <div class="cursor">COCOMODS</div> <div class="cursor">CONVERSE</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetD">D</a></h2>
			<div class="cursor">DANNER</div> <div class="cursor">DR.MARTENS</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetE">E</a></h2>
			<div class="cursor">EIDER</div> <div class="cursor">EARTHUS</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetF">F</a></h2>
			<div class="cursor">FEIYUE</div> <div class="cursor">FILA</div> <div class="cursor">FRED PERRY</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetG">G</a></h2>
			<div class="cursor">GUCCI</div> <div class="cursor">GOLDEN GOOSE</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetH">H</a></h2>
			<div class="cursor">HAWKINS</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetI">I</a></h2>
			<div class="cursor">INTHESTAR</div> <div class="cursor">IYSO</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetJ">J</a></h2>
			<div class="cursor">JOY&MARIO</div> <div class="cursor">J.DAUL</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetK">K</a></h2>
			<div class="cursor">KOLCA</div> <div class="cursor">KENZO</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetL">L</a></h2>
			<div class="cursor">LACOSTE</div> <div class="cursor">LAVISIONE</div> <div></div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetM">M</a></h2>
			<div class="cursor">MALIBU SANDALS</div> <div class="cursor">MAISON MARGIELA</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetN">N</a></h2>
			<div class="cursor">NIKE</div> <div class="cursor">NEW BALANCE</div>
		</div>
		<hr />
		
		<div class="brand-list">
			<h2><a name="targetO">O</a></h2>
			<div class="cursor">ONISUKA TIGER</div> <div class="cursor">OTZ</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetP">P</a></h2>
			<div class="cursor">POLO</div> <div class="cursor">POSE GANCH</div> <div class="cursor">PUMA</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetQ">Q</a></h2>
			<div></div> <div></div> <div></div>
		</div>
		<hr />
		
		<div class="brand-list">
			<h2><a name="targetR">R</a></h2>
			<div class="cursor">REEBOK</div> <div></div> <div></div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetS">S</a></h2>
			<div class="cursor">SAUCONY</div> <div class="cursor">SKECHERS</div> <div class="cursor">SPERRY</div>
			<div class="cursor">STEFANOROSSI</div> <div class="cursor">STRAYE</div> <div class="cursor">SUPERGA</div>
			
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetT">T</a></h2>
			<div class="cursor">TIMBERLAND</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetU">U</a></h2>
			<div class="cursor">UMBRO</div> <div class="cursor">UNDER ARMOUR</div> <div></div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetV">V</a></h2>
			<div class="cursor">VANS</div> <div class="cursor">VERBENAS</div> <div class="cursor">VLADO</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetW">W</a></h2>
			<div class="cursor">W-STAR</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetX">X</a></h2>
			<div class="cursor">XEXYMIX</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetY">Y</a></h2>
			<div class="cursor">YOWE</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="targetZ">Z</a></h2>
			<div class="cursor">ZLEYHADI</div> <div class="cursor">ZANCA</div>
		</div>
		<hr />

		<div class="brand-list">
			<h2><a name="target123">123</a></h2>
			<div class="cursor">23.65</div> <div class="cursor">4T2ND</div>
		</div>
		<hr />
	</div>
	
	<script type="text/javascript">
		$('.brand-list').find('div').on('click', function(){
			var brand = $(this).html();
			location.href = "/product/List/all/newest/all/1?brand="+brand;
		})
	</script>

		<!-- Footer Section Begin -->
		<jsp:include page="../footer.jsp" />
		<!-- Footer Section End -->
</body>
</html>