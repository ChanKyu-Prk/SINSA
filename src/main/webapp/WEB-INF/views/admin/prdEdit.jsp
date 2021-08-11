<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empEdit</title>
<style>
body {
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
</style>
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	<div>
		<form:form method="post" action="prdUpdate" modelAttribute="prdInfo" enctype="multipart/form-data">
			<form:hidden path="prd_num" />
			<form:hidden path="prd_image"/>
			<input type="file" name="uploadfile" placeholder="파일 선택" /><br/>
			<table>
				<tr>
					<td>상품코드 :</td>
					<td><form:input path="prd_code" /></td>
				</tr>
				<tr>
					<td>상 품 명 :</td>
					<td><form:input path="prd_name" /></td>
				</tr>
				<tr>
					<td>카테고리 :</td>
					<td><form:select path="prd_category">
        					<form:option value="러닝"/>
        					<form:option value="농구"/>
        					<form:option value="축구"/>
        					<form:option value="아웃도어"/>
        					<form:option value="테니스"/>
        					<form:option value="트레이닝"/>
        					<form:option value="샌들/슬리퍼"/>
        					<form:option value="스케이트보딩"/>
        					<form:option value="골프"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td>구분 :</td>
					<td>
						<form:select path="prd_gender">
        					<form:option value="공용"/>
        					<form:option value="남성"/>
        					<form:option value="여성"/>
						</form:select>
					</td>
				<tr>
				<tr>
					<td>가격 :</td>
					<td><form:input path="prd_price" /></td>
				</tr>
				<tr>
					<td>브랜드 :</td>
					<td>
						<form:select path="prd_brand">
        					<form:option value="NIKE"/>
        					<form:option value="ADIDAS"/>
        					<form:option value="FILA"/>
        					<form:option value="PUMA"/>
        					<form:option value="CONVERSE"/>
        					<form:option value="REEBOK"/>
        					<form:option value="NEWBALANCE"/>
        					<form:option value="LACOSTE"/>
						</form:select>
					</td>
				<tr>
				<tr>
					<td>색상 :</td>
					<td>
						<form:select path="prd_color">
        					<form:option value="WH"/>
        					<form:option value="BK"/>
        					<form:option value="GREY"/>
        					<form:option value="RED"/>
        					<form:option value="BLUE"/>
        					<form:option value="PK"/>
        					<form:option value="NEON"/>
        					<form:option value="BG"/>
        					<form:option value="SK"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td>할인율 :</td>
					<td><form:input path="prd_disrate" /></td>
				</tr>
				<tr>
					<td>상품설명 :</td>
					<td>
						<form:textarea path="prd_detail" cols="50" rows="5" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Save"></td>
				</tr>
				<tr>
					<td colspan="2"><a href="prdList">상품리스트</a></td>
				</tr>

			</table>
		</form:form>
	</div>
</body>
</html>