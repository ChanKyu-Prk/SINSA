<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SinSa</title>
    
    <script src="http://code.jquery.com/jquery-3.3.1.min.js">
	</script>

	<style>
.pagination {
	margin-top: 25px;
	margin-bottom: 25px;
	justify-content: center;
}
		
		#filter{
			border-top : 1px solid teal;
			border-bottom : 1px solid teal;
			padding-top: 18px;
			padding-bottom: 18px;
			margin-bottom: 70px;
		}
		#filter #search{
			background-color: gray;
			color: white;
			font-size: 25px;
			width: 100%;
			height: 60px;
			text-align: center;
			border: none;
		}
		
		.clicked{
			color: black;
		}
		
		ul.mySize > li {
			display:inline-block; width: 120px; padding: 5px 10px;
			background: #eee; border:1px solid #eee; text-align: center; position: relative;
		}
		ul.mySize > li:hover { background: #fff; }
		ul.mySize > li ul.li-size { display: none; position: absolute; top: 30px; left: 0; }
		ul.mySize > li:hover ul.li-size { z-index: 9999; display: inline-block; float: left; }
		ul.mySize > li ul.li-size > li { display: inline-block; float: left;   width: 120px; padding: 5px 10px; background: #eee; border:1px solid #eee; text-align: center;}
		ul.mySize > li ul.li-size > li:hover { background: #fff; }
	
	</style>


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">


</head>
<body>

<input type="hidden" value="${info.category }" id="categoryHidden">
<input type="hidden" value="${info.condition }" id="conditionHidden">
<input type="hidden" value="${info.orderby }" id="orderbyHidden">
<input type="hidden" value="${info.color }" id="colorHidden">
<input type="hidden" value="${info.minPrice }" id="minPriceHidden">
<input type="hidden" value="${info.maxPrice }" id="maxPriceHidden">
<input type="hidden" value="${info.keyWord }" id="keyWordHidden">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${path}/resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="${path}/resources/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
		<jsp:include page="../header.jsp" />
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                
                	<div class="hero__search d-flex justify-content-center">
						<div class="hero__search__form ">
							<form action="/product/List/all/newest/all/1?keyword=" method="get">
							
                                <input type="text" name="keyword" placeholder="찾으시는 상품을 검색해주세요" value = "${info.keyWord }">
                                <button type="button" id="searchBtn" class="site-btn" >검색</button>
                                <script>
                                	document.getElementById("searchBtn").onclick = function(){
                                		let keyword = document.getElementsByName("keyword")[0].value;
                                		console.log("검색중...!");

                                		location.href = "/product/List/all/newest/all/1?keyword="+keyword;
                                	};
                                </script>
                                
								
							</form>
						</div>
					</div>

                    
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${path}/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shoes Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>품목</h4>
                            <ul>
                           

	                                <li><a href="/product/List/${condition}/${info.orderby}/sneakers/1?keyword=${keyword }">Sneakers</a></li>
	                                <li><a href="/product/List/${condition}/${info.orderby}/converse/1?keyword=${keyword }">Converse</a></li>
	                                <li><a href="/product/List/${condition}/${info.orderby}/slipon/1?keyword=${keyword }">Slip-on</a></li>
	                                <li><a href="/product/List/${condition}/${info.orderby}/mule/1?keyword=${keyword }">Mule</a></li>
	                           

                            </ul>
                        </div>
                        
                    
                        <div id="filter">
                       
	                        <div class="sidebar__item">
	                            <h4>가격</h4>
	                            <!-- 
	                            <div class="price-range-wrap">

	                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
	                                    data-min="10" data-max="5000000">
	                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
	                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
	                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
	                                </div>
	                                <div class="range-slider">
	                                    <div class="price-input">
	                                        <input type="text" id="minamount">
	                                        <input type="text" id="maxamount">
	                                    </div>
	                                </div>
	                            </div>
	                             -->
	                             <div style="width: 248px">
	                             	<input class="price_input" id="minPrice" name="minPrice" type="text" value = "${info.minPrice }" placeholder="최소 금액 입력" maxlength="9" >
	                             	<span>원 ~</span><br /><br />
	                             	<input class="price_input" id="maxPrice" name="maxPrice" type="text" value = "${info.maxPrice }" placeholder="최대 금액 입력" maxlength="9" >
	                             	<span>원</span>
	                             </div>
	                        </div>
	                        <div id="color-box" class="sidebar__item sidebar__item__color--option">
	                            <h4>색상</h4>
	                            <div class="sidebar__item__color sidebar__item__color--white">
	                                <label for="white" id="id01" onmouseout="mout1()" onmouseover="mover1()">
	                                    White
	                                    <input type="checkbox" id="white" name="color" value="white">
	                                </label>

	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--gray">
	                                <label for="grey" id="id02" onmouseout="mout2()" onmouseover="mover2()">
	                                    Grey
	                                    <input type="checkbox" id="grey" name="color" value="grey">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--red">
	                                <label for="red" id="id03" onmouseout="mout3()" onmouseover="mover3()">
	                                    Red
	                                    <input type="checkbox" id="red" name="color" value="red">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--black">
	                                <label for="black" id="id04" onmouseout="mout4()" onmouseover="mover4()">
	                                    Black
	                                    <input type="checkbox" id="black" name="color" value="black">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--blue">
	                                <label for="blue" id="id05" onmouseout="mout5()" onmouseover="mover5()">
	                                    Blue
	                                    <input type="checkbox" id="blue" name="color" value="blue">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--green">
	                                <label for="green" id="id06" onmouseout="mout6()" onmouseover="mover6()">
	                                    Green
	                                    <input type="checkbox" id="green" name="color" value="green">
	                                </label>
	                            </div>
            
	                        </div>
	                
	                        
	                        <input id="search" type="button" value="조건 검색">
	                        

                        </div>
      
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <!-- 
                    <div class="product__discount">
                    
                        <div class="section-title product__discount__title">
                            <h2>특별한 가격으로 만나보세요~</h2>
                        </div>
                        
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/product/discount/pd-1.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">30.00원 <span>36.00원</span></div>
                                        </div>
                                        <ul class="product__item__pic__hover" style="bottom: 110px;">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"><b>바로구매</b></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                         -->
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                           
                            
                                <div class="filter__sort">
                <c:if test=""></c:if>
                                    <select class="orderbySelect">
                                        <option value="newest">신상품순</option>
                                        <option value="highprice" <c:if test="${info.orderby =='highprice'}">selected</c:if>>높은가격순</option>
                                        <option value="lowprice" <c:if test="${info.orderby =='lowprice'}">selected</c:if>>낮은가격순</option>
                                    </select>
                      
                                
                                
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                         
<%--                                     <h6><span>${page.count  }</span> Products found</h6> --%>
                            
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                <!-- 
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                 -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="list" items="${list }">
	                        <style>
                       			#modal${list.PRD_CODE } {
									display:none;
									position:absolute;
									width:100%;
									height:100%;
									z-index:999999;
								}
								
						
								#modal${list.PRD_CODE } .modal_content {
									width:300px;
									margin:100px auto;
									padding:20px 10px;
									background:#fff;
									border: 2px solid #666;
								}
	                        </style>
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="${path}/resources/img/product/${list.PRD_IMAGE }">
	                                </div>
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a id="modal_open_btn${list.PRD_CODE }"><i class="fa fa-retweet"><b>바로구매</b></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                    
				                    <div id="modal${list.PRD_CODE }">
										<div class="modal_content">
											<h2>바로구매</h2>
											<hr />
											
											<button type="button" id="">
												구매하기
											</button>
											<button type="button" id="modal_close_btn${list.PRD_CODE }">
												창 닫기
											</button>
										</div>
									</div>
	                                <div class="product__item__text">
										<p>
 											<h6>${list.PRD_NAME }</h6>												
 										</p>
                                   		<h5>${list.PRD_PRICE }원</h5>
                                	</div>
                            	</div>
                            	<script type="text/javascript">
                            		$('.product__item__pic').on('click', function(){
                            			var PRD_CODE = "${list.PRD_CODE}";
                            			location.href = "/product/prdCode="+PRD_CODE;
                            		})
                            
								    $("#modal_open_btn${list.PRD_CODE }").click(function(){
								        $("#modal${list.PRD_CODE }").attr("style", "display:block");
								    });
								   
								     $("#modal_close_btn${list.PRD_CODE }").click(function(){
								        $("#modal${list.PRD_CODE }").attr("style", "display:none");
								    });      
								</script>
	                        </div>


						</c:forEach>
                    </div>
                    

                    
		<ul class="pagination">
						<c:choose>
							<c:when test="${pageInfo.getPage()<=1}">
								<li class="page-item disabled"><a class="page-link"
									aria-disabled="true">이전</a></li>
							</c:when>
							<c:when test="${pageInfo.getStartPage()==1}">
								<li class="page-item"><a class="page-link"
									href="/product/List/${info.condition }/${info.orderby }/${info.category } 
									/${pageInfo.getStartPage()}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }"
									
									tabindex="-1">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/product/List/${info.condition }/${info.orderby }/${info.category } 
									/${pageInfo.getStartPage()-1}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }"
									tabindex="-1">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${pageInfo.getStartPage()}"
							end="${pageInfo.getEndPage()}" varStatus="state">
							<c:choose>
								<c:when test="${pageInfo.getPage()==state.index}">
									<li class="page-item active" aria-current="page"><a
										class="page-link">${state.index}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/product/List/${info.condition }/${info.orderby }/${info.category } 
									/${state.index}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }">${state.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${pageInfo.getPage() >= pageInfo.getMaxPage()}">
								<li class="page-item disabled"><a class="page-link"
									aria-disabled="true">다음</a></li>
							</c:when>
							<c:when test="${pageInfo.getEndPage()==pageInfo.getMaxPage()}">
								<li class="page-item"><a class="page-link"
									href="/product/List/${info.condition }/${info.orderby }/${info.category } 
									/${pageInfo.getEndPage()}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/product/List/${info.condition }/${info.orderby }/${info.category } 
									/${pageInfo.getEndPage()+1}?color=${info.color}&minPrice=${info.minPrice }
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }}">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="../footer.jsp" />  
    <!-- Footer Section End -->


