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
<title>${prdInfo.PRD_CODE}&nbsp;${prdInfo.PRD_CODE}&nbsp;-&nbsp;SINSA</title>
<script src="${path}/resources/js/productlist.js" type="text/javascript"></script>

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
}

.review_content {
	margin: 20px 0px 0px 19px !important;
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
	display:none; position:absolute; width:100%; height:60%; z-index:999999;
	top: 50px;
}

#modal .modal_content {
	width:900px; height:660px; margin:50px auto; padding:20px 10px; 
	background:#fff; border: 2px solid #666;
}
#empty-qna-description{
	width: 100%; text-align: center;
}
.btn-qna{
	background-color: black;
	color: white;
}
.btn-qna-block{
	width: 10%;
    left: 88%;
    position: relative;
}
#img-qna{
	width: 40px;
    padding: 9px 7px;
}
.qna-table-class{
	cursor: pointer;
}
.delete-qna{
	background-color: black;
	color: white;
}
.pagination { margin-top: 25px; margin-bottom: 25px; justify-content: center; }
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
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${pageContext.request.contextPath}/upload\prdImg/${prdInfo.PRD_CODE}.png"
								alt="mainPic">
						</div>
						<div class="product__details__pic__thumb row mx-auto px-0">
							<img
								src="${pageContext.request.contextPath}/upload\prdImg/${prdInfo.PRD_CODE}.png"
								alt="thumbnailMain"> <img
								src="${pageContext.request.contextPath}/upload\prdImg/${prdInfo.PRD_CODE}1.png"
								alt="thumbnail1"> <img
								src="${pageContext.request.contextPath}/upload\prdImg/${prdInfo.PRD_CODE}2.png"
								alt="thumbnail2"> <img
								src="${pageContext.request.contextPath}/upload\prdImg/${prdInfo.PRD_CODE}3.png"
								alt="thumbnail3"> <img
								src="${pageContext.request.contextPath}/upload\prdImg/${prdInfo.PRD_CODE}4.png"
								alt="thumbnail4">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<a
							href="/product/List/all/newest/all/1?brand=${prdInfo.PRD_BRAND}"
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
																	if (liNum > btnNum) {
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
								class="nav-link" onclick="getQnaList(1)" data-toggle="tab" href="#tabs-3" role="tab"
								aria-selected="false">상품문의&nbsp;<span>(3)</span></a></li>
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
											<c:forEach var="list" items="${detailReviewList}" varStatus="status">
												<a class="list-group-item list-group-item-action review_list">
													<div class="row">
														<div class="col">
															<div class="row TextCenter" data-toggle="collapse"
																data-target="#content${status.index}">
																<span class="col-md-2 span_star"> <c:if
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
																</span> <span class="col-md-10"> ${list.PRD_NAME} /
																	${list.PRD_COLOR } / ${list.ORDER_PRDSIZE } | &nbsp;${list.REV_TITLE} </span>
																<div class="review_content">${list.REV_CONTENT}</div>
																<div id="content${status.index}" class="collapse">
																	<div class="col-md-5 left margin"></div>
																	<div class="row">
																		<div class="col-md-12 review_content">
																			<img
																				src="${path}/resources/img/product/나이키디파이올데이.png"
																				alt="" class="review_img"> <img
																				src="${path}/resources/img/product/나이키디파이올데이.png"
																				alt="" class="review_img"> <img
																				src="${path}/resources/img/product/나이키디파이올데이.png"
																				alt="" class="review_img">
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
											<p>단순 상품비방, 상업적인 내용, 미풍양속 위반, 게시판의 성격에 맞지 않는 글은 통보 없이 삭제될
												수 있습니다.</p>
										</li>
									</ul>
									<div class="container" id="container-qna">
									<div id="modal">
										<div class="modal_content">
											<form id="formToInput" method="post">
												<input type="hidden" id="PRD_NUM" name="PRD_NUM" class="PRD_NUM" value="" />
												<p>
													<label> 패스워드 </label><br>
													<input type="text" id="QNA_LOCK" name="QNA_LOCK" />
												</p>
												<p>
													<label> 글 제목 </label><br>
													<input type="text" id="QNA_TITLE" name="QNA_TITLE" />
												</p>
												<p>
													<label> 글 내용 </label><br>
													<textarea rows="13" cols="90" id="QNA_CONTENT" name="QNA_CONTENT" ></textarea><br>
												</p>
													<button type="button" id="id-of-insert-qna" onclick="clkBtn(this.id)">확인</button>
													<button type="button" id="modal_close_btn">닫기</button>
											</form>
										</div>
									</div>
									<div class="row">
										<div class="btn-qna-block">
											<input type="button" id="modal_open_btn" class="btn-qna" value="문의쓰기" />
										</div><br>
										<script type="text/javascript">
										$('#replyDelete').on('click', function(){
											<%if(session.getAttribute("user") == null){%>
	 											var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
	 											if(result){
	 												location.href="/login.do";
	 												return false;
	 											}
	 											else {
	 												return false;
	 											}
 											<%}%>
										})
										$("#modal_close_btn").click(function(){
											$("#modal").attr("style", "display:none");
										})
										$("#modal_open_btn").click(function(){
											<%if(session.getAttribute("user") == null){%>
 											var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
 											if(result){
 												location.href="/login.do";
 												return false;
 											}
 											else {
 												return false;
 											}
 											<%}%>
											$("#modal").attr("style", "display:block");
										})
									
										</script>
										<br>
										<div class="row" id="qna-row">
										<div id="empty-qna-description"></div>
										<c:forEach var="qnaList" items="${qnaList }" varStatus="state">
											<div id="modal${state.index }">
												<div class="modal_content">
													<form id="formToInput${state.index }" method="post">
														<input type="hidden" id="QNA_NUM" name="QNA_NUM" value="${qnaList.QNA_NUM }" />
														<input type="hidden" id="PRD_NUM" name="PRD_NUM" value="${prdInfo.PRD_NUM}" />
														<p>
															<label> 패스워드 </label><br>
															<input type="password" id="QNA_LOCK" name="QNA_LOCK" value="${qnaList.QNA_LOCK }"/>
														</p>
														<p>
															<label> 글 제목 </label><br>
															<input type="text" id="QNA_TITLE" name="QNA_TITLE" value="${qnaList.QNA_TITLE }" />
														</p>
														<p>
															<label> 글 내용 </label><br>
															<textarea rows="13" cols="90" id="QNA_CONTENT" name="QNA_CONTENT">${qnaList.QNA_CONTENT }</textarea><br>
														</p>
														<button type="button" id="id-of-insert-qna" onclick="clkBtn${state.index }(this.id)">확인</button>
														<button type="button" id="modal_close_btn${state.index }">닫기</button>
													</form>
												</div>
											</div>
											<div id="qna-open-content${state.index }">
												<div class="modal_content">
													<input type="password" placeholder="비밀번호 입력" 
														id="qna-content-password${qnaList.QNA_NUM}">
													<input type="button" id="replyOpen" 
														class="qna-content-password-check${qnaList.QNA_NUM}" value="확인">
												</div>
											</div>
											<table id="qna-table${state.index }" onclick="qnaPwdCheck${state.index }()" class="qna-table-class" style="margin-bottom: 10px; border-bottom: 1px solid grey;">
												<c:choose>
													<c:when test="${!empty qnaList }">
														<tr>
															<td id="img-qna">
																<img alt="lock" style="width: 26px;" 
																	src="${path}/resources/img/product/details/lock.png">
															</td>
															<td style="width: 99px;">
																<fmt:formatDate value="${qnaList.QNA_REGDATE }" 
																	pattern="yyyy-MM-dd" /></td>
															<td style="width: 605px;">${qnaList.QNA_TITLE }</td>
															<td>${qnaList.QNA_CUSID }</td>
															<c:choose>
																<c:when test="${!empty qnaList.QNA_ANSWER }">
																	<td>답변완료</td>												
																</c:when>
																<c:when test="${empty qnaList.QNA_ANSWER }">
																	<td>답변대기</td>												
																</c:when>
															</c:choose>
																<td style="width: 49px;">
																	<form id="formToDelete${qnaList.QNA_NUM}" method="post">
																		<input type="hidden" id="QNA_NUM" name="QNA_NUM" 
																		value="${qnaList.QNA_NUM}" />
																		<input type="button" onclick="clkBtnList${qnaList.QNA_NUM}(this.id)" 
																		id="id-of-delete-qna${qnaList.QNA_NUM}" class="delete-qna" value="삭제">
																	</form>
																</td>
																<td style="width: 58px;">
																	<input type="button" id="modal_open_btn${qnaList.QNA_NUM}" class="btn-qna" value="수정" />
																</td>
															</tr>
															<tr>
																<td></td>
																<td></td>
																<td class="qna-content${qnaList.QNA_NUM}">
																	${qnaList.QNA_CONTENT }
																</td>
															</tr>
															<tr>
																<td></td>
																<td></td>
																<c:choose>
																	<c:when test="${!empty qnaList.QNA_ANSWER }">
																		<td class="qna-content${qnaList.QNA_NUM}">${qnaList.QNA_ANSWER }</td>												
																	</c:when>
																	<c:otherwise>
																		<td class="qna-content${qnaList.QNA_NUM}">ㄴ관리자가 답변을 준비중입니다. 다소 양해 부탁드립니다.</td>
																	</c:otherwise>
																</c:choose>
															</tr>
															<tr></tr>
													</c:when>
												</c:choose>
											</table>
											<br>
											<style>
												#modal${state.index } {
													display:none; position:absolute; width:100%; height:60%; z-index:999999;
													top: 50px;
												}
												
												#modal${state.index } .modal_content {
													width:900px; height:660px; margin:50px auto; padding:20px 10px; 
													background:#fff; border: 2px solid #666;
												}
												#qna-open-content${state.index } {
													display:none; position:absolute; width:100%; height:60%; z-index:999999;
													top: 50px;
												}
												
												#qna-open-content${state.index } .modal_content {
													width:900px; height:660px; margin:50px auto; padding:20px 10px; 
													background:#fff; border: 2px solid #666;
												}
												.qna-content${state.index }{
													display: none;
												}
											</style>
											
											<script type="text/javascript">												
											function qnaPwdCheck${state.index }(){
													<%if(session.getAttribute("user") == null){%>
		 											var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
		 											if(result){
		 												location.href="/login.do";
		 												return false;
		 											}
		 											else {
		 												return false;
		 											}
		 										<%}%>	
		 											$("#qna-open-content${state.index }").attr("style", "display:block");
												}
												
												$("#modal_open_btn${qnaList.QNA_NUM}").click(function(){
													<%if(session.getAttribute("user") == null){%>
		 											var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
		 											if(result){
		 												location.href="/login.do";
		 												return false;
		 											}
		 											else {
		 												return false;
		 											}
		 										<%}%>
													$("#modal${state.index }").attr("style", "display:block");
												})
												$("#modal_close_btn${qnaList.QNA_NUM}").click(function(){
													$("#modal${state.index }").attr("style", "display:none");
												})
												$('.qna-content-password-check${qnaList.QNA_NUM}').on('click', function(){
													var pwdCheck = $('#qna-content-password${qnaList.QNA_NUM}').val();
													if(pwdCheck === '${qnaList.QNA_LOCK}'){
														if($(this).attr('id') === 'replyWrite'){
															$('#qna-content').css('display','inline-block');																			
														}else if($(this).attr('id') === 'replyOpen'){
															$('#qna-open-content${state.index }').css('display','none');
															$('.qna-content${qnaList.QNA_NUM}').css('display','inline-block');
														}
													}else if(pwdCheck === ''){
														alert('패스워드를 입력해주세요.');
													}else {
														alert('패스워드가 틀렸습니다. 관리자에게 문의하세요.');
													}
												});
												function clkBtnList${qnaList.QNA_NUM}(clickedId){
													var CRUD = clickedId;
													var remove = '${state.index }';
													var pwdCheck = $('#qna-content-password${qnaList.QNA_NUM}').val();
													if(pwdCheck === '${qnaList.QNA_LOCK}'){
														var form = $('#formToDelete${qnaList.QNA_NUM}').serialize();
														CRUD = 'delete';
													}else if(pwdCheck === ''){
														alert('패스워드를 입력해주세요.');
														return false;
													}else {
														alert('패스워드가 틀렸습니다. 관리자에게 문의하세요.');
														return false;
													}
													qnaAjax(form, CRUD, remove);
												};
												function clkBtn${state.index }(clickedId){
													var CRUD = clickedId;
													var PRD_CODE = '${prdInfo.PRD_CODE}';
													if(CRUD === 'id-of-insert-qna'){
														var form = $('#formToInput${state.index }').serialize();
														CRUD = 'update';
														qnaAjax(form, CRUD, PRD_CODE);
													}
												}
											</script>
										</c:forEach>
										<script type="text/javascript">
										function clkBtn(clickedId){
											var CRUD = clickedId;
											var PRD_CODE = '${prdInfo.PRD_CODE}';
											if(CRUD === 'id-of-insert-qna'){
												var form = $('#formToInput').serialize();
												CRUD = 'insert';
												qnaAjax(form, CRUD, PRD_CODE);
											}
										}
										function qnaAjax(form, CRUD, code){
											var source = ajaxlist();
											console.log(source);
											$.ajax({
												url: '/formToInput/'+CRUD,
												type: "POST",
												data: form,
												beforeSend : function() {
													// 전송 전 실행 코드
													console.log("ajax 폼 전송");
												},
												success: function (data) {
													if(CRUD === 'insert'){
														location.href = "/product/prdCode="+code+"/${pageInfo.getPage()}";
														/*console.log(source);*/
														/*$('#container-qna').empty();*/
														/*$('#container-qna').html(source);*/
													}else if(CRUD === 'delete'){
														$('#qna-table'+code).remove();
													}else if(CRUD === 'update'){
														location.href = "/product/prdCode="+code;
													}
												},
												error: function (e) {
													// 전송 후 에러 발생 시 실행 코드
													console.log("ERROR : ", e);
												}
											});
										}
										</script>
										</div>
					<ul class="pagination">
						<c:choose>
							<c:when test="${pageInfo.getPage()<=1}">
								<li class="page-item disabled"><a class="page-link"
									aria-disabled="true">이전</a></li>
							</c:when>
							<c:when test="${pageInfo.getStartPage()==1}">
								<li class="page-item">
									<a class="page-link" 
									onclick="getQnaList(${pageInfo.getStartPage()})"
									 tabindex="-1">이전</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" 
									onclick="getQnaList(${pageInfo.getStartPage()-1})"
									 tabindex="-1">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${pageInfo.getStartPage()}"
							end="${pageInfo.getEndPage()}" varStatus="state">
							<c:choose>
								<c:when test="${pageInfo.getPage()==state.index}">
									<li class="page-item active" aria-current="page">
										<a class="page-link">${state.index}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link"
										onclick="getQnaList(${state.index})">
										${state.index}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.getPage() >= pageInfo.getMaxPage()}">
								<li class="page-item disabled">
									<a class="page-link" aria-disabled="true">다음</a></li>
							</c:when>
							<c:when test="${pageInfo.getEndPage()==pageInfo.getMaxPage()}">
								<li class="page-item">
									<a class="page-link"
									onclick="getQnaList(${pageInfo.getEndPage()})">
									다음</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link"
									onclick="getQnaList(${pageInfo.getEndPage()+1})">
									다음</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
									</div>
									
									
									</div>
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
	<jsp:include page="../footer.jsp" />
	<!-- Related Product Section End -->
	</c:if>
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

							// 썸네일 없으면 표시 안함
							$(".product__details__pic__thumb img").on('error',
									function(e) {
										$(this).hide();
									});

							//상단 리뷰 누르면 하단 리뷰로 이동
							$(".product__details__rating").on("click",
									function() {
										$("#reviewTab").trigger("click");
									});
						});

						
						function loginCheck(){
							var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
								if(result){
									location.href="/login.do";
									return false;
								}
								else {
									return false;
								}
						}
						function getQnaList(pageR){
							var prd_code = '${prdInfo.PRD_CODE}';
							var prd_num = '${prdInfo.PRD_NUM}';
							var arrays = new Array();
							
							var sendData = {
									"prdCode":prd_code, 
									"pageR":pageR
									};
							$.ajax({
								url : "/qnaListForm",
								type : "POST",
								data : sendData,
								success:function(data){
									//$('#container-qna').empty();
									arrays = data.qnaList;
									//$('#container-qna').html();
									//console.log(arrays[0]);
									
									$('.PRD_NUM').val(prd_num);
									if(arrays[0] === undefined){
										$('#empty-qna-description').html('작성된 문의가 없습니다.')										
									}else{
										$('#empty-qna-description').html('상품 Q&A')
									}
									
								}
							})
						}
			
						
						
	</script>
</body>
</html>