<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../header.jsp"></jsp:include>

<style type="text/css">
.table2 {
	display: none;
}

@media screen and (max-width: 720px) {
	.table1 {
		display: none;
	}
	.table2 {
		display: table;
	}
}

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

.period_wrap {
	padding: 10px;
	background-color: #EDEFF2;
}

.period_box {
	text-align: left;
}

#exclamation {
	width: 100px;
	height: 100px;
	fill: grey;
}

.noOrder_row {
	min-height: 200px;
	vertical-align: middle;
	padding-top: 50px;
}

.tableCel {
	display: table-cell;
	vertical-align: middle;
}

#date1 {
	height: 35px;
	border: solid 1px #EDEFF2;
}

#date2 {
	height: 35px;
	border: solid 1px #EDEFF2;
}

.state_C {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.state_box {
	text-align: center;
}

.dateBox {
	text-align: center;
}

.serchBtn {
	
}

.thumbPic {
	height: 100%;
}

.orderlist {
	margin-top: 40px;
}

table {
	width: 100%;
}

th {
	text-align: center !important;
	border-bottom: solid 1px black;
}

.imgtd {
	padding: 15px;
}

.underline {
	border-bottom: solid 1px #c1bfc1;
}

.td-row {
	height: 100px;
}

.prd_brand_td {
	font-size: 12px;
	color: grey;
}

.prd_name_td {
	font-size: 18px;
	font-weight: bold;
}

.prd_size_td {
	font-size: 12px;
	color: grey;
}

tr {
	
}

.padding0 {
	padding: 0 !important;
}

td {
	text-align: center !important;
}

.span_margin {
	margin: 0;
}

.info-wrap {
	margin-top: 50px;
	margin-bottom: 50px;
}

.blackUnderLine {
	background-color: black;
}

.info_td {
	text-align: left !important;
	margin-top: 5px;
	vertical-align: top;
}

.nopadding {
	margin: 0px !important;
	padding: 0px !important;
}

.cancel_select {
	margin-top: 15px;
	margin-bottom: 15px;
	width: 100%;
}

.guidediv {
	color: red;
	font-size: 10pt;
	margin: auto;
}

option {
	width: 468px;
}

.allCanceldiv {
	text-align: right;
	margin-top: 15px;
	margin-bottom: 15px;
}

.allCancel {
	
}

.allbutton_row {
	margin-top: 15px;
	text-align: right;
	right: 8px;
}

.btn {
	background-color: white;
	border: 1px solid #c1bfc1;
	padding: 5px;
	margin-bottom: 2px;
}

.decideModelSINSA {
	font-size: 20px;
	font-weight: bold;
}

.decideModelSINSA2 {
	font-weight: bold;
}

.decideModalRow {
	padding: 20px;
}

.decideCancle {
	background-color: white;
	border: 1px solid #c1bfc1;
	margin-bottom: 2px;
	width: 45%;
	padding-bottom: 5px;
	padding-top: 5px;
}

.decideBtn {
	background-color: white;
	border: 1px solid #c1bfc1;
	margin-bottom: 2px;
	width: 45%;
	padding-bottom: 5px;
	padding-top: 5px;
}
</style>
<title>SINSA : 주문 내역 조회</title>
</head>
<body>
	<div class="continer nopadding">
		<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
		<div class="container con_top_margin">
			<div class="row">
				<jsp:include page="myPageSideBar.jsp"></jsp:include>
				<div class="col-sm-12 col-md-9">
					<div class="subjecet">
						<h3>주문 상세 내역</h3>
					</div>
					<hr>

					<div class="container period_wrap">
						<div class="row">
							<div class="col-sm-12 col-md-6 period_box">
								주문일자 :
								<fmt:formatDate var="date" value="${orderList[0].ORDER_REGDATE}"
									pattern="yyyy-MM-dd" />
								${date }
							</div>
							<div class="col-sm-12 col-md-6 period_box">주문번호 :
								${orderList[0].ORDER_NUM }</div>
						</div>

					</div>



					<div class="container orderlist">

						<div class="row">
							<div class="col-12 padding0 table1">
								<table>
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 25%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 15%;">

									</colgroup>
									<thead>
										<tr>

											<th colspan="2">상품정보</th>
											<th>적립금</th>
											<th>수량</th>
											<th>결제금액</th>
											<th>상태</th>
										</tr>
									</thead>

									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="state" value="${fn:split(list.ORDER_STATE,'/')}" />

										<tr class="underline">

											<td class="imgtd">

												<div class="td-row">
													<input type="hidden" value="${list.ORDER_PRDCODE }"
														class="prdcode"> <img class="thumbPic"
														alt="상품 대표 사진" title="상품 대표 사진"
														src="/resources/prdImg/shoe.jpg" />

												</div>
											</td>

											<td>
												<table>
													<tr>
														<td class="prd_brand_td"><span
															class="prd_brand_span span_margin">${list.PRD_BRAND }</span></td>
													</tr>
													<tr>
														<td class="prd_name_td"><span
															class="prd_name_span span_margin"><input
																type="hidden" value="${list.ORDER_PRDCODE }"
																class="prdcode">${list.ORDER_PRDNAME }</span></td>
													</tr>
													<tr>
														<td class="prd_size_td">사이즈 : ${list.ORDER_PRDSIZE }
															mm</td>
													</tr>
												</table>
											</td>
											<td><fmt:formatNumber value="${list.ORDER_PRICE*0.03 }"
													type="number" />원</td>
											<td>${list.ORDER_AMOUNT}개</td>
											<td><fmt:formatNumber value="${list.ORDER_PRICE }"
													type="number" />원</td>
											<td><c:choose>
													<c:when test="${state[0] =='일괄취소요청' }">
											취소요청
											</c:when>
													<c:when test="${state[0] =='일괄반품요청' }">
											반품요청
											</c:when>
													<c:otherwise>
											${state[0]}
											</c:otherwise>
												</c:choose> <c:if test="${list.ORDER_STATE =='배송중' }">
													<br>
													<button type="button" class="delivBtn btn"
														data-toggle="modal" data-target="#exampleModalCenter">배송조회</button>
													<button type="button" class="btn" data-toggle="modal"
														data-target="#refundmodal">반품신청</button>
													<div class="modal" id="refundmodal" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">반품
																		신청</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-12">
																			<select class="cancel_select ">
																				<option value="" selected disabled>반품 사유</option>
																				<option value="상품불량">상품 불량</option>
																				<option value="오배송">오배송</option>
																				<option value="배송누락">배송누락</option>
																				<option value="고객변심*">고객 변심 (주의! 반품택배비
																					3,000원 고객 부담)</option>
																				<option value="변경*">색상 및 사이즈 변경 (주의! 반품택배비
																					3,000원 고객 부담)</option>
																				<option value="잘못주문*">다른 상품 잘못 주문 (주의!
																					반품택배비 3,000원 고객 부담)</option>
																				<option value="기타*">기타 (주의! 반품택배비 3,000원 고객
																					부담)</option>
																			</select>
																		</div>
																		<div class="guidediv">※ 카드 취소 승인까지 카드사 영업일 기준
																			3~5일 소요될 수 있습니다.</div>
																		<div class="allCanceldiv col-12">
																			<input type="hidden"
																				value="${orderList[0].ORDER_NUM }"
																				class="allordernum"> <input type="hidden"
																				value="${list.ORDER_PRDCODE }" class="prdcode">
																			<input type="hidden" value="${list.ORDER_NUM }"
																				class="orderum"> <input type="hidden"
																				value="${list.ORDER_PRDSIZE }" class="prdsize"><input
																				type="button" class="refundBtn btn" value="확인" />
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<button class="btn" data-toggle="modal"
														data-target="#decideModal">구매확정</button>

													<div class="modal decideModal" id="decideModal"
														tabindex="-1" role="dialog"
														aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">

																<div class="container-fluid">
																	<div class="row decideModalRow">
																		<div class="col-12">
																			<span class="decideModelSINSA">SINSA</span><br>
																			<br> <span class="decideModelSINSA2">"구매
																				확정"을 하시면 교환/반품을 하실수 없습니다.<br> 구매확정을 하시겠습니까?
																			</span>
																		</div>
																	</div>
																	<div class="row decideModalRow">

																		<div class="col-12">
																			<input type="hidden" value="${list.ORDER_PRDCODE }"
																				class="prdcode"> <input type="hidden"
																				value="${list.ORDER_NUM }" class="orderum">
																			<input type="hidden" value="${list.ORDER_PRDSIZE }"
																				class="prdsize">
																			<button type="button" class="decideCancle"
																				data-dismiss="modal">취소</button>
																			<button type="button" class="decideBtn">확인</button>
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<input type="hidden" value="${list.ORDER_DELIVCOMP }"
														class="delivcomp">
													<input type="hidden" value="${list.ORDER_DELIVNUM }"
														class="delivnum">

												</c:if> <c:if test="${list.ORDER_STATE =='결제완료' }">

													<button type="button" class="btn" data-toggle="modal"
														data-target="#cancelmodal">주문취소</button>
													<div class="modal" id="cancelmodal" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">주문
																		취소</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-12">
																			<select class="cancel_select ">
																				<option value="" selected disabled>취소 사유</option>
																				<option value="배송지연">배송지연</option>
																				<option value="고객변심">고객변심</option>
																				<option value="잘못주문">다른 상품 잘못 주문</option>
																			</select>

																		</div>
																		<div class="guidediv">※ 카드 취소 승인까지 카드사 영업일 기준
																			3~5일 소요될 수 있습니다.</div>
																		<div class="allCanceldiv col-12">
																			<input type="hidden"
																				value="${orderList[0].ORDER_NUM }"
																				class="allordernum"> <input type="hidden"
																				value="${list.ORDER_PRDCODE }" class="prdcode">
																			<input type="hidden" value="${list.ORDER_NUM }"
																				class="orderum"> <input type="hidden"
																				value="${list.ORDER_PRDSIZE }" class="prdsize">
																			<input type="button" class="cancelBtn btn" value="확인" />
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<br>
												</c:if></td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="col-12 padding0 table2">
								<table>
									<colgroup>
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">

									</colgroup>
									<thead>
										<tr>
											<th colspan="2">상품정보</th>
											<th>적립금<br>수량<br>결제금액
											</th>
											<th>상태</th>
										</tr>
									</thead>

									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="state" value="${fn:split(list.ORDER_STATE,'/')}" />

										<tr class="underline">

											<td class="imgtd">

												<div class="td-row">
													<input type="hidden" value="${list.ORDER_PRDCODE }"
														class="prdcode"> <img class="thumbPic"
														alt="상품 대표 사진" title="상품 대표 사진"
														src="/resources/prdImg/shoe.jpg" />

												</div>
											</td>

											<td>
												<table>
													<tr>
														<td class="prd_brand_td"><span
															class="prd_brand_span span_margin">${list.PRD_BRAND }</span></td>
													</tr>
													<tr>
														<td class="prd_name_td"><span
															class="prd_name_span span_margin"><input
																type="hidden" value="${list.ORDER_PRDCODE }"
																class="prdcode">${list.ORDER_PRDNAME }</span></td>
													</tr>
													<tr>
														<td class="prd_size_td">사이즈 : ${list.ORDER_PRDSIZE }
															mm</td>
													</tr>
												</table>
											</td>

											<td><table>
													<tr>
														<td><fmt:formatNumber
																value="${list.ORDER_PRICE*0.03 }" type="number" />원</td>
													</tr>
													<tr>
														<td>${list.ORDER_AMOUNT}개</td>
													</tr>
													<tr>
														<td><fmt:formatNumber value="${list.ORDER_PRICE }"
																type="number" />원</td>
													</tr>
												</table></td>




											<td><c:choose>
													<c:when test="${state[0] =='일괄취소요청' }">
											취소요청
											</c:when>
													<c:when test="${state[0] =='일괄반품요청' }">
											반품요청
											</c:when>
													<c:otherwise>
											${state[0]}
											</c:otherwise>
												</c:choose> <c:if test="${list.ORDER_STATE =='배송중' }">
													<br>
													<button type="button" class="delivBtn btn"
														data-toggle="modal" data-target="#exampleModalCenter">배송조회</button>
													<button type="button" class="btn" data-toggle="modal"
														data-target="#refundmodal2">반품신청</button>
													<div class="modal" id="refundmodal2" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">반품
																		신청</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-12">
																			<select class="cancel_select ">
																				<option value="" selected disabled>반품 사유</option>
																				<option value="상품불량">상품 불량</option>
																				<option value="오배송">오배송</option>
																				<option value="배송누락">배송누락</option>
																				<option value="고객변심*">고객 변심 (주의! 반품택배비
																					3,000원 고객 부담)</option>
																				<option value="변경*">색상 및 사이즈 변경 (주의! 반품택배비
																					3,000원 고객 부담)</option>
																				<option value="잘못주문*">다른 상품 잘못 주문 (주의!
																					반품택배비 3,000원 고객 부담)</option>
																				<option value="기타*">기타 (주의! 반품택배비 3,000원 고객
																					부담)</option>
																			</select>
																		</div>
																		<div class="guidediv">※ 카드 취소 승인까지 카드사 영업일 기준
																			3~5일 소요될 수 있습니다.</div>
																		<div class="allCanceldiv col-12">
																			<input type="hidden"
																				value="${orderList[0].ORDER_NUM }"
																				class="allordernum"> <input type="hidden"
																				value="${list.ORDER_PRDCODE }" class="prdcode">
																			<input type="hidden" value="${list.ORDER_NUM }"
																				class="orderum"> <input type="hidden"
																				value="${list.ORDER_PRDSIZE }" class="prdsize"><input
																				type="button" class="refundBtn btn" value="확인" />
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<input type="hidden" value="${list.ORDER_PRDCODE }"
														class="prdcode">
													<input type="hidden" value="${list.ORDER_NUM }"
														class="orderum">
													<input type="hidden" value="${list.ORDER_PRDSIZE }"
														class="prdsize">
													<button class="btn" data-toggle="modal"
														data-target="#decideModal2">구매확정</button>

													<div class="modal decideModal" id="decideModal2"
														tabindex="-1" role="dialog"
														aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">

																<div class="container-fluid">
																	<div class="row decideModalRow">
																		<div class="col-12">
																			<span class="decideModelSINSA">SINSA</span><br>
																			<br> <span class="decideModelSINSA2">"구매
																				확정"을 하시면 교환/반품을 하실수 없습니다.<br> 구매확정을 하시겠습니까?
																			</span>
																		</div>
																	</div>
																	<div class="row decideModalRow">

																		<div class="col-12">
																			<input type="hidden" value="${list.ORDER_PRDCODE }"
																				class="prdcode"> <input type="hidden"
																				value="${list.ORDER_NUM }" class="orderum">
																			<input type="hidden" value="${list.ORDER_PRDSIZE }"
																				class="prdsize">
																			<button type="button" class="decideCancle"
																				data-dismiss="modal">취소</button>
																			<button type="button" class="decideBtn">확인</button>
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<input type="hidden" value="${list.ORDER_DELIVCOMP }"
														class="delivcomp">
													<input type="hidden" value="${list.ORDER_DELIVNUM }"
														class="delivnum">

												</c:if> <c:if test="${list.ORDER_STATE =='결제완료' }">

													<button type="button" class="btn" data-toggle="modal"
														data-target="#cancelmodal2">주문취소</button>
													<div class="modal" id="cancelmodal2" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalCenterTitle"
														aria-hidden="true">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">주문
																		취소</h5>
																	<button type="button" class="close"
																		data-dismiss="modal">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="container-fluid">
																	<div class="row">
																		<div class="col-12">
																			<select class="cancel_select ">
																				<option value="" selected disabled>취소 사유</option>
																				<option value="배송지연">배송지연</option>
																				<option value="고객변심">고객변심</option>
																				<option value="잘못주문">다른 상품 잘못 주문</option>
																			</select>

																		</div>
																		<div class="guidediv">※ 카드 취소 승인까지 카드사 영업일 기준
																			3~5일 소요될 수 있습니다.</div>
																		<div class="allCanceldiv col-12">
																			<input type="hidden"
																				value="${orderList[0].ORDER_NUM }"
																				class="allordernum"> <input type="hidden"
																				value="${list.ORDER_PRDCODE }" class="prdcode">
																			<input type="hidden" value="${list.ORDER_NUM }"
																				class="orderum"> <input type="hidden"
																				value="${list.ORDER_PRDSIZE }" class="prdsize">
																			<input type="button" class="cancelBtn btn" value="확인" />
																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
													<br>
												</c:if></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>






					<div class="container cancel-wrap">
						<div class="row">
							<div class="col-12 allbutton_row">

								<c:if test="${fn:length(orderList)>1}">

									<c:set var="stateTest1" value="0" />
									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="stateTest2"
											value="${fn:split(list.ORDER_STATE,'/')}" />
										<c:if test="${stateTest2[0] =='결제완료'}">
											<c:set var="stateTest1" value="${stateTest1 + 1 }" />
										</c:if>
									</c:forEach>
									<c:if test="${stateTest1 == fn:length(orderList)}">
										<button type="button" class="btn" data-toggle="modal"
											data-target="#allcancelmodal">전체 취소</button>
									</c:if>
									<c:set var="stateTest3" value="0" />
									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="stateTest4"
											value="${fn:split(list.ORDER_STATE,'/')}" />
										<c:if test="${stateTest4[0] =='배송중'}">
											<c:set var="stateTest3" value="${stateTest3 + 1 }" />
										</c:if>
									</c:forEach>
									<c:if test="${stateTest3 == fn:length(orderList)}">
										<button type="button" class="btn" data-toggle="modal"
											data-target="#allrefundmodal">전체 반품</button>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>

					<div class="container info-wrap">
						<div class="row">



							<div class="col-sm-12 col-md-7">
								<h4>배송지 정보</h4>
								<hr class="blackUnderLine">
								<table>
									<colgroup>
										<col style="width: 30%">
										<col style="width: 70%">
									</colgroup>
									<tr>
										<td class="info_td">수령인</td>
										<td class="info_td">${orderList[0].ORDER_RECEIVER}</td>
									</tr>
									<tr>
										<td class="info_td">연락처</td>
										<td class="info_td">${orderList[0].ORDER_TEL }</td>
									</tr>
									<tr>
										<td class="info_td">배송지</td>
										<c:set var="addr"
											value="${fn:split(orderList[0].ORDER_ADDR,'|')}" />
										<td class="info_td">
											<%-- 									${orderList[0].ORDER_ADDR } --%> <c:forEach
												var="ad" items="${addr }">
										 ${ad }
										 </c:forEach>
										</td>
									</tr>
									<tr>
										<td class="info_td">배송 메모</td>
										<td class="info_td">${orderList[0].ORDER_MEMO  }</td>
									</tr>
								</table>
								<hr>
							</div>



							<div class="col-sm-12 col-md-5">
								<h4>결제 정보</h4>
								<hr class="blackUnderLine">
								<table>
									<colgroup>
										<col style="width: 40%">
										<col style="width: 60%">
									</colgroup>
									<tr>
										<td class="info_td">상품 합계</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="prdTotal"
													value="${prdTotal + list.PRD_PRICE*list.ORDER_AMOUNT }" />
											</c:forEach> <fmt:formatNumber value="${prdTotal }" type="number" /> 원</td>
									</tr>
									<tr>
										<td class="info_td">할인 합계</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="prdDiscount"
													value="${prdDiscount + list.PRD_DISRATE*list.ORDER_AMOUNT }" />
											</c:forEach> <fmt:formatNumber value="${prdDiscount }" type="number" />
											원</td>
									</tr>
									<tr>
										<td class="info_td">포인트 사용</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="usePoint"
													value="${usePoint + list.ORDER_USEPOINT }" />
											</c:forEach> <fmt:formatNumber value="${usePoint }" type="number" /> 원</td>
									</tr>
									<tr>
										<td class="info_td">배송비</td>
										<td class="info_td">0 원</td>
									</tr>
									<tr>
										<td class="info_td">최종 결제 금액</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="orderTotal"
													value="${orderTotal + list.ORDER_PRICE }" />
											</c:forEach> <fmt:formatNumber value="${orderTotal -usePoint}"
												type="number" />원</td>
									</tr>
								</table>
								<hr>
							</div>

						</div>
					</div>






				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal" id="exampleModalCenter" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">배송 조회</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div id="testtest">
						<table class="table">
							<tr>
								<td>송장 번호 :</td>
								<td class="td_deliv_num"></td>
								<td class="td_deliv_comp"></td>
							</tr>
						</table>
					</div>

					<div class="col-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>시간</th>
									<th>현재 위치</th>
									<th>배송 상태</th>
								</tr>
							</thead>
							<tbody id="tbodyA">

							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal" id="exampleModalCenter" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">배송 조회</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div id="testtest">
						<table class="table">
							<tr>
								<td>송장 번호 :</td>
								<td class="td_deliv_num"></td>
								<td class="td_deliv_comp"></td>
							</tr>
						</table>
					</div>

					<div class="col-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>시간</th>
									<th>현재 위치</th>
									<th>배송 상태</th>
								</tr>
							</thead>
							<tbody id="tbodyA">

							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- allCancelModal -->
	<div class="modal" id="allcancelmodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">주문 취소</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<select class="cancel_select ">
								<option value="" selected disabled>취소 사유</option>
								<option value="배송지연">배송지연</option>
								<option value="고객변심">고객변심</option>
								<option value="잘못주문">다른 상품 잘못 주문</option>
							</select>

						</div>
						<div class="guidediv">※ 카드 취소 승인까지 카드사 영업일 기준 3~5일 소요될 수
							있습니다.</div>
						<div class="allCanceldiv col-12">
							<input type="hidden" value="${orderList[0].ORDER_NUM }"
								class="allordernum"><input type="button"
								class="allCancel btn" value="확인" />
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- allRefundModal -->
	<div class="modal" id="allrefundmodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">반품 신청</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<select class="cancel_select ">
								<option value="" selected disabled>반품 사유</option>
								<option value="상품불량">상품 불량</option>
								<option value="오배송">오배송</option>
								<option value="배송누락">배송누락</option>
								<option value="고객변심*">고객 변심 (주의! 반품택배비 3,000원 고객 부담)</option>
								<option value="변경*">색상 및 사이즈 변경 (주의! 반품택배비 3,000원 고객
									부담)</option>
								<option value="잘못주문*">다른 상품 잘못 주문 (주의! 반품택배비 3,000원 고객
									부담)</option>
								<option value="기타*">기타 (주의! 반품택배비 3,000원 고객 부담)</option>
							</select>

						</div>
						<div class="guidediv">※ 카드 취소 승인까지 카드사 영업일 기준 3~5일 소요될 수
							있습니다.</div>
						<div class="allCanceldiv col-12">
							<input type="hidden" value="${orderList[0].ORDER_NUM }"
								class="allordernum"><input type="button"
								class="allRefund btn" value="확인" />
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
	delv = [];
	$('.delivBtn')
			.on(
					"click",
					function() {
						var DELIVCOMP = $(this).parent().find('.delivcomp')
								.val();
						var DELIVNUM = $(this).parent().find('.delivnum').val();
						var DEILVCODE = "";

						if (DELIVCOMP == 'DHL') {
							DEILVCODE = 'de.dhl';
						} else if (DELIVCOMP == 'Sagawa') {
							DEILVCODE = 'jp.sagawa';
						} else if (DELIVCOMP == 'Kuroneko Yamato') {
							DEILVCODE = 'jp.yamato';
						} else if (DELIVCOMP == 'Japan Post') {
							DEILVCODE = 'jp.yuubin';
						} else if (DELIVCOMP == '천일택배') {
							DEILVCODE = 'kr.chunilps';
						} else if (DELIVCOMP == 'CJ대한통운') {
							DEILVCODE = 'kr.cjlogistics';
						} else if (DELIVCOMP == 'GS Postbox 택배') {
							DEILVCODE = 'kr.cvsnet';
						} else if (DELIVCOMP == 'CWAY (Woori Express)') {
							DEILVCODE = 'kr.cway';
						} else if (DELIVCOMP == '대신택배') {
							DEILVCODE = 'kr.daesin';
						} else if (DELIVCOMP == '우체국 택배') {
							DEILVCODE = 'kr.epost';
						} else if (DELIVCOMP == '한의사랑택배') {
							DEILVCODE = 'kr.hanips';
						} else if (DELIVCOMP == '한진택배') {
							DEILVCODE = 'kr.hanjin';
						} else if (DELIVCOMP == '합동택배') {
							DEILVCODE = 'kr.hdexp';
						} else if (DELIVCOMP == '홈픽') {
							DEILVCODE = 'kr.homepick';
						} else if (DELIVCOMP == '한서호남택배') {
							DEILVCODE = 'kr.honamlogis';
						} else if (DELIVCOMP == '일양로지스') {
							DEILVCODE = 'kr.ilyanglogis';
						} else if (DELIVCOMP == '경동택배') {
							DEILVCODE = 'kr.kdexp';
						} else if (DELIVCOMP == '건영택배') {
							DEILVCODE = 'kr.kunyoung';
						} else if (DELIVCOMP == '로젠택배') {
							DEILVCODE = 'kr.logen';
						} else if (DELIVCOMP == '롯데택배') {
							DEILVCODE = 'kr.lotte';
						} else if (DELIVCOMP == 'SLX') {
							DEILVCODE = 'kr.slx';
						} else if (DELIVCOMP == '성원글로벌카고') {
							DEILVCODE = 'kr.swgexp';
						} else if (DELIVCOMP == 'TNT') {
							DEILVCODE = 'nl.tnt';
						} else if (DELIVCOMP == 'EMS') {
							DEILVCODE = 'un.upu.ems';
						} else if (DELIVCOMP == 'Fedex') {
							DEILVCODE = 'us.fedex';
						} else if (DELIVCOMP == 'UPS') {
							DEILVCODE = 'us.ups';
						} else if (DELIVCOMP == 'USPS') {
							DEILVCODE = 'us.usps';
						}

						var src = "https://apis.tracker.delivery/carriers/"
								+ DEILVCODE + "/tracks/" + DELIVNUM;

						$
								.ajax({
									type : "GET",
									url : src,
									dataType : "json",
									success : function(data) {
										console.log(data);
										$
												.ajax({
													type : "POST",
													url : "/delev",
													data : JSON.stringify(data),
													headers : {
														'Accept' : 'application/json',
														'Content-Type' : 'application/json'
													},
													success : function(
															progresses) {
														$('.td_deliv_num')
																.html(DELIVNUM);
														$('.td_deliv_comp')
																.html(
																		'('
																				+ DELIVCOMP
																				+ ')');

														$("#tbodyA").children()
																.remove();
														var str = '<TR>';
														$
																.each(
																		progresses,
																		function(
																				i) {

																			var time = new Date(
																					progresses[i].time)
																					.toLocaleString(
																							'ko-KR',
																							{
																								timeZone : 'Asia/Seoul'
																							});
																			str += '<TD>'
																					+ time
																					+ '</TD><TD>'
																					+ progresses[i].location.name
																					+ '</TD><TD>'
																					+ progresses[i].status.text
																					+ '</TD>';
																			str += '</TR>';
																		});
														$("#tbodyA")
																.append(str);

													},
													error : function() {
														alert("보내기 실패2");
													}
												})
									},
									error : function() {
										alert("보내기 실패1");
									}
								});
					})

	$('.refundBtn').on(
			"click",
			function() {
				var prdcode = $(this).parent().find('.prdcode').val();
				var orderum = $(this).parent().find('.orderum').val();
				var prdsize = $(this).parent().find('.prdsize').val();
				var reason = $(this).parent().parent().children().find(
						'.cancel_select').val();
				if (reason == null) {
					alert("반품 사유를 선택해 주세요");
				} else {
					alert("반품 처리 되었습니다.");
					location.href = '/refund?prdcode=' + prdcode + '&orderum='
							+ orderum + '&prdsize=' + prdsize + "&reason="
							+ reason;
				}
			});

	$('.cancelBtn').on(
			"click",
			function() {
				var prdcode = $(this).parent().find('.prdcode').val();
				var orderum = $(this).parent().find('.orderum').val();
				var prdsize = $(this).parent().find('.prdsize').val();
				var reason = $(this).parent().parent().children().find(
						'.cancel_select').val();
				if (reason == null) {
					alert("취소 사유를 선택해 주세요");
				} else {
					alert("취소 처리 되었습니다.");
					location.href = '/cancel?prdcode=' + prdcode + '&orderum='
							+ orderum + '&prdsize=' + prdsize + "&reason="
							+ reason;
				}
			});

	$('.thumbPic').on("mouseover", function() {
		$(this).css("cursor", "pointer");
	});

	$('.prd_brand_span').on("mouseover", function() {
		$(this).css("cursor", "pointer");
	});

	$('.prd_name_span').on("mouseover", function() {
		$(this).css("cursor", "pointer");
	});

	$('.thumbPic').on("click", function() {
		var PRD_CODE = $(this).parent().find('.prdcode').val();
		location.href = "/product/prdCode=" + PRD_CODE;
	});

	$('.prd_brand_span').on("click", function() {
		location.href = "#";
	});

	$('.prd_name_span').on("click", function() {
		var PRD_CODE = $(this).find('.prdcode').val();
		location.href = "/product/prdCode=" + PRD_CODE;
	});

	$('.allCancel').on(
			"click",
			function() {
				var reason = $(this).parent().parent().children().find(
						'.cancel_select').val();
				var ordernum = $(this).parent().find('.allordernum').val();
				if (reason == null) {
					alert("취소 사유를 선택해 주세요");
				} else {
					alert("취소 처리 되었습니다.");
					location.href = "/allCancel?orderum=" + ordernum
							+ "&reason=" + reason;
				}
			});
	$('.allRefund').on(
			"click",
			function() {
				var reason = $(this).parent().parent().children().find(
						'.cancel_select').val();
				var ordernum = $(this).parent().find('.allordernum').val();
				if (reason == null) {
					alert("반품 사유를 선택해 주세요");
				} else {
					alert("반품 처리 되었습니다.");
					location.href = "/allRefund?orderum=" + ordernum
							+ "&reason=" + reason;
				}
			});
	$('.decideBtn').on(
			"click",
			function() {
				var prdcode = $(this).parent().find('.prdcode').val();
				var orderum = $(this).parent().find('.orderum').val();
				var prdsize = $(this).parent().find('.prdsize').val();
				alert("구매확정 되었습니다.");
				location.href = '/decide?prdcode=' + prdcode + '&orderum='
						+ orderum + '&prdsize=' + prdsize + "&returnPage=1";
			});
</script>
</html>