<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.co.sinsa.biz.user.UserVO"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SINSA&nbsp;-&nbsp;상품 페이지</title>
<link rel="stylesheet" href="${path}/resources/css/productList.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/buttons.css" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${path}/resources/js/productlist.js" type="text/javascript"></script>
<style>
.sizeList {
	text-align: center;
}

.pagination {
	margin-top: 25px;
	margin-bottom: 25px;
	justify-content: center;
}

a.page-link {
	color: black !important;
}

.page-item.active .page-link {
	background-color: black !important;
	border-color: black !important;
	color: white !important;
}

#filter {
	padding: 10px 10px 10px 10px;
	margin-bottom: 70px;
}

#sidebar__item__menu {
	padding: 10px 10px 10px 10px;
}

#filter #search {
	background-color: gray;
	color: white;
	font-size: 25px;
	width: 100%;
	height: 60px;
	text-align: center;
	border: none;
}

.clicked {
	color: black;
}

ul.mySize>li {
	display: inline-block;
	width: 120px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
	position: relative;
}

ul.mySize>li:hover {
	background: #fff;
}

ul.mySize>li ul.li-size {
	display: none;
	position: absolute;
	top: 30px;
	left: 0;
}

ul.mySize>li:hover ul.li-size {
	z-index: 9999;
	display: inline-block;
	float: left;
}

ul.mySize>li ul.li-size>li {
	display: inline-block;
	float: left;
	width: 120px;
	padding: 5px 10px;
	background: #eee;
	border: 1px solid #eee;
	text-align: center;
}

ul.mySize>li ul.li-size>li:hover {
	background: #fff;
}

.product__item__pic__hover li a.buyNow {
	width: 70px;
	border-radius: 20px;
	padding-right: 5px;
	padding-left: 5px;
}

.product__item__pic__hover li a {
	cursor: pointer;
}

.cartModalBtn {
	display: none;
}

.buyNowBtn {
	display: none;
}

.nice-select.open .list {
	overflow: auto;
	max-height: 250px;
	width: 210px !important;
}

.selectStocks {
	width: 100% !important;
}

.marginbottom {
	margin-top: 20px;
	margin-bottom: 20px;
}

.modalImgDiv {
	margin: 0 !important;
	padding: 15px !important;
}

.modalInfoDiv {
	margin: 0 !important;
	padding: 15px !important;
}

.subBtn {
	display: table;
	text-align: center;
	width: 100%;
	border: solid 1px #e8e8e8;
	height: 100%;
	border-radius: 5px;
	cursor: pointer;
}

.subBtnS {
	display: table-cell;
	vertical-align: middle;
}

hr.mo {
	margin: 10px;
}

.brandrow {
	height: 20%;
	color: #808080;
	font-size: 15px;
}

.namerow {
	height: 40%;
	font-size: 25px;
	font-weight: bold;
}

.colorrow {
	height: 20%;
	font-size: 15px;
}

.pricerow {
	height: 20%;
	font-size: 15px;
}

.nopadding {
	padding: 0;
}

.fc {
	color: #808080;
}

.infos {
	padding-left: 15px;
}

.sort_row {
	text-align: right;
	padding-bottom: 30px;
}

.prodBox {
	height: 400px;
}

.filter__item {
	padding-top: 20px !important;
}

.red label:after{
	background-color: red !important;
}
.white label:after{
	background-color: white !important;
}
.yellow label:after{
	background-color: yellow !important;
}
.black label:after{
	background-color: black !important;
}
.gray label:after{
	background-color: gray !important;
}
.green label:after{
	background-color: green !important;
}
.blue label:after{
	background-color: blue !important;
}
.pink label:after{
	background-color: pink !important;
}
.multi label:after{
	background-image: linear-gradient(90deg, red, orange, yellow, green, blue, navy, purple) !important;
}
#color-box {
    padding-top: 0px;
}
</style>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
</head>

	<jsp:include page="../header.jsp" />
