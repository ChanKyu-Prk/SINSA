<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
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
   <br><br>
	<nav>
		SINSA관리자페이지
		<a href="prdList">상품관리</a>
		<a href="stockList">재고관리</a>
		<a href="customerList">고객관리</a>
		<a href="#">리뷰관리</a>
		<a href="#">문의관리</a>
		<a href="#">공지사항</a>
		<a href="#">로그아웃</a>
	</nav>
	<div>
		<form:form method="post" action="customerUpdate" modelAttribute="customerInfo" enctype="multipart/form-data">
			<form:hidden path="CUS_NUM" /> 
			<table>
				<tr>
					<td>아이디 :</td>
					<td><form:input path="CUS_ID" /></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><form:input path="CUS_PWD" /></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><form:input path="CUS_NAME" /></td>
					
				</tr>
				<tr>
					<td>성별 :</td>
					<td>
						<form:select path="CUS_GENDER">
        					<form:option value="남자"/>
        					<form:option value="여자"/>
						</form:select>
					</td>
					</tr>
				<tr>
					<td>이메일 :</td>
					<td><form:input path="CUS_EMAIL" /></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><form:input path="CUS_ADDR" /></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td><form:input path="CUS_TEL" /></td>
					</tr>
				<tr>
					<td>생년월일 :</td>
					<td><form:input path="CUS_BIRTH" /></td>
					</tr>
				<tr>
					<td>기본배송지 :</td>
					<td><form:input path="CUS_DELIV_ADDR" /></td>
					</tr>
				<tr>
					<td>포인트 :</td>
					<td><form:input path="CUS_POINT" /></td>
					</tr>
				<%-- <tr>
					<td>가입날짜 :</td>
					<td><form:input path="CUS_REGDATE" /></td>
					</tr> --%>
				
				
				<tr>
					<td colspan="2"><input type="submit" value="Save"></td>
				</tr>
				<tr>
					<td colspan="2"><a href="customerList">회원리스트</a></td>
				</tr>

			</table>
		</form:form>
	</div>
</body>
</html>
<%-- <style>
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
	<div>
		<form:form method="post" action="customerUpdate" modelAttribute="customerInfo">
			<form:hidden path="CUS_NUM" />
	순번 ${customerInfo.CUS_NUM } <br>
	아이디 ${customerInfo.CUS_ID } <br>
	이름${customerInfo.CUS_NAME }<br>
	성별 ${customerInfo.CUS_GENDER }<br>
	이메일${customerInfo.CUS_EMAIL } <br>
	주소${customerInfo.CUS_ADDR }<br>
	전화번호${customerInfo.CUS_TEL } <br>
	생년월일${customerInfo.CUS_NUM }<br>
	기본 배송지${customerInfo.CUS_DELIV_ADDR }<br>
	포인트${customerInfo.CUS_POINT }<br>
	가입날짜 ${customerInfo.CUS_REGDATE }
	
			<p>
				<input type="submit" value="변경사항적용">
			</p>
			<p>
				<a href="customerList">회원정보 리스트</a>
			</p>
		</form:form>
	</div>
</body>
</html> --%>