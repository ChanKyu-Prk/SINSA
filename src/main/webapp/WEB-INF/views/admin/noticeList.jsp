<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
div {
	margin: 0 auto;
}

table {
	width: 100%;
	text-align: center;
	
}
</style>
<script type="text/javascript">
	function prdDelete(prd_num) {
		if (confirm('해당 상품을 삭제하시겠습니까?')) {
			location.href = 'prdDelete?prd_num=' + prd_num;
		}
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<div class="container">

		<div class="row">
			<div align="center"><h2>공지사항&nbsp;&nbsp;&nbsp;
			<button id="click" type="button" class="btn btn-outline-primary btn-lg" onclick="location.href='noticeInput'">새 공지 등록</button></h2></div>
			<br><br><br>
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width:10%;">번호</th>
						<th style="width:60%;">제목</th>
						<th style="width:20%;">작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${ noticeList }">
						<tr>
							<td>${ e.notice_num }</td>
							<td style="text-align:left;"><a href="noticeEdit?notice_num=${ e.notice_num }">${ e.notice_title }</a></td>
							<td>${ e.notice_regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div align="center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pageInfo.getPage()<=1}">
							<li class="page-item disabled"><a class="page-link"
								aria-disabled="true">이전</a></li>
						</c:when>
						<c:when test="${pageInfo.getStartPage()==1}">
							<li class="page-item"><a class="page-link"
								href="noticeList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
								tabindex="-1">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="noticeList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
									href="noticeList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
								href="noticeList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="noticeList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br> <br>
		<form>
			<div class="form-row">
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-2">
					<select name="fieldName" id="fieldName" class="form-control">
						<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
						<option ${(param.fieldName == "notice_title")? "selected" : ""}
							value="notice_title">제목</option>
						<option ${(param.fieldName == "notice_content")? "selected" : ""}
							value="notice_content">내용</option>
					</select>
				</div>
				<div class="form-group col-md-5">
					<input type="text" class="form-control" placeholder="Search"
						name="searchWord" value="${param.searchWord}" />
				</div>
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
				<div class="form-group col-md-2"></div>
			</div>
		</form>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
</html>