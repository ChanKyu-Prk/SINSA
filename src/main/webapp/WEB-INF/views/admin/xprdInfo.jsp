<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empInfo</title>
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
}
td.left {
	border: 1px solid;
	width: 30%;
}
textarea {
	width: 100%;
	height: 500px;
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
	<nav>
		SINSA관리자페이지
		<a href="prdList">상품관리</a>
		<a href="stockList">재고현황</a>
		<a href="stockAdd">상품입고</a>
		<a href="#">고객관리</a>
		<a href="#">리뷰관리</a>
		<a href="#">문의관리</a>
		<a href="noticeList">공지사항</a>
		<a href="#">로그아웃</a>
	</nav>
	<div>
	
		<h2>상품 정보 상세</h2>
		<form:form method="post" action="prdUpdate" modelAttribute="prdInfo">
			<table>
				<tr>
					<td class="left">상품코드</td><td>
					<input type="text" name="prd_code" value="${prdInfo.prd_code}" readonly/></td>
				</tr><tr>
					<td class="left">상품명</td><td>
					<input type="text" name="prd_name" value="${prdInfo.prd_name}"></td>
				</tr><tr>
					<td class="left">카테고리</td><td>
					<select name="prd_category">
						<option ${(prd_category == "러닝")? "selected" : ""} value="러닝"></option>
						<option ${(prd_category == "농구")? "selected" : ""} value="농구"></option>
						<option ${(prd_category == "축구")? "selected" : ""} value="축구"></option>
						<option ${(prd_category == "아웃도어")? "selected" : ""} value="아웃도어"></option>
						<option ${(prd_category == "트레이닝")? "selected" : ""} value="트레이닝"></option>
						<option ${(prd_category == "샌들/슬리퍼")? "selected" : ""} value="샌들/슬리퍼"></option>
					</select>
				</tr><tr>
					<td class="left">상품이미지</td><td>
					<input type="text" name="prd_image" value="${prdInfo.prd_image}"></td>
				</tr><tr>
					<td class="left">구분</td><td>${prdInfo.prd_gender}</td>
				</tr><tr>
					<td class="left">가격</td><td>
					<input type="text" name="prd_price" value="${prdInfo.prd_price}"></td>
				</tr><tr>
					<td class="left">브랜드</td><td>${prdInfo.prd_brand}</td>
				</tr><tr>
					<td class="left">색상</td><td>${prdInfo.prd_color}</td>
				</tr><tr>
					<td colspan="2">상세설명</td>
				</tr>
			</table>
			<textarea name="detail" rows="15">${prdInfo.prd_detail}</textarea>
			<input type="submit" value="변경사항적용">
		</form:form>
		<p>
			<a href="prdEdit?prd_num=${prdInfo.prd_num }">상품 정보 수정</a>
			<a href="javascript:prdDelete(${prdInfo.prd_num })">사원정보 삭제</a>
		</p>
		<p>
			<a href="prdList">상품 리스트</a>
		</p>
	</div>
</body>
</html>