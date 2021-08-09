<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empInputform</title>

<style>
body {
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
</style>
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	<div>
		<h2>공지 등록</h2>
		<form:form method="post" action="noticeInsert" modelAttribute="noticeVO">
			<table>
				<tr>
					<td>제목 </td>
					<td><form:input path="notice_title" /></td>
				</tr>
				<tr>
					<td colspan=2>내용</td>
				</tr>
				<tr>
					<td colspan=2>
						<form:textarea path="notice_content" cols="50" rows="5" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>

		</form:form>
	</div>
</body>
</html>