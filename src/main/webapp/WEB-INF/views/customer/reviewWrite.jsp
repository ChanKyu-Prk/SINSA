<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
<title>SINSA : 후기 작성</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<h3>후기 작성</h3>
				</div>

				<hr>

${ordernum }
${orderprdsize }
${product.PRD_NAME }
${product.PRD_BRAND}
${product.PRD_IMAGE }
${product.PRD_CODE }

<form action="reviewInsert.do">

<input type="text">
<textarea rows="4" cols="56"></textarea>




</form>


				

				

			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>

	
</script>
</html>