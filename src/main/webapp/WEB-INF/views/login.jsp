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
  </head>
  <body>
  

  <div class="d-md-flex half">
    <div class="bg" style="background-image: url('${path}/resources/login_resources/images/bg_1.jpg');"></div>
    <div class="contents">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="form-block mx-auto">
              <div class="text-center mb-5">
                <h3 class="text-uppercase"><strong>LOGIN</strong></h3>
              </div>
              <form action="login.do" method="post">
                <div class="form-group first">
                  <label for="username">Username</label>
                  <input type="text" name="CUS_ID" class="form-control" placeholder="아이디" id="username">
                </div>
                <div class="form-group last mb-3">
                  <label for="password">Password</label>
                  <input type="password" name="CUS_PWD" class="form-control" placeholder="비밀번호" id="password">
                </div>
                
                <div class="d-sm-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Remember me</span>
                    <input type="checkbox" checked="checked"/>
                    <div class="control__indicator"></div>
                  </label>
                  <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                </div>

                <input type="submit" value="Log In" class="btn btn-block py-2 btn-primary">

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

    
  </div>
    
    

    <script src="${path}/resources/login_resources/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/login_resources/js/popper.min.js"></script>
    <script src="${path}/resources/login_resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/login_resources/js/main.js"></script>
  </body>
</html>