<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
div {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	function noticeDelete(notice_num) {
		if (confirm('해당 게시물을 삭제하시겠습니까?')) {
			location.href = 'noticeDelete?notice_num=' + notice_num;
		}
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<br>
	<div>

		<br>
		<div class="container">
			<h2>공지사항 수정/삭제</h2>


			<br> <br>
			<form:form method="post" action="noticeUpdate"
				modelAttribute="noticeInfo">
				<form:hidden path="notice_num" />

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">제목</span>
					</div>
					<input type="text" class="form-control" aria-label="Username"
						aria-describedby="basic-addon1" name="notice_title"
						value="${noticeInfo.notice_title }">
				</div>

				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">내용</span>
					</div>
					<textarea class="form-control" aria-label="With textarea"
						name="notice_content" rows="20">${noticeInfo.notice_content }</textarea>
				</div>

				<br>
				<br>
				<div align="center">
					<input type="submit" class="btn btn-primary" value="변경사항저장">
					<button type="button" class="btn btn-danger"
						onclick="javascript:noticeDelete(${ param.notice_num })">게시물삭제</button>
					&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-outline-primary" type="button"
						onclick="history.go(-1);">취소</button>
				</div>

			</form:form>
		</div>
	</div>
	<br><br>
	<jsp:include page="../footer.jsp"/>
</body>
</html>