</body>

<script type="text/javascript">






   
function mover1() {
	var m;
	m = document.getElementById("id01");
	m.style.color = "red";								
}
var clickCheck1 = "false";
function mout1() {
	var m;
	m = document.getElementById("id01");
    if(clickCheck1 === "false"){	                                	
    	m.style.color = "black";
    }									
}
$('#id01').on("click", function(e){
	var m;
	m = document.getElementById("id01");
	if(clickCheck1 === "false"){
// 		$('#white').val('white');
    	m.style.color = "red";
    	clickCheck1 = "true";
    	$('#white').attr('checked',true);
	}else if(clickCheck1 === "true"){
// 		$('#white').val('');
		m.style.color = "black";
    	clickCheck1 = "false";
       	$('#white').attr('checked',false);
	}
	return false;
});


function mover2() {
	var m;
	m = document.getElementById("id02");
	m.style.color = "red";								
}
var clickCheck2 = "false";
function mout2() {
	var m;
	m = document.getElementById("id02");
    if(clickCheck2 === "false"){	                                	
    	m.style.color = "black";
    }									
}
$('#id02').on("click", function(e){
	var m;
	m = document.getElementById("id02");
	if(clickCheck2 === "false"){
// 		$('#gray').val('gray');
    	m.style.color = "red";
    	clickCheck2 = "true";
    	$('#grey').attr('checked',true);
	}else if(clickCheck2 === "true"){
// 		$('#gray').val('');
		m.style.color = "black";
    	clickCheck2 = "false";
    	$('#grey').attr('checked',false);
	}
	return false;
});


