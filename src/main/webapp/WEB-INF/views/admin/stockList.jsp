<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<script type="text/javascript">
	function stockDelete(stock_prdcode) {
		if (confirm('해당 상품을 삭제하시겠습니까?')) {
			location.href = 'stockDelete?stock_prdcode=' + stock_prdcode;
		}
	}
</script>
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
					<td>${ e.stock_prdcode }</td>
					<td>${ e.stock_220 }</td>
					<td>${ e.stock_225 }</td>
					<td>${ e.stock_230 }</td>
					<td>${ e.stock_235 }</td>
					<td>${ e.stock_240 }</td>
					<td>${ e.stock_245 }</td>
					<td>${ e.stock_250 }</td>
					<td>${ e.stock_255 }</td>
					<td>${ e.stock_260 }</td>
					<td>${ e.stock_265 }</td>
					<td>${ e.stock_270 }</td>
					<td>${ e.stock_275 }</td>
					<td>${ e.stock_280 }</td>
					<td>${ e.stock_285 }</td>
					<td>${ e.stock_290 }</td>
					<td>${ e.row_total }</td>
					<td>
						<input type="button" onclick="location.href='stockAdd?stock_procode=${ e.stock_prdcode }'" value="수정" />
						<input type="button" onclick="javascript:stockDelete('${ e.stock_prdcode }')" value="삭제" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p><a href="prdInputForm">신규 상품 등록</a></p></div>
</body>
</html>