<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SINSA : 주문 내역 조회</title>
<jsp:include page="../header.jsp"></jsp:include>
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

.period_wrap {
	padding: 10px;
	background-color: #EDEFF2;
}

.period_wrap2 {
	padding-left: 10px;
	padding-right: 10px;
	height: 35px;
}

.periodBox {
	display: table;
	border: solid 1px #EDEFF2;
	cursor: pointer;
	text-align: center;
	height: 35px;
	background-color: #FFFFFF;
	border: solid 1px #EDEFF2;
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

.pagination {
	margin-top: 25px;
	margin-bottom: 25px;
	justify-content: center;
}

.span_margin {
	margin: 0;
}

.modal-header {
	padding-left: 200px;
}

.delivBtn {
	outline: none;
}

body {
	height: auto;
}

.nopadding {
	margin: 0px !important;
	padding: 0px !important;
}
</style>
</head>

<body>
	<div class="continer nopadding">
		<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
		<div class="container con_top_margin">
			<div class="row">
				<jsp:include page="myPageSideBar.jsp"></jsp:include>
				<div class="col-9 main_div">
					<div class="subjecet">
						<h3>주문 내역 조회</h3>
					</div>

					<hr>


					<div class="container period_wrap">
						<div class="row">
							<div class="col-3 state_C">${countState.payEnd }</div>
							<div class="col-3 state_C">${countState.delivery }</div>
							<div class="col-3 state_C">${countState.deliveryEnd }</div>
							<div class="col-3 state_C">${countState.cancel }</div>
						</div>

						<div class="row">
							<div class="col-3 state_box">결제 완료</div>
							<div class="col-3 state_box">배송중</div>
							<div class="col-3 state_box">배송 완료</div>
							<div class="col-3 state_box">취소/환불</div>
						</div>
						<hr>

						<div class="row period_wrap2">

							<div class="col-5">
								<div class="row">
									<div class="col-3 periodBox" id="oneWeek">
										<span class="tableCel">일주일</span>
									</div>
									<div class="col-3 periodBox" id="oneMonth">
										<span class="tableCel">1개월</span>
									</div>
									<div class="col-3 periodBox" id="threeMonth">
										<span class="tableCel">3개월</span>
									</div>
									<div class="col-3 periodBox" id="wholePeriod">
										<span class="tableCel">전체</span>
									</div>
								</div>
							</div>

							<div class="col-7 dateBox">
								<div class="row">
									<div class="col-10">
										<input type="date" id="date1" value="${date1 }"> ~ <input
											type="date" id="date2" value="${date2 }">
									</div>
									<div class="col-2 periodBox serchBtn">
										<span class="tableCel">조회</span>
									</div>
								</div>
							</div>



						</div>
					</div>



					<div class="container orderlist">
						<div class="row">
							<div class="col-12 padding0">
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
											<th>주문일자</th>
											<th>주문번호</th>
											<th>결제금액(수량)</th>
											<th>상태</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${fn:length(orderList) == 0}">

											<tr>
												<td colspan="6">
													<div class="container">
														<div class="row noOrder_row">
															<div class="col-12">
																<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
																	class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
																		d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																		d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
																<br>주문 내역이 없습니다.
															</div>
														</div>

													</div>
												</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${orderList}" varStatus="status">
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
													<td><fmt:formatDate var="date"
															value="${list.ORDER_REGDATE }" pattern="yyyy-MM-dd" />
														${date }</td>
													<td><span class="prd_order_num_span span_margin">
															<input type="hidden" value="${list.ORDER_NUM }"
															class="ORDER_NUM">${list.ORDER_NUM }</span></td>
													<td><fmt:formatNumber value="${list.ORDER_PRICE }"
															type="number" />원<br>(${list.ORDER_AMOUNT}개)</td>
													<td>${list.ORDER_STATE }<c:if
															test="${list.ORDER_STATE =='배송중' }">
															<br>
															<button type="button" class="delivBtn"
																data-toggle="modal" data-target="#exampleModalCenter">배송조회</button>

															<input type="hidden" value="${list.ORDER_DELIVCOMP }"
																class="delivcomp">
															<input type="hidden" value="${list.ORDER_DELIVNUM }"
																class="delivnum">
														</c:if> <c:if test="${list.ORDER_STATE =='결제완료' }">
															<input type="hidden" value="${list.ORDER_PRDCODE }"
																class="prdcode">
															<input type="hidden" value="${list.ORDER_NUM }"
																class="orderum">
															<input type="hidden" value="${list.ORDER_PRDSIZE }"
																class="prdsize">
															<button type="button" class="cancelBtn">주문취소</button>
															<br>
														</c:if> <c:if test="${list.ORDER_STATE =='배송완료' }">
															<br>
															<input type="hidden" value="${list.ORDER_PRDCODE }"
																class="prdcode">
															<input type="hidden" value="${list.ORDER_NUM }"
																class="orderum">
															<input type="hidden" value="${list.ORDER_PRDSIZE }"
																class="prdsize">
															<button type="button" class="refundBtn">환불신청</button>
														</c:if>
													</td>
												</tr>
											</c:forEach>




										</c:otherwise>
									</c:choose>
								</table>



							</div>
						</div>
					</div>
					<!-- paging  부분-->
					<c:if test="${fn:length(orderList) != 0}">

						<ul class="pagination">
							<c:choose>
								<c:when test="${date1 != null || date2!= null}">
									<c:choose>
										<c:when test="${pageInfo.getPage()<=1}">
											<li class="page-item disabled"><a class="page-link"
												aria-disabled="true">이전</a></li>
										</c:when>
										<c:when test="${pageInfo.getStartPage()==1}">
											<li class="page-item"><a class="page-link"
												href="${pageInfo.getStartPage()}?&fromDate=${date1}&toDate=${date2}"
												tabindex="-1">이전</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageInfo.getStartPage()-1}?&fromDate=${date1}&toDate=${date2}"
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
													href="${state.index}?&fromDate=${date1}&toDate=${date2}">${state.index}</a></li>
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
												href="${pageInfo.getEndPage()}?&fromDate=${date1}&toDate=${date2}">다음</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageInfo.getEndPage()+1}?&fromDate=${date1}&toDate=${date2}}">다음</a></li>
										</c:otherwise>
									</c:choose>
								</c:when>


								<c:otherwise>
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
								</c:otherwise>

							</c:choose>

						</ul>
					</c:if>
					<!-- paging 끝 -->

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
				location.href = '/refund?prdcode=' + prdcode + '&orderum='
						+ orderum + '&prdsize=' + prdsize;
			});

	$('.cancelBtn').on(
			"click",
			function() {
				var prdcode = $(this).parent().find('.prdcode').val();
				var orderum = $(this).parent().find('.orderum').val();
				var prdsize = $(this).parent().find('.prdsize').val();
				location.href = '/cancel?prdcode=' + prdcode + '&orderum='
						+ orderum + '&prdsize=' + prdsize;
			});

	$('#date1').on("change", function() {
		var date1 = $('#date1').val();
		var date2 = $('#date2').val();
		if (date2 == "") {
			document.getElementById('date2').value = date1;
		} else if (date1 > date2) {
			document.getElementById('date2').value = date1;
		}
	});
	$('#date2').on("change", function() {
		var date1 = $('#date1').val();
		var date2 = $('#date2').val();
		if (date1 == "") {
			document.getElementById('date1').value = date2;
		} else if (date1 > date2) {
			document.getElementById('date1').value = date2;
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

	$('.prd_order_num_span').on("mouseover", function() {
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

	$('.prd_order_num_span').on("click", function() {
		var ORDER_NUM = $(this).find('.ORDER_NUM').val();
		location.href = "/myOrderStatus/" + ORDER_NUM;
	});

	$('.underline').on("mouseover", function() {
		$(this).css("background-color", "#EDEFF2");
	});
	$('.underline').on("mouseout", function() {
		$(this).css("background-color", "white");
	});

	$('#wholePeriod').on("click", function() {
		document.getElementById('date2').value = "";
		document.getElementById('date1').value = "";
	});

	$('#oneWeek').on("click", function() {
		var today = new Date();
		var time = today.getTime();
		var diff = 24 * 60 * 60 * 1000 * 7;
		var date1 = new Date(time - diff);
		document.getElementById('date2').valueAsDate = today;
		document.getElementById('date1').valueAsDate = date1;
	});
	$('#oneMonth').on("click", function() {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() - 1;
		var date = today.getDate() + 1;
		var date1 = new Date(year, month, date);
		document.getElementById('date2').valueAsDate = today;
		document.getElementById('date1').valueAsDate = date1;
	});
	$('#threeMonth').on("click", function() {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() - 3;
		var date = today.getDate() + 1;
		var date1 = new Date(year, month, date);
		document.getElementById('date2').valueAsDate = today;
		document.getElementById('date1').valueAsDate = date1;
	});
	$('.serchBtn').on("click", function() {
		var date1 = $('#date1').val();
		var date2 = $('#date2').val();
		location.href = '1?fromDate=' + date1 + '&toDate=' + date2;
	});
</script>

</html>