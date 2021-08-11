<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

table {
	width: 100%;
}

th {
	text-align: center !important;
	border-bottom: solid 1px black;
}

.underline {
	border-bottom: solid 1px #c1bfc1;
	padding-bottom: 5px;
	padding-top: 5px;
}

tr {
	
}
.padding0{
	padding: 0 !important;
}
td {
	text-align: center !important;
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
					<h3>주문 내역 조회</h3>
				</div>

				<hr>


				<button type="button" id="oneWeek">일주일</button>
				<button type="button" id="oneMonth">1개월</button>
				<button type="button" id="threeMonth">3개월</button>
				<button type="button" id="wholePeriod">전체</button>
				<input type="date" id="date1" value="${date1 }"> <input
					type="date" id="date2" value="${date2 }">
				<button type="button" class="serchBtn">조회</button>
				<br>


				<div class="container">
					<div class="row">
						<div class="col-12 padding0">
							<table>
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 30%;">
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

										<tr class="underline">
											<td colspan="6">조회결과가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="list" items="${orderList}" varStatus="status">
											<tr class="underline">
												<td>${list.PRD_IMAGE }</td>
												<td>
													<table>
														<tr>
															<td>${list.PRD_BRAND }</td>
														</tr>
														<tr>
															<td>${list.ORDER_PRDNAME }</td>
														</tr>
														<tr>
															<td>사이즈 : ${list.ORDER_PRDSIZE }</td>
														</tr>
													</table>
												</td>
												<td><fmt:formatDate var="date" value="${list.ORDER_REGDATE }" pattern="yyyy-MM-dd"/> ${date }</td>
												<td>${list.ORDER_NUM }</td>
												<td>
												<fmt:formatNumber value="${list.ORDER_PRICE }" type="number"/>원</td>
												<td>${list.ORDER_STATE }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
				<!-- paging  부분-->
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
										href="myOrderList.do?page=${pageInfo.getStartPage()}&date1=${date1}&date2=${date2}"
										tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myOrderList.do?page=${pageInfo.getStartPage()-1}&date1=${date1}&date2=${date2}"
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
											href="myOrderList.do?page=${state.index}&date1=${date1}&date2=${date2}">${state.index}</a></li>
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
										href="myOrderList.do?page=${pageInfo.getEndPage()}&date1=${date1}&date2=${date2}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myOrderList.do?page=${pageInfo.getEndPage()+1}&date1=${date1}&date2=${date2}">다음</a></li>
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
										href="myOrderList.do?page=${pageInfo.getStartPage()}"
										tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myOrderList.do?page=${pageInfo.getStartPage()-1}"
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
											href="myOrderList.do?page=${state.index}">${state.index}</a></li>
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
										href="myOrderList.do?page=${pageInfo.getEndPage()}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myOrderList.do?page=${pageInfo.getEndPage()+1}">다음</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>

					</c:choose>

				</ul>
				<!-- paging 끝 -->

			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>


$('.underline').on("mouseover", function() {
	$(this).css("background-color","#d3d3d3");
});
$('.underline').on("mouseout", function() {
	$(this).css("background-color","white");
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