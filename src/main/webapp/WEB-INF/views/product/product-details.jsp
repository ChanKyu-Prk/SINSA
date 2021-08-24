<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${prdInfo.PRD_CODE}&nbsp;${prdInfo.PRD_CODE}&nbsp;-&nbsp;SINSA</title>

<style type="text/css">

.product__details__pic__thumb{
	justify-content: space-between;
}

.product__details__pic__thumb img:hover{
	border: 1px solid black;
}

.product__details__pic__thumb img{
	max-width: 19%;
	justify-content: space-between;
}

.product__details__text .brand_name {
	font-size: 15px;
	margin-bottom: 0px;
}

ul#quantity {
	padding-top: 0px;
}

div#sizeCon.product__details__size button {
	cursor: pointer;
	display: inline-block;
	font-size: 13px;
	line-height: 26px;
	width: 52px;
	text-align: center;
	border: 1px solid black;
	border-radius: 2px;
	margin: 0 3px 3px 0;
	background-color: white;
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

#cartBtn{
	background-color: #6f6f6f;
	color: white;
	margin-right: 0;
}

.borderNone {
	border: none;
	border-radius : 2px;
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

.product__details__price{
	font-family: adihaus;
}

.product__details__price .discntNum{
	text-decoration: line-through;
	color: #999;
	font-size: 18px;
}

.product__details__price .disRateNum{
	font-size:18px;
	font-weight: 400 !important;
}

#btnJjim{
	pointer:cursor;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="../header.jsp" />
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${path}/resources/prdImg/${prdInfo.PRD_IMAGE}" alt="">
						</div>
						<div class="product__details__pic__thumb row mx-auto px-0">
							<img src="${path}/resources/prdImg/${prdInfo.PRD_IMAGE}" alt="thumbnail1">
							<img src="${path}/resources/img/product/details/thumb-1.jpg" alt="thumbnail2">
							<img src="${path}/resources/img/product/details/thumb-2.jpg" alt="thumbnail3">
							<img src="${path}/resources/img/product/details/thumb-3.jpg" alt="thumbnail4">
							<img src="${path}/resources/img/product/details/thumb-4.jpg" alt="thumbnail5">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<p class="brand_name">
							${prdInfo.PRD_BRAND} <span><i class="fa fa-angle-right"></i></span>
						</p>
						<h3 class="mb-1">${prdInfo.PRD_NAME}<span class="ml-1 font-weight-normal prdCode">${prdInfo.PRD_CODE}</span></h3>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <span>(18개 상품평)</span>
						</div>
						<div class="product__details__code">
							<span>색상: <span>${prdInfo.PRD_COLOR}</span>
							</span>
						</div>
						
						<div class="product__details__price">
							<c:if test="${prdInfo.PRD_DISRATE == 0}">
								<c:set var="finalPrice" value="${prdInfo.PRD_PRICE}"/>
								<span class="digits">${finalPrice}원</span>
							</c:if>
							<c:if test="${prdInfo.PRD_DISRATE != 0}">
								<c:set var="finalPriceOrg" 
									value="${prdInfo.PRD_PRICE-(prdInfo.PRD_PRICE*(prdInfo.PRD_DISRATE/100))}"
		  						/>
		  						<c:set var="finalPrice" value="${fn:substringBefore(finalPriceOrg, '.')}" />
		  						<span class="digits discntNum">${prdInfo.PRD_PRICE}원</span>
							<span class="digits">${finalPrice}원</span>
							<span class="disRateNum">[${prdInfo.PRD_DISRATE}%]</span>
							</c:if>
						</div>
						<div id="priceContainer">
							<div id="sizeCon" class="product__details__size">
								<c:set var="items" value="${fn:split(stockInfo, ',')}" />
								<c:forEach var="item" items="${items}" begin="1">
									<c:set var="stockTrim" value="${fn:replace(item, ']', '')}" />
									<c:set var="stock" value="${fn:substringAfter(stockTrim, '=')}" />
									<c:set var="columnSp"
										value="${fn:substringBefore(stockTrim, '=')}" />
									<c:set var="column" value="${fn:replace(columnSp, ' ', '')}" />
									<c:set var="size" value="${fn:substringBefore(item, '=')}" />
									<c:set var="size" value="${fn:substringAfter(size, '_')}" />
									<c:if test="${stock ne 0}">
										<button type="button" class="product_size" value="${column}">${size}</button>
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
								<span class="totalPriceCon-num digits">0</span><span class="ml-2">원</span>
							</div>
						</div>
						<button type="button" id= "btnBuy" class="primary-btn col-lg-12 borderNone text-center">바로구매</button>
						<script type="text/javascript">
							$("#btnBuy").click(function(){
								<%if(session.getAttribute("user") == null){%>
									var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
									if(result){
										location.href="/login.do";
									}
									else {
										return false;
									}
								<%}%>
								var ORDER_PRDCODE = $(".prdCode").text();
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
									data["ORDER_PRDCODE"] = ORDER_PRDCODE;
									data["ORDER_PRDSIZE"] = ORDER_PRDSIZE[i];
									data["ORDER_AMOUNT"] = ORDER_AMOUNT[i];
									itemList.unshift(data);
								}
									  $.ajax({
									   url : "/direct/checkout",
									   type : "POST",
									   data : JSON.stringify(itemList),
									    headers: {
									      'Accept': 'application/json',
									      'Content-Type': 'application/json'
									    },
									   success : function(data){
											location.href="/direct/checkout";
									   },
									   error : function(){
									    alert("보내기 실패");
									   }
									  });
							});
						</script>
						<div id="jjimNCart" class="row col-lg-12 mx-auto px-0">
							<button id="cartBtn" class="primary-btn text-center col-lg-10 borderNone">장바구니</button>
							<script type="text/javascript">
							$("#cartBtn").click(function(){
								var ORDER_PRDCODE = $(".prdCode").text();
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
									data["ORDER_PRDCODE"] = ORDER_PRDCODE;
									data["ORDER_PRDSIZE"] = ORDER_PRDSIZE[i];
									data["ORDER_AMOUNT"] = ORDER_AMOUNT[i];
									itemList.unshift(data);
								}
									  $.ajax({
									   url : "/addCart",
									   type : "POST",
									   data : JSON.stringify(itemList),
									    headers: {
									      'Accept': 'application/json',
									      'Content-Type': 'application/json'
									    },
									   success : function(data){
									   },
									   error : function(){
									    alert("장바구니에 담기 실패");
									   }
									  });
							});
						</script>
							<button id="jjimBtn" class="heart-icon col-lg-2 text-center borderNone">
								<c:if test="${empty jjimInfo}">
									<i class="fa fa-heart-o"></i>
								</c:if>
								<c:if test="${not empty jjimInfo}">
									<i class="fa fa-heart"></i>
								</c:if>
							</button>
							<script type="text/javascript">
							$("#jjimBtn").click(function(){
								<%if(session.getAttribute("user") == null){%>
								var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
								if(result){
									location.href="/login.do";
								}
								else {
									return false;
								}
								<%}%>
							
								if($(this).find("i").hasClass("fa-heart-o")){
									$(this).find("i").removeClass("fa-heart-o");
									$(this).find("i").addClass("fa-heart");
								} else {
									$(this).find("i").removeClass("fa-heart");
									$(this).find("i").addClass("fa-heart-o");
								}
								var ORDER_PRDCODE = $(".prdCode").text();
								
								//JSON 형태로 데이터 생성
								var data = {};
									data["ORDER_PRDCODE"] = ORDER_PRDCODE;
									  $.ajax({
									   url : "/jjim",
									   type : "POST",
									   data : JSON.stringify(data),
									    headers: {
									      'Accept': 'application/json',
									      'Content-Type': 'application/json'
									    },
									   success : function(data){
										   //
									   },
									   error : function(){
									    alert("보내기 실패");
									   }
									  });
							});
							</script>
						</div>
						<ul>
							<li><b>재고</b> <span>In Stock</span></li>
							<li><b>배송</b> <span>무료 배송</span></li>
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
								aria-selected="false">상품평&nbsp; <span>(18)</span></a></li>
							<li class="nav-item" role="presentation"><a id="qnaTab"
								class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
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
									<p>리뷰</p>
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>관련 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							data-setbg="/resources/img/product/product-1.jpg">
							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp" />
	<!-- Related Product Section End -->
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
														.text(); //260
												
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
								$(".digits").each(function() {
									$(this).text( $(this).text().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
								});
							}
							
							function noDigits() {
								$(".digits").each(function() {
									$(this).text( $(this).text().replaceAll(',', ''));
								});
							}
							
							//deleteBtn to delete list
							$(".product_size").parents("#priceContainer").on(
									"click",
									".btn-delete",
									function() {
										noDigits();
										$(this).closest("li").remove();
										calc();
										numberWithDigits();
									});
							
							// large pic width = height
							var imgWidth = $('.product__details__pic__item--large').width(); 
							$(window).resize(function(){
							    $('.product__details__pic__item--large').height(imgWidth);
							});
							
							// thumb pic width = height
							var thumbImgWidth = $('.product__details__pic__thumb img').width(); 
							$(window).resize(function(){
							    $('.product__details__pic__thumb img').height(thumbImgWidth);
							});
							
							// change main img while hovering on thumbnails
							$(".product__details__pic__thumb img").hover(function(){
							   var src = $(this).attr("src");
							    $(".product__details__pic__item--large").attr("src",src);
							});
						});
	</script>
</body>
</html>