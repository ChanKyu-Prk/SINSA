<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empEdit</title>
<style>
body {
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	function noticeDelete(notice_num) {
		if (confirm('해당 게시물을 삭제하시겠습니까?')) {
			location.href = 'noticeDelete?notice_num=' + notice_num;
		}
	}
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	<div>
		<form:form method="post" action="noticeUpdate" modelAttribute="noticeInfo">
			<form:hidden path="notice_num" />
			<table>
				<tr>
					<td>제목</td>
					<td><form:input path="notice_title" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<form:textarea path="notice_content" cols="50" rows="5" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="변경사항저장"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" onclick="javascript:noticeDelete(${ param.notice_num })" value="삭제" /></td>
				</tr>

			</table>
		</form:form>
	</div>
</body>
</html>