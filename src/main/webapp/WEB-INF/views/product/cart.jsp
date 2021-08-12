<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

.previousPrice{ 
 	text-decoration:line-through !important;
 	color:grey;
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
                                    <th class="shoping__product">상품 [<%=productList.size()%>개] </th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>합계</th>
                                    <th></th>
                                </tr>
                            </thead>
                            
                            
                            <tbody>
                            
                            <c:forEach var="list" items="${userCartProductStockList}" varStatus="theCount">
                           
                                <tr>
                                
                                    <td class="shoping__cart__item">
                                    
                                        <img src="${path}/resources/img/cart/cart-1.jpg" alt="">
                                        <h5>[${list.PRD_BRAND}] ${list.PRD_NAME}<br><br>사이즈 : ${list.CART_PRDSIZE}<input type="submit" value="옵션변경"/></h5>
                                      
                                    </td>
                                    <td class="shoping__cart__price">
                                    	<input type="hidden" id="price" value="${list.PRD_PRICE }"/>
                                        <c:set var="price" value="${list.PRD_PRICE}"/>
                                        <c:set var="disRate" value="${list.PRD_DISRATE}"/>
                                        <c:set var="discountedPrice" value="${list.PRD_PRICE-list.PRD_DISRATE*list.PRD_PRICE/100}"/>
                                        
                                        <c:if test="${disRate > 0}">
                                        <div class="previousPrice" ><fmt:formatNumber value="${price}" pattern="#,###" /></div>
                                        <fmt:formatNumber value="${discountedPrice}" pattern="#,###" />
                                        </c:if>
                                        
                                        <c:if test="${disRate == 0}">
                                        <fmt:formatNumber value="${price}" pattern="#,###" />
                                        </c:if>
                                        
                                    </td>
                                    <td class="shoping__cart__quantity">
          
          							<form action="#">
          							<input type="hidden" name="CART_PRDNUM" value="${list.CART_PRDNUM}" />
          							
          							<input id="count" name="CART_PRDCOUNT" value="${list.CART_PRDCOUNT }" /><br>
          							<input type="submit" value="변경"/>
                                    </form>
                                    
                
                                    </td>
                                    <td class="shoping__cart__total">
                                        <c:set var="totalPrice" value="${discountedPrice * list.CART_PRDCOUNT}"/>
                                        <fmt:formatNumber value="${totalPrice}" pattern="#,###" />
                                        <div id="totalprice"></div>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                    
                                    	<input type="submit" value="바로구매"/>
                                    
                                    	<form id="form" name="form" action="cart.do" method="post" onsubmit="return confirm('장바구니에서 해당 상품을 삭제 하시겠습니까?');">
                                    	
                                    		<input type="hidden" id="CART_PRDNUM" name="CART_PRDNUM" value="${list.CART_PRDNUM }">
                                    		<input type="submit" value="삭제" onclick="button_event();"/>
                                    		
                                        </form>
                                        <br>
                                        <input type="submit" value="상품보기"/>
                                        
                                    </td>
                                </tr>
                                
                       
                            </c:forEach>
                            </tbody>
                            
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="/" class="primary-btn cart-btn cart-btn-right">쇼핑 계속하기</a>
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
    
    
    
    
    
<script>

var countList=document.querySelectorAll("#count");
var priceList=document.querySelectorAll("#price");
var totalpriceList=document.querySelectorAll("#totalprice");


for(var i=0; i < countLength; i++){
    countList[i].addEventListener('input',onIncreaseCountHandler)
    };
   


function onIncreaseCountHandler(e) {

	for(var i=0; i<countList.length; i++){

		totalpriceList[i].innerText=priceList[i].value*countList[i].value;
	}
}


</script>

<script>

function button_event(){
	

	if (confirm('장바구니에서 해당 상품을 삭제 하시겠습니까?');) {
		document.getElementById('form').submit();
	}else{
		return false;
	}
}

</script>



    

   <jsp:include page="../footer.jsp"/>
</body>

</html>