function mover3() {
	var m;
	m = document.getElementById("id03");
	m.style.color = "red";								
}
var clickCheck3 = "false";
function mout3() {
	var m;
	m = document.getElementById("id03");
    if(clickCheck3 === "false"){	                                	
    	m.style.color = "black";
    }									
}
$('#id03').on("click", function(e){
	var m;
	m = document.getElementById("id03");
	if(clickCheck3 === "false"){
// 		$('#red').val('red');
    	m.style.color = "red";
    	clickCheck3 = "true";
    	$('#red').attr('checked',true);
	}else if(clickCheck3 === "true"){
// 		$('#red').val('');
		m.style.color = "black";
    	clickCheck3 = "false";
    	$('#red').attr('checked',false);
	}
	return false;
});


function mover4() {
	var m;
	m = document.getElementById("id04");
	m.style.color = "red";								
}
var clickCheck4 = "false";
function mout4() {
	var m;
	m = document.getElementById("id04");
    if(clickCheck4 === "false"){	                                	
    	m.style.color = "black";
    }									
}
$('#id04').on("click", function(e){
	var m;
	m = document.getElementById("id04");
	if(clickCheck4 === "false"){
// 		$('#black').val('black');
    	m.style.color = "red";
    	clickCheck4 = "true";
    	$('#black').attr('checked',true);
	}else if(clickCheck4 === "true"){
// 		$('#black').val('');
		m.style.color = "black";
    	clickCheck4 = "false";
    	$('#black').attr('checked',false);
	}
	return false;
});


