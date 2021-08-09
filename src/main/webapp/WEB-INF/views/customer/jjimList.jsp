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
<title>SINSA : 찜 목록</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
				<h3>찜 목록</h3>
				</div>
				
				<hr>



		<c:choose>
					<c:when test="${fn:length(jjimList) == 0}">
       			 조회결과가 없습니다.
   				 </c:when>
					<c:otherwise>
						<c:forEach var="list" items="${jjimList}" varStatus="status">
            ${list.PRD_NUM } <br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
<!-- paging  부분-->
				<ul class="pagination">
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
			
				</ul>
<!-- paging 끝 -->

			</div>
		</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>


	
// function serach() {
// 	var date1 = $('#date1').val();
// 	var date2 = $('#date2').val();
// 	location.href='myOrderList.do?date1='+date1+'&date2='+date2;
// }
</script>
</html>
