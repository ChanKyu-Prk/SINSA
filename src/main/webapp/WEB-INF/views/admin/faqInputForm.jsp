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
			$('#faq').slideToggle('slow', function() {
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
		<h2>자주하는 질문&nbsp;&nbsp;&nbsp;<button id="click" type="button" class="btn btn-outline-primary btn-lg" style="word-break: nowrap; text-align:right";>새 질문 등록</button></h2>
		<br>
		<div id="faq" style="display:none;">
		<form:form method="post" action="faqInsert" modelAttribute="FAQVO">
			<table>
				<tr>
					<td class="q">Q</td>
					<td><form:input path="faq_q" class="form-control"/></td>
				</tr>
				<tr>
					<td class="a">A</td>

					<td><form:textarea class="form-control" path="faq_a" cols="50" rows="5" /></td>
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