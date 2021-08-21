<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<title>SINSA : ${page }</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<span>${page }</span>
				</div>
				<hr>
				
		<c:choose >		
<c:when test="${page == '비밀번호 변경' }">
<form action="passChange.do" method="post"></c:when>
<c:otherwise><form action="privateInfoChange.do" method="post"></c:otherwise>
</c:choose>

비밀번호 <input type="password" name="password">
<input type="submit" value="확인">

</form>

			</div>
			<hr />
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</body>
</html>