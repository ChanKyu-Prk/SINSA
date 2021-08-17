<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@page import="kr.co.sinsa.biz.product.ProductVO"%>
<%@page import="kr.co.sinsa.biz.product.CartVO"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../header.jsp" />


	<div class="contact-form spad">
		<div class="container">
			<div class="row">
			
			
			
			
			<div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            
                            <tbody>
                                <tr>
                                    <td class="shoping__cart__item">
                                    <div class="row">
                                    <div class="col-lg-2 col-md-10">
                                        <img src="${path}/resources/img/cart/cart-3.jpg" alt="">
                                    </div>
                                    
                                    <div class="col-lg-10 col-md-2">    
                                        <h5>${productVO.PRD_BRAND}<br>
                                        	${productVO.PRD_NAME}<br>
                                        	${productVO.PRD_PRICE}원<br>
                                        </h5>
                                        	<div><span>리뷰 : ${fn:length(reviewList)}&nbsp;&nbsp;&nbsp;</span><span>평점 : </span></div>
                                    </div>   
                                    </div>
                                    </td>
                                    
                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                
			
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2>상품 리뷰</h2>
					</div>
				</div>
			</div>
			<form action="#">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<input type="text" placeholder="Your name">
					</div>
					<div class="col-lg-12 text-center">
						<input type="text" placeholder="제목">
					</div>
					<div class="col-lg-12 text-center">
						<textarea placeholder="내용"></textarea>
						<button type="submit" class="site-btn">리뷰 작성</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<form action="insertBoard.do" method="post" enctype="multipart/form-data">
<table border="1" cellpadding="0" cellspacing="0">

<tr>
	<td bgcolor="orange" width="70">업로드</td><td align="left">
	<input type="file" name="uploadFile"></textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value=" 새글 등록 "/></td>
</tr>
</table>
</form>





	<jsp:include page="../footer.jsp" />



</body>
</html>