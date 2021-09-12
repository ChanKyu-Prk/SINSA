<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.con_top_margin {
	margin-top: 40px;
}

.addmargin {
	margin-top: 40px;
}

.subjecet {
	text-align: center;
	font-size: 27pt;
}

#exclamation {
	width: 100px;
	height: 100px;
	fill: grey;
}

.no_jjim {
	text-align: center;
	padding: 120px;
	vertical-align: middle;
}

#modal {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 999999;
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#filter {
	border-top: 1px solid teal;
	border-bottom: 1px solid teal;
	padding-top: 18px;
	padding-bottom: 18px;
	margin-bottom: 70px;
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

.pagination {
	margin-top: 25px;
	margin-bottom: 25px;
	justify-content: center;
}

.nopadding {
	margin: 0px !important;
	padding: 0px !important;
}

a.page-link {
	color: black !important;
}

.page-item.active
.page-link {
	background-color: black !important;
	border-color: black !important;
	color: white !important;
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
.prodBox {
	height: 400px;
}

</style>

<title>SINSA 찜 목록</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="continer nopadding">
		<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
		<div class="container con_top_margin">
			<div class="row">
				<jsp:include page="myPageSideBar.jsp"></jsp:include>
				<div class="col-sm-12 col-md-9">
					<div class="subjecet">
						<h3>찜 목록</h3>
					</div>
					<hr>


					<c:choose>
						<c:when test="${fn:length(jjimList) == 0}">
							<div class="container">
								<div class="row">
									<div class="col-12 no_jjim">
										<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
											class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
												d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
										<br>찜한 내역이 없습니다.
									</div>
								</div>

							</div>


						</c:when>



						<c:otherwise>


							<div class="row">
								<c:forEach var="list" items="${jjimList }" varStatus="status">

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
												<li>
												<li onclick="event.cancelBubble= true;"><a
													class="buyNow"><i class="fa">바로구매</i></a></li>
												<li onclick="event.cancelBubble= true;"><a
													class="showpingCart"><i class="fa fa-shopping-cart"></i></a></li>

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
															<div class="col-sm-12 col-md-4 modalImgDiv">
																<img alt=""
																	src="${pageContext.request.contextPath}/resources/prdImg/${list.PRD_CODE }.png">

															</div>
															<div class="col-sm-12 col-md-8 modalInfoDiv">
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
															<div class="col-sm-12 col-md-4 modalImgDiv">
																<img alt=""
																	src="${pageContext.request.contextPath}/resources/prdImg/${list.PRD_CODE }.png">

															</div>
															<div class="col-sm-12 col-md-8 modalInfoDiv">
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


						</c:otherwise>
					</c:choose>


					<!-- paging  부분-->


					<c:if test="${fn:length(jjimList) != 0}">
						<ul class="pagination">
							<c:choose>
								<c:when test="${pageInfo.getPage()<=1}">
									<li class="page-item disabled"><a class="page-link"
										aria-disabled="true">이전</a></li>
								</c:when>
								<c:when test="${pageInfo.getStartPage()==1}">
									<li class="page-item"><a class="page-link"
										href="${pageInfo.getStartPage()}" tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageInfo.getStartPage()-1}" tabindex="-1">이전</a></li>
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
											href="${state.index}">${state.index}</a></li>
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
										href="${pageInfo.getEndPage()}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${pageInfo.getEndPage()+1}">다음</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</c:if>
					<!-- paging 끝 -->

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
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


$('.buyNow').on("click", function() {

	$(this).closest('.product__item__pic').next().click();
});
$('.showpingCart').on("click", function() {

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
