<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@page import="kr.co.sinsa.biz.product.ProductVO"%>
<%@page import="kr.co.sinsa.biz.product.CartVO"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>sinsa</title>


   <jsp:include page="../header.jsp"/>
<style>
.header__top__right__auth {
   margin: 15px;
}


.shoping__cart__item{
   margin: 30px;
}

/* .before discount{ */
/*    text-decoration:line-through; */
/* } */

.changecount{
   border: 1px solid grey;
}
.sumup{
	color: black !important;
}
</style>

<% 
   ArrayList<ProductVO> productList = (ArrayList<ProductVO>) request.getAttribute("productList");
   ArrayList<CartVO> cartList = (ArrayList<CartVO>) request.getAttribute("cartList");
   DecimalFormat formatter = new DecimalFormat("###,###");
%>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>

<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>





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
                                    
                                    
                                    <%if(productList.get(i).getPRD_DISRATE() > 0){%>
                                    	<td class="shoping__cart__price" >
                                        
                                        <span class="before discount" style="text-decoration:line-through;"><%=formatter.format(productList.get(i).getPRD_PRICE())%>원</span>
                                        <br><%=formatter.format(productList.get(i).getPRD_PRICE() * (100-productList.get(i).getPRD_DISRATE())/100)%>원
                                        <input type="hidden" id="price<%=i %>" value="<%=productList.get(i).getPRD_PRICE()%>">
                                    </td>
                                    <%} %>
                                    <%if(productList.get(i).getPRD_DISRATE() == 0){%>
                                    	<td class="shoping__cart__price" >
                                        
                                        <%=formatter.format(productList.get(i).getPRD_PRICE() * (100-productList.get(i).getPRD_DISRATE())/100)%>원
                                        <input type="hidden" id="price<%=i %>" value="<%=productList.get(i).getPRD_PRICE()%>">
                                    </td>
                                    <%} %>
                                    
                                    
                                    
                                    <td class="shoping__cart__quantity">
                                    <span type="text">수량 : <%=cartList.get(i).getCART_PRDCOUNT()%></span>
                                        
                                    </td>
                                    <td class="shoping__cart__total">
                                        <span>
                                         <%=formatter.format((productList.get(i).getPRD_PRICE() * (100-productList.get(i).getPRD_DISRATE())/100) * cartList.get(i).getCART_PRDCOUNT())%>
                                        </span>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                    
                                    <%   
                                        for(int j=0; j<cartList.size(); j++){
                                        if(productList.get(i).getPRD_NUM() == cartList.get(j).getCART_PRDNUM()){%>
                                        
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
                        <a href="/index.do" class="primary-btn cart-btn cart-btn-right">쇼핑 계속하기</a>
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
                            <li>주문금액 <span class="sumup">
                            <%int sum1 = 0;
                               for(int i=0; i<productList.size(); i++){
                            		   sum1+=productList.get(i).getPRD_PRICE()*cartList.get(i).getCART_PRDCOUNT();
                               }%>
                            <%=formatter.format(sum1)%></span></li>
                            <li>할인금액 <span class="sumup">
                            <%int sum2 = 0;
                               for(int i=0; i<productList.size(); i++){
                                  sum2+=(productList.get(i).getPRD_PRICE() * productList.get(i).getPRD_DISRATE()/100)*cartList.get(i).getCART_PRDCOUNT();
                               }%>
                            <%=formatter.format(sum2)%></span></li>
                            <li>총 금액 <span>
                            <%=formatter.format(sum1-sum2)%></span>
                            </li>
                        </ul>
                        <a href="#" class="primary-btn">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    
   <!-- Button trigger modal -->
   <div id="locBtnCon" class="container mt-4">
      <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal"
         data-bs-target="#exampleModal">
         <i class="fas fa-map-marker-alt mr-1"></i>변경
      </button>
   </div>
   
   
    <!-- Modal -->
   <div class="modal fade " id="exampleModal" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">옵션변경</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
           <div class="modal-body ">
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal">취소</button>
            </div>
         </div>
      </div>
   </div>
    

    
<body onload="init();">
<script language="JavaScript">
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  
</script>

<%-- <form name="form" method="get"> --%>
<!-- 수량 : <input type=hidden name="sell_price" value="5500"> -->
<!-- <input type="text" name="amount" value="1" size="3" onchange="change();"> -->
<!-- <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br> -->

<!-- 금액 : <input type="text" name="sum" size="11" readonly>원 -->
<%-- </form> --%>
    
    
    

   <jsp:include page="../footer.jsp"/>
</body>

</html>