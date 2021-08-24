<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String getreferer = request.getHeader("Referer");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
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
   <center><h2>고객정보수정</h2></center>
	<div class="container">
			<form:form method="post" action="customerUpdate" modelAttribute="customerInfo" >
				<input type="hidden" id="referer" name="referer" value="<%= getreferer %>" />
			<form:hidden path="CUS_NUM" /> 
			- <table id="qnalist" class="table table-bordered"
					style="text-align: center; border: 0px solid #dddddd">
				<tr>
					<td>아이디 :</td>
					<td><form:input path="CUS_ID" class="form-control" readonly="true"/></td>
					<td rowspan="10"></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><form:input type="password" path="CUS_PWD" class="form-control" /></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><form:input path="CUS_NAME" class="form-control" /></td>
					
				</tr>
				<tr>
					<td>성별 :</td>
					<td>
						<form:input path="CUS_GENDER" class="form-control" readonly="true" />
        				<%-- 	<form:option value="남자"/>
        					<form:option value="여자"/>
						</form:select>--%>
					</td>
					</tr>
				<tr>
					<td>이메일 :</td>
					<td><form:input path="CUS_EMAIL" class="form-control" 
					/></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><form:input path="CUS_ADDR" class="form-control" /></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td><form:input path="CUS_TEL" class="form-control" /></td>
					</tr>
				<tr>
					<td>생년월일 :</td>
					<td><form:input path="CUS_BIRTH" class="form-control" readonly="true"/></td>
					</tr>
				<tr>
					<td>포인트 :</td>
					<td><form:input path="CUS_POINT" class="form-control" /></td>
					</tr>
				</table>
				<div align="center">
					<input type="submit" class="btn btn-primary" value="변경사항저장">
					<button class="btn btn-outline-primary" onclick="history.go(-1);">취소</button>
					<br><br>
				</div>
		</form:form>
		</div>
</body>
</html>
