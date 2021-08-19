<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String getreferer = request.getHeader("Referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A답변달기</title>
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
	<br>
	<br>
	<div class="container">
		<div class="row">
			<form:form method="post" action="qnaUpdate" modelAttribute="qnaInfo"
				enctype="multipart/form-data">
				<input type="hidden" id="referer" name="referer" value="<%= getreferer %>" />
		<form:hidden path="qna_num" />
			<br />
				<table id="qnalist" class="table table-bordered"
					style="text-align: center; border: 0px solid #dddddd">
					<tr>
						<td nowrap>&emsp;번호&emsp;</td>
							<td><form:input path="qna_num" class="form-control" readonly="true"/></td>
						<td nowrap>상품코드</td>
							<td><form:input path="prd_num" class="form-control" readonly="true"/></td>
					</tr>
					<center><h2>Q&A관리</h2></center>
					<br><br>
					<tr>
						<td>&emsp;제목&emsp;</td>
							<td><form:input path="qna_title" class="form-control" readonly="true"/></td>
						<td nowrap>아이디</td>
							<td><form:input path="qna_cusid" class="form-control" readonly="true"/></td>
					</tr>
					<tr>
						<td>&emsp;내용&emsp;</td>
							<td rowspan="10"><form:textarea path="qna_content"
								style="height: 200px; width: 500px;" readonly="true"/></td>
						<td>답변</td>
							<td rowspan="10"><form:textarea path="qna_answer"
								style="height: 200px; width: 500px;" /></td>		
					</tr>
				</table>
					<div align="center">
						<input type="submit" class="btn btn-primary" value="변경사항저장">
						<button class="btn btn-outline-primary" onclick="history.go(-1);">취소</button>
					</div>
				<br><br>
			</form:form>
		</div>
	</div>
</body>
</html>