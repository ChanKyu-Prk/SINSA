<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



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
</style>
<title>SINSA : 상품 문의</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<h3>상품 문의</h3>
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

				<c:choose>
					<c:when test="${fn:length(QnAList) == 0}">
       			 조회결과가 없습니다.
   				 </c:when>
					<c:otherwise>
						<c:forEach var="list" items="${QnAList}" varStatus="status">
            ${list.QNA_NUM} <br>
						</c:forEach>
					</c:otherwise>
				</c:choose>

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
										href="myProductQnA.do?page=${pageInfo.getStartPage()}&date1=${date1}&date2=${date2}"
										tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getStartPage()-1}&date1=${date1}&date2=${date2}"
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
											href="myProductQnA.do?page=${state.index}&date1=${date1}&date2=${date2}">${state.index}</a></li>
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
										href="myProductQnA.do?page=${pageInfo.getEndPage()}&date1=${date1}&date2=${date2}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getEndPage()+1}&date1=${date1}&date2=${date2}">다음</a></li>
								</c:otherwise>
							</c:choose>
						</c:when>

						<c:when test="${date != null}">
							<c:choose>
								<c:when test="${pageInfo.getPage()<=1}">
									<li class="page-item disabled"><a class="page-link"
										aria-disabled="true">이전</a></li>
								</c:when>
								<c:when test="${pageInfo.getStartPage()==1}">
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getStartPage()}&date=${date}"
										tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getStartPage()-1}&date=${date}"
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
											href="myProductQnA.do?page=${state.index}&date=${date}">${state.index}</a></li>
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
										href="myProductQnA.do?page=${pageInfo.getEndPage()}&date=${date}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getEndPage()+1}&date=${date}">다음</a></li>
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
										href="myProductQnA.do?page=${pageInfo.getStartPage()}"
										tabindex="-1">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getStartPage()-1}"
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
											href="myProductQnA.do?page=${state.index}">${state.index}</a></li>
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
										href="myProductQnA.do?page=${pageInfo.getEndPage()}">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="myProductQnA.do?page=${pageInfo.getEndPage()+1}">다음</a></li>
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
		var year = today.getFullYear() ;
		var month = today.getMonth() -1; 
		var date = today.getDate() +1;
		var date1 = new Date(year ,month, date);
		document.getElementById('date2').valueAsDate = today;
		document.getElementById('date1').valueAsDate = date1;

	});

	$('#threeMonth').on("click", function() {
		var today = new Date();
		var year = today.getFullYear() ;
		var month = today.getMonth() -3; 
		var date = today.getDate() +1;
		var date1 = new Date(year ,month, date);
		document.getElementById('date2').valueAsDate = today;
		document.getElementById('date1').valueAsDate = date1;

	});

	$('.serchBtn').on("click", function() {
		var date1 = $('#date1').val();
		var date2 = $('#date2').val();
		location.href = 'myProductQnA.do?date1=' + date1 + '&date2=' + date2;

	});

</script>
</html>
