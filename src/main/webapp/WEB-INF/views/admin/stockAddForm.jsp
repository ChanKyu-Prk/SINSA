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

table {
	width: 100%;
	border: 1px solid;
}

input.form-control {
	text-align: right;
}

.code {
	font-size: 1.3em;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

	function add() {
		var maxcnt = ${stockList.size()};
		var sum = 0;
		for(var i=1; i<maxcnt+1; i++){
				temp = parseInt(document.getElementById('total'+i).value);
				sum += temp;
			}
		if (confirm("총수량 " + sum + "족 입고 처리하시겠습니까?")) {
			document.forms["addform"].submit();
		}
		
	}
	
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<div class="container-fluid" style="padding: 0 30px;">
		<div class="row">
		<div align="center"><h2>상품 입고</h2></div>
		<br><br><br>
		<table id="addstock" class="table table-hover"
				style="text-align: center; border: 0px solid #dddddd">
			<thead>
				<tr>
					<th style="width:150px;">모델</th>
					<th class="size">220</th>
					<th class="size">225</th>
					<th class="size">230</th>
					<th class="size">235</th>
					<th class="size">240</th>
					<th class="size">245</th>
					<th class="size">250</th>
					<th class="size">255</th>
					<th class="size">260</th>
					<th class="size">265</th>
					<th class="size">270</th>
					<th class="size">275</th>
					<th class="size">280</th>
					<th class="size">285</th>
					<th class="size">290</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
									<form:form method="post" action="stockUpdate"
							modelAttribute="stockInfo" name="addform">
				<c:forEach var="e" items="${ stockList }" varStatus="status">
					<tr>
							<input type="hidden" id="referer" name="referer" value="<%=getreferer%>" />
							<form:hidden path="stock_prdcode" value="${ e.stock_prdcode }" />
							<td class="code">${ e.stock_prdcode }</td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_220" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_225" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_230" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_235" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_240" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_245" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_250" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_255" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_260" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_265" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_270" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_275" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_280" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_285" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0"
								class="stock${status.count} form-control" name="stock_290" onchange="javascript:sum(${status.count});"></td>
							<td><input type=number min="0" value="0" class="form-control" name="total"
								id="total${status.count}" readonly/></td>
						
					</tr>
					
					<script>
				    function sum(id) {
				        
				        var maxcnt = ${stockList.size()};
				        for(var i=1; i<maxcnt+1; i++){
				        	var sum = 0;
				        	var test = $( '.stock'+i ).get();
				        	for(var y=0; y<test.length; y++){
				        		var temp = parseInt(test[y].value);
				        		sum += temp;
				        		document.getElementById('total'+i).value = sum;
				        	}
				        	
				        }
				                                   
				    }
					</script>
				</c:forEach>
				</form:form>
			</tbody>
		</table>
		<br><br>
		<input type="button" class="btn btn-primary btn-lg btn-block" value="전체 입고 처리" onclick="add();"/>
<%-- 		<ul class="pagination">
			<c:choose>
				<c:when test="${pageInfo.getPage()<=1}">
					<li class="page-item disabled"><a class="page-link"
						aria-disabled="true">이전</a></li>
				</c:when>
				<c:when test="${pageInfo.getStartPage()==1}">
					<li class="page-item"><a class="page-link"
						href="stockList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
						tabindex="-1">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="stockList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
						tabindex="-1">이전</a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="${pageInfo.getStartPage()}"
				end="${pageInfo.getEndPage()}" varStatus="state">
				<c:choose>
					<c:when test="${pageInfo.getPage()==state.index}">
						<li class="page-item active" aria-current="page"><a
							class="page-link">${state.index}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="stockList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${pageInfo.getPage() >= pageInfo.getMaxPage()}">
					<li class="page-item disabled"><a class="page-link"
						aria-disabled="true">다음</a></li>
				</c:when>
				<c:when test="${pageInfo.getEndPage()==pageInfo.getMaxPage()}">
					<li class="page-item"><a class="page-link"
						href="stockList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="stockList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul> --%>

	</div>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
</html>