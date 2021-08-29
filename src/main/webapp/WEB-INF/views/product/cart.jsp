<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@page import="kr.co.sinsa.biz.product.ProductVO"%>
<%@page import="kr.co.sinsa.biz.product.CartVO"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html lang="zxx">

<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">


<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>sinsa</title>
<script src="https://kit.fontawesome.com/848d8f1fa9.js"
	crossorigin="anonymous"></script>

<jsp:include page="../header.jsp" />
<style>
.header__top__right__auth {
	margin: 15px;
}

.shoping__cart__item {
	margin: 30px;
}

/* .before discount{ */
/*    text-decoration:line-through; */
/* } */
.changecount {
	border: 1px solid grey;
}

.sumup {
	color: black !important;
}

.previousPrice {
	text-decoration: line-through !important;
	color: grey;
	font-size: 16px;
	text-align: right !important;
	padding: 0px 7px 0px 0px
}

.previousTotalPrice {
	text-decoration: line-through !important;
	color: grey;
	font-size: 16px;
	text-align: right !important;
	padding: 0px 9px 0px 0px
}

.throwout {
	margin: 0px 5px 0px 0px;
	border: 1px solid grey;
	width: 160px !important;
	height: 50px !important;
	background-color: white !important;
	padding: 0px 0px 0px 0px !important;
	font-size: 16px !important;
}

.keepshopping {
	margin: 0px 0px 0px 0px;
	border: 1px solid grey;
	width: 160px !important;
	height: 50px !important;
	background-color: #222020 !important;
	padding: 0px 0px 0px 0px !important;
	color: white !important;
	font-weight: bold !important;
	font-size: 16px !important;
}

.noProduct {
	text-align: center !important;
}

.noProductIcon {
	margin: 100px 0px 40px 0px;
}

.optionModal {
	height: 470px;
}

.size_change_modal_img {
	padding: 0px 15px 0px 0px !important;
}

.countselectbox {
	height: 32px;
	line-height: 30px;
	box-sizing: border-box !important;
	z-index: 10 !important;
	size: 3 !important;
}

.select_size {
	width: 310px !important;
}

.nice-select .list {
	max-height: 150px;
	overflow: scroll !important;
	width: 305px !important;
}

.btn-outline-secondary {
	color: #262525 !important;
	background-color: #f7f7f7 !important;
	border-color: #ddd !important;
	border-radius: 0px !important;
}

.btn-outline-secondary:hover {
	color: #262525 !important;
	background-color: #f7f7f7 !important;
	border-color: black !important;
}

.modal_button_size_change {
	border: 1px solid grey;
	width: 73px !important;
	height: 30px;
	background-color: white;
	font-size: 13px !important;
	padding: 6px 8px 6px 8px !important;
}

.button_confirm_change_size {
	border: 1px solid #222020;
	width: 100px !important;
	height: 40px !important;
	/* 	margin: 0px 0px 7px 0px; */
	background-color: #222020;
	color: white;
	font-weight: bold;
}

.div_button_change_size {
	text-align: center !important;
	margin: 47px 0px 0px 0px !important;
}

.modal-body {
	height: 500px !important;
}

.pro-qty {
	border: 1px solid #ddd;
	text-align: center;
	width: 100px !important;
	background-color: #f7f7f7 !important;
}

#count {
	border-right: 1px solid #ddd;
	border-left: 1px solid #ddd;
}

.button_qty_change {
	border: 1px solid grey;
	width: 100px !important;
	height: 35px;
	background-color: white;
}

.buy_rightnow {
	border: 1px solid grey;
	width: 100px !important;
	height: 40px !important;
	margin: 0px 0px 7px 0px;
	background-color: #222020;
	color: white;
	font-weight: bold;
}

.delete_one {
	border: 1px solid grey;
	width: 100px !important;
	height: 40px !important;
	margin: 0px 0px 7px 0px;
	background-color: white;
}

.size_change_modal {
	top: 20%;
}

