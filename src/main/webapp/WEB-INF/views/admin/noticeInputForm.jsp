<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
table {
	width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<br>
	<div>

		<br>
		<div class="container">
			<h2>공지사항 등록</h2>
			

				<br>
				<br>
				<form:form method="post" action="noticeInsert"
					modelAttribute="noticeVO">

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">제목</span>
						</div>
						<input type="text" class="form-control" aria-label="Username"
							aria-describedby="basic-addon1" name="notice_title">
					</div>

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">내용</span>
						</div>
						<textarea class="form-control" aria-label="With textarea"
							name="notice_content" rows="20"></textarea>
					</div>

					<br><br>
					<div align="center">
						<input type="submit" class="btn btn-primary" value="등록">
						<button class="btn btn-outline-primary" type="button" onclick="history.go(-1);">취소</button>
					</div>
				</form:form>
			</div>
		</div>
	<br><br>
	<jsp:include page="../footer.jsp"/>
</body>
</html>