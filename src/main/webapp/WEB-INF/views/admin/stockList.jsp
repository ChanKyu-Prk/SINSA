<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- <link href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css" rel="stylesheet">
<script	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script	src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script	src="https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"></script> -->

<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css" rel="stylesheet"> -->

<style>


div {
	margin: 0 auto;
}

table {
	width: 100%;
	border: 1px solid;
}

#events {
	margin-bottom: 1em;
	padding: 1em;
	background-color: #f6f6f6;
	border: 1px solid #999;
	border-radius: 3px;
	height: 100px;
	overflow: auto;
}
</style>
<script type="text/javascript">

var no = "";
var picks = new Array();

function selectNum(target) {
    var tbody = target.parentNode;
    var trs = tbody.getElementsByTagName('tr');
 
    var backColor = "#ffffff";
    var textColor = "black";
    var orgBColor = "#eeeeee";
    var orgTColor = "#000";
 
  		  	 
    for ( var i = 0; i < trs.length; i++ ) {
        if ( trs[i] != target ) {
            trs[i].style.backgroundColor = backColor;
            trs[i].style.color = textColor;
        } else {
            trs[i].style.backgroundColor = orgBColor;
            trs[i].style.color = orgTColor;
            var td = trs[i].getElementsByTagName('td');
            no = td[0].innerText;
        	
        	picks[picks.length] = "'"+no+"'";
        	document.getElementById("pick").value = picks;
        	
        }
    }

}

function prdModify(picks) {
	if (no != "") {
		location.href = 'stockAdd?' + picks;
		
	} else {
	  alert('수정할 항목을 선택하십시오.');
	}
}

function prdDelete() {
	if (no != "") {
		if (confirm('해당 상품을 삭제하시겠습니까?')) {
			location.href = 'stockDelete?stock_prdcode=' + no;
		}	
	} else {
		  alert('삭제할 항목을 선택하십시오.');
		}
}

	

</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<div class="container-fluid" style="padding: 0 30px;">
		
		<form>
			<div class="form-row">
				<div class="form-group col-md-3">전체 재고 수량 : ${ allcount }</div>
				<div class="form-group col-md-1">
					<select name="fieldName" id="fieldName" class="form-control">
						<option ${(param.fieldName == "stock_prdcode")? "selected" : ""}
							value="prd_code">코드</option>
						<option ${(param.fieldName == "prd_name")? "selected" : ""}
							value="prd_name">품명</option>
					</select>
				</div>
				<div class="form-group col-md-4">
					<input type="text" class="form-control" placeholder="Search"
						name="searchWord" value="${param.searchWord}" />
				</div>
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
				<div class="form-group col-md-3"></div>
			</div>
		</form>			
		<br><br>
		<div class="row">
			<table style="border: 0px">
				<tr>
					<td align="left">
						<button type="button" class="btn btn-outline-primary btn-sm"
							onclick="location.href='stockInputForm'">신규 상품 등록</button>
					</td>
					
					<td width=50%><form:form id="picks" method="post" action="stockAdd">
					<input type="text" id="pick" name="picks" class="form-control" placeholder="현재 페이지에서 수정 또는 삭제할 아이템을 선택하세요." readonly/>
					</form:form></td>
					
					<td align="right"><input type="submit" 
						class="btn btn-primary btn-sm" form="picks"
						value="선택 상품 입고" /> &nbsp; <input type="button"
						class="btn btn-danger btn-sm" onclick="javascript:stockDelete()"
						value="선택 상품 삭제" /></td>
				</tr>
			</table>
			<br>
			<br>
			<!-- 			<div id="events">
        	Event summary - new events added at the top
    		</div> -->
			<table id="stock" class="table table-hover"
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
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${ stockList }">
						<tr onclick="javascript:selectNum(this);">
							<td>${ e.stock_prdcode }</td>
							<td>${ e.prd_name }</td>
							<td class="size">${ e.stock_220 }</td>
							<td class="size">${ e.stock_225 }</td>
							<td class="size">${ e.stock_230 }</td>
							<td class="size">${ e.stock_235 }</td>
							<td class="size">${ e.stock_240 }</td>
							<td class="size">${ e.stock_245 }</td>
							<td class="size">${ e.stock_250 }</td>
							<td class="size">${ e.stock_255 }</td>
							<td class="size">${ e.stock_260 }</td>
							<td class="size">${ e.stock_265 }</td>
							<td class="size">${ e.stock_270 }</td>
							<td class="size">${ e.stock_275 }</td>
							<td class="size">${ e.stock_280 }</td>
							<td class="size">${ e.stock_285 }</td>
							<td class="size">${ e.stock_290 }</td>
							<td id="row_total">${ e.total }</td>
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
		<br> <br>

	</div>
</body>
</html>