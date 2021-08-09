<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prdList</title>
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
	function prdDelete(prd_num) {
		if (confirm('해당 상품을 삭제하시겠습니까?')) {
			location.href = 'prdDelete?prd_num=' + prd_num;
		}
	}
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	<div>
	<h2>공지사항</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${ noticeList }">
				<tr>
					<td>${ e.notice_num }</td>
					<td><a href="noticeEdit?notice_num=${ e.notice_num }">${ e.notice_title }</a></td>
					<td>${ e.notice_regdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="button" onclick="location.href='noticeInputForm'" value="글쓰기" />
	</div>
</body>
</html>