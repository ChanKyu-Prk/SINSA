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

.period_wrap {
	padding: 10px;
	padding-top: 30px;
	padding-bottom: 30px;
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
	min-height: 250px;
	vertical-align: middle;
	padding-top: 75px;
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
	background-color: #EDEFF2;
}

table {
	width: 100%;
}

th {
	text-align: center !important;
	border-bottom: solid 1px black;
	background-color: #EDEFF2;
}

tr.underline {
	background-color: white;
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

.write_btn {
	background-color: #0b89fd;
	color: white;
	padding: 6px;
	cursor: pointer;
}

.reviews_w {
	border-radius: 10px 10px 0px 0px;
	background-color: #EDEFF2;
	text-align: center;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

.reviews_s {
	background-color: #EDEFF2;
	border-radius: 10px 10px 0px 0px;
}

.reviews_s_row {
	background-color: white;
	border-radius: 10px 10px 0px 10px;
	text-align: center;
	border: solid 1px #EDEFF2;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
	cursor: pointer;
}

.select_row {
	background-color: white;
	margin-bottom: 20px;
}

.nopadding {
	margin: 0px !important;
	padding: 0px !important;
}
</style>
<title>SINSA : 나의 상품 후기</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="continer nopadding">
		<jsp:include page="../recentlyViewBar.jsp"></jsp:include>
		<div class="container con_top_margin">
			<div class="row">
				<jsp:include page="myPageSideBar.jsp"></jsp:include>
				<div class="col-9">
					<div class="subjecet">
						<h3>나의 상품 후기</h3>
					</div>

					<hr>


					<div class="container period_wrap">




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
						<div class="row select_row">
							<!-- 				<div class="col-1 reviews_l"></div> -->
							<div class="col-3 reviews_w">후기 작성 하기</div>
							<div class="col-3 reviews_s">
								<div class="row reviews_s_row">
									<div class="col-12 reviews_s_col">후기 내역 보기</div>
								</div>
							</div>
							<div class="col-6 reviews_r"></div>
						</div>
						<div class="row">
							<div class="col-12 padding0">
								<table>
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 25%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">

									</colgroup>
									<thead>
										<tr>

											<th colspan="2">상품정보</th>
											<th>주문 일자</th>
											<th>상태</th>
											<th>후기</th>
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
																<br>후기 내역이 없습니다.
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
																		class="prdcode"> ${list.ORDER_PRDNAME }</span></td>
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
													<td>${list.ORDER_STATE }</td>
													<td><c:choose>
															<c:when test="${list.ORDER_STATE =='배송완료' }">
																<c:choose>
																	<c:when test="${reviewCheck[status.index] ==0}">

																		<span class="write_btn"> <input type="hidden"
																			value="${list.ORDER_PRDCODE }" class="ORDER_PRDCODE">
																			<input type="hidden" value="${list.ORDER_PRDSIZE  }"
																			class="ORDER_PRDSIZE"> <input type="hidden"
																			value="${list.ORDER_NUM  }" class="ORDER_NUM ">
																			후기작성하기
																		</span>

																	</c:when>
																	<c:otherwise>
											작성완료
											</c:otherwise>
																</c:choose>

															</c:when>
															<c:when test="${list.ORDER_STATE =='취소' }">
											작성불가 <br>
											(취소상품)
											</c:when>
															<c:when test="${list.ORDER_STATE =='환불' }">
											작성불가 <br>
											(환불상품)
											</c:when>
															<c:when test="${list.ORDER_STATE =='환불신청' }">
											작성불가 <br>
											(환불상품)
											</c:when>
															<c:otherwise>
											배송전
											</c:otherwise>
														</c:choose></td>


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
												href="${pageInfo.getStartPage()}?fromDate=${date1}&toDate=${date2}"
												tabindex="-1">이전</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageInfo.getStartPage()-1}?fromDate=${date1}&toDate=${date2}"
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
													href="${state.index}?fromDate=${date1}& qtoDate=${date2}">${state.index}</a></li>
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
												href="${pageInfo.getEndPage()}?fromDate=${date1}&toDate=${date2}">다음</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageInfo.getEndPage()+1}?fromDate=${date1}&toDate=${date2}">다음</a></li>
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
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>
	$('.write_btn').on(
			"click",
			function() {
				var ORDERNUM = $(this).find('.ORDER_NUM').val();
				var ORDERPRDSIZE = $(this).find('.ORDER_PRDSIZE').val();
				var PRDCODE = $(this).find('.ORDER_PRDCODE').val();

				location.href = '/reviewWrite/' + ORDERNUM + '/' + ORDERPRDSIZE
						+ '/' + PRDCODE;
			});
	$('.underline').on("mouseover", function() {
		$(this).css("background-color", "#EDEFF2");
	});
	$('.underline').on("mouseout", function() {
		$(this).css("background-color", "white");
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

	$('.reviews_s_col').on("click", function() {
		location.href = "/myReviews/1";
	});
</script>
</html>