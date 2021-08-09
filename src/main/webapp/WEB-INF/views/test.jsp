<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(10000);
		list.add(20000);
		list.add(30000);
	%>
123

	<%
		for (int i = 0; i < list.size(); i++) {
	%>
	<div class="hall">
		<div><%=list.get(i)%>
			<input type="hidden" value="<%=list.get(i)%>" class="price">
		</div>
		<div class="quantity">
			<div class="pro-qty">

				<input type="text" value="<%=list.get(i)%>" class="ctn">
			</div>
		</div>
		<div>
			<input  class="sum" value="<%=list.get(i)*list.get(i)%>">
		</div>
	</div>
	<%
		}
	%>

</body>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">


	$('.hall').on("change input click", function() {
		var sum = $(this).find('.price').val() * $(this).find('.ctn').val();
		$(this).find('.sum').val(sum);

	});
</script>
</html>