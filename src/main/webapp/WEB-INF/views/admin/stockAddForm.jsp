<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prdList</title>
<style>
body {
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
table { 
	width: 100%;
	border: 1px solid; 
}
input {
	width: 40px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	<div>
	<h2>상품 관리</h2>
	<table>
		<thead>
			<tr>
				<th>모델</th>
				<th>220</th>
				<th>225</th>
				<th>230</th>
				<th>235</th>
				<th>240</th>
				<th>245</th>
				<th>250</th>
				<th>255</th>
				<th>260</th>
				<th>265</th>
				<th>270</th>
				<th>275</th>
				<th>280</th>
				<th>285</th>
				<th>290</th>
				<th>합계</th>
				<th>수량변경</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${ stockList }">
				<tr>
					<form:form method="post" action="stockUpdate" modelAttribute="stockInfo">
					<form:hidden path="stock_prdcode" value="${ e.stock_prdcode }" />
					<td>${ e.stock_prdcode }</td>
 					<td class="size"><input type=number value="0" min="0" maxlength=3 name="stock_220"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_225"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_230"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_235"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_240"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_245"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_250"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_255"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_260"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_265"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_270"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_275"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_280"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_285"></td>
					<td class="size"><input type=number value="0" min="0" name="stock_290"></td> 
					<td id="fn_total"></td>
					<td>
						<input type="submit" value="입고" />
					</td>
					</form:form>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p><a href="prdInputForm">신규 상품 등록</a></p></div>
</body>
</html>