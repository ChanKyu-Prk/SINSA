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
}

.product__details__text #jjimNCart a:first-child {
	background-color: #6f6f6f;
	color: white;
	margin-right: 0;
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- IamPort -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
						<h3 class="mb-1">${prdInfo.PRD_NAME}<span class="ml-1 font-weight-normal">${prdInfo.PRD_CODE}</span></h3>
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
							</c:if>
							<c:if test="${prdInfo.PRD_DISRATE != 0}">
								<c:set var="finalPriceOrg" 
									value="${prdInfo.PRD_PRICE-(prdInfo.PRD_PRICE*(prdInfo.PRD_DISRATE/100))}"
		  						/>
		  						<c:set var="finalPrice" value="${fn:substringBefore(finalPriceOrg, '.')}" />
		  						<span class="digits discntNum">${prdInfo.PRD_PRICE}원</span>
							</c:if>
							<span class="digits">${finalPrice}원</span>
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
						<a href="#" id= "btnBuy" class="primary-btn col-lg-12 text-center">바로구매</a>
						<div id="jjimNCart" class="row col-lg-12 mx-auto px-0">
							<a href="#" id="btnJjim"
								class="primary-btn shopping-icon text-center col-lg-10">장바구니</a>
							<a href="#" class="heart-icon col-lg-2 text-center"><span
								class="icon_heart_alt"></span></a>
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
														+ "</span></div><div class='p-2'><div class='qty-countCon'><span class='qty-button qty-minus'>–</span><input type='number' class='amount' value='1' min='1' name='"
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
																	".amount[name="
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
														.attr('name')).text(
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
							
							// Iamport 결제
							$("#btnJjim").click(function () {

							var IMP = window.IMP; // 생략가능
					        IMP.init('imp39263192'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
					        var msg;
					        var finalPrice = $(".totalPriceCon-num").text().replace(',', ''); 
					        
					        IMP.request_pay({
					            pg : 'kakaopay',
					            pay_method : 'card',
					            merchant_uid : 'merchant_' + new Date().getTime(),
					            name : '[SINSA 상품 결제 ] ${prdInfo.PRD_NAME}',
					            amount : finalPrice,
					            buyer_email : '${user.CUS_EMAIL}',
					            buyer_name : '${user.CUS_NAME}',
					            buyer_tel : '${user.CUS_TEL}',
					            buyer_addr : '${user.CUS_DELIV_ADDR}',
					            buyer_postcode : '${prdInfo.PRD_BRAND}', // POSTCODE 받는 법
					            //m_redirect_url : 'http://www.naver.com'
					            /*
								모바일 결제시,
								결제가 끝나고 랜딩되는 URL을 지정
								(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
								*/
								
					        }, function(rsp) {
					            if ( rsp.success ) {
					                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					                jQuery.ajax({
					                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
					                    type: 'POST',
					                    dataType: 'json',
					                    data: {
					                        imp_uid : rsp.imp_uid
					                        //기타 필요한 데이터가 있으면 추가 전달
					                    }
					                }).done(function(data) {
					                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					                    if ( everythings_fine ) {
					                        msg = '결제가 완료되었습니다.';
					                        msg += '\n고유ID : ' + rsp.imp_uid;
					                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					                        msg += '\결제 금액 : ' + rsp.paid_amount;
					                        msg += '카드 승인번호 : ' + rsp.apply_num;
					                        
					                        alert(msg);
					                    } else {
					                        //[3] 아직 제대로 결제가 되지 않았습니다.
					                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					                    }
					                });
					                //성공시 이동할 페이지
<%-- 					                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
					            } else {
					                msg = '결제에 실패하였습니다.';
					                msg += '에러내용 : ' + rsp.error_msg;
					                //실패시 이동할 페이지
<%-- 					                location.href="<%=request.getContextPath()%>/order/payFail"; --%>
					                alert(msg);
					            }
					        });
							});
						});
	</script>
</body>

</html>