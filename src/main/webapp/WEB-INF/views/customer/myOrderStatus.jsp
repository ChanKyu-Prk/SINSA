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

.span_margin{
margin: 0;
}

</style>
<title>SINSA : 주문 내역 조회</title>
</head>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<h3>주문 상세 내역</h3>
				</div>
				<hr>




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

<%-- 										<c:forEach var="list" items="${orderList}" varStatus="status"> --%>
											<tr class="underline">

												<td class="imgtd">

													<div class="td-row">
														<img class="thumbPic" alt="상품 대표 사진" title="상품 대표 사진"
															src="/resources/prdImg/shoe.jpg" />

													</div>
												</td>

												<td>
													<table>
														<tr>
															<td class="prd_brand_td"><span class="prd_brand_span span_margin"></span></td>
														</tr>
														<tr>
															<td class="prd_name_td"><span class="prd_name_span span_margin"></span></td>
														</tr>
														<tr>
															<td class="prd_size_td">사이즈 : 
																mm</td>
														</tr>
													</table>
												</td>
												<td><fmt:formatDate var="date"
														value="${list.ORDER_REGDATE }" pattern="yyyy-MM-dd" />
													${date }</td>
												<td><span class="prd_order_num_span span_margin"></span></td>
												<td><fmt:formatNumber value=""
														type="number" />원</td>
												<td></td>
											</tr>
<%-- 										</c:forEach> --%>
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
	
// 	$('.thumbPic').on("click", function() {
// 		location.href = ;
// 	});
	
// 	$('.prd_brand_span').on("click", function() {
// 		location.href = ;
// 	});
	
// 	$('.prd_name_span').on("click", function() {
// 		location.href = ;
// 	});
	
// 	$('.prd_order_num_span').on("click", function() {
// 	 	location.href = ;
// 	});
	
	
	
	
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
		location.href = 'myOrderList.do?date1=' + date1 + '&date2=' + date2;
	});
</script>
</html>