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
	function prdDelete(prd_num) {
		if (confirm('해당 상품을 삭제하시겠습니까?')) {
			location.href = 'prdDelete?prd_num=' + prd_num;
		}
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<div>
		<h2>상품 관리</h2>
		<form>
			<select name="fieldName" id="fieldName" class="form-control">
				<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
				<option ${(param.fieldName == "prd_code")? "selected" : ""}
					value="prd_code">코드</option>
				<option ${(param.fieldName == "prd_name")? "selected" : ""}
					value="prd_name">품명</option>
				<option ${(param.fieldName == "prd_brand")? "selected" : ""}
					value="prd_brand">브랜드</option>
			</select> <input type="text" class="form-control" placeholder="Search"
				name="searchWord" value="${param.searchWord}" /> <input
				type="submit" value="검색" />
		</form>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이미지</th>
					<th>코드</th>
					<th>품명</th>
					<th>분류</th>
					<th>구분</th>
					<th>가격</th>
					<th>브랜드</th>
					<th>색상</th>
					<th>할인율</th>
					<th>편집</th>
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
							<tr>
								<td>${ e.prd_num }</td>
								<td>${e.prd_image}</td>
								<td>${ e.prd_code }</td>
								<td><a href="prdInfo?prd_num=${ e.prd_num }">${ e.prd_name }</a></td>
								<td>${e.prd_category}</td>
								<td>${e.prd_gender}</td>
								<td>${e.prd_price}</td>
								<td>${e.prd_brand}</td>
								<td>${e.prd_color}</td>
								<td>${e.prd_disrate}</td>
								<td><input type="button"
									onclick="location.href='prdEdit?prd_num=${ e.prd_num }'"
									value="수정" /> <input type="button"
									onclick="javascript:prdDelete(${ e.prd_num })" value="삭제" /></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

			</tbody>
		</table>
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
		<p>
			<a href="prdInputForm">신규 상품 등록</a>
		</p>
	</div>
</body>
</html>