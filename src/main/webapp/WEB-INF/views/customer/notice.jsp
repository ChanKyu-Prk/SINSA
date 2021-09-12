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

#exclamation {
	width: 100px;
	height: 100px;
	fill: grey;
}

.no_row {
	min-height: 250px;
	display: table;
	padding-top: 50px;
}

.no_col {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.noticerow {
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.noticerow {
	border-bottom: solid 1px #bebebe;
}

.numbercol {
	text-align: center;
}

.datecol {
	text-align: center;
}

.titleSpan {
	cursor: pointer;
}

.pagination {
	margin-top: 25px;
	margin-bottom: 25px;
	justify-content: center;
}
a.page-link{
color: black !important;
}
.page-item.active
.page-link{
background-color: black !important;
border-color: black !important;
color: white !important;
}

</style>
<title>SINSA 공지사항</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>

	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="customerCenterBar.jsp"></jsp:include>
			<div class="col-sm-12 col-md-9">
				<div class="subjecet">
					<span>공지사항</span>
				</div>
				<hr>

				<div class="container FAQList">


					<c:choose>
						<c:when test="${fn:length(NoticeList) == 0}">
							<div class="container">
								<div class="row no_row">
									<div class="col-12 no_col">
										<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
											class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
												d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
										<br>공지사항이 없습니다.
									</div>
								</div>

							</div>

						</c:when>
						<c:otherwise>
							<div class="row noticerow">
								<div class="col-2 col-md-1 numbercol">번호</div>
								<div class="col-7 col-md-9">제목</div>
								<div class="col-3 col-md-2 datecol">작성일</div>
							</div>
							<c:forEach var="list" items="${NoticeList}" varStatus="status">
								<div class="row noticerow">
									<div class="col-2 col-md-1 numbercol">${list.notice_num }</div>
									<div class="col-7 col-md-9">
										<span class="titleSpan">${list.notice_title }</span>
									</div>
									<div class="col-3 col-md-2 datecol">${list.notice_regdate }</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
				<c:if test="${fn:length(NoticeList) != 0}">
				<ul class="pagination">
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
								<li class="page-item active Cpage" aria-current="page"><a
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

				</ul>
			</c:if>
			<!-- paging 끝 -->
			</div>
			<hr />

			



		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$('.titleSpan').on("click", function(){
	var noticeNum = $(this).parent().prev().text();
	var page = $('.Cpage').text();
	location.href = "/noticeDetail"+page+"/"+noticeNum;
});
</script>
</html>
