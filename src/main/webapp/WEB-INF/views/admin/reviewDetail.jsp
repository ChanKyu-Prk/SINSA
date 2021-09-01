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
		<!-- <div class="row"> -->
			<form:form method="post" action="reviewUpdate" modelAttribute="reviewInfo"
				enctype="multipart/form-data">
				<input type="hidden" id="referer" name="referer" value="<%= getreferer %>" />
				
				<form:hidden path="rev_num" />
				
						
						<br />
						
				<table class="table table-bordered"
					style="text-align: center; border: 0px solid #dddddd">
					<tr>
						<th nowrap>고객아이디</th>
						<td style="text-align:left;"><form:input path="rev_cusid" class="form-control" readonly="true"/></td>
						</tr>
						<tr>
						<th nowrap>&nbsp;&nbsp;상품코드&nbsp;&nbsp;</th>
						<td><form:input path="rev_prdcode" class="form-control" readonly="true"/></td>
					</tr>
					<center><h2>리뷰상세보기</h2></center>
					<br><br>
				<tr>
						<th>제목</th>
						<td><form:input path="rev_title" class="form-control" readonly="true"/></td>
						</tr>
				
				
				<tr>
						 <th>별점</th>
						 <td><form:input path="rev_star" class="form-control" readonly="true"/></td>
						 
						 </tr>
						 <tr>
						 <th nowrap>리뷰내용</th>
						   <td rowspan="10" width="50%"><form:textarea path="rev_content" class="form-control"
						style="height: 300px; width: 600px; border: 0px;" readonly="true"/></td>
						</tr>
						
						
					
						 </table>
						 </form:form>
						 <!-- </div> -->
						 <!-- <div class="row"> -->
				<br />
				
					<table class="table table-bordered"
					style="text-align: center; border: 0px solid #dddddd">
				<%-- 	<colgroup>
						<col width="250px">
						<col width="250px">
						<col width="250px">
						</colgroup> --%>
						<tr>
						<th nowrap>이미지</th>
					<c:forEach items="${imgList }" var="imglist">
						<td><img alt="리뷰 사진" src="${pageContext.request.contextPath}/resources/img/review/${imglist }" style="height: 180px; width: 400px;" /></td>
						</c:forEach>
						</tr>
						</table>
						<!-- </div> -->
						<br><br>
						 <div align="center">
					<!-- <input type="button" class="btn btn-danger btn-sm" onclick="javascript:reviewDelete()" value="리뷰삭제" /> -->
					<!-- <input type="submit" class="btn btn-primary" value="변경사항저장"> -->
					<button class="btn btn-outline-primary" onclick="history.go(-1);">뒤로</button>
				</div>
				
				</div>
				
				<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/mixitup.min.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
				</body>
				</html>
				
						 
						 
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<%-- <table id="reviewlist" class="table table-bordered"
					style="text-align: center; border: 5px solid #dddddd">
					
					<tr>
						<th nowrap>고객아이디</th>
						<td><form:input path="rev_cusid" class="form-control" readonly="true"/></td> 
						</tr>
						
						<tr>
						<th nowrap>&nbsp;&nbsp;상품코드&nbsp;&nbsp;</th>
						<td><form:input path="rev_prdcode" class="form-control" readonly="true"/></td>
					</tr>
					<center><h2>리뷰상세보기</h2></center>
					<br><br>
					<tr>
						<th>제목</th>
						<td><form:input path="rev_title" class="form-control" readonly="true"/></td>
						</tr>
						
					<tr>
						 <th>별점</th>
						 <td><form:input path="rev_star" class="form-control" readonly="true"/></td>
						 
						 </tr>
						<tr>
						<th nowrap>이미지</th>
					<c:forEach items="${imgList }" var="imglist">
						<td><img alt="리뷰 사진" src="${pageContext.request.contextPath}/resources/img/review/${imglist }" style="height: 180px; width: 400px;" /></td>
						</c:forEach>
					<th nowrap>리뷰내용</th>
						  <td rowspan="0"><form:textarea path="rev_content"
						style="height: 300px; width: 600px;" readonly="true"/></td> 
					</tr>
						
					
				</table> --%>
				
				
				<%-- <div align="center">
					<!-- <input type="button" class="btn btn-danger btn-sm" onclick="javascript:reviewDelete()" value="리뷰삭제" /> -->
					<!-- <input type="submit" class="btn btn-primary" value="변경사항저장"> -->
					<button class="btn btn-outline-primary" onclick="history.go(-1);">뒤로</button>
				</div>
				<br><br>
			</form:form>
		</div>
	</div>
</body>
</html> --%>