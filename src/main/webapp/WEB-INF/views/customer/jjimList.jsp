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

#exclamation {
	width: 100px;
	height: 100px;
	fill: grey;
}

.no_jjim {
	text-align: center;
	padding: 120px;
	vertical-align: middle;
}

#modal {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 999999;
}

#modal .modal_content {
	width: 300px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#filter {
	border-top: 1px solid teal;
	border-bottom: 1px solid teal;
	padding-top: 18px;
	padding-bottom: 18px;
	margin-bottom: 70px;
}

#filter #search {
	background-color: gray;
	color: white;
	font-size: 25px;
	width: 100%;
	height: 60px;
	text-align: center;
	border: none;
}

.clicked {
	color: black;
}

.pagination {
	margin-top: 25px;
	margin-bottom: 25px;
	justify-content: center;
}

.nopadding {
	margin: 0px !important;
	padding: 0px !important;
}
</style>
<title>SINSA : 찜 목록</title>
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
						<h3>찜 목록</h3>
					</div>

					<hr>





					<c:choose>
						<c:when test="${fn:length(jjimList) == 0}">
							<div class="container">
								<div class="row">
									<div class="col-12 no_jjim">
										<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
											class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
												d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
										<br>찜한 내역이 없습니다.
									</div>
								</div>

							</div>


						</c:when>



						<c:otherwise>


							<div class="row">
								<c:forEach var="list" items="${jjimList }">
									<div class="col-lg-4 col-md-6 col-sm-6">
										<div class="product__item">
											<div class="product__item__pic set-bg"
												data-setbg="/resources/img/default.png">
												<ul class="product__item__pic__hover">
													<li><a href="#"><i class="fa fa-heart"></i></a></li>
													<li><a id="modal_open_btn"><i
															class="fa fa-retweet"><b>바로구매</b></i></a></li>
													<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
												</ul>
											</div>
											<div id="modal">
												<div class="modal_content">
													<h2>모달 창</h2>

													<p>모달 창 입니다.</p>

													<button type="button" id="modal_close_btn">모달 창 닫기
													</button>
												</div>
											</div>
											<div class="product__item__text">
												<p>
												<h6>${list.PRD_NAME }</h6>
												</p>
												<h5>${list.PRD_PRICE }원</h5>
											</div>
										</div>
									</div>

									<script>
										$("#modal_open_btn").click(
												function() {
													$("#modal").attr("style",
															"display:block");
												});

										$("#modal_close_btn").click(
												function() {
													$("#modal").attr("style",
															"display:none");
												});
									</script>

								</c:forEach>
							</div>


						</c:otherwise>
					</c:choose>


					<!-- paging  부분-->


					<c:if test="${fn:length(jjimList) != 0}">
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
	
</script>
</html>
