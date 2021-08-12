<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('div.a').click(function() {
			$(this).next().slideToggle();
		});
	});

	$(document).ready(function() {
		$('#click').click(function() {
			$('#notice').slideToggle('slow', function() {
			});
		});
	});
</script>
<style>
table {
	width: 100%;
}

td.q {
	width: 10%;
	height: 38px;
	background-color: #007bfe;
	color: #fff;
	font-size: 1.8em;
	text-align: center;
	
}

td.a {
	width: 10%;
	font-size: 1.8em;
	text-align: center;
}

</style>
</head>
<body>

	<br>
	<div>
		<h2>공지사항&nbsp;&nbsp;&nbsp;<button id="click" type="button" class="btn btn-outline-primary btn-lg" style="word-break: nowrap; text-align:right";>새 공지 등록</button></h2>
		<br>
		<div id="notice" style="display:none;">
		<form:form method="post" action="noticeInsert" modelAttribute="noticeVO">
			<table>
				<tr>
					<td class="q">제목</td>
					<td><form:input path="notice_title" class="form-control"/></td>
				</tr>
				<tr>
					<td class="a">내용</td>

					<td><form:textarea class="form-control" path="notice_content" cols="50" rows="5" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:right;"><input type="submit" class="btn btn-primary" value="등록"></td>
				</tr>
			</table>
		</form:form>
		</div>
	</div>
</body>
</html>