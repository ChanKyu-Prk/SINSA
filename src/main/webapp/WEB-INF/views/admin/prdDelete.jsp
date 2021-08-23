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
<style>
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

		<form:form method="post" action="prdDeleteSuccess"
			modelAttribute="prdInfo">
			<input type="hidden" id="referer" name="referer"
				value="<%=getreferer%>" />
			<form:hidden path="prd_code" value="${ prdInfo.prd_code }" />
			<br />

			<div class="col">
				<div class="jumbotron" style="padding-top: 60px;">

					<h3 style="text-align: center;">
						${ prdInfo.prd_code }에 등록된 ${ stock }개의 재고가 함께 삭제됩니다.<br>
						<br> 삭제하시겠습니까?
					</h3>
					<br>
					<br>
					<div align="center">
						<input type="submit" class="btn btn-primary" value="확인">
						<button class="btn btn-outline-primary" type="button"
							onclick="history.go(-1);">취소</button>
					</div>

				</div>
			</div>

		</form:form>
	</div>
</body>
</html>