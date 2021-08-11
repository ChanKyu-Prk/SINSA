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
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<p>
				<a href="prdInputForm">신규 상품 등록</a>
			</p>
			<table class="table table-striped"
				style="text-align: center; border: 0px solid #dddddd">
				<thead>
					<tr>
						<th>모델</th>
						<th>품명</th>
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
							<td>${ e.prd_name }</td>
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
							<td><input type="button"
								onclick="location.href='stockAdd?stock_procode=${ e.stock_prdcode }'"
								value="수정" /> <input type="button"
								onclick="javascript:stockDelete('${ e.stock_prdcode }')"
								value="삭제" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<ul class="pagination">
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
				</ul>
			</div>
		</div>
		<br>
		<br>
		<form>
			<div class="form-row">
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-2">
					<select name="fieldName" id="fieldName" class="form-control">
						<option ${(param.fieldName == "stock_prdcode")? "selected" : ""}
							value="prd_code">코드</option>
						<option ${(param.fieldName == "prd_name")? "selected" : ""}
							value="prd_name">품명</option>
					</select>
				</div>
				<div class="form-group col-md-5">
					<input type="text" class="form-control" placeholder="Search"
						name="searchWord" value="${param.searchWord}" />
				</div>
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
				<div class="form-group col-md-2"></div>
			</div>
		</form>
	</div>
</body>
</html>