<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
}


</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var no = "";

	function selectNum(target) {
		var tbody = target.parentNode;
		var trs = tbody.getElementsByTagName('tr');

		var backColor = "#ffffff";
		var textColor = "black";
		var orgBColor = "#eeeeee";
		var orgTColor = "#000";

		for (var i = 0; i < trs.length; i++) {
			if (trs[i] != target) {
				trs[i].style.backgroundColor = backColor;
				trs[i].style.color = textColor;
			} else {
				trs[i].style.backgroundColor = orgBColor;
				trs[i].style.color = orgTColor;
				var td = trs[i].getElementsByTagName('td');
				no = td[2].innerText;

			}
		}

	}

	function prdModify() {
		if (no != "") {
			location.href = 'prdEdit?prd_code=' + no;

		} else {
			alert('수정할 항목을 선택하십시오.');
		}
	}

	function prdDelete() {
		if (no != "") {
			location.href = 'prdDelete?prd_code=' + no;
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
	<center><h2>상품 관리</h2></center>
	<br><br><br>
	<form>
		<div class="form-row">
		<div class="form-group col-md-3"></div>
			<div class="form-group col-md-1" style="margin: 0;">
				<select class="form-control" name="fieldName" id="fieldName">
					<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
					<option ${(param.fieldName == "prd_code")? "selected" : ""}
						value="prd_code">코드</option>
					<option ${(param.fieldName == "prd_name")? "selected" : ""}
						value="prd_name">품명</option>
					<option ${(param.fieldName == "prd_brand")? "selected" : ""}
						value="prd_brand">브랜드</option>
				</select>
			</div>
			<div class="form-group col-md-5" style="margin: 0;">
				<input type="text" class="form-control" placeholder="Search"
					name="searchWord" value="${param.searchWord}" />
			</div>
			<div class="form-group col-md-1" style="margin: 0;">
				<input type="submit" class="btn btn-primary" value="검색" />
			</div>
			<div class="form-group col-md-2"></div>
		</div>
	</form>
		<br> <br>

	
		<table style="border: 0px">
			<tr>
				<td align="left">
					<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='prdInputForm'">신규 상품 등록</button>
				</td>
				<td></td>
				<td align="right" style="width: 250px;"><input type="button"
					class="btn btn-primary btn-sm" onclick="prdModify()"
					value="선택 상품 수정" /> &nbsp; <input type="button"
					class="btn btn-danger btn-sm" onclick="javascript:prdDelete()"
					value="선택 상품 삭제" /></td>
			</tr>
		</table>
		<br>
		<div class="row">
			<table id="prdlist" class="table table-hover"
				style="text-align: center; border: 0px solid #dddddd">
				<thead>
					<tr>
						<th>번호</th>
						<th>대표이미지</th>
						<th>코드</th>
						<th>품명</th>
						<th>분류</th>
						<th>구분</th>
						<th>가격</th>
						<th>브랜드</th>
						<th>색상</th>
						<th>할인율</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty prdList }">
							<tr>
								<td colspan="10" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty prdList}">
							<c:forEach var="e" items="${ prdList }">
								<tr onclick="javascript:selectNum(this);">
									<td style="vertical-align:middle;">${ e.prd_num }</td>
									<%-- <td>${e.prd_image}</td> --%>
									<c:set var="img" value="${ e.prd_code }" ></c:set>
									<%
									String img = (String)pageContext.getAttribute("img");
									%>
									<td style="vertical-align:middle;"><img src="${pageContext.request.contextPath}\upload\prdImg\<%= img %>.png" width="100px"></td>
									<td style="vertical-align:middle;">${ e.prd_code }</td>
									<td style="vertical-align:middle;"><a href="prdInfo?prd_num=${ e.prd_num }">${ e.prd_name }</a></td>
									<td style="vertical-align:middle;">${e.prd_category}</td>
									<td style="vertical-align:middle;">${e.prd_gender}</td>
									<td style="vertical-align:middle;"><fmt:formatNumber value="${e.prd_price}"
											pattern="#,###,###" /></td>
									<td style="vertical-align:middle;">${e.prd_brand}</td>
									<td style="vertical-align:middle;">${e.prd_color}</td>
									<td style="vertical-align:middle;">${e.prd_disrate}</td>

								</tr>
							</c:forEach>
						</c:when>
					</c:choose>

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
								href="prdList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
								tabindex="-1">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="prdList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
									href="prdList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
								href="prdList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="prdList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br> <br>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
</html>