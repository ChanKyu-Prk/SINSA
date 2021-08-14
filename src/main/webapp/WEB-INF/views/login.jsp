<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${path}/resources/login_resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${path}/resources/login_resources/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${path}/resources/login_resources/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="${path}/resources/login_resources/css/style.css">

    <title>Login #5</title>
    
    <style>
    .login{
    margin:100px 0px !important;
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
    
    
  </head>
  <body>
  <jsp:include page="header.jsp"/>

<!--   <div class="d-md-flex half"> -->
<%--     <div class="bg" style="background-image: url('${path}/resources/login_resources/images/bg_1.jpg');"></div> --%>
    <div class="contents">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12 login">
            <div class="form-block mx-auto">
              <div class="text-center mb-5">
                <h3 class="text-uppercase"><strong>로그인</strong></h3>
              </div>
              <form action="login.do" method="post" name="loginFrm">
                <div class="form-group first">
                  <label for="username">Username</label>
                  <input type="text" name="CUS_ID" class="form-control" placeholder="아이디를 입력해주세요" id="username" value="<%=CUS_ID%>">
                  
                </div>
                <div class="form-group last mb-3">
                  <label for="password">Password</label>
                  <input type="password" name="CUS_PWD" class="form-control" placeholder="비밀번호를 입력해주세요" id="password" value="<%=CUS_PWD%>">
                </div>
                
                <div class="d-sm-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">아이디 저장</span>
                    <input type="checkbox" name="id_rem" <%if(CUS_ID.length()>1) out.println("checked"); %>/>
                    <div class="control__indicator"></div>
                    
                  </label>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">비밀번호 저장</span>
                    <input type="checkbox" name="pwd_rem" <%if(CUS_PWD.length()>1) out.println("checked"); %>/>
                    <div class="control__indicator"></div>
                    
                  </label>
                  <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                </div>

                <input onclick="checklogin()" type="button" value="Log In" class="btn btn-block py-2 btn-primary">

                <span class="text-center my-3 d-block">or</span>
                
                
                <div class="">
                <a href="#" class="btn btn-block py-2 btn-facebook">
                  <span class="icon-facebook mr-3"></span> Login with facebook
                </a>
                <a href="#" class="btn btn-block py-2 btn-google"><span class="icon-google mr-3"></span> Login with Google</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    
<!--   </div> -->
    
    
    <jsp:include page="footer.jsp"/>
    
    
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