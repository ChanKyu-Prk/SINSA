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

.mainCon {
	margin-top: 40px;
	border: 3px solid #c1bfc1;
	display: table;
	border: 3px solid #c1bfc1;
}

.mainRow {
	margin-top: 25px;
	margin-bottom: 25px;
	display: table-cell;
	vertical-align: middle;
	font-size: 18px;
}

.pointCol {
	text-align: center;
	padding: 0px !important;
	border-right: 1px solid #c1bfc1;
}

.jjimCol {
	text-align: center;
	padding: 0px !important;
}

.cartCol {
	text-align: center;
	padding: 0px !important;
	border-right: 1px solid #c1bfc1;
}

.point_br {
	display: none;
}

#pointSpan {
	font-size: 25px;
	font-weight: bold;
}

#cartSpan {
	font-size: 25px;
	font-weight: bold;
}

#jjimSpan {
	font-size: 25px;
	font-weight: bold;
}

.recOrderCon {
	margin-top: 40px;
}

.OrderTitleRow {
	
}

.OrderTitle {
	font-size: 25px;
}

.seeMore {
	font-size: 12px;
	text-align: right;
	display: table;
}

.veticalBottom {
	display: table-cell;
	vertical-align: bottom;
}

.seeMoreSpan {
	cursor: pointer;
}

.OrderRow {
	text-align: center;
	position: relative;
}

.odrderNumberSpan {
	font-size: 30px;
	font-weight: bold;
}

.odrderNumberSpan2 {
	font-size: 20px;
	font-weight: bold;
}

.odrderNumberSpan3 {
	
}

.orderMoreThan1 {
	font-size: 40px;
	color: #c1bfc1;
	position: absolute;
	top: 10px;
	left: 30%;
}

.orderMoreThan2 {
	font-size: 40px;
	color: #c1bfc1;
	position: absolute;
	top: 10px;
	right:  30%;
}

.OrderRow2 {
	margin-top: 15px;
	padding: 20px;
	border-top: solid 1px #c1bfc1;
	text-align: center;
	border-bottom: solid 1px #c1bfc1;
	font-weight: bold;
}

.divTable {
	display: table;
}

.tableBottom {
	display: table-cell;
	vertical-align: middle;
}

.canceNumlCol {
	border-right: solid 1px #c1bfc1;
}

.cancelNum {
	font-size: 23px;
}

.jjimTitleRow {
	margin-top: 40px;
	font-size: 20px;
}

#exclamation {
	width: 100px;
	height: 100px;
	fill: grey;
}

.no_jjim {
	text-align: center;
	padding: 138px;
	vertical-align: middle;
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
	padding: 0 !important;
}

.fc {
	padding-right: 0;
	color: #808080;
}

.infos {
	padding-left: 15px;
}

.prodBox {
	height: 400px;
}

.recTitleCol {
	font-weight: bold;
	cursor: default;
}

.jjimTitleCol {
	cursor: pointer;
}

.jjimdiv {
	display: none;
}

.privateTitle {
	font-size: 25px;
}

.delivTitleRow {
	font-size: 25px;
}

