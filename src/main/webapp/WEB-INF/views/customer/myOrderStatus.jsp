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
<title>SINSA ?????? ?????? ??????</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div class="continer nopadding">
		<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
		<div class="container con_top_margin">
			<div class="row">
				<jsp:include page="myPageSideBar.jsp"></jsp:include>
				<div class="col-sm-12 col-md-9">
					<div class="subjecet">
						<h3>?????? ?????? ??????</h3>
					</div>
					<hr>

					<div class="container period_wrap">
						<div class="row">
							<div class="col-sm-12 col-md-6 period_box">
								???????????? :
								<fmt:formatDate var="date" value="${orderList[0].ORDER_REGDATE}"
									pattern="yyyy-MM-dd" />
								${date }
							</div>
							<div class="col-sm-12 col-md-6 period_box">???????????? :
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

											<th colspan="2">????????????</th>
											<th>?????????</th>
											<th>??????</th>
											<th>????????????</th>
											<th>??????</th>
										</tr>
									</thead>

									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="state" value="${fn:split(list.ORDER_STATE,'/')}" />

										<tr class="underline">

											<td class="imgtd">

												<div class="td-row">
													<input type="hidden" value="${list.ORDER_PRDCODE }"
														class="prdcode"> <img class="thumbPic"
														alt="?????? ?????? ??????" title="?????? ?????? ??????"
														src="${pageContext.request.contextPath}/resources/prdImg/${list.ORDER_PRDCODE }.png " />

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
														<td class="prd_size_td">????????? : ${list.ORDER_PRDSIZE }
															mm</td>
													</tr>
												</table>
											</td>
											<td><fmt:formatNumber value="${list.ORDER_PRICE*0.03 }"
													type="number" />???</td>
											<td>${list.ORDER_AMOUNT}???</td>
											<td><fmt:formatNumber value="${list.ORDER_PRICE }"
													type="number" />???</td>
											<td class="stateTd${status.index}"><span><c:choose>
														<c:when test="${state[0] =='??????????????????' }">
											????????????
											</c:when>
														<c:when test="${state[0] =='??????????????????' }">
											????????????
											</c:when>
														<c:otherwise>
											${state[0]}
											</c:otherwise>
													</c:choose> <c:if test="${list.ORDER_STATE =='?????????' }">
														<br>
														<button type="button" class="delivBtn btn"
															data-toggle="modal" data-target="#exampleModalCenter">????????????</button>
														<button type="button" class="btn" data-toggle="modal"
															data-target="#refundmodal${status.index }">????????????</button>
														<div class="modal" id="refundmodal${status.index }"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalCenterTitle"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLongTitle">??????
																			??????</h5>
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="container-fluid">
																		<div class="row">
																			<div class="col-12">
																				<select class="cancel_select ">
																					<option value="" selected disabled>?????? ??????</option>
																					<option value="????????????">?????? ??????</option>
																					<option value="?????????">?????????</option>
																					<option value="????????????">????????????</option>
																					<option value="????????????*">?????? ?????? (??????! ???????????????
																						3,000??? ?????? ??????)</option>
																					<option value="??????*">?????? ??? ????????? ?????? (??????! ???????????????
																						3,000??? ?????? ??????)</option>
																					<option value="????????????*">?????? ?????? ?????? ?????? (??????!
																						??????????????? 3,000??? ?????? ??????)</option>
																					<option value="??????*">?????? (??????! ??????????????? 3,000???
																						?????? ??????)</option>
																				</select>
																			</div>
																			<div class="guidediv">??? ?????? ?????? ???????????? ????????? ????????? ??????
																				3~5??? ????????? ??? ????????????.</div>
																			<div class="allCanceldiv col-12">
																				<input type="hidden"
																					value="${orderList[0].ORDER_NUM }"
																					class="allordernum"> <input type="hidden"
																					value="${list.ORDER_PRDCODE }" class="prdcode">
																				<input type="hidden" value="${list.ORDER_NUM }"
																					class="orderum"> <input type="hidden"
																					value="${list.ORDER_PRDSIZE }" class="prdsize"><input
																					type="button" class="refundBtn btn" value="??????" />
																			</div>
																		</div>
																	</div>

																</div>
															</div>
														</div>
														<button class="btn" data-toggle="modal"
															data-target="#decideModal${status.index }">????????????</button>

														<div class="modal decideModal"
															id="decideModal${status.index }" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalCenterTitle"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered"
																role="document">
																<div class="modal-content">

																	<div class="container-fluid">
																		<div class="row decideModalRow">
																			<div class="col-12">
																				<span class="decideModelSINSA">SINSA</span><br>
																				<br> <span class="decideModelSINSA2">"??????
																					??????"??? ????????? ??????/????????? ????????? ????????????.<br> ??????????????? ???????????????????
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
																					data-dismiss="modal">??????</button>
																				<input type="hidden" value="${status.index }"
																					class="index">
																				<button type="button" class="decideBtn">??????</button>
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

													</c:if> <c:if test="${list.ORDER_STATE =='????????????' }">

														<button type="button" class="btn" data-toggle="modal"
															data-target="#cancelmodal${status.index }">????????????</button>
														<div class="modal" id="cancelmodal${status.index }"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalCenterTitle"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLongTitle">??????
																			??????</h5>
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="container-fluid">
																		<div class="row">
																			<div class="col-12">
																				<select class="cancel_select ">
																					<option value="" selected disabled>?????? ??????</option>
																					<option value="????????????">????????????</option>
																					<option value="????????????">????????????</option>
																					<option value="????????????">?????? ?????? ?????? ??????</option>
																				</select>

																			</div>
																			<div class="guidediv">??? ?????? ?????? ???????????? ????????? ????????? ??????
																				3~5??? ????????? ??? ????????????.</div>
																			<div class="allCanceldiv col-12">
																				<input type="hidden"
																					value="${orderList[0].ORDER_NUM }"
																					class="allordernum"> <input type="hidden"
																					value="${list.ORDER_PRDCODE }" class="prdcode">
																				<input type="hidden" value="${list.ORDER_NUM }"
																					class="orderum"> <input type="hidden"
																					value="${list.ORDER_PRDSIZE }" class="prdsize">
																				<input type="button" class="cancelBtn btn"
																					value="??????" />
																			</div>
																		</div>
																	</div>

																</div>
															</div>
														</div>
														<br>
													</c:if></span></td>
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
											<th colspan="2">????????????</th>
											<th>?????????<br>??????<br>????????????
											</th>
											<th>??????</th>
										</tr>
									</thead>

									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="state" value="${fn:split(list.ORDER_STATE,'/')}" />

										<tr class="underline">

											<td class="imgtd">

												<div class="td-row">
													<input type="hidden" value="${list.ORDER_PRDCODE }"
														class="prdcode"> <img class="thumbPic"
														alt="?????? ?????? ??????" title="?????? ?????? ??????"
														src="${pageContext.request.contextPath}/resources/prdImg/${list.ORDER_PRDCODE }.png" />

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
														<td class="prd_size_td">????????? : ${list.ORDER_PRDSIZE }
															mm</td>
													</tr>
												</table>
											</td>

											<td><table>
													<tr>
														<td><fmt:formatNumber
																value="${list.ORDER_PRICE*0.03 }" type="number" />???</td>
													</tr>
													<tr>
														<td>${list.ORDER_AMOUNT}???</td>
													</tr>
													<tr>
														<td><fmt:formatNumber value="${list.ORDER_PRICE }"
																type="number" />???</td>
													</tr>
												</table></td>




											<td class="stateTd${status.index}"><span><c:choose>
														<c:when test="${state[0] =='??????????????????' }">
											????????????
											</c:when>
														<c:when test="${state[0] =='??????????????????' }">
											????????????
											</c:when>
														<c:otherwise>
											${state[0]}
											</c:otherwise>
													</c:choose> <c:if test="${list.ORDER_STATE =='?????????' }">
														<br>
														<button type="button" class="delivBtn btn"
															data-toggle="modal" data-target="#exampleModalCenter">????????????</button>
														<button type="button" class="btn" data-toggle="modal"
															data-target="#refundmodal2${status.index }b">????????????</button>
														<div class="modal" id="refundmodal2${status.index }b"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalCenterTitle"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLongTitle">??????
																			??????</h5>
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="container-fluid">
																		<div class="row">
																			<div class="col-12">
																				<select class="cancel_select ">
																					<option value="" selected disabled>?????? ??????</option>
																					<option value="????????????">?????? ??????</option>
																					<option value="?????????">?????????</option>
																					<option value="????????????">????????????</option>
																					<option value="????????????*">?????? ?????? (??????! ???????????????
																						3,000??? ?????? ??????)</option>
																					<option value="??????*">?????? ??? ????????? ?????? (??????! ???????????????
																						3,000??? ?????? ??????)</option>
																					<option value="????????????*">?????? ?????? ?????? ?????? (??????!
																						??????????????? 3,000??? ?????? ??????)</option>
																					<option value="??????*">?????? (??????! ??????????????? 3,000???
																						?????? ??????)</option>
																				</select>
																			</div>
																			<div class="guidediv">??? ?????? ?????? ???????????? ????????? ????????? ??????
																				3~5??? ????????? ??? ????????????.</div>
																			<div class="allCanceldiv col-12">
																				<input type="hidden"
																					value="${orderList[0].ORDER_NUM }"
																					class="allordernum"> <input type="hidden"
																					value="${list.ORDER_PRDCODE }" class="prdcode">
																				<input type="hidden" value="${list.ORDER_NUM }"
																					class="orderum"> <input type="hidden"
																					value="${list.ORDER_PRDSIZE }" class="prdsize"><input
																					type="button" class="refundBtn btn" value="??????" />
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
															data-target="#decideModal2${status.index }b">????????????</button>

														<div class="modal decideModal"
															id="decideModal2${status.index }b" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalCenterTitle"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered"
																role="document">
																<div class="modal-content">

																	<div class="container-fluid">
																		<div class="row decideModalRow">
																			<div class="col-12">
																				<span class="decideModelSINSA">SINSA</span><br>
																				<br> <span class="decideModelSINSA2">"??????
																					??????"??? ????????? ??????/????????? ????????? ????????????.<br> ??????????????? ???????????????????
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
																					data-dismiss="modal">??????</button>
																				<input type="hidden" value="${status.index }"
																					class="index">
																				<button type="button" class="decideBtn">??????</button>
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

													</c:if> <c:if test="${list.ORDER_STATE =='????????????' }">

														<button type="button" class="btn" data-toggle="modal"
															data-target="#cancelmodal2${status.index }b">????????????</button>
														<div class="modal" id="cancelmodal2${status.index }b"
															tabindex="-1" role="dialog"
															aria-labelledby="exampleModalCenterTitle"
															aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered"
																role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLongTitle">??????
																			??????</h5>
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span aria-hidden="true">&times;</span>
																		</button>
																	</div>
																	<div class="container-fluid">
																		<div class="row">
																			<div class="col-12">
																				<select class="cancel_select ">
																					<option value="" selected disabled>?????? ??????</option>
																					<option value="????????????">????????????</option>
																					<option value="????????????">????????????</option>
																					<option value="????????????">?????? ?????? ?????? ??????</option>
																				</select>

																			</div>
																			<div class="guidediv">??? ?????? ?????? ???????????? ????????? ????????? ??????
																				3~5??? ????????? ??? ????????????.</div>
																			<div class="allCanceldiv col-12">
																				<input type="hidden"
																					value="${orderList[0].ORDER_NUM }"
																					class="allordernum"> <input type="hidden"
																					value="${list.ORDER_PRDCODE }" class="prdcode">
																				<input type="hidden" value="${list.ORDER_NUM }"
																					class="orderum"> <input type="hidden"
																					value="${list.ORDER_PRDSIZE }" class="prdsize">
																				<input type="button" class="cancelBtn btn"
																					value="??????" />
																			</div>
																		</div>
																	</div>

																</div>
															</div>
														</div>
														<br>
													</c:if></span></td>
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
										<c:if test="${stateTest2[0] =='????????????'}">
											<c:set var="stateTest1" value="${stateTest1 + 1 }" />
										</c:if>
									</c:forEach>
									<c:if test="${stateTest1 == fn:length(orderList)}">
										<button type="button" class="btn" data-toggle="modal"
											data-target="#allcancelmodal">?????? ??????</button>
									</c:if>
									<c:set var="stateTest3" value="0" />
									<c:forEach var="list" items="${orderList}" varStatus="status">
										<c:set var="stateTest4"
											value="${fn:split(list.ORDER_STATE,'/')}" />
										<c:if test="${stateTest4[0] =='?????????'}">
											<c:set var="stateTest3" value="${stateTest3 + 1 }" />
										</c:if>
									</c:forEach>
									<c:if test="${stateTest3 == fn:length(orderList)}">
										<button type="button" class="btn" data-toggle="modal"
											data-target="#allrefundmodal">?????? ??????</button>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>

					<div class="container info-wrap">
						<div class="row">



							<div class="col-sm-12 col-md-7">
								<h4>????????? ??????</h4>
								<hr class="blackUnderLine">
								<table>
									<colgroup>
										<col style="width: 30%">
										<col style="width: 70%">
									</colgroup>
									<tr>
										<td class="info_td">?????????</td>
										<td class="info_td">${orderList[0].ORDER_RECEIVER}</td>
									</tr>
									<tr>
										<td class="info_td">?????????</td>
										<td class="info_td">${orderList[0].ORDER_TEL }</td>
									</tr>
									<tr>
										<td class="info_td">?????????</td>
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
										<td class="info_td">?????? ??????</td>
										<td class="info_td">${orderList[0].ORDER_MEMO  }</td>
									</tr>
								</table>
								<hr>
							</div>



							<div class="col-sm-12 col-md-5">
								<h4>?????? ??????</h4>
								<hr class="blackUnderLine">
								<table>
									<colgroup>
										<col style="width: 40%">
										<col style="width: 60%">
									</colgroup>
									<tr>
										<td class="info_td">?????? ??????</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="prdTotal"
													value="${prdTotal + list.PRD_PRICE*list.ORDER_AMOUNT }" />
											</c:forEach> <fmt:formatNumber value="${prdTotal }" type="number" /> ???</td>
									</tr>
									<tr>
										<td class="info_td">?????? ??????</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="prdDiscount"
													value="${prdDiscount + list.PRD_DISRATE*list.ORDER_AMOUNT }" />
											</c:forEach> <fmt:formatNumber value="${prdDiscount }" type="number" />
											???</td>
									</tr>
									<tr>
										<td class="info_td">????????? ??????</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="usePoint"
													value="${usePoint + list.ORDER_USEPOINT }" />
											</c:forEach> <fmt:formatNumber value="${usePoint }" type="number" /> ???</td>
									</tr>
									<tr>
										<td class="info_td">?????????</td>
										<td class="info_td">0 ???</td>
									</tr>
									<tr>
										<td class="info_td">?????? ?????? ??????</td>
										<td class="info_td"><c:forEach var="list"
												items="${orderList }">
												<c:set var="orderTotal"
													value="${orderTotal + list.ORDER_PRICE }" />
											</c:forEach> <fmt:formatNumber value="${orderTotal -usePoint}"
												type="number" />???</td>
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
					<h5 class="modal-title" id="exampleModalLongTitle">?????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div id="testtest">
						<table class="table">
							<tr>
								<td>?????? ?????? :</td>
								<td class="td_deliv_num"></td>
								<td class="td_deliv_comp"></td>
							</tr>
						</table>
					</div>

					<div class="col-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>??????</th>
									<th>?????? ??????</th>
									<th>?????? ??????</th>
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
					<h5 class="modal-title" id="exampleModalLongTitle">?????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div id="testtest">
						<table class="table">
							<tr>
								<td>?????? ?????? :</td>
								<td class="td_deliv_num"></td>
								<td class="td_deliv_comp"></td>
							</tr>
						</table>
					</div>

					<div class="col-12">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>??????</th>
									<th>?????? ??????</th>
									<th>?????? ??????</th>
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
					<h5 class="modal-title" id="exampleModalLongTitle">?????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<select class="cancel_select ">
								<option value="" selected disabled>?????? ??????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">?????? ?????? ?????? ??????</option>
							</select>

						</div>
						<div class="guidediv">??? ?????? ?????? ???????????? ????????? ????????? ?????? 3~5??? ????????? ???
							????????????.</div>
						<div class="allCanceldiv col-12">
							<input type="hidden" value="${orderList[0].ORDER_NUM }"
								class="allordernum"><input type="button"
								class="allCancel btn" value="??????" />
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
					<h5 class="modal-title" id="exampleModalLongTitle">?????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<select class="cancel_select ">
								<option value="" selected disabled>?????? ??????</option>
								<option value="????????????">?????? ??????</option>
								<option value="?????????">?????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????*">?????? ?????? (??????! ??????????????? 3,000??? ?????? ??????)</option>
								<option value="??????*">?????? ??? ????????? ?????? (??????! ??????????????? 3,000??? ??????
									??????)</option>
								<option value="????????????*">?????? ?????? ?????? ?????? (??????! ??????????????? 3,000??? ??????
									??????)</option>
								<option value="??????*">?????? (??????! ??????????????? 3,000??? ?????? ??????)</option>
							</select>

						</div>
						<div class="guidediv">??? ?????? ?????? ???????????? ????????? ????????? ?????? 3~5??? ????????? ???
							????????????.</div>
						<div class="allCanceldiv col-12">
							<input type="hidden" value="${orderList[0].ORDER_NUM }"
								class="allordernum"><input type="button"
								class="allRefund btn" value="??????" />
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
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.chunilps';
						} else if (DELIVCOMP == 'CJ????????????') {
							DEILVCODE = 'kr.cjlogistics';
						} else if (DELIVCOMP == 'GS Postbox ??????') {
							DEILVCODE = 'kr.cvsnet';
						} else if (DELIVCOMP == 'CWAY (Woori Express)') {
							DEILVCODE = 'kr.cway';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.daesin';
						} else if (DELIVCOMP == '????????? ??????') {
							DEILVCODE = 'kr.epost';
						} else if (DELIVCOMP == '??????????????????') {
							DEILVCODE = 'kr.hanips';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.hanjin';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.hdexp';
						} else if (DELIVCOMP == '??????') {
							DEILVCODE = 'kr.homepick';
						} else if (DELIVCOMP == '??????????????????') {
							DEILVCODE = 'kr.honamlogis';
						} else if (DELIVCOMP == '???????????????') {
							DEILVCODE = 'kr.ilyanglogis';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.kdexp';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.kunyoung';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.logen';
						} else if (DELIVCOMP == '????????????') {
							DEILVCODE = 'kr.lotte';
						} else if (DELIVCOMP == 'SLX') {
							DEILVCODE = 'kr.slx';
						} else if (DELIVCOMP == '?????????????????????') {
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
														alert("????????? ??????2");
													}
												})
									},
									error : function() {
										alert("????????? ??????1");
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
					alert("?????? ????????? ????????? ?????????");
				} else {
					alert("?????? ?????? ???????????????.");
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
					alert("?????? ????????? ????????? ?????????");
				} else {
					alert("?????? ?????? ???????????????.");
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
		var brand = $(this).text();
		location.href = "/product/List/"+brand+"/newest/all/1";
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
					alert("?????? ????????? ????????? ?????????");
				} else {
					alert("?????? ?????? ???????????????.");
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
					alert("?????? ????????? ????????? ?????????");
				} else {
					alert("?????? ?????? ???????????????.");
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
				var index = $(this).parent().find('.index').val();
				var state = $('.stateTd'+index);
				
				$.ajax({
					url : '/decide?prdcode=' + prdcode + '&orderum=' + orderum
							+ '&prdsize=' + prdsize,
					type : "GET",
					success : function() {
						alert("???????????? ???????????????.");
						$('.decideCancle').click();
						state.children().remove();
						state.append('????????????');
					},
					error : function() {
						alert("????????? ??????");
					}
				});

			});
</script>
</html>