<body>
	<%
		UserVO user = (UserVO) session.getAttribute("user");
		if(user != null){
	%>
	<input type="hidden" value="<%= user.getCUS_ID() %>" id="USERID">
	<%}else{ %>
	<input type="hidden" value="" id="USERID">
	<%}%>
	<input type="hidden" value="${info.category }" id="categoryHidden">
	<input type="hidden" value="${info.condition }" id="conditionHidden">
	<input type="hidden" value="${info.orderby }" id="orderbyHidden">
	<input type="hidden" value="${info.color }" id="colorHidden">
	<input type="hidden" value="${info.minPrice }" id="minPriceHidden">
	<input type="hidden" value="${info.maxPrice }" id="maxPriceHidden">
	<input type="hidden" value="${info.keyWord }" id="keyWordHidden">

	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
			
				<div class="col-lg-12">
					<div class="hero__search d-flex justify-content-center">
						<div class="hero__search__form ">
							<form action="/product/List/all/newest/all/1?keyword="
								method="get">
								<input type="text" name="keyword" placeholder="찾으시는 상품을 검색해주세요"
									value="">
								<button type="button" id="searchBtn" class="site-btn">검색</button>
								<script>
									document.getElementById("searchBtn").onclick = function() {
										let keyword = document
												.getElementsByName("keyword")[0].value;
										location.href = "/product/List/all/newest/all/1?keyword="
												+ keyword;
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
		data-setbg="${path}/resources/img/beach-6544025_19202.png"
		style="padding: 95px 0 90px !important;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2 style="color:white; text-shadow: -2px 0 gray, 0 2px gray, 2px 0 gray, 0 -2px gray;">Shoes Shop</h2>
						<div class="breadcrumb__option">
							<a href="/" style="color:white; text-shadow: -2px 0 gray, 0 2px gray, 2px 0 gray, 0 -2px gray;"><span>SINSA</span></a> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<!-- Product Section Begin -->
	<section class="product spad">
	<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-3">
					<div class="sidebar">
						<div class="sidebar__item" id="sidebar__item__menu">
						<div class="row">
						<div class="col-6 col-md-12">
						
						
						
							<h4>운동화</h4>
							<ul>
								<li><a
									href="/product/List/${condition}/${info.orderby}/sneakers/1?keyword=${keyword }">Sneakers</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/converse/1?keyword=${keyword }">Converse</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/slipon/1?keyword=${keyword }">Slip-on</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/mule/1?keyword=${keyword }">Mule</a></li>
							</ul>
							<br><br>
							</div>
							<div class="col-6 col-md-12">
							<h4>스포츠</h4>
							<ul>
								<li><a
									href="/product/List/${condition}/${info.orderby}/running/1?keyword=${keyword }">Running</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/basketball/1?keyword=${keyword }">Basketball</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/soccer/1?keyword=${keyword }">Soccer</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/golf/1?keyword=${keyword }">Golf</a></li>
								<li><a
									href="/product/List/${condition}/${info.orderby}/outdoor/1?keyword=${keyword }">Outdoor</a></li>
							</ul>
							</div></div>
						</div>
						<br>
						<div id="filter">
						
						<div class="row">
						<div class="col-6 col-md-12">
							<div class="sidebar__item">
								<h4>가격</h4>
								<div style="width: 248px">
									<input class="price_input" id="minPrice" name="minPrice"
										type="text" value="${info.minPrice }" placeholder="최소 금액 입력"
										maxlength="9"> <span>원 ~</span><br /> <br /> <input
										class="price_input" id="maxPrice" name="maxPrice" type="text"
										value="${info.maxPrice }" placeholder="최대 금액 입력" maxlength="9">
									<span>원</span>
							<br><br><br>
								</div>
						</div>
							</div>
						<div class="col-6 col-md-12">
							
							<div id="color-box"
								class="sidebar__item sidebar__item__color--option">
								<h4>색상</h4>
								<div class="sidebar__item__color sidebar__item__color--white white">
									<label for="white" id="id01" onmouseout="mout1()"
										onmouseover="mover1()"> WHITE <input type="checkbox"
										id="white" name="color" value="white">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green gray">
									<label for="grey" id="id02" onmouseout="mout2()"
										onmouseover="mover2()"> GREY <input type="checkbox"
										id="grey" name="color" value="grey">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green red">
									<label for="red" id="id03" onmouseout="mout3()"
										onmouseover="mover3()"> RED <input type="checkbox"
										id="red" name="color" value="red">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green black">
									<label for="black" id="id04" onmouseout="mout4()"
										onmouseover="mover4()"> BLACK <input type="checkbox"
										id="black" name="color" value="black">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green blue">
									<label for="blue" id="id05" onmouseout="mout5()"
										onmouseover="mover5()"> BLUE <input type="checkbox"
										id="blue" name="color" value="blue">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green pink">
									<label for="PK" id="id06" onmouseout="mout6()"
										onmouseover="mover6()"> PINK <input type="checkbox"
										id="PK" name="color" value="PK">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green multi">
									<label for="MULTI" id="id07" onmouseout="mout7()"
										onmouseover="mover7()"> MULTI <input type="checkbox"
										id="MULTI" name="color" value="MULTI">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green green">
									<label for="BG" id="id08" onmouseout="mout8()"
										onmouseover="mover8()"> GREEN <input type="checkbox"
										id="BG" name="color" value="BG">
									</label>
								</div>
								<div class="sidebar__item__color sidebar__item__color--green yellow">
									<label for="YELLOW" id="id09" onmouseout="mout9()"
										onmouseover="mover9()"> YELLOW <input type="checkbox"
										id="YELLOW" name="color" value="YELLOW">
									</label>
								</div>
							</div>
							
							
							</div>
							</div>
							<input id="search" type="button" value="조건 검색">
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-9">
					<div class="filter__item">
						<div class="row sort_row">
							<div class="col-12 ">
								<div class="filter__sort">
									<select class="orderbySelect">
										<option value="newest">신상품순</option>
										<option value="highprice"
											<c:if test="${info.orderby =='highprice'}">selected</c:if>>높은가격순</option>
										<option value="lowprice"
											<c:if test="${info.orderby =='lowprice'}">selected</c:if>>낮은가격순</option>
									</select>
								</div>
								<div class="col-lg-4 col-md-4">
									<div class="filter__found"></div>
								</div>
								<div class="col-lg-4 col-md-3">
									<div class="filter__option"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<c:forEach var="list" items="${list }" varStatus="status">
								<div class="col-lg-4 col-md-6 col-sm-6 prodBox">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath}/resources/prdImg/${list.PRD_CODE }.png"
											onclick="location.href='/product/prdCode=${list.PRD_CODE}';">
											<ul class="product__item__pic__hover">
												<li onclick="event.cancelBubble= true;"><a
													class="jjimBtn"><input type="hidden"
														value="${list.PRD_NUM}" class="prdnumj"> <c:if
															test="${jjimcheck[status.index]==0}">
															<i class="fa fa-heart-o"></i>
														</c:if> <c:if test="${jjimcheck[status.index]==1}">
															<i class="fa fa-heart"></i>
														</c:if> </a></li>
												<li onclick="event.cancelBubble= true;">
													<a class="buyNow">
														<i class="fa">바로구매</i>
													</a>
												</li>
												<li onclick="event.cancelBubble= true;"><a
													class="shoppingCart"><i class="fa fa-shopping-cart"></i></a></li>
											</ul>
										</div>
										<button class="buyNowBtn" data-toggle="modal"
											data-target="#buyNowModal${status.index }"></button>
										<div class="modal" id="buyNowModal${status.index }"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">바로구매</h5>
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="container-fluid">
														<div class="row">
															<div class="col-4 modalImgDiv">
																<img alt=""
																	src="${pageContext.request.contextPath}/resources/prdImg/${list.PRD_CODE }.png">
															</div>
															<div class="col-8 modalInfoDiv">
																<div class="row brandrow infos">${list.PRD_BRAND }</div>
																<div class="row namerow infos">${list.PRD_NAME }</div>
																<div class="row colorrow">
																	<div class="col-3  infos fc">색상 :</div>
																	<c:choose>
																		<c:when test="${list.PRD_COLOR == 'BK'}">
																			<div class="col-9 nopadding">BLACK</div>																			
																		</c:when>
																		<c:when test="${list.PRD_COLOR == 'BG'}">
																			<div class="col-9 nopadding">GREEN</div>																			
																		</c:when>
																		<c:when test="${list.PRD_COLOR == 'WH'}">
																			<div class="col-9 nopadding">WHITE</div>																			
																		</c:when>
																		<c:when test="${list.PRD_COLOR == 'PK'}">
																			<div class="col-9 nopadding">PINK</div>																			
																		</c:when>
																		<c:when test="${list.PRD_COLOR == 'BL'}">
																			<div class="col-9 nopadding">BLUE</div>																			
																		</c:when>
																		<c:otherwise>																		
																			<div class="col-9 nopadding">${list.PRD_COLOR }</div>
																		</c:otherwise>
																	</c:choose>
																</div>
																<div class="row pricerow">
																	<div class="col-3 infos fc">가격 :</div>
																	<div class="col-9 nopadding">
																		<fmt:formatNumber value="${list.PRD_PRICE }"
																			type="number" />
																		원
																	</div>
																</div>
															</div>
														</div>
														<hr class="mo" />
														<div class="row marginbottom selectRow">
															<div class="col-6">
																<select class="selectStocks">
																	<c:set value="0" var="count" />
																	<option value="" selected="selected"
																		disabled="disabled">사이즈 선택</option>
																	<c:forEach begin="220" end="290" step="5"
																		varStatus="var">
																		<c:set value="${stock[status.index]}" var="stock1" />
																		<c:set value="STOCK_${var.index }" var="stock2" />
																		<c:set value="${ stock1[stock2]}" var="stock3" />
																		<c:if test="${ stock3 >0}">
																			<option value="${var.index }">${var.index }&nbsp;&nbsp;(
																				${stock3 }개)</option>
																			<c:set value="1" var="count" />
																		</c:if>
																	</c:forEach>
																	<c:if test="${ count == 0}">
																		<option value="" disabled="disabled">품절
																			되었습니다.</option>
																	</c:if>
																</select>
															</div>
															<div class="col-6">
																<div class="subBtn">
																	<input type="hidden" value="${list.PRD_CODE}"
																		class="numCode"> <span
																		class="subBtnS goByebtn">바로 구매</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<button class="cartModalBtn" data-toggle="modal"
											data-target="#cartModal${status.index }"></button>
										<div class="modal" id="cartModal${status.index }"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">장바구니에
															담기</h5>
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="container-fluid">
														<div class="row">
															<div class="col-4 modalImgDiv">
																<img alt=""
																	src="${pageContext.request.contextPath}/resources/prdImg/${list.PRD_CODE }.png">

															</div>
															<div class="col-8 modalInfoDiv">
																<div class="row brandrow infos">${list.PRD_BRAND }</div>
																<div class="row namerow infos">${list.PRD_NAME }</div>

																<div class="row colorrow">
																	<div class="col-3  infos fc">색상 :</div>
																	<div class="col-9 nopadding">${list.PRD_COLOR }</div>
																</div>
																<div class="row pricerow">
																	<div class="col-3  infos fc">가격 :</div>
																	<div class="col-9 nopadding">
																		<fmt:formatNumber value="${list.PRD_PRICE }"
																			type="number" />
																		원
																	</div>
																</div>
															</div>
														</div>
														<hr class="mo" />
														<div class="row marginbottom selectRow">
															<div class="col-6">
																<select class="selectStocks">
																	<c:set value="0" var="count" />
																	<option value="" selected="selected"
																		disabled="disabled">사이즈 선택</option>
																	<c:forEach begin="220" end="290" step="5"
																		varStatus="var">
																		<c:set value="${stock[status.index]}" var="stock1" />
																		<c:set value="STOCK_${var.index }" var="stock2" />
																		<c:set value="${ stock1[stock2]}" var="stock3" />
																		<c:if test="${ stock3 >0}">
																			<option value="${var.index }">${var.index }&nbsp;&nbsp;(
																				${stock3 }개)</option>
																			<c:set value="1" var="count" />
																		</c:if>
																	</c:forEach>
																	<c:if test="${ count == 0}">
																		<option value="" disabled="disabled" class="soldout">품절
																			되었습니다.</option>
																	</c:if>
																</select>
															</div>
															<div class="col-6">
																<div class="subBtn">
																	<input type="hidden" value="${list.PRD_NUM}"
																		class="numCode"> <span
																		class="subBtnS goCartBtn">담기</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="product__item__text">
											<h6>
												<a href='/product/prdCode=${list.PRD_CODE}' class=>${list.PRD_NAME }</a>
											</h6>
											<h5>
												<fmt:formatNumber value="${list.PRD_PRICE }" type="number" />
												원
											</h5>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<ul class="pagination">
							<c:choose>
								<c:when test="${pageInfo.getPage()<=1}">
									<li class="page-item disabled"><a class="page-link"
										aria-disabled="true">이전</a></li>
								</c:when>
								<c:when test="${pageInfo.getStartPage()==1}">
									<li class="page-item"><a class="page-link"
										href="/product/List/${info.condition }/${info.orderby }/${info.category }
									/${pageInfo.getStartPage()}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }"
										tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/product/List/${info.condition }/${info.orderby }/${info.category }
									/${pageInfo.getStartPage()-1}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }"
										tabindex="-1">이전</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${pageInfo.getStartPage()}"
								end="${pageInfo.getEndPage()}" varStatus="state">
								<c:choose>
									<c:when test="${pageInfo.getPage()==state.index}">
										<li class="page-item active" aria-current="page"><a
											class="page-link">${state.index}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="/product/List/${info.condition }/${info.orderby }/${info.category }
									/${state.index}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }">${state.index}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageInfo.getPage() >= pageInfo.getMaxPage()}">
									<li class="page-item disabled"><a class="page-link"
										aria-disabled="true">다음</a></li>
								</c:when>
								<c:when test="${pageInfo.getEndPage()==pageInfo.getMaxPage()}">
									<li class="page-item"><a class="page-link"
										href="/product/List/${info.condition }/${info.orderby }/${info.category }
									/${pageInfo.getEndPage()}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/product/List/${info.condition }/${info.orderby }/${info.category }
									/${pageInfo.getEndPage()+1}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }">다음</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Product Section End -->
	<!-- Footer Section Begin -->
	<!-- Footer Section End -->
