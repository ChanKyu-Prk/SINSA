<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
body {
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}

table {
	width: 100%;
	border: 1px solid;
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
	<div>
		<h2>자주하는 질문</h2>
		<table>
			<thead>
				<tr>
					<th></th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${ faqList }">
					<form:form method="post" action="faqUpdate"	modelAttribute="faqInfo">
						<form:hidden path="faq_num" value="${ e.faq_num }" />
						<tr>
							<td style="width: 10%">번호</td>
							<td>${ e.faq_num }</td>
						</tr>
						<tr>
							<td style="width: 10%">질문</td>
							<td><input type="text" name="faq_q" value="${ e.faq_q }" />
								<input type="submit" onclick="javascript:faqupdate(${ e.faq_num })" value="수정">
								<input type="button" onclick="javascript:faqDelete(${ e.faq_num })" value="삭제" /></td>
						</tr>
						<tr>
							<td style="width: 10%">답변</td>
							<td><textarea name="faq_a" cols="50" rows="5">${ e.faq_a }</textarea></td>
						</tr>
					</form:form>
					<tr>
						<td colspan="2">------------------------------------------------</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="button" onclick="location.href='faqInputForm'"
			value="글쓰기" />
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
		<form>
			<select name="fieldName" id="fieldName" class="form-control">
				<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
				<option ${(param.fieldName == "notice_title")? "selected" : ""}
					value="notice_title">제목</option>
				<option ${(param.fieldName == "notice_content")? "selected" : ""}
					value="notice_content">내용</option>
			</select> <input type="text" class="form-control" placeholder="Search"
				name="searchWord" value="${param.searchWord}" /> <input
				type="submit" value="검색" />
		</form>
	</div>
</body>
</html>