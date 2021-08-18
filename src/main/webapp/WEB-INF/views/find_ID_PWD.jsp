<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${path}/resources/login_resources/fonts/icomoon/style.css">

<link rel="stylesheet"
	href="${path}/resources/login_resources/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${path}/resources/login_resources/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet"
	href="${path}/resources/login_resources/css/style.css">

<style>
.form {
	text-align: center !important;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />



	<div class="container">
		<div class="row">
			<div class="col-lg-10">

				<form action="find_ID.do" method="POST" name="loginFrm">
					<div class="form-group first">
						<label for="username">이름</label> <input type="text"
							name="CUS_NAME" id="CUS_NAME1" class="form-control" placeholder="이름을 입력해주세요">

					</div>
					<div class="form-group last mb-3">
						<label for="email">이메일</label> <input type="text" name="CUS_EMAIL" id="CUS_EMAIL1"
							class="form-control" placeholder="이메일을 입력해주세요">
					</div>
					<div class="form-group">
						<input type="button" value="인증번호 받기" name="checkNum" id="btn1"
							class="btn btn-block py-2 btn-primary" onclick="sendCode();" >
					</div>
				</form>



				<form>
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="인증번호를 입력해주세요"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">인증 확인</button>
					</div>

					<div class="form-group">
						<input type="submit" value="아이디 찾기"
							class="btn btn-block py-2 btn-primary">
					</div>


				</form>






<script>
 
function sendCode(){
	
	
	var sendCodeData = { CUS_NAME : $('input[name="CUS_NAME"]').val(),
			CUS_EMAIL : $('input[name="CUS_EMAIL"]').val()}
    $.ajax({
        url: "find_ID.do",
        type: "POST",
        data : sendCodeData,
        success: function(result){
        	alert("인증번호 보냈다");
        	
        },
        error: function(){
            alert("simpleWithObject err");
        }
    });
}
</script>

























				<form action="find_PWD.do" method="post">
					<div class="form-group first">
						<label for="username">아이디</label> <input type="text" name="CUS_ID"
							class="form-control" placeholder="아이디를 입력해주세요">
					</div>

					<div class="form-group first">
						<label for="username">이름</label> <input type="text"
							name="CUS_NAME" class="form-control" placeholder="이름을 입력해주세요">
					</div>

					<div class="form-group last mb-3">
						<label for="email">이메일</label> <input type="text" name="CUS_EMAIL"
							class="form-control" placeholder="이메일을 입력해주세요">
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Recipient's username"
							aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">인증 확인</button>
					</div>
					<input type="submit" value="비밀번호 찾기"
						class="btn btn-block py-2 btn-primary">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />

	
	
	
</body>
</html>