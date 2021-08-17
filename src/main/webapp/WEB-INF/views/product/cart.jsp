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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>sinsa</title>
<script src="https://kit.fontawesome.com/848d8f1fa9.js" crossorigin="anonymous"></script>

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

.previousPrice { 
 	text-decoration:line-through !important;
 	color:grey;
} 
.previousTotalPrice{
	text-decoration:line-through !important;
 	color:grey;
}
.throwout{
	margin: 0px 5px 0px 0px;
}

/* .noProduct{ */
/* 	width:50px !important; */
/* 	height:50px */
/* } */

.noProduct{ 
	text-align: center !important; 
} 

.noProductIcon{
	margin: 100px 0px 40px 0px;
}

.optionModal{
	height: 500px;
}

.countselectbox{
	height:32px;
    line-height: 30px;
    box-sizing: border-box !important;
    z-index: 10 !important;
    
    size:3 !important;
}

.nice-select .list {
	max-height: 200px;
	overflow: scroll !important;
}

.modal-body{
	height: 500px !important;
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
                            
                            
                            <c:if test="${fn:length(cartList) != 0}">
                            <c:forEach var="list" items="${userCartProductStockList}" varStatus="status">
                           		
                                <tr>
                                
                                    <td class="shoping__cart__item">
                                    <div class="row">
                                    
										<div class="col-lg-3 col-md-9">
                                        <img src="${path}/resources/img/cart/cart-1.jpg" alt="">
                                        </div>
                                        
                                        <div class="col-lg-9 col-md-3">
                                        [${list.PRD_BRAND}]<br> ${list.PRD_NAME}<br>${list.PRD_CODE}<br>사이즈 : ${list.CART_PRDSIZE}
                                        
                                        
                                        
                                        <!-- Button trigger modal -->
										<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}">변경</button>


													<!-- Modal -->
													<div class="modal fade " id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel${status.index}" aria-hidden="true">
														<div class="modal-dialog modal-dialog-scrollable">
															<div class="modal-content optionModal">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel${status.index}">옵션변경</h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																
																
																<form action="updatesize.do" method="POST" onsubmit="return alert('사이즈가 변경되었습니다');">
																<div class="modal-body ">

																	
																	<div class="row">
																	<div class="col-lg-3 col-md-9">
																	<img src="${path}/resources/img/cart/cart-1.jpg" alt="">
																	
																	</div>
																	
																	<div class="col-lg-9 col-md-3">
                                        							<h5>[${list.PRD_BRAND}]<br> ${list.PRD_NAME}<br>${list.PRD_CODE}<br>사이즈 : ${list.CART_PRDSIZE}</h5>
																	
																	</div>
																	
																	</div>
																	
																	<div>
																	<hr>





																				<div>
																					<select id="list" class="list" name="CART_PRDSIZE">
																						<option value="" disabled selected>선택하세요</option>
																						<c:choose>
																							<c:when
																								test="${list.STOCK_220 > 0 and list.CART_PRDSIZE ne '220'}">
																								<option value="220">220</option>
																							</c:when>
																							<c:when
																								test="${list.STOCK_220 > 0 and list.CART_PRDSIZE eq '220'}">
																								<option value="220" selected>220</option>
																							</c:when>
																						</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_225 > 0 and list.CART_PRDSIZE ne '225'}">
																									<option value="225">225</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_225 > 0 and list.CART_PRDSIZE eq '225'}">
																									<option value="225" selected>225</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_230 > 0 and list.CART_PRDSIZE ne '230'}">
																									<option value="230">230</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_230 > 0 and list.CART_PRDSIZE eq '230'}">
																									<option value="230" selected>230</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_235 > 0 and list.CART_PRDSIZE ne '235'}">
																									<option value="235">235</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_235 > 0 and list.CART_PRDSIZE eq '235'}">
																									<option value="235" selected>235</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_240 > 0 and list.CART_PRDSIZE ne '240'}">
																									<option value="240">240</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_240 > 0 and list.CART_PRDSIZE eq '240'}">
																									<option value="240" selected>240</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_245 > 0 and list.CART_PRDSIZE ne '245'}">
																									<option value="245">245</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_245 > 0 and list.CART_PRDSIZE eq '245'}">
																									<option value="245" selected>245</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_250 > 0 and list.CART_PRDSIZE ne '250'}">
																									<option value="250">250</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_250 > 0 and list.CART_PRDSIZE eq '250'}">
																									<option value="250" selected>250</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_255 > 0 and list.CART_PRDSIZE ne '255'}">
																									<option value="255">255</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_255 > 0 and list.CART_PRDSIZE eq '255'}">
																									<option value="255" selected>255</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_260 > 0 and list.CART_PRDSIZE ne '260'}">
																									<option value="260">260</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_260 > 0 and list.CART_PRDSIZE eq '260'}">
																									<option value="260" selected>260</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_265 > 0 and list.CART_PRDSIZE ne '265'}">
																									<option value="265">265</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_265 > 0 and list.CART_PRDSIZE eq '265'}">
																									<option value="265" selected>265</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_270 > 0 and list.CART_PRDSIZE ne '270'}">
																									<option value="270">270</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_270 > 0 and list.CART_PRDSIZE eq '270'}">
																									<option value="270" selected>270</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_275 > 0 and list.CART_PRDSIZE ne '275'}">
																									<option value="275">275</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_275 > 0 and list.CART_PRDSIZE eq '275'}">
																									<option value="275" selected>275</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_280 > 0 and list.CART_PRDSIZE ne '280'}">
																									<option value="280">280</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_280 > 0 and list.CART_PRDSIZE eq '280'}">
																									<option value="280" selected>280</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_285 > 0 and list.CART_PRDSIZE ne '285'}">
																									<option value="285">285</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_285 > 0 and list.CART_PRDSIZE eq '285'}">
																									<option value="285" selected>285</option>
																								</c:when>
																							</c:choose>
																							<c:choose>
																								<c:when
																									test="${list.STOCK_290 > 0 and list.CART_PRDSIZE ne '290'}">
																									<option value="290">290</option>
																								</c:when>
																								<c:when
																									test="${list.STOCK_290 > 0 and list.CART_PRDSIZE eq '290'}">
																									<option value="290" selected>290</option>
																								</c:when>
																							</c:choose>
																						
																					</select>
																				</div>
																				<div>
																					<input type="submit" value="확인" />
																				</div>
																			</div>
																	<div>
																	
																	<input type="hidden" name="CART_NUM" value="${list.CART_NUM}"/>
																	</div>
																</div>
																
																</form>
																
															</div>
														</div>
													</div>
													</div>
													</div>
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
                                    
                                    
                                    
                                    <form action="updatecart.do" method="POST" onsubmit="return alert('수량이 변경되었습니다');">
                                    	<div class="quantity">
                                        	<div class="pro-qty">
          										<input id="count" name="CART_PRDCOUNT" value="${list.CART_PRDCOUNT}" readonly />
                                    		</div>
                                    	</div>
                                    	<input type="hidden" name="CART_NUM" value="${list.CART_NUM}" />
                                    	
                                    	<input type="submit" value="변경" />
                                    	
                                    </form>
                                    
                                    </td>
                                    <td class="shoping__cart__total">
                                    <c:set var="previousTotalPrice" value="${price * list.CART_PRDCOUNT}"/>
                                    <c:set var="discountedTotalPrice" value="${discountedPrice * list.CART_PRDCOUNT}"/>
                                    
                                    <c:if test="${disRate > 0}">
                                    <div class="previousTotalPrice"><fmt:formatNumber value="${previousTotalPrice}" pattern="#,###" /></div>
                                    <fmt:formatNumber value="${discountedTotalPrice}" pattern="#,###" />
                                    </c:if>
                                    
                                    <c:if test="${disRate == 0}">
                                    <fmt:formatNumber value="${discountedTotalPrice}" pattern="#,###" />
                                    </c:if>
                                    
                                        
                                        <div id="previousTotalPrice"></div>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                    
                                    	<input type="submit" value="바로구매"/>
                                    
                                    	<form id="form" name="form" action="cart.do" method="post" onsubmit="return confirm('장바구니에서 해당 상품을 삭제 하시겠습니까?');">
                                    	
                                    		<input type="hidden" id="CART_PRDNUM" name="CART_PRDNUM" value="${list.CART_PRDNUM }">
                                    		<input type="hidden" id="CART_PRDSIZE" name="CART_PRDSIZE" value="${list.CART_PRDSIZE }">
                                    		<input type="hidden" id="CUS_ID" name="CUS_ID" value="${list.CUS_ID }">
                                    		<input type="submit" value="삭제" onclick="delete_event();"/>
                                    		
                                    		
                                        </form>
                                        <br>
                                        <input type="submit" value="상품보기"/>
                                        
                                    </td>
                                </tr>
                                
                            </c:forEach>
                            </c:if>
                            </tbody>
                            
                            
                        </table>
                    </div>
                    
                </div>
            </div>
            
            <c:if test="${fn:length(cartList) == 0}">
            <div class="noProduct">
            	<div class="noProductIcon"><i class="fas fa-exclamation-circle fa-9x"></i></div>
                  	 <div><h3>장바구니에 담긴 상품이 없습니다.</h3></div>
            </div>               
            </c:if>
            
            <c:if test="${fn:length(cartList) != 0}">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="/" class="primary-btn cart-btn cart-btn-right keepshopping">쇼핑 계속하기</a>
                        
                        <form name="deleteAll" action="deleteAllCart.do" method="post" onsubmit="return confirm('장바구니를 비우시겠습니까?');">
                        <input type="hidden" name="CUS_ID" value="${list.CUS_ID}"/>
                        <input type="submit" class="primary-btn cart-btn cart-btn-right throwout" value="장바구니 비우기"/>
                        </form>
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
            
          </c:if>



			



		</div>
    </section>
    <!-- Shoping Cart Section End -->
    
   
    
    
    
    
    