.privateRow2 {
	font-size: 18px;
	margin-bottom: 40px;
	padding-bottom: 6px;
	border-bottom: solid 1px #c1bfc1;
}
.privateCol1{
padding-bottom: 6px;
border-right: solid 1px #c1bfc1;
}
.privateCol2{
padding-bottom: 6px;
}
@media screen and (max-width: 720px) {

	.point_br {
		display: block;
	}
	.blank_span {
		display: none;
	}
}
.naverMark{
border: solid 1px #36d169;
color: #36d169;
border-radius: 11px;
font-size: 12px;
padding-left: 3px;
margin-left: 10px;
padding-right: 3px;
}
</style>
<title>SINSA ?????? ??????</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>

	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-sm-12 col-md-9">
				<div class="subjecet">
					<span>?????? ??????</span>
				</div>
				<hr>

				<div class="container mainCon">

					<div class="row mainRow">

						<div class="col-4 pointCol">
							<i class="fas fa-parking"></i> ?????????<span class="blank_span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br
								class="point_br" /> <span id="pointSpan">${myInfo.CUS_POINT }</span>
							p
						</div>
						<div class="col-4 cartCol">
							<i class="fa fa-heart"></i> ???????????? <span class="blank_span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br
								class="point_br" /> <span id="jjimSpan">${countJjimList }</span>
							???
						</div>
						<div class="col-4 jjimCol">
							<i class="fa fa-shopping-bag"></i> ???????????? <span class="blank_span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br
								class="point_br" /> <span id="cartSpan">${countCartList }</span>
							???
						</div>


					</div>
				</div>


				<div class="container recOrderCon">

					<div class="row OrderTitleRow">
						<div class="col-10 OrderTitle">?????? ?????? ??????</div>
						<div class="col-2 seeMore">
							<div class="veticalBottom">
								<span class="seeMoreSpan"
									onclick="location.href='/myOrderList/1'">?????????</span>
							</div>
						</div>
					</div>
					<hr />

					<div class="row OrderRow">
						<div class="col-4">
							<div>
								<span class="odrderNumberSpan">${countRecOrderList.payEnd }</span>
							</div>
							<div>
								<span class="odrderNumberSpan2">????????????</span>
							</div>
						</div>
						<div class="col-4">
							<div>
								<span class="odrderNumberSpan">${countRecOrderList.delivery }</span>
							</div>
							<div>
								<span class="odrderNumberSpan2">?????????</span>
							</div>
						</div>
						<div class="col-4">
							<div>
								<span class="odrderNumberSpan">${countRecOrderList.deliveryEnd }</span>
							</div>
							<div>
								<span class="odrderNumberSpan2">????????????</span>
							</div>
						</div>
						<div class="orderMoreThan1">></div>
						<div class="orderMoreThan2">></div>
					</div>
					<div class="row OrderRow2">
						<div class="col-3 divTable">
							<span class="tableBottom">????????????</span>
						</div>
						<div class="col-3 canceNumlCol divTable">
							<span class="tableBottom"><b class="cancelNum">${countRecOrderList.cancel }</b>
								???</span>
						</div>
						<div class="col-3 divTable">
							<span class="tableBottom">????????????</span>
						</div>
						<div class="col-3">
							<b class="cancelNum">${countRecOrderList.refund } </b>???
						</div>
					</div>

				</div>

				<div class="container cartCon">


					<div class="row jjimTitleRow">
						<input type="hidden" value="1" class="recOrJjim">
						<div class="col-5 col-md-3 recTitleCol">?????? ???
							??????(${countRecViewList})</div>
						<div class="col-5 col-md-3 jjimTitleCol">????????????(${countJjimList })</div>

						<div class="col-2 col-md-6 seeMore">
							<div class="veticalBottom">
								<span class="seeMoreSpan seeMoreROJ">?????????</span>
							</div>
						</div>
					</div>

					<hr />

					<div class="recdiv">
						<c:choose>
							<c:when test="${fn:length(recentView) == 0}">

								<div class="row">
									<div class="col-12 no_jjim">
										<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
											class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
												d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
										<br>????????? ?????? ????????? ????????????.
									</div>
								</div>


							</c:when>
							<c:otherwise>
								<div class="row recRow">

									<c:forEach var="list" items="${recentView }" varStatus="status">
										<div class="col-lg-4 col-md-6 col-sm-6 prodBox">
											<div class="product__item">
												<div class="product__item__pic set-bg"
													data-setbg="${pageContext.request.contextPath}/resources/prdImg/${list.PRD_CODE }.png"
													onclick="location.href='/product/prdCode=${list.PRD_CODE}';">
													<ul class="product__item__pic__hover">
														<li onclick="event.cancelBubble= true;"><a
															class="jjimBtn"><input type="hidden"
																value="${list.PRD_NUM}" class="prdnumj"> <c:if
																	test="${recJjimcheck[status.index]==0}">
																	<i class="fa fa-heart-o"></i>
																</c:if> <c:if test="${recJjimcheck[status.index]==1}">
																	<i class="fa fa-heart"></i>
																</c:if> </a></li>
														<li>
														<li onclick="event.cancelBubble= true;"><a
															class="buyNow"><i class="fa">????????????</i></a></li>
														<li onclick="event.cancelBubble= true;"><a
															class="showpingCart"><i class="fa fa-shopping-cart"></i></a></li>

													</ul>


												</div>
												<button class="buyNowBtn" data-toggle="modal"
													data-target="#recbuyNowModal${status.index }"></button>
												<div class="modal" id="recbuyNowModal${status.index }"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalCenterTitle"
													aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLongTitle">????????????</h5>
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
																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">${list.PRD_COLOR }</div>
																		</div>
																		<div class="row pricerow">

																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">
																				<fmt:formatNumber value="${list.PRD_PRICE }"
																					type="number" />
																				???
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
																				disabled="disabled">????????? ??????</option>
																			<c:forEach begin="220" end="290" step="5"
																				varStatus="var">
																				<c:set value="${recStock[status.index]}"
																					var="stock1" />
																				<c:set value="STOCK_${var.index }" var="stock2" />
																				<c:set value="${ stock1[stock2]}" var="stock3" />
																				<c:if test="${ stock3 >0}">
																					<option value="${var.index }">${var.index }&nbsp;&nbsp;(
																						${stock3 }???)</option>
																					<c:set value="1" var="count" />
																				</c:if>
																			</c:forEach>
																			<c:if test="${ count == 0}">
																				<option value="" disabled="disabled">??????
																					???????????????.</option>
																			</c:if>
																		</select>
																	</div>
																	<div class="col-6">
																		<div class="subBtn">
																			<input type="hidden" value="${list.PRD_CODE}"
																				class="numCode"> <span
																				class="subBtnS goByebtn">?????? ??????</span>
																		</div>
																	</div>

																</div>
															</div>

														</div>
													</div>
												</div>


												<button class="cartModalBtn" data-toggle="modal"
													data-target="#reccartModal${status.index }"></button>

												<div class="modal" id="reccartModal${status.index }"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalCenterTitle"
													aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLongTitle">???????????????
																	??????</h5>
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
																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">${list.PRD_COLOR }</div>
																		</div>
																		<div class="row pricerow">

																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">
																				<fmt:formatNumber value="${list.PRD_PRICE }"
																					type="number" />
																				???
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
																				disabled="disabled">????????? ??????</option>
																			<c:forEach begin="220" end="290" step="5"
																				varStatus="var">
																				<c:set value="${recStock[status.index]}"
																					var="stock1" />
																				<c:set value="STOCK_${var.index }" var="stock2" />
																				<c:set value="${ stock1[stock2]}" var="stock3" />
																				<c:if test="${ stock3 >0}">
																					<option value="${var.index }">${var.index }&nbsp;&nbsp;(
																						${stock3 }???)</option>
																					<c:set value="1" var="count" />
																				</c:if>
																			</c:forEach>
																			<c:if test="${ count == 0}">
																				<option value="" disabled="disabled" class="soldout">??????
																					???????????????.</option>
																			</c:if>
																		</select>
																	</div>
																	<div class="col-6">
																		<div class="subBtn">
																			<input type="hidden" value="${list.PRD_NUM}"
																				class="numCode"> <span
																				class="subBtnS goCartBtn">??????</span>
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
														???
													</h5>
												</div>
											</div>
										</div>

									</c:forEach>

								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="jjimdiv">
						<c:choose>
							<c:when test="${fn:length(jjimList) == 0}">

								<div class="row">
									<div class="col-12 no_jjim">
										<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
											class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
												d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
										<br>?????? ????????? ????????????.
									</div>
								</div>


							</c:when>
							<c:otherwise>

								<div class="row jjimRow">

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
															class="buyNow"><i class="fa">????????????</i></a></li>
														<li onclick="event.cancelBubble= true;"><a
															class="showpingCart"><i class="fa fa-shopping-cart"></i></a></li>

													</ul>


												</div>
												<button class="buyNowBtn" data-toggle="modal"
													data-target="#buyNowModal${status.index }"></button>
												<div class="modal" id="buyNowModal${status.index }"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalCenterTitle"
													aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLongTitle">????????????</h5>
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
																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">${list.PRD_COLOR }</div>
																		</div>
																		<div class="row pricerow">

																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">
																				<fmt:formatNumber value="${list.PRD_PRICE }"
																					type="number" />
																				???
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
																				disabled="disabled">????????? ??????</option>
																			<c:forEach begin="220" end="290" step="5"
																				varStatus="var">
																				<c:set value="${jjimStock[status.index]}"
																					var="stock1" />
																				<c:set value="STOCK_${var.index }" var="stock2" />
																				<c:set value="${ stock1[stock2]}" var="stock3" />
																				<c:if test="${ stock3 >0}">
																					<option value="${var.index }">${var.index }&nbsp;&nbsp;(
																						${stock3 }???)</option>
																					<c:set value="1" var="count" />
																				</c:if>
																			</c:forEach>
																			<c:if test="${ count == 0}">
																				<option value="" disabled="disabled">??????
																					???????????????.</option>
																			</c:if>
																		</select>
																	</div>
																	<div class="col-6">
																		<div class="subBtn">
																			<input type="hidden" value="${list.PRD_CODE}"
																				class="numCode"> <span
																				class="subBtnS goByebtn">?????? ??????</span>
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
													aria-labelledby="exampleModalCenterTitle"
													aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLongTitle">???????????????
																	??????</h5>
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
																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">${list.PRD_COLOR }</div>
																		</div>
																		<div class="row pricerow">

																			<div class="col-3  infos fc">?????? :</div>
																			<div class="col-9 nopadding">
																				<fmt:formatNumber value="${list.PRD_PRICE }"
																					type="number" />
																				???
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
																				disabled="disabled">????????? ??????</option>
																			<c:forEach begin="220" end="290" step="5"
																				varStatus="var">
																				<c:set value="${jjimStock[status.index]}"
																					var="stock1" />
																				<c:set value="STOCK_${var.index }" var="stock2" />
																				<c:set value="${ stock1[stock2]}" var="stock3" />
																				<c:if test="${ stock3 >0}">
																					<option value="${var.index }">${var.index }&nbsp;&nbsp;(
																						${stock3 }???)</option>
																					<c:set value="1" var="count" />
																				</c:if>
																			</c:forEach>
																			<c:if test="${ count == 0}">
																				<option value="" disabled="disabled" class="soldout">??????
																					???????????????.</option>
																			</c:if>
																		</select>
																	</div>
																	<div class="col-6">
																		<div class="subBtn">
																			<input type="hidden" value="${list.PRD_NUM}"
																				class="numCode"> <span
																				class="subBtnS goCartBtn">??????</span>
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
														???
													</h5>
												</div>
											</div>
										</div>

									</c:forEach>

								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="container privateCon">
					<div class="row privateRow">

						<div class="col-10 privateTitle">?????? ?????? ??????</div>
						<div class="col-2 seeMore">
							<div class="veticalBottom">
								<span class="seeMoreSpan"
									onclick="location.href='/privateInfoChange'">????????????</span>
							</div>
						</div>
					</div>
					<hr />
					<div class="row privateRow2">
					<c:if test="${SNS !='O'}">
						<div class="col-3 privateCol1">?????????</div>
						<div class="col-9 privateCol2">${myInfo.CUS_ID }</div></c:if>
						<div class="col-3 privateCol1">??????</div>
						<div class="col-9 privateCol2">${myInfo.CUS_NAME }</div>
						<div class="col-3 privateCol1">????????????</div>
						<div class="col-9 privateCol2">${myInfo.CUS_TEL }</div>
						<div class="col-3 privateCol1">?????????</div>
						<div class="col-9 privateCol2">${myInfo.CUS_EMAIL }<c:if test="${naver}"><span class="naverMark">????????? ?????? ??????</span></c:if></div>

					</div>
				</div>






			</div>



		</div>

	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
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
					var con = confirm("???????????? ????????? ??????????????????.\n????????????????????????????");
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
				alert("????????? ??????");
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
							alert("???????????? ??????????????????.");
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
										var toCart = confirm("????????? ???????????? ???????????????.\n??????????????? ?????????????????????????");
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
					alert("???????????? ??????????????????.");
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
						alert("????????? ??????");
					}
				});
			})

	$('.jjimTitleCol').on("click", function() {
		$('.recdiv').css("display", "none");
		$('.jjimdiv').css("display", "block");
		$('.recTitleCol').css("font-weight", "normal");
		$('.jjimTitleCol').css("font-weight", "bold");
		$('.recTitleCol').css("cursor", "pointer");
		$('.jjimTitleCol').css("cursor", "default");
		$('.recOrJjim').val(2);
	});
	$('.recTitleCol').on("click", function() {
		$('.recdiv').css("display", "block");
		$('.jjimdiv').css("display", "none");
		$('.recTitleCol').css("font-weight", "bold");
		$('.jjimTitleCol').css("font-weight", "normal");
		$('.recTitleCol').css("cursor", "default");
		$('.jjimTitleCol').css("cursor", "pointer	");
		$('.recOrJjim').val(1);
	});
	$('.seeMoreROJ').on("click", function() {
		var recOrJjim = $('.recOrJjim').val();
		if (recOrJjim == 1) {
			location.href = "/recentView/1";
		} else {
			location.href = "/jjimList/1";

		}
	});
</script>
</ html>