</body>
<jsp:include page="../footer.jsp" />

<script type="text/javascript">
	function mover1() {
		var m;
		m = document.getElementById("id01");
		m.style.color = "red";
	}
	var clickCheck1 = "false";
	function mout1() {
		var m;
		m = document.getElementById("id01");
		if (clickCheck1 === "false") {
			m.style.color = "black";
		}
	}
	$('#id01').on("click", function(e) {
		var m;
		m = document.getElementById("id01");
		if (clickCheck1 === "false") {
			m.style.color = "red";
			clickCheck1 = "true";
			$('#white').attr('checked', true);
		} else if (clickCheck1 === "true") {
			m.style.color = "black";
			clickCheck1 = "false";
			$('#white').attr('checked', false);
		}
		return false;
	});

	function mover2() {
		var m;
		m = document.getElementById("id02");
		m.style.color = "red";
	}
	var clickCheck2 = "false";
	function mout2() {
		var m;
		m = document.getElementById("id02");
		if (clickCheck2 === "false") {
			m.style.color = "black";
		}
	}
	$('#id02').on("click", function(e) {
		var m;
		m = document.getElementById("id02");
		if (clickCheck2 === "false") {
			m.style.color = "red";
			clickCheck2 = "true";
			$('#grey').attr('checked', true);
		} else if (clickCheck2 === "true") {
			// 		$('#gray').val('');
			m.style.color = "black";
			clickCheck2 = "false";
			$('#grey').attr('checked', false);
		}
		return false;
	});

	function mover3() {
		var m;
		m = document.getElementById("id03");
		m.style.color = "red";
	}
	var clickCheck3 = "false";
	function mout3() {
		var m;
		m = document.getElementById("id03");
		if (clickCheck3 === "false") {
			m.style.color = "black";
		}
	}
	$('#id03').on("click", function(e) {
		var m;
		m = document.getElementById("id03");
		if (clickCheck3 === "false") {
			// 		$('#red').val('red');
			m.style.color = "red";
			clickCheck3 = "true";
			$('#red').attr('checked', true);
		} else if (clickCheck3 === "true") {
			// 		$('#red').val('');
			m.style.color = "black";
			clickCheck3 = "false";
			$('#red').attr('checked', false);
		}
		return false;
	});

	function mover4() {
		var m;
		m = document.getElementById("id04");
		m.style.color = "red";
	}
	var clickCheck4 = "false";
	function mout4() {
		var m;
		m = document.getElementById("id04");
		if (clickCheck4 === "false") {
			m.style.color = "black";
		}
	}
	$('#id04').on("click", function(e) {
		var m;
		m = document.getElementById("id04");
		if (clickCheck4 === "false") {
			// 		$('#black').val('black');
			m.style.color = "red";
			clickCheck4 = "true";
			$('#black').attr('checked', true);
		} else if (clickCheck4 === "true") {
			// 		$('#black').val('');
			m.style.color = "black";
			clickCheck4 = "false";
			$('#black').attr('checked', false);
		}
		return false;
	});

	function mover5() {
		var m;
		m = document.getElementById("id05");
		m.style.color = "red";
	}
	var clickCheck5 = "false";
	function mout5() {
		var m;
		m = document.getElementById("id05");
		if (clickCheck5 === "false") {
			m.style.color = "black";
		}
	}
	$('#id05').on("click", function(e) {
		var m;
		m = document.getElementById("id05");
		if (clickCheck5 === "false") {
			// 		$('#blue').val('blue');
			m.style.color = "red";
			clickCheck5 = "true";
			$('#blue').attr('checked', true);
		} else if (clickCheck5 === "true") {
			// 		$('#blue').val('');
			m.style.color = "black";
			clickCheck5 = "false";
			$('#blue').attr('checked', false);
		}
		return false;
	});

	function mover6() {
		var m;
		m = document.getElementById("id06");
		m.style.color = "red";
	}
	var clickCheck6 = "false";
	function mout6() {
		var m;
		m = document.getElementById("id06");
		if (clickCheck6 === "false") {
			m.style.color = "black";
		}
	}
	$('#id06').on("click", function(e) {
		var m;
		m = document.getElementById("id06");
		if (clickCheck6 === "false") {
			// 		$('#green').val('green');
			m.style.color = "red";
			clickCheck6 = "true";
			$('#PK').attr('checked', true);
		} else if (clickCheck6 === "true") {
			// 		$('#green').val('');
			m.style.color = "black";
			clickCheck6 = "false";
			$('#PK').attr('checked', false);
		}
		return false;
	});

	function mover7() {
		var m;
		m = document.getElementById("id07");
		m.style.color = "red";
	}
	var clickCheck7 = "false";
	function mout7() {
		var m;
		m = document.getElementById("id07");
		if (clickCheck7 === "false") {
			m.style.color = "black";
		}
	}
	$('#id07').on("click", function(e) {
		var m;
		m = document.getElementById("id07");
		if (clickCheck7 === "false") {
			// 		$('#green').val('green');
			m.style.color = "red";
			clickCheck7 = "true";
			$('#MULTI').attr('checked', true);
		} else if (clickCheck7 === "true") {
			// 		$('#green').val('');
			m.style.color = "black";
			clickCheck7 = "false";
			$('#MULTI').attr('checked', false);
		}
		return false;
	});

	function mover8() {
		var m;
		m = document.getElementById("id08");
		m.style.color = "red";
	}
	var clickCheck8 = "false";
	function mout8() {
		var m;
		m = document.getElementById("id08");
		if (clickCheck8 === "false") {
			m.style.color = "black";
		}
	}
	$('#id08').on("click", function(e) {
		var m;
		m = document.getElementById("id08");
		if (clickCheck8 === "false") {
			// 		$('#green').val('green');
			m.style.color = "red";
			clickCheck8 = "true";
			$('#BG').attr('checked', true);
		} else if (clickCheck8 === "true") {
			// 		$('#green').val('');
			m.style.color = "black";
			clickCheck8 = "false";
			$('#BG').attr('checked', false);
		}
		return false;
	});

	function mover9() {
		var m;
		m = document.getElementById("id09");
		m.style.color = "red";
	}
	var clickCheck9 = "false";
	function mout9() {
		var m;
		m = document.getElementById("id09");
		if (clickCheck9 === "false") {
			m.style.color = "black";
		}
	}
	$('#id09').on("click", function(e) {
		var m;
		m = document.getElementById("id09");
		if (clickCheck9 === "false") {
			// 		$('#green').val('green');
			m.style.color = "red";
			clickCheck9 = "true";
			$('#YELLOW').attr('checked', true);
		} else if (clickCheck9 === "true") {
			// 		$('#green').val('');
			m.style.color = "black";
			clickCheck9 = "false";
			$('#YELLOW').attr('checked', false);
		}
		return false;
	});

	$(document).ready(function() {
		var colors = $('#colorHidden').val();
		var colorsArray = colors.split('_');
		var m1 = document.getElementById("id01");
		var m2 = document.getElementById("id02");
		var m3 = document.getElementById("id03");
		var m4 = document.getElementById("id04");
		var m5 = document.getElementById("id05");
		var m6 = document.getElementById("id06");
		var m7 = document.getElementById("id07");
		var m8 = document.getElementById("id08");
		var m9 = document.getElementById("id09");
		for ( var i in colorsArray) {
			if (colorsArray[i] == 'white') {
				m1.style.color = "red";
				clickCheck1 = "true";
				$('#white').attr('checked', true);
			}
			if (colorsArray[i] == 'grey') {
				m2.style.color = "red";
				clickCheck2 = "true";
				$('#grey').attr('checked', true);
			}
			if (colorsArray[i] == 'red') {
				m3.style.color = "red";
				clickCheck3 = "true";
				$('#red').attr('checked', true);
			}
			if (colorsArray[i] == 'black') {
				m4.style.color = "red";
				clickCheck4 = "true";
				$('#black').attr('checked', true);
			}
			if (colorsArray[i] == 'blue') {
				m5.style.color = "red";
				clickCheck5 = "true";
				$('#blue').attr('checked', true);
			}
			if (colorsArray[i] == 'PK') {
				m6.style.color = "red";
				clickCheck6 = "true";
				$('#PK').attr('checked', true);
			}
			if (colorsArray[i] == 'MULTI') {
				m7.style.color = "red";
				clickCheck7 = "true";
				$('#MULTI').attr('checked', true);
			}
			if (colorsArray[i] == 'BG') {
				m8.style.color = "red";
				clickCheck8 = "true";
				$('#BG').attr('checked', true);
			}
			if (colorsArray[i] == 'YELLOW') {
				m9.style.color = "red";
				clickCheck9 = "true";
				$('#YELLOW').attr('checked', true);
			}
		}
	});

	$('.li-size').find('li').on('click', function() {
		var newDiv = document.createElement("div");
		var size = $(this).html();
		newDiv.setAttribute('name', size);
		newDiv.setAttribute('value', size);
		newDiv.setAttribute('id', size);
		newDiv.innerHTML = size;
		var sidebar__item__id = document.getElementById("sidebar__item__id");
		sidebar__item__id.appendChild(newDiv);
	});

	$('#search').on(
			'click',
			function() {
				var minPrice = $('#minPrice').val();
				var maxPrice = $('#maxPrice').val();
				var condition = $('#conditionHidden').val();
				var category = $('#categoryHidden').val();
				var orderby = $('#orderbyHidden').val();
				var keyWord = $('#keyWordHidden').val();
				var color = "";
				$("input[name='color']:checked").each(function(i) {
					color += $(this).val() + '_';
				});
				color = color.slice(0, -1);

				location.href = "/product/List/" + condition + "/" + orderby
						+ "/" + category + "/1" + "?color=" + color
						+ "&minPrice=" + minPrice + "&maxPrice=" + maxPrice
						+ "&keyWord=" + keyWord;
			});

	$('.orderbySelect').on(
			"change",
			function() {
				var minPrice = $('#minPriceHidden').val();
				var maxPrice = $('#maxPriceHidden').val();
				var condition = $('#conditionHidden').val();
				var category = $('#categoryHidden').val();
				var keyWord = $('#keyWordHidden').val();
				var color = $('#colorHidden').val();
				var orderby = $('.orderbySelect').val();
				location.href = "/product/List/" + condition + "/" + orderby
						+ "/" + category + "/1" + "?color=" + color
						+ "&minPrice=" + minPrice + "&maxPrice=" + maxPrice
						+ "&keyWord=" + keyWord;
			});
	$('.jjimBtn').on("click", function() {
		var prdnum = $(this).find('.prdnumj').val();
		var data = {
			prdnum : prdnum
		}
		var btn = $(this).find("i");
		$.ajax({
			type : "POST",
			url : "/dojjim",
			data : data,
			success : function(result) {
				if (result == 'login') {
					var con = confirm("로그인이 필요한 서비스입니다.\n로그인하시겠습니까?");
					if (con) {
						location.href = "/login.do";
						return false;
					} else {
						return false;
					}
				} else {
					if (btn.hasClass("fa-heart-o")) {
						btn.removeClass("fa-heart-o");
						btn.addClass("fa-heart");
					} else {
						btn.removeClass("fa-heart");
						btn.addClass("fa-heart-o");
					}
				}
			},
			error : function() {
				alert("보내기 실패");
			}
		});
	});
	(function() {
		var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);
		if (isSafari) {
			document.getElementById('support-note').style.display = 'block';
		}
	})();
	$('.buyNow').on("click", function() {
		var user = $('#USERID').val();	
		if (user == "") {
			var result = confirm("로그인이 필요한 서비스입니다.\n로그인하시겠습니까?");
			if (result) {
				location.href = "/login.do";
				return false;
			} else {
				return false;
			}
		}
		$(this).closest('.product__item__pic').next().click();
	});
	$('.shoppingCart').on("click", function() {
		var user = $('#USERID').val();	
		if (user == "") {
			var result = confirm("로그인이 필요한 서비스입니다.\n로그인하시겠습니까?");
			if (result) {
				location.href = "/login.do";
				return false;
			} else {
				return false;
			}
		}
		$(this).closest('.product__item__pic').next().next().next().click();
	});
	$('.goCartBtn')
			.on(
					"click",
					function() {
						var numCode = $(this).parent().find('.numCode').val();
						var selectSize = $(this).closest('.selectRow')
								.children().find('.selectStocks').val();
						if (selectSize === null) {
							alert("사이즈를 선택해주세요.");
							return false;
						}
						var sendData = {
							"PRDNUM" : numCode,
							"PRDSIZE" : selectSize
						};
						$
								.ajax({
									url : '/ajaxToCart',
									method : 'POST',
									data : sendData,
									success : function(data) {
										var toCart = confirm("상품이 장바구니 담겼습니다.\n장바구니로 이동하시겠습니까?");
										if (toCart) {
											location.href = "/cart.do";
										}
									}
								})
					})

	$('.goByebtn').on(
			"click",
			function() {
				var ORDER_PRDCODE = $(this).parent().find('.numCode').val();
				var ORDER_PRDSIZE = $(this).closest('.selectRow').children()
						.find('.selectStocks').val();
				if (ORDER_PRDSIZE === null) {
					alert("사이즈를 선택해주세요.");
					return false;
				}
				var ORDER_AMOUNT = '1';
				var data = {};
				var itemList = [];
				data["ORDER_PRDCODE"] = ORDER_PRDCODE;
				data["ORDER_PRDSIZE"] = ORDER_PRDSIZE;
				data["ORDER_AMOUNT"] = ORDER_AMOUNT;
				itemList.unshift(data);

				$.ajax({
					url : "/direct/checkout",
					type : "POST",
					data : JSON.stringify(itemList),
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					success : function(data) {
						location.href = "/direct/checkout";
					},
					error : function() {
						alert("보내기 실패");
					}
				});
			})
</script>
</html>