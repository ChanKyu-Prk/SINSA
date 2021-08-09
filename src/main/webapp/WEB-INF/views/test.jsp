<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	
	<c:forEach var="q" items="${FAQList }">
	<p>
	${q.faq_num }/${q.faq_q }/${q.faq_a }<br>
	</p>
	</c:forEach>
</div>

</body>
</html>