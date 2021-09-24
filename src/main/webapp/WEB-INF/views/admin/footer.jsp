<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>Insert title here</title>
</head>

<body>

<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="/" style="text-align: right;"><img class="header_sinsa_logo"
								src="${path}/resources/img/sinsa_logo.png" alt="LOGO" style="width:50%;"></a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 ">
					<div class="footer__widget">
						<h6>About us</h6>
						<p>
							SINSA는 운동화 전문 온라인 쇼핑몰입니다.<br>운동화 구매는 SINSA와 함께하세요
						</p>
					</div>
					

				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text" style="width:100%;">
							<p style="text-align:center">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy; Team SINSA 2021. All rights reserved
								SINSA (박찬규, 정인호, 권혁재, 이보배, 정혁희, 한다연)<!-- <button type="button" class="btn btn-outline-success" onclick="location.href='/adminLogin'">바로가기</button>  -->
								<!-- <button type="button" onclick="location.href='/adminLogin'">바로가기</button> -->
								<%-- <a type="button" href="${pageContext.request.contextPath}/adminLogin" title="주문관리페이지로 이동">바로가기</a> --%>
							</p>
						</div>
						<div class="footer__copyright__payment"></div>
					</div>
				</div>
			</div>
		</div>
		
		
	</footer>
	<!-- Footer Section End -->

</body>
</html>