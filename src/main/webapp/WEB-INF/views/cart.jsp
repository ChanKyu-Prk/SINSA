<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@page import="kr.co.sinsa.biz.customer.ProductVO"%>
<%@page import="kr.co.sinsa.biz.customer.CartVO"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>sinsa</title>



<style>
.header__top__right__auth {
	margin: 15px;
}


.shoping__cart__item{
	margin: 30px;
}

/* .before discount{ */
/* 	text-decoration:line-through; */
/* } */

.changecount{
	border: 1px solid grey;
}
</style>

<% 
	ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("productList");
	ArrayList<CartVO> cartList = (ArrayList<CartVO>) request.getAttribute("cartList");
%>


</head>

<body>
	<jsp:include page="header.jsp"/>






    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${path}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="index.do">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th></th>
                                </tr>
                            </thead>
                            
                            
                            <tbody>
                         
                            
                            <%if(productList.size() != 0 || productList != null){
                            	for(int i=0; i<productList.size(); i++){%>
                            	
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="${path}/resources/img/cart/cart-1.jpg" alt="">
                                        <h5>[<%=productList.get(i).getPRD_BRAND()%>] <%=productList.get(i).getPRD_NAME()%><br>
                                        	
                                        <%	
                                        for(int j=0; j<cartList.size(); j++){
                            				if(productList.get(i).getPRD_NUM() == cartList.get(j).getCART_PRDNUM()){%>
                            					사이즈:<%=cartList.get(j).getCART_PRDSIZE()%>
                            				<%}
                            			}
                            			%>
                                        </h5><br>
                                       
                                        
                                    </td>
                                    <td class="shoping__cart__price" >
                                        <span class="before discount" style="text-decoration:line-through;"><%=productList.get(i).getPRD_PRICE()%>원</span>
                                        <%=productList.get(i).getPRD_PRICE() * (100-productList.get(i).getPRD_DISRATE())/100%>원
                                        <input type="hidden" value="<%=productList.get(i).getPRD_PRICE()%>">
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="<%=cartList.get(i).getCART_PRDCOUNT()%>">
                                            </div>
                                        </div>
                                        <a href="#" class="primary-btn cart-btn changecount">&nbsp;변&nbsp;&nbsp;&nbsp;경&nbsp;</a>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <span></span>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                    
                                    <%	
                                        for(int j=0; j<cartList.size(); j++){
                            				if(productList.get(i).getPRD_NUM() == cartList.get(j).getCART_PRDNUM()){%>
                            					<br>
                            					<form action="cart.do" method="post">
                                    				<input type="hidden" id="CART_PRDNUM" name="CART_PRDNUM" value="<%=cartList.get(j).getCART_PRDNUM()%>">
                                    				<button class="icon_close" type="submit"></button>
                                    			</form>
                            					
                            				<%}
                            			}
                            			%>
                                    
                                    </td>
                                </tr>
                                <% }
                                }%>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">쇼핑 계속하기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
<!--                         <div class="shoping__discount"> -->
<!--                             <h5>Discount Codes</h5> -->
<%--                             <form action="#"> --%>
<!--                                 <input type="text" placeholder="Enter your coupon code"> -->
<!--                                 <button type="submit" class="site-btn">APPLY COUPON</button> -->
<%--                             </form> --%>
<!--                         </div> -->
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>결제예정금액</h5>
                        <ul>
                            <li>주문금액 <span>
                            <%int sum1 = 0;
                            	for(int i=0; i<productList.size(); i++){
                            		sum1+=productList.get(i).getPRD_PRICE();
                            	}%>
                            <%=sum1%></span></li>
                            <li>할인금액 <span>
                            <%int sum2 = 0;
                            	for(int i=0; i<productList.size(); i++){
                            		sum2+=productList.get(i).getPRD_PRICE() * productList.get(i).getPRD_DISRATE()/100;
                            	}%>
                            <%=sum2%></span></li>
                            <li>총 금액 <span>
                            <%int sum3 = 0;
                            	for(int i=0; i<productList.size(); i++){
                            		sum3+=productList.get(i).getPRD_PRICE() * (100-productList.get(i).getPRD_DISRATE())/100;
                            	}%>
                            <%=sum3%></span>
                            </li>
                        </ul>
                        <a href="#" class="primary-btn">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

	<jsp:include page="footer.jsp"/>
</body>
<script>


</script>
</html>