function mover5() {
	var m;
	m = document.getElementById("id05");
	m.style.color = "red";								
}
var clickCheck5 = "false";
function mout5() {
	var m;
	m = document.getElementById("id05");
    if(clickCheck5 === "false"){	                                	
    	m.style.color = "black";
    }								
}
$('#id05').on("click", function(e){
	var m;
	m = document.getElementById("id05");
	if(clickCheck5 === "false"){
// 		$('#blue').val('blue');
    	m.style.color = "red";
    	clickCheck5 = "true";
    	$('#blue').attr('checked',true);
	}else if(clickCheck5 === "true"){
// 		$('#blue').val('');
		m.style.color = "black";
    	clickCheck5 = "false";
    	$('#blue').attr('checked',false);
	}
	return false;
});


function mover6() {
	var m;
	m = document.getElementById("id06");
	m.style.color = "red";								
}
var clickCheck6 = "false";
function mout6() {
	var m;
	m = document.getElementById("id06");
    if(clickCheck6 === "false"){	                                	
    	m.style.color = "black";
    }
}
$('#id06').on("click", function(e){
	var m;
	m = document.getElementById("id06");
	if(clickCheck6 === "false"){
// 		$('#green').val('green');
    	m.style.color = "red";
    	clickCheck6 = "true";
    	$('#green').attr('checked',true);
	}else if(clickCheck6 === "true"){
// 		$('#green').val('');
		m.style.color = "black";
    	clickCheck6 = "false";
    	$('#green').attr('checked',false);
	}
	return false;
});


$(document).ready( function() { 
	var colors= $('#colorHidden').val();
	var colorsArray = colors.split('_');
	var m1 = document.getElementById("id01");
	var m2 = document.getElementById("id02");
	var m3 = document.getElementById("id03");
	var m4 = document.getElementById("id04");
	var m5 = document.getElementById("id05");
	var m6 = document.getElementById("id06");
	for ( var i in colorsArray ) {
        if(colorsArray[i]=='white'){
        	m1.style.color = "red";
        	clickCheck1 = "true";
        	$('#white').attr('checked',true);
        }
        if(colorsArray[i]=='grey'){
        	m2.style.color = "red";
        	clickCheck2 = "true";
        	$('#grey').attr('checked',true);
        }
        if(colorsArray[i]=='red'){
        	m3.style.color = "red";
        	clickCheck3 = "true";
        	$('#red').attr('checked',true);
        }
        if(colorsArray[i]=='black'){
        	m4.style.color = "red";
        	clickCheck4 = "true";
        	$('#black').attr('checked',true);
        }
        if(colorsArray[i]=='blue'){
        	m5.style.color = "red";
        	clickCheck5 = "true";
        	$('#blue').attr('checked',true);
        }
        if(colorsArray[i]=='green'){
        	m6.style.color = "red";
        	clickCheck6 = "true";
        	$('#green').attr('checked',true);
        }
      }
});




$('.li-size').find('li').on('click', function(){
	var newDiv = document.createElement("div");
	var size = $(this).html();
	newDiv.setAttribute( 'name', size );
	newDiv.setAttribute( 'value', size );
	newDiv.setAttribute( 'id', size );
	newDiv.innerHTML = size;
	var sidebar__item__id = document.getElementById("sidebar__item__id");
	sidebar__item__id.appendChild(newDiv);
});


$('#search').on('click', function(){
	var minPrice = $('#minPrice').val();
	var maxPrice = $('#maxPrice').val();
	var condition = $('#categoryHidden').val()
	var category  = $('#conditionHidden').val();
	var orderby = $('#orderbyHidden').val();
	var keyWord = $('#keyWordHidden').val();
	var color = "";
	$("input[name='color']:checked").each(function(i){
		color += $(this).val()+'_';
	});
	color = color.slice(0, -1);

	location.href = "/product/List/"+condition+"/"+orderby+"/"+category+"/1"
			+"?color="+color
			+"&minPrice="+minPrice
			+"&maxPrice="+maxPrice
			+"&keyWord="+keyWord;
});




$('.orderbySelect').on("change", function(){
	var minPrice = $('#minPriceHidden').val();
	var maxPrice = $('#maxPriceHidden').val();
	var condition = $('#categoryHidden').val()
	var category  = $('#conditionHidden').val();
	var keyWord = $('#keyWordHidden').val();
	var color = $('#colorHidden').val();
	
	var orderby = $('.orderbySelect').val();
	
	location.href = "/product/List/"+condition+"/"+orderby+"/"+category+"/1"
	+"?color="+color
	+"&minPrice="+minPrice
	+"&maxPrice="+maxPrice
	+"&keyWord="+keyWord;
});
</script>
</html>