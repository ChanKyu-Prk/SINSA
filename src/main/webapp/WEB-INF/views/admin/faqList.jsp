<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.sinsa.admin.vo.FAQVO" %>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ArrayList<FAQVO> faq_list = (ArrayList<FAQVO>) request.getAttribute("faq_list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq</title>
<style>
.b {
	padding: 20px;
	background-color: #eeeeee;
}

.a {
	padding: 15px;
	border: 1px solid #dddddd;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<body>
	<center>
		<section class="top">
			<h2>FAQ</h2>
			<p>신사 FAQ</p>
		</section>
		</center>
		<br>
		<hr>
		
		<br>
		<center>
		<table class="table table-striped"
			style="text-align: center; border: 0px solid #dddddd;">
			<thead>
				<tr id="click" style="text-align: center; width: 1110px;">
					<th scope="col" colspan="4"
						style="background-color: #f3f6f7; text-align: center;">자주하는질문 &#11167;</th>
				</tr>
			</thead>
		</table>
		</center>


		<div id="faq" style="display: none;">
			<%
				if (faq_list != null) {
			%>
			<%
				for (int i = 0; i < faq_list.size(); i++) {
			%>
			<div class="a" style="font-weight: 500">
				Q.
				<%=faq_list.get(i).getFAQ_Q()%></div>
			<div class="b" style="display: none;">
				A.
				<%=faq_list.get(i).getFAQ_A()%></div>
			<%
				}
			%>
			<%
				}
			%>
			<br><br>
		</div>
	

</body>
</html>