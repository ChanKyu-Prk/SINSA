<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="#"><img class="header_sinsa_logo"
								src="${path}/resources/img/sinsa_logo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 서울시 금천구 가산디지털2로 123 월드메르디앙2차 4층 413호</li>
							<br>
							<li>Phone: +82 232 3235 759</li>
							<li>Email: sinsa@kosmo.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>About us</h6>
						<p>
							SINSA는 운동화 전문 온라인 쇼핑몰입니다.<br>운동화 구매는 SINSA와 함께하세요
						</p>
					</div>
					<div class="footer__widget">
						<h6>HELP US</h6>
						<ul>
							<li><a href="#">고객센터</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
					</div>

				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>FEATURES</h6>
						<ul>
							<li><a href="#">Brand</a></li>
							<li><a href="#">Men</a></li>
							<li><a href="#">Women</a></li>
							<li><a href="#">New</a></li>
							<li><a href="#">Best</a></li>
						</ul>
					</div>


				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
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