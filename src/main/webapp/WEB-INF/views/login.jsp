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

<title>Login #5</title>

<style>
.login {
	margin: 100px 0px !important;
}

.input_username{
	border-radius: 0px !important;
}

.input_password{
	border-radius: 0px !important;
}

.button_login{
	border-radius: 0px !important;
	height: 53px;
	border: 1px solid black !important;
	background-color: #222020 !important;
	font-weight: bold !important;
	font-size: 18px !important;
}

.login_box{
	border: 1px solid white !important;
	box-shadow: none;
}

</style>

<%
    	Cookie[] cookie = request.getCookies();
    	String CUS_ID = "";
    	String CUS_PWD = "";
    	if(cookie != null){
    		for(int i = 0; i<cookie.length; i++){
    			if(cookie[i].getName().trim().equals("CUS_ID")){
    				System.out.println(cookie[i].getValue());
    				CUS_ID = cookie[i].getValue();
    			}
    		}
    	}
    	
    	if(cookie != null){
    		for(int i = 0; i<cookie.length; i++){
    			if(cookie[i].getName().trim().equals("CUS_PWD")){
    				System.out.println(cookie[i].getValue());
    				CUS_PWD = cookie[i].getValue();
    			}
    		}
    	}
    %>

<style>
.find_id_pw{
	color: #6c757d !important;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />

	<!--   <div class="d-md-flex half"> -->
	<%--     <div class="bg" style="background-image: url('${path}/resources/login_resources/images/bg_1.jpg');"></div> --%>
	<div class="contents">

		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-12 login">
					<div class="form-block mx-auto login_box">
						<div class="text-center mb-5">
							<h3 class="text-uppercase">
								<strong>로그인</strong>
							</h3>
						</div>
						<form action="login.do" method="post" name="loginFrm">
							<div class="form-group first">
								<label for="username">아이디</label> <input type="text"
									name="CUS_ID" class="form-control input_username" placeholder="아이디를 입력해주세요"
									id="username" value="<%=CUS_ID%>">

							</div>
							<div class="form-group last mb-3">
								<label for="password">비밀번호</label> <input type="password"
									name="CUS_PWD" class="form-control input_password" placeholder="비밀번호를 입력해주세요"
									id="password" value="<%=CUS_PWD%>">
							</div>

							<div class="d-sm-flex mb-5 align-items-center">
								<label class="control control--checkbox mb-3 mb-sm-0"><span
									class="caption">아이디 저장</span> <input type="checkbox"
									name="id_rem"
									<%if(CUS_ID.length()>1) out.println("checked"); %> />
									<div class="control__indicator"></div> </label>
<!-- 								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label -->
<!-- 									class="control control--checkbox mb-3 mb-sm-0"><span -->
<!-- 									class="caption">비밀번호 저장</span> <input type="checkbox" -->
<!-- 									name="pwd_rem" -->
<%-- 									<%if(CUS_PWD.length()>1) out.println("checked"); %> /> --%>
<!-- 									<div class="control__indicator"></div> </label> -->
									<span
									class="ml-auto "><a href="find_ID_PWD.do"
									class="forgot-pass find_id_pw">ID/PW 찾기</a></span>
							</div>

							<input onclick="checklogin()" type="button" value="로그인"
								class="btn btn-block py-2 btn-primary button_login"> <span
								class="text-center my-3 d-block">or</span>
							<input type="hidden" name="referer" value="${prevPage}">

							<div id="naver_id_login" style="text-align: center">
								<a href="${url}"> <img width="223"
									src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--   </div> -->


	<jsp:include page="footer.jsp" />


	<script>
    
   
    
    
    function checklogin(callback){
       
       var form = document.loginFrm;
       //login버튼이 button타입이면 페이지 이동이 일어나지 않는다./submit타입이면 페이지 이동이 일어남......(그래서 아래 포커스를 준 부분을 페이지에서 유지할 수 있음)
       if(form.CUS_ID.value == ""){
          alert('아이디를 입력해주세요.');
          setTimeout(function(){form.CUS_ID.focus();}, 1); //아이디 입력창으로 포커스를 줌
          return false;
       }
       else if(form.CUS_PWD.value == ""){
          alert('비밀번호를 입력해주세요.');
          form.CUS_PWD.focus();
//           setTimeout(function(){CUS_PWD.focus();}, 1);
          return false;
       }
       /*유효성 검사를 다 통과하면 자바스크립트 함수내에서 submit() 호출함.*/
       form.submit();
   }
    
    </script>






	<script src="${path}/resources/login_resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/login_resources/js/popper.min.js"></script>
	<script src="${path}/resources/login_resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/login_resources/js/main.js"></script>
</body>
</html>