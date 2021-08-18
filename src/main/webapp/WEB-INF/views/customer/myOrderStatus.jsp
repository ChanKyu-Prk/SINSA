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
}

.blackUnderLine {
	background-color: black;
}
.info_td{
text-align: left !important;
margin-top: 5px;
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

				<div class="container period_wrap">
					<div class="row">
						<div class="col-6 period_box">
							주문일자 :
							<fmt:formatDate var="date" value="${orderList[0].ORDER_REGDATE}"
								pattern="yyyy-MM-dd" />
							${date }
						</div>
						<div class="col-6 period_box">주문번호 :
							${orderList[0].ORDER_NUM }</div>
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
										<th>적립금</th>
										<th>수량</th>
										<th>결제금액</th>
										<th>상태</th>
									</tr>
								</thead>

								<c:forEach var="list" items="${orderList}" varStatus="status">
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
													<td class="prd_brand_td"><span
														class="prd_brand_span span_margin">${list.PRD_BRAND }</span></td>
												</tr>
												<tr>
													<td class="prd_name_td"><span
														class="prd_name_span span_margin">${list.ORDER_PRDNAME }</span></td>
												</tr>
												<tr>
													<td class="prd_size_td">사이즈 : ${list.ORDER_PRDSIZE }
														mm</td>
												</tr>
											</table>
										</td>
										<td><fmt:formatNumber value="${list.ORDER_PRICE*0.05 }"
												type="number" />원</td>
										<td>${list.ORDER_AMOUNT}개</td>
										<td><fmt:formatNumber value="${list.ORDER_PRICE }"
												type="number" />원</td>
										<td>${list.ORDER_STATE }<c:if
												test="${list.ORDER_STATE =='배송중' }">
												<br>
												<span>배송조회</span>
											</c:if> <c:if test="${list.ORDER_STATE =='결제완료' }">
												<br>
												<span>구매취소</span>
											</c:if> <c:if test="${list.ORDER_STATE =='배송완료' }">
												<br>
												<span>환불신청</span>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>



				<div class="container info-wrap">
					<div class="row">



						<div class="col-6">
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
									<td class="info_td">${orderList[0].ORDER_ADDR }</td>
								</tr>
								<tr>
									<td class="info_td">배송 메모</td>
									<td class="info_td">${orderList[0].ORDER_MEMO  }</td>
								</tr>
							</table>
						</div>



						<div class="col-6">
							<h4>결제 정보</h4>
							<hr class="blackUnderLine">
							<table>
								<colgroup>
									<col style="width: 30%">
									<col style="width: 70%">
								</colgroup>
								<tr>
									<td class="info_td">상품 합계</td>
									<td class="info_td"> 원</td>
								</tr>
								<tr>
									<td class="info_td">할인 합계</td>
									<td class="info_td"> 원</td>
								</tr>
								<tr>
									<td class="info_td">포인트 사용</td>
									<td class="info_td"> 원</td>
								</tr>
								<tr>
									<td class="info_td">배송비</td>
									<td class="info_td">0 원</td>
								</tr>
								<tr>
									<td class="info_td">최종 결제 금액</td>
									<td class="info_td"> 원</td>
								</tr>
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

//	$('.thumbPic').on("click", function() {
//	location.href = ;
//});

//$('.prd_brand_span').on("click", function() {
//	location.href = ;
//});

//$('.prd_name_span').on("click", function() {
//	location.href = ;
//});

</script>
</html>