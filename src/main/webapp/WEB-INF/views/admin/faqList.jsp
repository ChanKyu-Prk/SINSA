<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

div {
	margin: 0 auto;
}

table{
	width: 100%;
	margin: 0 15px;
}

table.list{
	width: 100%;
	margin: 0 0 0 30px;
}

td.q {
	color: #007bfe;
	font-size: 1.8em;
	text-align: center;
	background-color: #fff;
}

td.a {
	width: 10%;
	font-size: 1.8em;
	text-align: center;
}
</style>
<script type="text/javascript">
	function faqDelete(faq_num) {
		if (confirm('해당 게시물을 삭제하시겠습니까?')) {
			location.href = 'faqDelete?faq_num=' + faq_num;
		}
	}
	function faqupdate(faq_num) {
		if (confirm(faq_num+'번 게시물이 수정되었습니다.')) {
			
		}
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<div class="container">

		<jsp:include page="faqInputForm.jsp" flush="true" />
		<div class="row">
			<table class="list">
				<thead>
					<tr>
						<th></th>

					</tr>
				</thead>
				<tbody>

					<c:forEach var="e" items="${ faqList }">
						<form:form method="post" action="faqUpdate"
							modelAttribute="faqInfo">
							<form:hidden path="faq_num" value="${ e.faq_num }" />

							<tr>
								<td class="q">#${ e.faq_num }</td>
								<td><input type="text" name="faq_q" class="form-control"
									value="${ e.faq_q }" /></td>
								<td width=200px></td>
							</tr>
							<tr>
								<td class="a">A</td>
								<td><textarea name="faq_a" cols="50" rows="5"
										class="form-control">${ e.faq_a }</textarea></td>
								<td></td>
							</tr>

							<tr>
								<td colspan="2" style="text-align: right;"><input
									type="submit" class="btn btn-primary btn-sm"
									onclick="javascript:faqupdate(${ e.faq_num })" value="수정">
									<input type="button" class="btn btn-danger btn-sm"
									onclick="javascript:faqDelete(${ e.faq_num })" value="삭제" /></td>
							</tr>
							<tr><td>&nbsp;<td></tr>
						</form:form>
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
								href="faqList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
								tabindex="-1">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="faqList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
									href="faqList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
								href="faqList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="faqList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br>
		<br>
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