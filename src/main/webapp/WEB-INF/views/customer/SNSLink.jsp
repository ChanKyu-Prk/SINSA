<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SINSA 네이버 연동</title>
<style type="text/css">
.product .section-title h2 {
	width: 100%;
}
.btnCon{
	text-align: center;
}
.primary-btn{
	width: 200px;
	border: 2px solid #7fad39;
}
.shopBtn.primary-btn{
	background: transparent;
	color: #7fad39;
}

.payCompleteCon a:hover {
	color: #0e4a8b;
}
.notic{
background-color: #EDEFF2;
text-align: center;
margin: auto;
width: 60%;
padding :35px;
font-weight: bold;
font-size: 30px;
margin-bottom: 35px;
}
.form{
display: inline;
}
.fcolor{
color: #7fad39;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<jsp:include page="../header.jsp" />
	<section class="product spad payCompleteCon">
		<div class="container">
			<div class="notic">고객님의 네이버 아이디로 가입된 아이디는 <br>
			<span class="fcolor">${ID }</span> 입니다. <br>
				연동 하시겠습니까?</div>
				
				<div class="btnCon">
					
					
					<form action="/SNSLink" method="post">				
					<input type="hidden" value="${email }" name="email">
					<input type="hidden" value="${naverID }" name="naverID">
					<button class="primary-btn shopBtn" onclick="location.href='/'">메인 화면으로 가기</button>
					<button type="submit" class="primary-btn">연동하기</button>
					</form>
				</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<jsp:include page="../footer.jsp" />
	<!-- Footer Section End -->
</body>
<script type="text/javascript">
window.history.forward(); function noBack(){ window.history.forward(); }

$('.primary-btn').on("click",function(){
	
	
});

</script>
</html>