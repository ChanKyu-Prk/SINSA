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
<title>리뷰상세보기</title>
<style>
body {
	font-size:11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
</style>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
<br>
<br>
	<div class="container">
		<div class="row">
			<form:form method="post" action="reviewUpdate" modelAttribute="reviewInfo"
				enctype="multipart/form-data">
				<input type="hidden" id="referer" name="referer" value="<%= getreferer %>" />
				
				<form:hidden path="rev_num" />
				<br />
				<table id="reviewlist" class="table table-bordered"
					style="text-align: center; border: 0px solid #dddddd">
					
					<tr>
						<td nowrap>고객아이디</td>
						<td><form:input path="rev_cusid" class="form-control" readonly="true"/></td> 
						<%-- <td nowrap>리뷰내용</td>
						<td rowspan="10"><form:textarea path="rev_content"
						style="height: 300px; width: 500px;" readonly="true"/></td> --%>
						
						<tr>
						<td nowrap>&nbsp;&nbsp;상품코드&nbsp;&nbsp;</td>
						<td><form:input path="rev_prdcode" class="form-control" readonly="true"/></td>
					</tr>
					<center><h2>리뷰상세보기</h2></center>
					<br><br>
					<tr>
						<td>제목</td>
						<td><form:input path="rev_title" class="form-control" readonly="true"/></td>
						</tr>
						
					<tr>
						 <td>별점</td>
						 <td><form:input path="rev_star" class="form-control" readonly="true"/></td>
						 
						 </tr>
						<tr>
						<!-- <td rowspan="10"></td> -->
						<td nowrap>이미지</td>
					<c:forEach items="${imgList }" var="imglist">
						<td rowspan="10"><img alt="리뷰 사진" src="${pageContext.request.contextPath}/resources/img/review/${imglist }" style="height: 200px; width: 500px;" /></td>
						</c:forEach>
					</tr>
					
				</table>
				<div align="center">
					<!-- <input type="button" class="btn btn-danger btn-sm" onclick="javascript:reviewDelete()" value="리뷰삭제" /> -->
					<!-- <input type="submit" class="btn btn-primary" value="변경사항저장"> -->
					<button class="btn btn-outline-primary" onclick="history.go(-1);">뒤로</button>
				</div>
				<br><br>
			</form:form>
		</div>
	</div>
</body>
</html>