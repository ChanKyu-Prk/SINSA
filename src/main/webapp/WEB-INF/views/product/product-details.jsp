<%@page import="kr.co.sinsa.biz.user.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SINSA&nbsp;-&nbsp;상세페이지&nbsp;${prdInfo.PRD_CODE}</title>
<script src="${path}/resources/js/productlist.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
.product__details__pic__thumb {
	justify-content: space-between;
}

.product__details__pic__thumb img:hover {
	border: 1px solid black;
}

.product__details__pic__thumb img {
	max-width: 19%;
	justify-content: space-between;
}

.product__details__text .brand_name {
	font-size: 15px;
	margin-bottom: 0px;
}

.product__details__text .brand_name:hover {
	color: #0e4a8b;
}

ul#quantity {
	padding-top: 0px;
}

div#sizeCon.product__details__size button {
	cursor: pointer;
	display: inline-block;
	font-size: 13px;
	line-height: 29px;
	width: 80px;
	text-align: center;
	border: 1px solid black;
	border-radius: 2px;
	margin: 0 3px 3px 0;
	background-color: white;
}

div#sizeCon.product__details__size button small {
	color: #858585;
}

div#sizeCon.product__details__size button:hover, div#sizeCon.product__details__size button:focus
	{
	background-color: black;
	color: white;
}

.product__details__text div .heart-icon {
	display: inline;
	margin-bottom: 5px;
	border-left: 5px solid white;
	border: none;
}

#cartBtn {
	background-color: #6f6f6f;
	color: white;
	margin-right: 0;
}

.borderNone {
	border: none;
	border-radius: 2px;
}

/** pro-qty 카운트 */

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}

#quantity .pro-qty {
	margin-bottom: 0;
	width: 100% !important;
}

#quantity .pro-qty div:last-child {
	min-width: 150px;
	text-align: right;
	flex-wrap: wrap;
}

#quantity .pro-qty .qty-countCon {
	display: inline-block;
	user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	-o-user-select: none;
}

#quantity .pro-qty .qty-countCon .qty-button {
	background-color: #90A2B0;
	color: white;
	padding: 0 8px;
	cursor: pointer;
	text-align: center;
	line-height: 34px;
}

#quantity .pro-qty .qty-countCon .qty-minus {
	border-radius: 5px 0 0 5px;
}

#quantity .pro-qty .qty-countCon .qty-plus {
	border-radius: 0 5px 5px 0;
}

#quantity .pro-qty .qty-countCon .amount {
	background-color: white;
}

/* total Price */
.product__details__totalPrice span:first-child {
	line-height: 44px;
}

.product__details__totalPrice .totalPriceCon .totalPriceCon-num {
	color: red;
	font-size: 30px;
	font-weight: 600;
}

#quantity .pro-qty .btn-delete {
	position: relative;
	width: 25px;
	height: 25px;
	margin: 0 0 3px 5px;
}

#quantity .pro-qty .btn-delete:hover {
	background-color: transparent;
	color: #6c757d;
}

#quantity .pro-qty .btn-delete span {
	position: absolute;
	top: 0;
	left: 7px;
	font-family: sans-serif;
	font-weight: 400;
}

.product__details__price {
	font-family: adihaus;
}

.product__details__price .discntNum, .discntNum {
	text-decoration: line-through;
	color: #999;
	font-size: 18px;
}

.product__details__price .disRateNum {
	font-size: 18px;
	font-weight: 400 !important;
}

#btnJjim {
	pointer: cursor;
}

button:disabled {
	background-color: #B2B2B2;
}

.accordion {
	border: 1px solid white !important;
}

.accordion-item {
	border: 1px solid white !important;
}

.accordion-header {
	border: 1px solid white !important;
}

.reviewbox {
	border: 1px solid white !important;
}

.star {
	width: 20px !important;
	height: 20px !important;
	margin: 0px 4px 0px 0px !important;
}

.empty_star {
	width: 20px !important;
	height: 20px !important;
	margin: 0px 4px 0px 0px !important;
}

.span_star {
	padding: 0px 15px 0px 30px !important;
	margin: 0px 0px 10px 0px !important;
}

.review_content {
	margin: 0px 0px 10px 15px !important;
}

.review_img {
	width: 330px !important;
	height: 330px !important;
	margin: 0px 30px 0px 0px !important;
}

.review_list {
	border-radius: 0px !important;
	border-right: 1px solid white !important;
	border-top: 1px solid white !important;
	border-left: 1px solid white !important;
}

.review_list:hover {
	background-color: white !important;
}

#modal {
	display: none;
	position: absolute;
	width: 100%;
	height: 60%;
	z-index: 999999;
	top: 50px;
}

#modal .modal_content {
	width: 58%;
	height: 750px;
	margin: 50px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#empty-qna-description {
	width: 100%;
	text-align: center;
}

.btn-qna {
	background-color: black;
	color: white;
}

.btn-qna-block {
	width: 10%;
	left: 88%;
	position: relative;
}

#img-qna {
	width: 40px;
	padding: 9px 7px;
}

.qna-table-class {
	cursor: pointer;
}

.delete-qna {
	background-color: black;
	color: white;
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

.writeQnaBtn {
	display: none;
}

.modalInfoDiv {
	margin: 0 !important;
	padding: 15px !important;
}

.btn-qnaNew {
	background-color: black !important;
	color: white !important;
	background-image: none !important;
}

.btn-qna-hidden {
	display: none !important;
}

#QNA_LOCK {
	width: 100%;
}

#QNA_TITLE {
	width: 100%;
}

.review_image {
	height: 300px !important;
	width: 350px !important;
	margin: 0px 10px 0px 0px !important;
}

.reviewThumbPic {
	height: 100px;
	width: 100px;
}

.main_review_img {
	padding: 0px 0px 0px 90px !important;
}

.piclenth {
	position: absolute;
	right: 0px;
	width: 25px;
	height: 25px;
	background-color: rgba(0, 0, 0, 0.8);
	color: white;
	margin-top: -25px;
}

.review_content22 {
	margin: 0px 0px 0px 17px !important;
}