<script>
	// function delete_event(){

	// 	if (confirm('장바구니에서 해당 상품을 삭제 하시겠습니까?');) {
	// 		document.getElementById('form').submit();
	// 	}else{
	// 		return false;
	// 	}
	// }

	// function updateCount_event(){

	// 	alert('수량이 변경되었습니다');
	// }
</script>


	<script>
		function choose(size) {
			var resultElement = document.getElementById('result');

			var writeSize = resultElement.innerText;

			if (size === '220') {
				writeSize = "220";
			}
			else if (size === '225') {
				writeSize = "225";
			}
			else if (size === '230') {
				writeSize = "230";
			}
			else if (size === '235') {
				writeSize = "235";
			}
			else if (size === '240') {
				writeSize = "240";
			}
			else if (size === '245') {
				writeSize = "245";
			}
			else if (size === '250') {
				writeSize = "250";
			}
			else if (size === '255') {
				writeSize = "255";
			}
			else if (size === '260') {
				writeSize = "260";
			}
			else if (size === '265') {
				writeSize = "265";
			}
			else if (size === '270') {
				writeSize = "270";
			}
			else if (size === '275') {
				writeSize = "275";
			}
			else if (size === '280') {
				writeSize = "280";
			}
			else if (size === '285') {
				writeSize = "285";
			}
			else if (size === '290') {
				writeSize = "290";
			}

			resultElement.innerText = writeSize;

		}
	</script>


	<jsp:include page="../footer.jsp"/>
</body>

</html>