.char_size {
	text-align: left !important;
	padding: 9px 0px 0px 0px;
	margin: 0px 0px 0px 0px !important;
}

.size_change_row {
	margin: 40px 0px 40px 0px !important;
}

.size_change_modal_detail {
	margin: 6px 0px 20px 0px !important;
}

.brand {
	font-weight: bold;
}

.product_name {
	color: grey;
	font-size: 14px;
}

.product_name:hover {
	color: grey;
}

.product_color {
	color: grey;
	font-size: 14px;
}

.product_color:hover {
	color: grey;
}

.product_size {
	color: grey;
	font-size: 14px;
}

.product_size:hover {
	color: grey;
}

.pre_won {
	font-size: 14px;
}

.won {
	font-size: 16px;
}

.shoping__cart__table table tbody tr td.shoping__cart__item {
	width: 550px !important;
}

.modal_hr1 {
	border: 0;
	height: 2px !important;
	background: #ccc;
}

.modal_hr2 {
	border: 0;
	height: 2px !important;
	background: #ccc;
}

.button_buy{
	border: 1px solid grey;
	font-size:17px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%
	ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("productList");
	ArrayList<CartVO> cartList = (ArrayList<CartVO>) request.getAttribute("cartList");
	DecimalFormat formatter = new DecimalFormat("###,###");
%>



</head>

<body>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${path}/resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Shopping Cart</h2>
						<div class="breadcrumb__option">
							<a href="index.do">Home</a> <span>Shopping Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">상품 [<%=productList.size()%>개]
									</th>
									<th>가격</th>
									<th>수량</th>
									<th>합계</th>
									<th></th>
								</tr>
							</thead>


							<tbody>


								<c:if test="${fn:length(cartList) != 0}">
									<c:forEach var="list" items="${userCartProductStockList}"
										varStatus="status">

										<tr>

											<td class="shoping__cart__item">
												<div class="row">

													<div class="col-lg-3 col-md-9">
														<a href="product/prdCode=${list.PRD_CODE}"><img
															src="${path}/resources/img/cart/cart-1.jpg" alt=""></a>
													</div>

													<div class="col-lg-9 col-md-3">
														<div class="brand">${list.PRD_BRAND}</div>
														<div>
															<a class="product_name"
																href="product/prdCode=${list.PRD_CODE}">${list.PRD_NAME}<span class="pl-1 prdCode">${list.PRD_CODE}</span></a>
														</div>
														<div>
															<a class="product_color"
																href="product/prdCode=${list.PRD_CODE}">${list.PRD_COLOR}</a>
														</div>
														<div class="product_size">
															<span class="qty-size">${list.CART_PRDSIZE}</span>

															<!-- Button trigger modal -->
															<button type="button"
																class="btn btn-outline-secondary modal_button_size_change"
																data-bs-toggle="modal"
																data-bs-target="#exampleModal${status.index}">옵션변경</button>
														</div>


														<!-- Modal -->
														<div class="modal fade " id="exampleModal${status.index}"
															tabindex="-1"
															aria-labelledby="exampleModalLabel${status.index}"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-scrollable">
																<div class="modal-content optionModal size_change_modal">
																	<div class="modal-header">
																		<h5 class="modal-title"
																			id="exampleModalLabel${status.index}">옵션변경</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>


																	<form>
																		<div class="modal-body ">


																			<div class="row size_change_modal_detail">
																				<div class="col-lg-3 col-md-9 size_change_modal_img">
																					<img src="${path}/resources/img/cart/cart-1.jpg"
																						alt="">

																				</div>

																				<div class="col-lg-9 col-md-3">
																					<div class="brand">${list.PRD_BRAND}</div>
																					<div class="product_name">${list.PRD_NAME}</div>
																					<div class="product_color">${list.PRD_COLOR}
																					</div>
																					<div class="product_size">
																						${list.CART_PRDSIZE}</div>

																				</div>

																			</div>

																			<!-- 																			<div> -->
																			<hr class="modal_hr1">

																			<div class="row size_change_row">
																				<div class="col-lg-3 col-md-9 char_size">사이즈</div>



																				<div class="col-lg-9 col-md-3">
																					<select id="list" class="select_size"
																						name="CART_PRDSIZE">
																						<option value="" disabled selected hidden>선택하세요</option>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_220 <= 0 and list.CART_PRDSIZE eq '220'}">
																								<option value="220" disabled selected>[품절]220</option>
																							</c:when>
																							<c:when test="${list.STOCK_220 <= 0}">
																								<option value="220" disabled>[품절]220</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_220 > 0 and list.CART_PRDSIZE ne '220'}">
																								<option value="220">220</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_220 > 0 and list.CART_PRDSIZE eq '220'}">
																								<option value="220" selected>220</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_225 <= 0 and list.CART_PRDSIZE eq '225'}">
																								<option value="225" disabled selected>[품절]225</option>
																							</c:when>
																							<c:when test="${list.STOCK_225 <= 0}">
																								<option value="225" disabled>[품절]225</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_225 > 0 and list.CART_PRDSIZE ne '225'}">
																								<option value="225">225</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_225 > 0 and list.CART_PRDSIZE eq '225'}">
																								<option value="225" selected>225</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_230 <= 0 and list.CART_PRDSIZE eq '230'}">
																								<option value="230" disabled selected>[품절]230</option>
																							</c:when>
																							<c:when test="${list.STOCK_230 <= 0}">
																								<option value="230" disabled>[품절]230</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_230 > 0 and list.CART_PRDSIZE ne '230'}">
																								<option value="230">230</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_230 > 0 and list.CART_PRDSIZE eq '230'}">
																								<option value="230" selected>230</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_235 <= 0 and list.CART_PRDSIZE eq '235'}">
																								<option value="235" disabled selected>[품절]235</option>
																							</c:when>
																							<c:when test="${list.STOCK_235 <= 0}">
																								<option value="235" disabled>[품절]235</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_235 > 0 and list.CART_PRDSIZE ne '235'}">
																								<option value="235">235</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_235 > 0 and list.CART_PRDSIZE eq '235'}">
																								<option value="235" selected>235</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_240 <= 0 and list.CART_PRDSIZE eq '240'}">
																								<option value="240" disabled selected>[품절]240</option>
																							</c:when>
																							<c:when test="${list.STOCK_240 <= 0}">
																								<option value="240" disabled>[품절]240</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_240 > 0 and list.CART_PRDSIZE ne '240'}">
																								<option value="240">240</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_240 > 0 and list.CART_PRDSIZE eq '240'}">
																								<option value="240" selected>240</option>
																							</c:when>
																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_245 <= 0 and list.CART_PRDSIZE eq '245'}">
																								<option value="245" disabled selected>[품절]245</option>
																							</c:when>
																							<c:when test="${list.STOCK_245 <= 0}">
																								<option value="245" disabled>[품절]245</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_245 > 0 and list.CART_PRDSIZE ne '245'}">
																								<option value="245">245</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_245 > 0 and list.CART_PRDSIZE eq '245'}">
																								<option value="245" selected>245</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_250 <= 0 and list.CART_PRDSIZE eq '250'}">
																								<option value="250" disabled selected>[품절]250</option>
																							</c:when>
																							<c:when test="${list.STOCK_250 <= 0}">
																								<option value="250" disabled>[품절]250</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_250 > 0 and list.CART_PRDSIZE ne '250'}">
																								<option value="250">250</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_250 > 0 and list.CART_PRDSIZE eq '250'}">
																								<option value="250" selected>250</option>
																							</c:when>
																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_255 <= 0 and list.CART_PRDSIZE eq '255'}">
																								<option value="255" disabled selected>[품절]255</option>
																							</c:when>
																							<c:when test="${list.STOCK_255 <= 0}">
																								<option value="255" disabled>[품절]255</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_255 > 0 and list.CART_PRDSIZE ne '255'}">
																								<option value="255">255</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_255 > 0 and list.CART_PRDSIZE eq '255'}">
																								<option value="255" selected>255</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_260 <= 0 and list.CART_PRDSIZE eq '260'}">
																								<option value="260" disabled selected>[품절]260</option>
																							</c:when>
																							<c:when test="${list.STOCK_260 <= 0}">
																								<option value="260" disabled>[품절]260</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_260 > 0 and list.CART_PRDSIZE ne '260'}">
																								<option value="260">260</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_260 > 0 and list.CART_PRDSIZE eq '260'}">
																								<option value="260" selected>260</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_265 <= 0 and list.CART_PRDSIZE eq '265'}">
																								<option value="265" disabled selected>[품절]265</option>
																							</c:when>
																							<c:when test="${list.STOCK_265 <= 0}">
																								<option value="265" disabled>[품절]265</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_265 > 0 and list.CART_PRDSIZE ne '265'}">
																								<option value="265">265</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_265 > 0 and list.CART_PRDSIZE eq '265'}">
																								<option value="265" selected>265</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_270 <= 0 and list.CART_PRDSIZE eq '270'}">
																								<option value="270" disabled selected>[품절]270</option>
																							</c:when>
																							<c:when test="${list.STOCK_270 <= 0}">
																								<option value="270" disabled>[품절]270</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_270 > 0 and list.CART_PRDSIZE ne '270'}">
																								<option value="270">270</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_270 > 0 and list.CART_PRDSIZE eq '270'}">
																								<option value="270" selected>270</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_275 <= 0 and list.CART_PRDSIZE eq '275'}">
																								<option value="275" disabled selected>[품절]275</option>
																							</c:when>
																							<c:when test="${list.STOCK_275 <= 0}">
																								<option value="275" disabled>[품절]275</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_275 > 0 and list.CART_PRDSIZE ne '275'}">
																								<option value="275">275</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_275 > 0 and list.CART_PRDSIZE eq '275'}">
																								<option value="275" selected>275</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_280 <= 0 and list.CART_PRDSIZE eq '280'}">
																								<option value="280" disabled selected>[품절]280</option>
																							</c:when>
																							<c:when test="${list.STOCK_280 <= 0}">
																								<option value="280" disabled>[품절]280</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_280 > 0 and list.CART_PRDSIZE ne '280'}">
																								<option value="280">280</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_280 > 0 and list.CART_PRDSIZE eq '280'}">
																								<option value="280" selected>280</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_285 <= 0 and list.CART_PRDSIZE eq '285'}">
																								<option value="285" disabled selected>[품절]285</option>
																							</c:when>
																							<c:when test="${list.STOCK_285 <= 0}">
																								<option value="285" disabled>[품절]285</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_285 > 0 and list.CART_PRDSIZE ne '285'}">
																								<option value="285">285</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_285 > 0 and list.CART_PRDSIZE eq '285'}">
																								<option value="285" selected>285</option>
																							</c:when>

																						</c:choose>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_290 <= 0 and list.CART_PRDSIZE eq '290'}">
																								<option value="290" disabled selected>[품절]290</option>
																							</c:when>
																							<c:when test="${list.STOCK_290 <= 0}">
																								<option value="290" disabled>[품절]290</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_290 > 0 and list.CART_PRDSIZE ne '290'}">
																								<option value="290">290</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_290 > 0 and list.CART_PRDSIZE eq '290'}">
																								<option value="290" selected>290</option>
																							</c:when>

																						</c:choose>

																					</select>
																				</div>
																			</div>

																			<!-- 																			</div> -->

																			<hr class="modal_hr2">

																			<div class="div_button_change_size">
																				<button class="button_confirm_change_size"
																					type="button" >확인</button>
																					
																					<input type="hidden" name="CART_NUM" class="CART_NUM_I"
																					value="${list.CART_NUM}" /> 
																					<input type="hidden"
																					name="CART_PRDNUM" value="${list.CART_PRDNUM}" class="CART_PRDNUM_I"/>
																				<input type="hidden" name="CUS_ID"
																					value="${list.CUS_ID}" class="CUS_ID_I"/>
																			</div>
																			<div>

																				


																			</div>
																		</div>

																	</form>

																</div>
															</div>
														</div>
													</div>
												</div>
											</td>




											<td class="shoping__cart__price"><input type="hidden"
												id="price" value="${list.PRD_PRICE }" /> <c:set var="price"
													value="${list.PRD_PRICE}" /> <c:set var="disRate"
													value="${list.PRD_DISRATE}" /> <c:set var="discountPrice"
													value="${list.PRD_PRICE-list.PRD_DISRATE*list.PRD_PRICE/100}" />

												<c:if test="${disRate > 0}">
													<div class="previousPrice">
														<fmt:formatNumber value="${price}" pattern="#,###" />
														<span class="pre_won">원</span>
													</div>
													<div>
														<fmt:formatNumber value="${discountPrice}" pattern="#,###" />
														<span class="won">원</span>
													</div>
												</c:if> <c:if test="${disRate == 0}">
													<fmt:formatNumber value="${price}" pattern="#,###" />
													<span class="won">원</span>
												</c:if></td>
											<td class="shoping__cart__quantity">
													<form action="updatecart.do" method="POST"
														onsubmit="return alert('수량이 변경되었습니다');">
														<div class="quantity">
															<div id="count${status.index}" class="pro-qty">
																<input  class="amount" name="CART_PRDCOUNT" data-lastVal = "${list.CART_PRDCOUNT}"
																	value="${list.CART_PRDCOUNT}" readonly />
															</div>
														</div>
														<input type="hidden" name="CART_NUM"
															value="${list.CART_NUM}" /> <input
															class="button_qty_change" type="submit" value="변경" />
													</form>
												</td>
											<td class="shoping__cart__total"><c:set
													var="previousTotalPrice"
													value="${price * list.CART_PRDCOUNT}" /> <c:set
													var="discountedTotalPrice"
													value="${discountPrice * list.CART_PRDCOUNT}" /> <c:if
													test="${disRate > 0}">
													<div class="previousTotalPrice">
														<fmt:formatNumber value="${previousTotalPrice}"
															pattern="#,###" />
														<span class="pre_won">원</span>
													</div>
													<fmt:formatNumber value="${discountedTotalPrice}"
														pattern="#,###" />
													<span class="won">원</span>
												</c:if> <c:if test="${disRate == 0}">
													<fmt:formatNumber value="${discountedTotalPrice}"
														pattern="#,###" />
													<span class="won">원</span>
												</c:if>


												<div id="previousTotalPrice"></div></td>
											<td class="shoping__cart__item__close">
												<button id="directBtn${status.index}" class="buy_rightnow" type="submit">바로구매</button>
												<script type="text/javascript">
												$("#directBtn${status.index}").click(function(){
													var ORDER_PRDCODE = $(this).parents("tr").find(".prdCode").text();
													var ORDER_PRDSIZE = $(this).parents("tr").find(".qty-size").text();
													var ORDER_AMOUNT = $(this).parents("tr").find(".amount").val();
													var lastVal = $(this).parents("tr").find(".amount").attr("data-lastval");
													if(lastVal != ORDER_AMOUNT){
														var result = confirm("변경된 수량을 저장하시겠습니까?\n변경전 : " + lastVal + " => 변경후 : " + ORDER_AMOUNT);
														if(!result){
															$(this).parents("tr").find(".amount").val(lastVal);
															alert("변경을 취소하였습니다.");
															return false;
														} else {
															$(this).parents("tr").find(".button_qty_change").trigger('click');
														}
													}
													//JSON 형태로 데이터 생성
													var data = {};
													var itemList = [];
														data["ORDER_PRDCODE"] = ORDER_PRDCODE;
														data["ORDER_PRDSIZE"] = ORDER_PRDSIZE;
														data["ORDER_AMOUNT"] = ORDER_AMOUNT;
														itemList.unshift(data);
														  $.ajax({
														   url : "/cart/checkout",
														   type : "POST",
														   data : JSON.stringify(itemList),
														    headers: {
														      'Accept': 'application/json',
														      'Content-Type': 'application/json'
														    },
														   success : function(data){
																location.href="/cart/checkout";
														   },
														   error : function(){
														    alert("보내기 실패");
														   }
														  });
												});
											</script>

												<form id="form" name="form" action="cart.do" method="post"
													onsubmit="return confirm('장바구니에서 해당 상품을 삭제 하시겠습니까?');">

													<input type="hidden" id="CART_PRDNUM" name="CART_PRDNUM"
														value="${list.CART_PRDNUM }"> <input type="hidden"
														id="CART_PRDSIZE" name="CART_PRDSIZE"
														value="${list.CART_PRDSIZE }"> <input
														type="hidden" id="CUS_ID" name="CUS_ID"
														value="${list.CUS_ID }">
													<button class="delete_one" type="submit"
														onclick="delete_event();">
														<i class="far fa-trash-alt">&nbsp;</i>삭제
													</button>


												</form></td>
										</tr>

									</c:forEach>
								</c:if>
							</tbody>


						</table>
					</div>

				</div>
			</div>

			<c:if test="${fn:length(cartList) == 0}">
				<div class="noProduct">
					<div class="noProductIcon">
						<i class="fas fa-exclamation-circle fa-9x"></i>
					</div>
					<div>
						<h3>장바구니에 담긴 상품이 없습니다.</h3>
					</div>
				</div>
			</c:if>

			<c:if test="${fn:length(cartList) != 0}">
				<div class="row">
					<div class="col-lg-12">
						<div class="shoping__cart__btns">
							<button onclick="location.href='/'"
								class="primary-btn cart-btn cart-btn-right keepshopping">쇼핑
								계속하기</button>

							<form name="deleteAll" action="deleteAllCart.do" method="post"
								onsubmit="return confirm('장바구니를 비우시겠습니까?');">
								<input type="hidden" name="CUS_ID" value="${list.CUS_ID}" />
								<button type="submit"
									class="primary-btn cart-btn cart-btn-right throwout">장바구니
									비우기</button>
							</form>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="shoping__continue">
							<!--                         <div class="shoping__discount"> -->
							<!--                             <h5>Discount Codes</h5> -->
							<%--                             <form action="#"> --%>
							<!--                                 <input type="text" placeholder="Enter your coupon code"> -->
							<!--                                 <button type="submit" class="site-btn">APPLY COUPON</button> -->
							<%--                             </form> --%>
							<!--                         </div> -->
						</div>
					</div>
					<div class="col-lg-6">
						<div class="shoping__checkout">
							<h5>결제예정금액</h5>
							<ul>
								<li>주문금액 <span class="sumup"> <%
 	int sum1 = 0;
 		for (int i = 0; i < productList.size(); i++) {
 			sum1 += productList.get(i).getPRD_PRICE() * cartList.get(i).getCART_PRDCOUNT();
 		}
 %> <%=formatter.format(sum1)%></span></li>
								<li>할인금액 <span class="sumup"> <%
 	int sum2 = 0;
 		for (int i = 0; i < productList.size(); i++) {
 			sum2 += (productList.get(i).getPRD_PRICE() * productList.get(i).getPRD_DISRATE() / 100)
 					* cartList.get(i).getCART_PRDCOUNT();
 		}
 %> <%=formatter.format(sum2)%></span></li>
								<li>총 금액 <span> <%=formatter.format(sum1 - sum2)%></span>
								</li>
							</ul>
							<button id="cartBuyBtn" class="primary-btn col-lg-12 button_buy">구매하기</button>
							<script type="text/javascript">
							$("#cartBuyBtn").click(function(){
								var changedVal = 0;
								$('.buy_rightnow').each(function (index, item) {
									var curVal = $(this).parents("tr").find(".amount").val();
									var lastVal = $(this).parents("tr").find(".amount").attr("data-lastval");
									if(lastVal != curVal){
										$(this).parents("tr").find(".amount").val(lastVal);
										changedVal+=1;
									}
								});
								if(changedVal > 0){
									alert("저장되지 않은 수량변경이 있습니다.");
									alert("수량을 초기화 합니다.");
									return false;
								}
								var ORDER_PRDCODE = $(".prdCode").map(function() {
								    return $(this).text();
								}).get();
								var ORDER_PRDSIZE = $(".qty-size").map(function() {
								    return $(this).text();
								}).get();
								var ORDER_AMOUNT = $('.amount').map(function() {
								    return this.value;
								}).get();
								
								//JSON 형태로 데이터 생성
								var data = {};
								var itemList = [];
								if(ORDER_AMOUNT.length == 0){
									alert("옵션을 선택해주세요.");
									return false;
								}
								for(var i=0; i<ORDER_AMOUNT.length; i++){
									data = {};
									data["ORDER_PRDCODE"] = ORDER_PRDCODE[i];
									data["ORDER_PRDSIZE"] = ORDER_PRDSIZE[i];
									data["ORDER_AMOUNT"] = ORDER_AMOUNT[i];
									itemList.push(data);
								}
									  $.ajax({
									   url : "/cart/checkout",
									   type : "POST",
									   data : JSON.stringify(itemList),
									    headers: {
									      'Accept': 'application/json',
									      'Content-Type': 'application/json'
									    },
									   success : function(data){
											location.href="/cart/checkout";
									   },
									   error : function(){
									    alert("보내기 실패");
									   }
									  });
							});
						</script>
						</div>
					</div>
				</div>

			</c:if>







		</div>
	</section>
	<!-- Shoping Cart Section End -->








	<script>
		// function delete_event(){

		// 	if (confirm('장바구니에서 해당 상품을 삭제 하시겠습니까?');) {
		// 		document.getElementById('form').submit();
		// 	}else{
		// 		return false;
		// 	}
		// }

		// function updateCount_event(){

		// 	alert('수량이 변경되었습니다');
		// }
	</script>


	<script>
		function choose(size) {
			var resultElement = document.getElementById('result');

			var writeSize = resultElement.innerText;

			if (size === '220') {
				writeSize = "220";
			} else if (size === '225') {
				writeSize = "225";
			} else if (size === '230') {
				writeSize = "230";
			} else if (size === '235') {
				writeSize = "235";
			} else if (size === '240') {
				writeSize = "240";
			} else if (size === '245') {
				writeSize = "245";
			} else if (size === '250') {
				writeSize = "250";
			} else if (size === '255') {
				writeSize = "255";
			} else if (size === '260') {
				writeSize = "260";
			} else if (size === '265') {
				writeSize = "265";
			} else if (size === '270') {
				writeSize = "270";
			} else if (size === '275') {
				writeSize = "275";
			} else if (size === '280') {
				writeSize = "280";
			} else if (size === '285') {
				writeSize = "285";
			} else if (size === '290') {
				writeSize = "290";
			}

			resultElement.innerText = writeSize;

		}
	</script>







	<script>
	$('.button_confirm_change_size').on("click",function(){
		var CART_PRDSIZE = $(this).parent().parent().children('.size_change_row').children().find('.select_size').val();
var CUS_ID = $(this).parent().find('.CUS_ID_I').val();
var CART_NUM = $(this).parent().find('.CART_NUM_I').val();
var CART_PRDNUM = $(this).parent().find('.CART_PRDNUM_I').val();
			var codeData = {
				CART_PRDSIZE : CART_PRDSIZE,
				CUS_ID : CUS_ID,
				CART_NUM : CART_NUM,
				CART_PRDNUM : CART_PRDNUM
			}
			
			$.ajax({
				url : "updatesize.do",
				type : "POST",
				data : codeData,
				success : function(result) {
					var num = result;
					if (num > 0) {
						alert("동일한 옵션이 존재합니다.");
					} else {
						alert("상품이 수정되었습니다.");
						location.href = "/cart.do";
					}
				}
			});
		});
	</script>


	<jsp:include page="../footer.jsp" />
</body>

</html>