.review_span{
	margin: 0px 10px 0px 0px !important;
	font-weight: bold;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<!-- Page Preloder -->
	<!-- 
	<div id="preloder">
		<div class="loader"></div>
	</div>
	 -->
	<jsp:include page="../header.jsp" />
	<!-- Product Details Section Begin -->
	<div>
	<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${pageContext.request.contextPath}/resources/prdImg/${prdInfo.PRD_CODE}.png"
								alt="mainPic">
						</div>
						<div class="product__details__pic__thumb row mx-auto px-0">
							<img
								src="${pageContext.request.contextPath}/resources/prdImg/${prdInfo.PRD_CODE}.png"
								alt="thumbnailMain"> <img
								src="${pageContext.request.contextPath}/resources/prdImg/${prdInfo.PRD_CODE}1.png"
								alt="thumbnail1" onerror="this.style.display='none'"> <img
								src="${pageContext.request.contextPath}/resources/prdImg/${prdInfo.PRD_CODE}2.png"
								alt="thumbnail2" onerror="this.style.display='none'"> <img
								src="${pageContext.request.contextPath}/resources/prdImg/${prdInfo.PRD_CODE}3.png"
								alt="thumbnail3" onerror="this.style.display='none'"> <img
								src="${pageContext.request.contextPath}/resources/prdImg/${prdInfo.PRD_CODE}4.png"
								alt="thumbnail4" onerror="this.style.display='none'">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<a
							href="/product/List/${prdInfo.PRD_BRAND}/newest/all/1"
							class="brand_name"> ${prdInfo.PRD_BRAND} <span><i
								class="fa fa-angle-right"></i></span>
						</a>
						<h3 class="mb-1">${prdInfo.PRD_NAME}<span
								class="ml-2 font-weight-normal prdCode">${prdInfo.PRD_CODE}</span>
						</h3>
						<a class="product__details__rating" href="#reviewTab"> <c:forEach
								begin="1" end="${avgReview}" varStatus="loop">
								<i class="fa fa-star"></i>
							</c:forEach> <c:forEach begin="1" end="${5 - avgReview}" varStatus="loop">
								<i class="fa fa-star-o"></i>
							</c:forEach> <span>(${reviewNum}개 상품평)</span>
						</a>
						<div class="product__details__code">
							<span>색상: <span>${prdInfo.PRD_COLOR}</span>
							</span>
						</div>

						<div class="product__details__price">
							<c:if test="${prdInfo.PRD_DISRATE == 0}">
								<c:set var="finalPrice" value="${prdInfo.PRD_PRICE}" />
								<span class="digits">${finalPrice}원</span>
							</c:if>
							<c:if test="${prdInfo.PRD_DISRATE != 0}">
								<c:set var="finalPriceOrg"
									value="${prdInfo.PRD_PRICE-(prdInfo.PRD_PRICE*(prdInfo.PRD_DISRATE/100))}" />
								<c:set var="finalPrice"
									value="${fn:substringBefore(finalPriceOrg, '.')}" />
								<span class="digits discntNum">${prdInfo.PRD_PRICE}원</span>
								<span class="digits">${finalPrice}원</span>
								<span class="disRateNum">[${prdInfo.PRD_DISRATE}%]</span>
							</c:if>
						</div>
						<div id="priceContainer">
							<div id="sizeCon" class="product__details__size">
								<c:set var="items" value="${fn:split(stockInfo, ',')}" />
								<%
									int inStock = 0;
								%>
								<c:forEach var="item" items="${items}" begin="1">
									<c:set var="stockTrim" value="${fn:replace(item, ']', '')}" />
									<c:set var="stock" value="${fn:substringAfter(stockTrim, '=')}" />
									<c:set var="columnSp"
										value="${fn:substringBefore(stockTrim, '=')}" />
									<c:set var="column" value="${fn:replace(columnSp, ' ', '')}" />
									<c:set var="size" value="${fn:substringBefore(item, '=')}" />
									<c:set var="size" value="${fn:substringAfter(size, '_')}" />
									<c:if test="${stock ne 0}">
										<!-- 여기에 속한게 하나도 없으면 품절value c:set -->
										<%
											inStock++;
										%>
										<button id="${column}" type="button" class="product_size"
											value="${column}">${size}<small class="pl-1"
												data-stockNum="${stock}">(${stock}개)</small>
										</button>
									</c:if>
								</c:forEach>
							</div>

							<div
								class="product__details__quantity row col-lg-12 mx-auto px-0">
								<ul id="quantity" class="quantity">
									<!-- append() list -->
								</ul>
							</div>
						</div>
						<div class="product__details__totalPrice col-lg-12 d-flex my-3">
							<span class="mr-auto p-2">총 결제금액</span>
							<div class="p-2 totalPriceCon">
								<span class="totalPriceCon-num digits">0</span><span
									class="ml-2">원</span>
							</div>
						</div>
						<button type="button" id="btnBuy"
							class="primary-btn col-lg-12 borderNone text-center"
							<%if (inStock == 0) {%> disabled <%}%>>바로구매</button>
						<script type="text/javascript">
							$("#btnBuy")
									.click(
											function() {
						<%if (session.getAttribute("user") == null) {%>
							var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
												if (result) {
													location.href = "/login.do";
													return false;
												} else {
													return false;
												}
						<%}%>
							var stopFunc = 0;
												$(".amount")
														.each(
																function(event) {
																	var liNum = $(
																			this)
																			.val(); //선택된 수량
																	var liOpt = $(
																			this)
																			.attr(
																					"data-opt"); // STOCK_260
																	var btnNum = $(
																			this)
																			.parents(
																					"#priceContainer")
																			.find(
																					"button[value="
																							+ liOpt
																							+ "] > small")
																			.attr(
																					"data-stocknum");
																	if (parseInt(liNum) > parseInt(btnNum)) {
																		alert("준비된 수량을 초과했습니다.");
																		stopFunc += 1;
																		return false;
																	}
																});
												if (stopFunc > 0) {
													return false;
												}
												var ORDER_PRDCODE = $(
														".prdCode").text();
												var ORDER_PRDSIZE = $(
														".qty-size").map(
														function() {
															return $(this)
																	.text();
														}).get();
												var ORDER_AMOUNT = $('.amount')
														.map(function() {
															return this.value;
														}).get();
												//JSON 형태로 데이터 생성
												var data = {};
												var itemList = [];
												if (ORDER_AMOUNT.length == 0) {
													alert("옵션을 선택해주세요.");
													return false;
												}
												for (var i = 0; i < ORDER_AMOUNT.length; i++) {
													data = {};
													data["ORDER_PRDCODE"] = ORDER_PRDCODE;
													data["ORDER_PRDSIZE"] = ORDER_PRDSIZE[i];
													data["ORDER_AMOUNT"] = ORDER_AMOUNT[i];
													itemList.unshift(data);
												}
												$
														.ajax({
															url : "/direct/checkout",
															type : "POST",
															data : JSON
																	.stringify(itemList),
															headers : {
																'Accept' : 'application/json',
																'Content-Type' : 'application/json'
															},
															success : function(
																	data) {
																location.href = "/direct/checkout";
															},
															error : function() {
																alert("보내기 실패");
															}
														});
											});
						</script>
						<div id="jjimNCart" class="row col-lg-12 mx-auto px-0">
							<button id="cartBtn"
								class="primary-btn text-center col-lg-10 borderNone">장바구니</button>
							<script type="text/javascript">
								$("#cartBtn")
										.click(
												function() {
							<%if (session.getAttribute("user") == null) {%>
								var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
													if (result) {
														location.href = "/login.do";
														return false;
													} else {
														return false;
													}
							<%}%>
								var ORDER_PRDCODE = $(
															".prdCode").text();
													var ORDER_PRDSIZE = $(
															".qty-size")
															.map(
																	function() {
																		return $(
																				this)
																				.text();
																	}).get();
													var ORDER_AMOUNT = $(
															'.amount')
															.map(
																	function() {
																		return this.value;
																	}).get();

													//JSON 형태로 데이터 생성
													var data = {};
													var itemList = [];
							<%if (session.getAttribute("user") != null) {%>
								if (ORDER_AMOUNT.length == 0) {
														alert("옵션을 선택해주세요.");
														return false;
													}
							<%}%>
								for (var i = 0; i < ORDER_AMOUNT.length; i++) {
														data = {};
														data["ORDER_PRDCODE"] = ORDER_PRDCODE;
														data["ORDER_PRDSIZE"] = ORDER_PRDSIZE[i];
														data["ORDER_AMOUNT"] = ORDER_AMOUNT[i];
														itemList.unshift(data);
													}
													$
															.ajax({
																url : "/addCart",
																type : "POST",
																data : JSON
																		.stringify(itemList),
																headers : {
																	'Accept' : 'application/json',
																	'Content-Type' : 'application/json'
																},
																success : function(
																		data) {
																	var result = confirm("상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
																	if (result) {
																		location.href = "/cart.do";
																	} else {
																		return false;
																	}
																},
																error : function() {
																	alert("이미 담겨있는 상품입니다.");
																}
															});
												});
							</script>
							<button id="jjimBtn"
								class="heart-icon col-lg-2 text-center borderNone">
								<c:if test="${empty jjimInfo}">
									<i class="fa fa-heart-o"></i>
								</c:if>
								<c:if test="${not empty jjimInfo}">
									<i class="fa fa-heart"></i>
								</c:if>
							</button>
							<script type="text/javascript">
								$("#jjimBtn")
										.click(
												function() {
							<%if (session.getAttribute("user") == null) {%>
								var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
													if (result) {
														location.href = "/login.do";
														return false;
													} else {
														return false;
													}
							<%}%>
								if ($(this)
															.find("i")
															.hasClass(
																	"fa-heart-o")) {
														$(this)
																.find("i")
																.removeClass(
																		"fa-heart-o");
														$(this)
																.find("i")
																.addClass(
																		"fa-heart");
													} else {
														$(this)
																.find("i")
																.removeClass(
																		"fa-heart");
														$(this)
																.find("i")
																.addClass(
																		"fa-heart-o");
													}
													var ORDER_PRDCODE = $(
															".prdCode").text();

													//JSON 형태로 데이터 생성
													var data = {};
													data["ORDER_PRDCODE"] = ORDER_PRDCODE;
													$
															.ajax({
																url : "/jjim",
																type : "POST",
																data : JSON
																		.stringify(data),
																headers : {
																	'Accept' : 'application/json',
																	'Content-Type' : 'application/json'
																},
																success : function(
																		data) {
																	//
																},
																error : function() {
																	alert("보내기 실패");
																}
															});
												});
							</script>
						</div>
						<ul>
							<li><b>재고</b><span> <%
 	if (inStock > 0) {
 %>IN STOCK<%
 	} else {
 %>SOLD OUT<%
 	}
 %>
							</span></li>
							<li><b>배송</b><span>무료 배송</span></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation"><a
								class="nav-link active" id="infoTab" data-toggle="tab"
								href="#tabs-1" role="tab" aria-selected="true">상품정보</a></li>
							<li class="nav-item" role="presentation"><a id="reviewTab"
								class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
								aria-selected="false">상품평&nbsp; <span>(${reviewNum})</span></a></li>
							<li class="nav-item" role="presentation"><a id="qnaTab"
								class="nav-link" onclick="QnaList(1)" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">상품문의&nbsp;<span>(${qlistCount})</span></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h5 class="text-center mt-3 mb-1">${prdInfo.PRD_BRAND}</h5>
									<h4 class="text-center mb-4 font-weight-bold">${prdInfo.PRD_NAME}</h4>
									<p>${prdInfo.PRD_DETAIL}</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<div class="container">
										<div class="row">
											<c:forEach var="list" items="${detailReviewList}"
												varStatus="status">
												<a
													class="list-group-item list-group-item-action review_list">
													<div class="row">
														<div class="col">
															<div class="row TextCenter" data-toggle="collapse"
																data-target="#content${status.index}">
																<span class="col-md-10 span_star"> <c:if
																		test="${list.REV_STAR eq 0}">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">

																	</c:if> <c:if test="${list.REV_STAR eq 1}">
																		<div style="display: flex;">
																			<img src="${path}/resources/img/star.png"
																				class="star"> <img
																				src="${path}/resources/img/empty_star.png"
																				class="empty_star"> <img
																				src="${path}/resources/img/empty_star.png"
																				class="empty_star"> <img
																				src="${path}/resources/img/empty_star.png"
																				class="empty_star"> <img
																				src="${path}/resources/img/empty_star.png"
																				class="empty_star">
																		</div>
																	</c:if> <c:if test="${list.REV_STAR eq 2}">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">

																	</c:if> <c:if test="${list.REV_STAR eq 3}">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">

																	</c:if> <c:if test="${list.REV_STAR eq 4}">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/empty_star.png"
																			class="empty_star">

																	</c:if> <c:if test="${list.REV_STAR eq 5}">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">
																		<img src="${path}/resources/img/star.png" class="star">

																	</c:if>
																	
																	<span><br> <fmt:formatDate
																			value="${list.REV_REGDATE}" pattern="yyyy-MM-dd" />
																</span><br> ${list.PRD_NAME} / ${list.PRD_COLOR } /
																	${list.ORDER_PRDSIZE }<br> <c:set var="rev_title"
																		value="${fn:split(list.REV_TITLE,'/')}" />사이즈 :<span
																	class="review_span"> ${rev_title[0] }</span>|&nbsp;&nbsp;&nbsp;색상
																	:<span class="review_span"> ${rev_title[1] }</span>|&nbsp;&nbsp;&nbsp;착화감
																	:<span class="review_span"> ${rev_title[2] }</span>|&nbsp;&nbsp;&nbsp;배송
																	:<span class="review_span"> ${rev_title[3] }</span>
																	
																	
																	
																	
																	
																	
																	
																	
																</span> 
																
																
																
																
																



																<c:set var="img_array"
																	value="${fn:split(list.REV_IMAGE,'/')}" />

																<c:if test="${list.REV_IMAGE ne null}">
																	<c:if test="${img_array[0] ne null}">
																		<span class="col-md-2 main_review_img"> <input
																			type="hidden" value="0" class="displayState">
																			<img class="reviewThumbPic" alt="리뷰 대표 사진"
																			title="리뷰 대표 사진"
																			src="${path}/resources/img/review/${img_array[0]}" />
																			<div class="piclenth">&nbsp;&nbsp;${fn:length(img_array)}</div>
																		</span>
																	</c:if>
																</c:if>




																<span class="col-md-9 review_content">${list.REV_CONTENT}</span>





																<div id="content${status.index}" class="collapse">
																	<!-- 																	<div class="col-md-5 left margin"></div> -->
																	<div class="row">
																		<div class="col-md-12 review_content22">
																			<c:if test="${list.REV_IMAGE ne null}">
																				<c:if test="${img_array[0] ne null}">
																					<img
																						src="${path}/resources/img/review/${img_array[0]}"
																						alt="" class="review_image">
																				</c:if>
																				<c:if test="${img_array[1] ne null}">
																					<img
																						src="${path}/resources/img/review/${img_array[1]}"
																						alt="" class="review_image">
																				</c:if>
																				<c:if test="${img_array[2] ne null}">
																					<img
																						src="${path}/resources/img/review/${img_array[2]}"
																						alt="" class="review_image">
																				</c:if>
																			</c:if>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</a>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<ul>
										<li>
											<p style="text-align: center;">단순 상품비방, 상업적인 내용, 미풍양속 위반, 게시판의 성격에 맞지 않는 글은 통보 없이 삭제될
												수 있습니다.</p>
										</li>
									</ul>


									<div class="container">
										<div class="container-fluid">
											<button type="button" id="btn-qna-hidden-id"
												class="btn btn-primary btn-lg btn-qna-hidden"
												data-toggle="modal" data-target="#myModal"></button>
											<div class="modal fade" id="myModal" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title" id="myModalLabel">상품Q&A 작성</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<form id="formToInput" method="post">
																<input type="hidden" id="PRD_NUM" name="PRD_NUM"
																	class="PRD_NUM" value="${prdInfo.PRD_NUM}" />
																<p>
																	<label> 제목* </label><br> <input type="text"
																		id="QNA_TITLE" name="QNA_TITLE" required="required"
																		value="" />
																</p>

																<p>
																	<input type="radio" style="margin-right: 10px;"
																		id="QNA_LOCK0" name="QNA_LOCK" value="0" checked>
																	<label for="QNA_LOCK" style="margin-right: 10px;">비밀글</label>
																	<input type="radio" style="margin-right: 10px;"
																		id="QNA_LOCK1" name="QNA_LOCK" value="1"> <label
																		for="QNA_LOCK">공개글</label>
																</p>
																<!--  
												 <p><label> 패스워드* </label><br><input type="password" id="QNA_LOCK0" name="QNA_LOCK" 
												  	required="required" value=""/></p>
												 -->
																<p>
																	<label> 문의 내용 입력* </label><br>
																	<textarea rows="10" cols="60" id="QNA_CONTENT"
																		name="QNA_CONTENT" required="required" style="resize: none; width: 100%"></textarea>
																	<br>
																</p>
															</form>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-primary"
																id="qnaWrite-id" onclick="qnaWrite(this.id)" style="background-color: black;">쓰기</button>
															<button type="button" class="btn btn-default"
																id="modal_close_btn" data-dismiss="modal">닫기</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="container" id="container-qna"></div>
									<!-- 페이징 구분 -->
									<ul class="pagination">
									</ul>
									<input type="hidden" id="hidden-page">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Product Details Section End -->
	<c:if test="${recommList != null}">
		<!-- Related Product Section Begin -->
		<section class="related-product">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title related__product__title">
							<h2>추천 상품</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="list" items="${recommList}">
						<c:if test="${list.PRD_CODE != prdInfo.PRD_CODE}">
							<div class="col-lg-3 col-md-4 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="${pageContext.request.contextPath}/upload/prdImg/${list.PRD_CODE}.png">
									</div>
									<div class="product__item__text">
										<h6>
											<a href="/product/prdCode=${list.PRD_CODE}">${list.PRD_NAME}</a>
										</h6>
										<c:if test="${list.PRD_DISRATE == 0}">
											<h5 class="digits">${list.PRD_PRICE}</h5>
										</c:if>
										<c:if test="${list.PRD_DISRATE != 0}">
											<c:set var="finalPriceOrg"
												value="${list.PRD_PRICE-(list.PRD_PRICE*(list.PRD_DISRATE/100))}" />
											<c:set var="finalPrice"
												value="${fn:substringBefore(finalPriceOrg, '.')}" />
											<h5 class="digits discntNum">${list.PRD_PRICE}원</h5>
											<h5 class="digits">${finalPrice}원</h5>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- Related Product Section End -->
	</c:if>
		</div>
		<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var totalPrice = 0;
							var singlePrice = 0;
							var prdListNum = 0;
							// prepend list on size click
							numberWithDigits();
							$(".product_size")
									.click(
											function() {
												var listNum = $(this).val(); //STOCK_260
												var clickedSize = $(this)
														.text().substring(0, 3); //260

												var element = "<li><div class='pro-qty d-flex col-lg-12'><div class='mr-auto p-2'><span class='qty-size ml-2' data-stock='"
														+ listNum.trim()
														+ "'>"
														+ clickedSize
														+ "</span></div><div class='p-2'><div class='qty-countCon'><span class='qty-button qty-minus'>–</span><input type='number' class='amount' value='1' min='1' name='ORDER_AMOUNT' data-opt='"
														+ listNum.trim()
														+ "'><span class='qty-button qty-plus'>+</span></div></div><div class='p-2'><span class='qty-totalPrice mr-1 digits' data-org-price='${finalPrice}' data-stockName='"
														+ listNum.trim()
														+ "'>${finalPrice}</span><small>원</small><button class='btn-delete btn btn-outline-secondary'><span>X</span></button></div></div></li>"
												var selected = $('span[data-stock="'
														+ listNum.trim() + '"]');
												noDigits();
												if (selected.length > 0) {
													// val + 1
													var isDup = $(this)
															.parents(
																	"#priceContainer")
															.find(
																	".amount[data-opt="
																			+ listNum
																			+ "]");
													isDup.val(parseInt(isDup
															.val()) + 1);
													$(this)
															.parents(
																	"#priceContainer")
															.find(
																	".qty-totalPrice[data-stockname="
																			+ listNum
																			+ "]")
															.text(
																	$(this)
																			.parents(
																					"#priceContainer")
																			.find(
																					".qty-totalPrice")
																			.data(
																					"org-price")
																			* isDup
																					.val());
													calc();
													numberWithDigits();
												} else {
													$("#quantity").prepend(
															element);
													calc();
													numberWithDigits();
												}

											});

							// amount decre or incre
							$(".product_size")
									.parents("#priceContainer")
									.on(
											"click",
											".qty-button",
											function() {
												var $button = $(this);
												var oldValue = $button.parent()
														.find("input").val();
												if ($button.text() == "+") {
													var newVal = parseFloat(oldValue) + 1;
												} else {
													if (oldValue > 1) {
														var newVal = parseFloat(oldValue) - 1;
													} else {
														newVal = 1;
													}
												}
												$button.parent().find("input")
														.val(newVal);
											});

							// prevent inputting non positive num
							$(".product_size")
									.parents("#priceContainer")
									.on(
											"keydown",
											".amount",
											function(e) {
												if (!((e.keyCode > 95 && e.keyCode < 106)
														|| (e.keyCode > 47 && e.keyCode < 58) || e.keyCode == 8)) {
													return false;
												}
											});

							// 	Calculate total price due to amount (direct change on input)
							$(".product_size").parents("#priceContainer").on(
									"propertychange change keyup paste input",
									".amount",
									function(e) {
										var amount = parseInt($(this).val());
										var totalPrice = 0;
										noDigits();
										if ($(this).val() != '') {
											totalPrice = $(".qty-totalPrice")
													.data("org-price")
													* amount;
										}
										$(this).parents(".pro-qty").find(
												".qty-totalPrice").attr(
												'data-stockname',
												$(this).attr('name')).text(
												totalPrice);
										calc();
										numberWithDigits();
									});

							//	Calculate total price due to amount (on +/- click)

							$(".product_size").parents("#priceContainer").on(
									"click",
									".qty-button",
									function(e) {
										noDigits();
										var amount = parseInt($(this).parents(
												".pro-qty").find(".amount")
												.val());
										singlePrice = $(".qty-totalPrice")
												.data("org-price")
												* amount;
										$(this).parents(".pro-qty").find(
												".qty-totalPrice").attr(
												'data-stockname',
												$(this).siblings(".amount")
														.data('opt')).text(
												singlePrice);
										calc();
										numberWithDigits();
									});

							function calc() {
								var eachTotal = $(".product_size").parents(
										"#priceContainer").find(
										".qty-totalPrice");
								$(eachTotal).each(function(i, item) {
									totalPrice += parseInt($(this).text());
								});
								$(".totalPriceCon-num").text(totalPrice);
								totalPrice = 0;
							}

							function numberWithDigits() {
								$(".digits")
										.each(
												function() {
													$(this)
															.text(
																	$(this)
																			.text()
																			.replace(
																					/\B(?=(\d{3})+(?!\d))/g,
																					','));
												});
							}

							function noDigits() {
								$(".digits").each(
										function() {
											$(this).text(
													$(this).text().replaceAll(
															',', ''));
										});
							}

							//deleteBtn to delete list
							$(".product_size").parents("#priceContainer").on(
									"click", ".btn-delete", function() {
										noDigits();
										$(this).closest("li").remove();
										calc();
										numberWithDigits();
									});

							// large pic width = height
							var imgWidth = $(
									'.product__details__pic__item--large')
									.width();

							$(".product__details__pic__item--large").get(0).onload = function() {
								$('.product__details__pic__item--large')
										.height(imgWidth);
							}

							// thumb pic width = height
							var thumbImgWidth = $(
									'.product__details__pic__thumb img')
									.width();
							$(window).resize(
									function() {
										$('.product__details__pic__thumb img')
												.height(thumbImgWidth);
									});

							// change main img while hovering on thumbnails
							$(".product__details__pic__thumb img")
									.hover(
											function() {
												var src = $(this).attr("src");
												$(
														".product__details__pic__item--large")
														.attr("src", src);
											});

							//상단 리뷰 누르면 하단 리뷰로 이동
							$(".product__details__rating").on("click",
									function() {
										$("#reviewTab").trigger("click");
									});
						});
		function modalOpenBtn() {
	<%if (session.getAttribute("user") == null) {%>
		loginCheck();
	<%}%>
		$("#QNA_TITLE").val("");
			$("#QNA_LOCK").val("");
			$("#btn-qna-hidden-id").click();
		}
		function qnaWrite(clickedId) {
			var CRUD = clickedId;
			var PRD_CODE = '${prdInfo.PRD_CODE}';
			var page;
			var CONTENT = $('#QNA_CONTENT').val();
			var TITLE = $('#QNA_TITLE').val();
			var LOCK = $('input[name="QNA_LOCK"]:checked').val();

			if (CONTENT === null || CONTENT === "") {
				alert("내용이 비었습니다.");
				return false;
			} else if (TITLE === null || TITLE === "") {
				alert("문의 제목을 작성해주세요.");
				return false;
			}
			if (CRUD === 'qnaWrite-id') {

				var form = $('#formToInput').serialize();
				CRUD = 'insert';
				qnaCrud(form, CRUD, PRD_CODE, page);
			}
		}
		function qnaUpdate(updateNumbering) {
	<%if (session.getAttribute("user") == null) {%>
		loginCheck();
			return false;
	<%}%>
		$("#btn-qna-hidden-id" + updateNumbering).click();
		}
		function continueQnaUpdate(updateNumbering, page) {
			var CONTENT = $('#QNA_CONTENT' + updateNumbering).val();
			var TITLE = $('#QNA_TITLE' + updateNumbering).val();
			var LOCK = $(
					'input[name="QNA_LOCK' + updateNumbering + '"]:checked')
					.val();
			if (CONTENT === null || CONTENT === "") {
				alert("내용이 비었습니다.");
				return false;
			} else if (TITLE === null || TITLE === "") {
				alert("문의 제목을 작성해주세요.");
				return false;
			} else if (LOCK === null || LOCK === "") {
				alert("패스워드가 비었습니다.");
				return false;
			}
			var CRUD = 'update';
			var CODE = updateNumbering;
			var form = $('#formToInput' + updateNumbering).serialize();
			qnaCrud(form, CRUD, CODE, page);
		}
		function qnaDelete(deleteNumbering, thisId, page) {
	<%if (session.getAttribute("user") == null) {%>
		loginCheck();
			return false;
	<%} else {
				UserVO id = (UserVO) session.getAttribute("user");
				String CutId = id.getCUS_ID();
				pageContext.setAttribute("CutId", new String[]{CutId});
			}%>
		var checkID = "${CutId[0]}";
			if (thisId != checkID) {
				alert("게시물을 작성한 계정만 게시물을 삭제할 수 있습니다.");
				return false;
			}
			var result = confirm("정말로 삭제하시겠습니까?");
			if (result) {
				var CRUD = 'delete';
				var CODE = deleteNumbering;
				var isForm = 'formToDelete' + deleteNumbering;
				var form = $('#' + isForm).serialize();
				qnaCrud(form, CRUD, CODE, page);
			} else {
				return false;
			}
		}

		function qnaCrud(form, CRUD, CODE, page) {
			$.ajax({
				url : '/formToInput/' + CRUD,
				type : "POST",
				data : form,
				success : function(data) {
					if (CRUD === 'insert') {
						QnaList(1);
						$('#modal_close_btn').click();
					} else if (CRUD === 'delete') {
						QnaList(page);
					} else {
						$('#modal_close_btn' + CODE).click();
						setTimeout(function() {
							QnaList(page);
						}, 500);
					}
				},
				error : function(e) {
					console.log("ERROR : ", e);
				}
			})

		}
		function loginCheck() {
			var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
			if (result) {
				location.href = "/login.do";
				return false;
			} else {
				return false;
			}
		}
		function openContent(qnaNumbering, thisId, lock) {
	<%if (session.getAttribute("user") == null) {%>
		loginCheck();
			return false;
	<%} else {
				UserVO id = (UserVO) session.getAttribute("user");
				String CutId = id.getCUS_ID();
				pageContext.setAttribute("CutId", new String[]{CutId});
			}%>
		var checkID = "${CutId[0]}";
			if (lock === "0" || lock === 0) {
				if (thisId != checkID) {
					alert("비밀글은 작성자만 볼 수 있습니다.");
					return false;
				}
			}
			var check = $(".qna-content" + qnaNumbering).css("display");
			if(check === "block"){
				$(".qna-content" + qnaNumbering).attr("style", "display:none");	
			}else{				
				$(".qna-content" + qnaNumbering).attr("style", "display:block");
			}
			return false;
		}

		function replyOpenDelete(qnaNumbering) {
			var correctPwd = $('#correct-pwd-delete' + qnaNumbering).val();
			var comparePwd = $("#qna-content-password-delete" + qnaNumbering)
					.val();
			if (correctPwd != comparePwd || comparePwd === null) {
				alert("패스워드를 다시 확인해주세요.");
			} else {
				$('#qna-open-content-delete' + qnaNumbering).css('display',
						'none');

			}
		}
		function replyCancle(qnaNumbering) {
			$('#qna-open-content' + qnaNumbering).css('display', 'none');
			$('#qna-open-content-delete' + qnaNumbering).css('display', 'none');
		}
		function modalCloseBtn(qnaNumbering) {
			$("#modal" + qnaNumbering).attr("style", "display:none");
		}

		function QnaList(pageR) {
			var prd_code = '${prdInfo.PRD_CODE}';
			var arrays = new Array();
			var sendData = {
				"prdCode" : prd_code,
				"pageR" : pageR
			};
			$
					.ajax({
						url : "/qnaListForm",
						type : "POST",
						data : sendData,
						success : function(data) {
							arrays = data.qnaList;
							var pI = data.pageInfo;
							$('#hidden-page').attr("onclick",
									"QnaList(" + pI.page + ")");
							$('#container-qna').empty();
							if (arrays[0] === undefined) {
								$('#container-qna')
										.append(
												'<div id="empty-qna-description" >작성된 문의가 없습니다.</div>');
							} else {
								$('#container-qna')
										.append(
												'<div id="empty-qna-description" style="margin-bottom: 55px;"><h4>< 상품 Q&A ></h4></div>');
							}
							$('#container-qna')
									.append(
											'<div style="margin-bottom:10px;" align="right">'
													+ '<button type="button" onclick="modalOpenBtn()" class="btn btn-primary btn-lg btn-qnaNew">문의쓰기</button>'
													+ '</div>');
							for (var i = 0; i < arrays.length; i++) {
								var id;
								$('#container-qna')
										.append(
												'<div class="container" ><div class="container-fluid">'
														+ '<button type="button" id="btn-qna-hidden-id'+i+'" class="btn btn-primary btn-lg btn-qna-hidden" '
											+'data-toggle="modal" data-target="#myModal'+i+'"></button>'
														+ '<div class="modal fade" id="myModal'+i+'" tabindex="-1" role="dialog"' 
											+'aria-labelledby="myModalLabel" aria-hidden="true">'
														+ '<div class="modal-dialog">'
														+ '<div class="modal-content">'
														+ '<div class="modal-header">'
														+ '<h4 class="modal-title" id="myModalLabel">상품Q&A 수정</h4>'
														+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
														+ '<span aria-hidden="true">&times;</span></button></div>'
														+ '<div class="modal-body"><form id="formToInput'+i+'" method="post">'
														+ '<input type="hidden" id="QNA_NUM'+i+'" name="QNA_NUM" value="'+arrays[i].qna_NUM+'" />'
														+ '<input type="hidden" id="PRD_NUM'+i+'" name="PRD_NUM" value="'+${prdInfo.PRD_NUM}+'" />'
														+ '<p><label> 제목* </label><br><input type="text" id="QNA_TITLE'+i+'" name="QNA_TITLE" ' 
										  +'required="required" value="'+arrays[i].qna_TITLE+'"/></p>'
														+ '<p>'
														+ '<input type="radio" style=" margin-right: 10px;" id="QNA_LOCK0" name="QNA_LOCK'+i+'" value="0" checked>'
														+ '<label for="QNA_LOCK" style=" margin-right: 10px;" >비밀글</label>'
														+ '<input type="radio" style=" margin-right: 10px;" id="QNA_LOCK1" name="QNA_LOCK'+i+'" value="1">'
														+ '<label for="QNA_LOCK">공개글</label>'
														+ '</p>'
														+ '<p><label> 문의 내용 입력* </label><br><textarea rows="10" cols="60" id="QNA_CONTENT'+i+'" '
										  +'name="QNA_CONTENT" required="required">'
														+ arrays[i].qna_CONTENT
														+ '</textarea><br></p>'
														+ '</form></div>'
														+ '<div class="modal-footer">'
														+ '<button type="button" class="btn btn-primary" id="qnaWrite-id" '
														+ 'onclick="continueQnaUpdate('
														+ i
														+ ', '
														+ pI.page
														+ ')">쓰기</button>'
														+ '<button type="button" class="btn btn-default close_btn" '
														+'id="modal_close_btn'+i+'" data-dismiss="modal">닫기</button>'
														+ '</div></div></div></div></div></div>'
														+ '<div id="qna-open-content'+i+'"><div class="modal_content">'
														+ '<div id="replypw">문의글 비밀번호를 입력해주세요.</div>'
														+ '<hr/>'
														+ '<input type="hidden" id="correct-pwd'+i+'" value="'+arrays[i].qna_LOCK+'">'
														+ '<input type="password" placeholder="비밀번호 입력" size="30" id="qna-content-password'+i+'"><br>'
														+ '<div id="reply">'
														+ '<input type="button" id="replyCancle" onclick="replyCancle('
														+ i
														+ ')" class="qna-content-password-check'
														+ i
														+ '" value="취소">'
														+ '</div></div></div>'
														+ '<div id="qna-open-content-delete'+i+'"><div class="modal_content">'
														+ '<div id="replypw">문의글 비밀번호를 입력해주세요.</div>'
														+ '<hr/>'
														+ '<input type="hidden" id="correct-pwd-delete'+i+'" value="'+arrays[i].qna_LOCK+'">'
														+ '<input type="password" placeholder="비밀번호 입력" size="30" id="qna-content-password-delete'+i+'"><br>'
														+ '<div id="reply">'
														+ '<input type="button" id="replyOpen" onclick="replyOpenDelete('
														+ i
														+ ')" class="qna-content-password-check'
														+ i
														+ '" value="확인">'
														+ '<input type="button" id="replyCancle" onclick="replyCancle('
														+ i
														+ ')" class="qna-content-password-check'
														+ i
														+ '" value="취소">'
														+ '</div></div></div>'
														+ '<table id="qna-table'+i+'" class="qna-table-class" style="margin-bottom: 10px; border-bottom: 1px solid grey;">'
														+ '<tr><td id="security-qna'+i+'">'
														+ arrays[i].qna_LOCK
														+ '</td>'
														+ '<td style="width: 99px;">'
														+ new Date(
																arrays[i].qna_REGDATE)
																.toLocaleDateString()
														+ '</td>'
														+ '<td style="width: 605px;" id="'
														+ arrays[i].qna_CUSID
														+ '" onclick="openContent('
														+ i
														+ ',this.id,'
														+ arrays[i].qna_LOCK
														+ ')">'
														+ arrays[i].qna_TITLE
														+ '</td>'
														+ '<td style="width: 130px;">'
														+ arrays[i].qna_CUSID
														+ '</td>'
														+ '<td style="width: 91px;" id="aCheck'+i+'">답변대기</td><td style="width: 49px;">'
														+ '<form id="formToDelete'+i+'" method="post">'
														+ '<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="'+arrays[i].qna_NUM+'" />'
														+ '<input type="button" onclick="qnaDelete('
														+ i
														+ ',this.id, '
														+ pI.page
														+ ')" id="'
														+ arrays[i].qna_CUSID
														+ '" class="delete-qna delete-qna'+i+'" value="삭제">'
														+ '</form>'
														+ '</td>'
														+ '<td style="width: 58px;">'
														+ '<input type="button" id="modal_open_btn'
														+ i
														+ '" onclick="qnaUpdate('
														+ i
														+ ')" class="btn-qna btn-qna'+i+'" value="수정" />'
														+ '</td>'
														+ '</tr>'
														+ '<tr>'
														+ '<td></td>'
														+ '<td></td>'
														+ '<td class="qna-content'+i+'" id="qna-content'+i+'" value="check" >'
														+ arrays[i].qna_CONTENT
														+ '</td>'
														+ '</tr><tr><td></td><td></td><td class="qna-content'+i+'"><textarea rows="10" style="resize:none" cols="80" placeholder="A.관리자가 답변을 준비중입니다." value="'+arrays[i].qna_ANSWER+' readonly="readonly" disabled>'
														+ arrays[i].qna_ANSWER
														+ '</textarea></td></tr>'
														+ '</table>'
														+ '<style>'
														+ '#replypw{margin:0 10%; text-align: center}'
														+ '#reply{margin:0 20%;}'
														+ '#modal'
														+ i
														+ ' {display:none; position:absolute; width:100%; height:175%; z-index:999999; top: 50px;}'
														+ '#replyOpen {display:inline-block; margin-right: 8px; width:100px;}'
														+ '#replyCancle {display:inline-block; width:100px;}'
														+ '#modal'
														+ i
														+ ' .modal_content {width:58%; height:750px; margin:50px auto; padding:20px 10px;'
														+ 'background:#fff; border: 2px solid #666;}'
														+ '#qna-open-content'
														+ i
														+ ' {display:none; position:absolute; width:80%; height:22%; z-index:999999;}'
														+ '#qna-open-content-delete'
														+ i
														+ ' {display:none; position:absolute; width:80%; height:22%; z-index:999999;}'
														+ '#qna-open-content'
														+ i
														+ ' .modal_content {width:40%; height:190px; margin:50px auto; padding:20px 10px; '
														+ 'background:#fff; border: 2px solid #666;}'
														+ '#qna-open-content-delete'
														+ i
														+ ' .modal_content {width:40%; height:190px; margin:50px auto; padding:20px 10px; '
														+ 'background:#fff; border: 2px solid #666;}'
														+ '.qna-content'
														+ i
														+ '{display: none;} #qna-content-password'
														+ i
														+ '{display:block; margin: auto;}'
														+ '#qna-content-password-delete'
														+ i
														+ '{display:block; margin: auto;}</style>')
								if (arrays[i].qna_ANSWER != "") {
									$('#aCheck' + i).text('답변완료');
								}
								var sq = $('#security-qna' + i).text();
								console.log(sq + "? sq");
								if (sq === '0') {
									$('#security-qna' + i).html(
											'[비밀글]&nbsp&nbsp&nbsp&nbsp');
								} else {
									$('#security-qna' + i).html(
											'[공개글]&nbsp&nbsp&nbsp&nbsp');
								}
								var listWriter = arrays[i].qna_CUSID;
								<%if (session.getAttribute("user") == null) {%>
									$(".btn-qna"+i).remove();
									$(".btn-qna"+i).css("cursor", "default");
									$(".delete-qna"+i).remove();
									$(".delete-qna"+i).css("cursor", "default");
								<%}else{%>
								<%
									UserVO id = (UserVO) session.getAttribute("user");
									String CutId = id.getCUS_ID();
									pageContext.setAttribute("CutId", new String[]{CutId});
								%>
								if(listWriter != "${CutId[0]}"){
									$(".btn-qna"+i).remove();
									$(".delete-qna"+i).remove();									
								}
								<%}%>
							}

							console.log(arrays[0]);
							console.log("pI.page : " + pI.page);
							console.log("pI.startPage : " + pI.startPage);
							console.log("pI.endPage : " + pI.endPage);
							console.log("pI.maxPage : " + pI.maxPage);
							console.log("pI.listCount : " + pI.listCount);
							//페이징 처리 로직
							$(".pagination").empty(); //페이징에 필요한 객체내부를 비워준다.
							if (pI.page <= 1) { // 현재 페이지가
								$(".pagination")
										.append(
												'<li class="page-item disabled"><a class="page-link" aria-disabled="true">이전</a></li>');
							} else if (pI.startPage === 1) {
								$(".pagination")
										.append(
												'<li class="page-item"><a class="page-link" onclick="QnaList('
														+ pI.startPage
														+ ')" tabindex="-1">이전</a></li>');
							} else {
								$(".pagination")
										.append(
												'<li class="page-item"><a class="page-link" onclick="QnaList('
														+ pI.startPage
														+ '-1})" tabindex="-1">이전</a></li>');
							}
							;

							for (var i = pI.startPage; i <= pI.endPage; i++) {
								if (pI.page === i) {
									$(".pagination").append(
											'<li class="page-item active" aria-current="page"><a class="page-link">'
													+ i + '</a></li>');
								} else {
									$(".pagination").append(
											'<li class="page-item"><a class="page-link" onclick="QnaList('
													+ i + ')">' + i
													+ '</a></li>');
								}
							}
							;

							if (pI.page >= pI.maxPage) {
								$(".pagination")
										.append(
												'<li class="page-item disabled"><a class="page-link" aria-disabled="true">다음</a></li>')

							} else if (pI.endPage === pI.maxPage) {
								$(".pagination")
										.append(
												'<li class="page-item"><a class="page-link" onclick="QnaList('
														+ pI.endPage
														+ ')">다음</a></li>')
							} else {
								$(".pagination").append(
										'<li class="page-item"><a class="page-link" onclick="QnaList('
												+ pI.endPage
												+ '+1)">다음</a></li>')
							}

						}
					})
		}
	</script>
</body>
</html>