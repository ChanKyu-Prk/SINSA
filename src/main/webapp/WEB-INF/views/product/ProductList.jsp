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
    <link rel="stylesheet" href="${path}/resources/css/productList.css" type="text/css">
   	<link rel="stylesheet" type="text/css" href="${path}/resources/css/base.css" />
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/buttons.css" />
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/productlist.js" type="text/javascript"></script>
	<style>
		.sizeList{ text-align: center; }
		.pagination { margin-top: 25px; margin-bottom: 25px; justify-content: center; }
		#filter{border : 1px solid teal; padding : 10px 10px 10px 10px; margin-bottom: 70px;}
		#sidebar__item__menu{border : 1px solid teal; border-bottom : 0px solid teal; padding : 10px 10px 10px 10px; }
		#filter #search{ background-color: gray; color: white; font-size: 25px; 
						width: 100%; height: 60px; text-align: center;border: none;}
		.clicked{ color: black; }
		ul.mySize > li { display:inline-block; width: 120px; padding: 5px 10px;
						 background: #eee; border:1px solid #eee; text-align: center; position: relative; }
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
                                <input type="text" name="keyword" placeholder="찾으시는 상품을 검색해주세요" value = "">
                                <button type="button" id="searchBtn" class="site-btn" >검색</button>
                                <script>
                                	document.getElementById("searchBtn").onclick = function(){
                                		let keyword = document.getElementsByName("keyword")[0].value;
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
                <div class="col-lg-3 col-md-5" style="padding-top: 85px;">
                    <div class="sidebar">
                        <div class="sidebar__item" id="sidebar__item__menu">
                            <h4>품목</h4>
                            <ul>
                               <li><a href="/product/List/${condition}/${info.orderby}/sneakers/1?keyword=${keyword }">Sneakers</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/converse/1?keyword=${keyword }">Converse</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/slipon/1?keyword=${keyword }">Slip-on</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/mule/1?keyword=${keyword }">Mule</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/sandals/1?keyword=${keyword }">Sandals/Slipper</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/running/1?keyword=${keyword }">Running</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/basketball/1?keyword=${keyword }">Basketball</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/soccer/1?keyword=${keyword }">Soccer</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/golf/1?keyword=${keyword }">Golf</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/outdoor/1?keyword=${keyword }">Outdoor</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/tennis/1?keyword=${keyword }">Tennis</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/training/1?keyword=${keyword }">Training</a></li>
                               <li><a href="/product/List/${condition}/${info.orderby}/skating/1?keyword=${keyword }">Skating</a></li>
                            </ul>
                        </div>
                        <div id="filter">
	                        <div class="sidebar__item">
                            	<h4>가격</h4>
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
	                                <label for="PK" id="id06" onmouseout="mout6()" onmouseover="mover6()">
	                                    PK
	                                    <input type="checkbox" id="PK" name="color" value="PK">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--white">
	                                <label for="MULTI" id="id07" onmouseout="mout7()" onmouseover="mover7()">
	                                    MULTI
	                                    <input type="checkbox" id="MULTI" name="color" value="MULTI">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--white">
	                                <label for="BG" id="id08" onmouseout="mout8()" onmouseover="mover8()">
	                                    BG
	                                    <input type="checkbox" id="BG" name="color" value="BG">
	                                </label>
	                            </div>
	                            <div class="sidebar__item__color sidebar__item__color--white">
	                                <label for="YELLOW" id="id09" onmouseout="mout9()" onmouseover="mover9()">
	                                    YELLOW
	                                    <input type="checkbox" id="YELLOW" name="color" value="YELLOW">
	                                </label>
	                            </div>
	                        </div>
	                        <input id="search" type="button" value="조건 검색">
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item" style="border-top-width: 0px;">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
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
                          <c:forEach var="list" items="${list }" varStatus="status">
	                        <style>
                       			#modal${list.PRD_CODE } {
                       				display:none; position:absolute; width:100%; height:60%; z-index:999999;
								}
								#cartModal${list.PRD_CODE } {
									display:none; position:absolute; width:100%; height:60%; z-index:999999;
								}
								#modal${list.PRD_CODE } .modal_content {
									width:450px; height:330px; margin:50px auto; padding:20px 10px; 
									background:#fff; border: 2px solid #666;
								}
								#cartModal${list.PRD_CODE } .modal_content {
									width:450px; height:330px; margin:50px auto; padding:20px 10px;
									background:#fff; border: 2px solid #666;
								}
								#btnBuy${list.PRD_NUM } {padding-top: 0px; padding-bottom: 0px; height: 41px; width: 221px; display: inline-block;}
								#bBchild${list.PRD_NUM }{
									margin-top: 2px; margin-bottom: 2px; margin-right: 2px; margin-left: 2px; padding-top: 5px;
    								padding-bottom: 5px; height: 37px; width: 217px;
   								}
   								#ajaxToCart${list.PRD_CODE } {padding-top: 0px; padding-bottom: 0px; height: 41px; width: 221px; display: inline-block;}
   								.cartSize${list.PRD_NUM }{ top: -14px; position: relative;}
   								.product__item__detail${list.PRD_NUM }{cursor: pointer}
	                        </style>
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg product__item__detail${list.PRD_NUM }" data-setbg="${path}/resources/img/product/${list.PRD_IMAGE }"></div>
                                    	<ul class="product__item__pic__hover">
                                        <li>
                                        	<a class="jjimBtn"><input type="hidden" value= "${list.PRD_NUM}" class="prdnumj">
												<c:if test="${jjimcheck[status.index]==0}">
													<i class="fa fa-heart-o"></i>
												</c:if>
												<c:if test="${jjimcheck[status.index]==1}">
													<i class="fa fa-heart"></i>
												</c:if>
											</a>
										</li>
                                        <li><a id="modal_open_btn${list.PRD_CODE }" class="listToBuy${list.PRD_CODE }"><i class="fa fa-retweet"><b>바로구매</b></i></a></li>
                                        <li><a id="cartModal_open_btn${list.PRD_CODE }" class="listToCart${list.PRD_CODE }"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
				                    <div id="modal${list.PRD_CODE }">
										<div class="modal_content">
											<h4 style="display:inline-block; margin-right: 294px;">옵션선택</h4>
											<button type="button" id="modal_close_btn${list.PRD_CODE }">
													<b>X</b>
											</button>
											<hr />
											<div id="p-Box">
												<div id="p-Img">
													<img alt="${list.PRD_IMAGE }" width="250px" src="${path}/resources/img/product/${list.PRD_IMAGE }">
												</div>
												<br>
												<div id="p-Text">
													<span><b>${list.PRD_BRAND }</b></span> <br />
													<span>${list.PRD_NAME }</span> <br />
													<br />
													<span>COLOR : ${list.PRD_COLOR }</span>
													<br />												
													<span>금액 : ${list.PRD_PRICE }원</span>
													<br />
												</div>
											</div>
											<hr />
											<div id="cartSize" class="filter__sort cartSize${list.PRD_NUM }">
			                                   <select class="selectStocks">
			                                       <option value="0">사이즈 선택</option>
			                                   </select>
			                                </div>
			                                <!-- 
											<button type="button" id="btnBuy${list.PRD_NUM }">
												바로구매
											</button>
			                                 -->
			                                 <div class="box bg-3" id="btnBuy${list.PRD_NUM }" class="btnBuyStyle${list.PRD_NUM }">
			                                	<button id="bBchild${list.PRD_NUM }" type="button" class="button button--wayra button--border-medium button--text-upper button--size-s button--text-thick button--inverted">
			                                		바로 구매
			                                	</button>
											 </div>
										</div>
									</div>
				                    <div id="cartModal${list.PRD_CODE }">
										<div class="modal_content">
												<h4 style="display:inline-block;margin-right: 294px;">옵션선택</h4>
												<button type="button" id="cartModal_close_btn${list.PRD_CODE }">
													<b>X</b>
												</button>
											<hr />
											<div id="p-Box">
												<div id="p-Img">
													<img alt="${list.PRD_IMAGE }" width="250px" src="${path}/resources/img/product/${list.PRD_IMAGE }">
												</div>
												<br>
												<div id="p-Text">
													<span><b>${list.PRD_BRAND }</b></span> <br />
													<span>${list.PRD_NAME }</span> <br />
													<br />
													<span>COLOR : ${list.PRD_COLOR }</span>
													<br />												
													<span>금액 : ${list.PRD_PRICE }원</span>
													<br />
												</div>
											</div>
											<hr />
										    <div id="cartSize" class="filter__sort cartSize${list.PRD_NUM }">
			                                   <select class="selectStocks">
			                                       <option value="0">사이즈 선택</option>
			                                   </select>
			                                </div>
			                                <!-- 
										   <button type="button" id="ajaxToCart${list.PRD_CODE }">
												상품 담기
											</button> 
			                                 -->
									        <div class="box bg-3" id="ajaxToCart${list.PRD_CODE }">
			                                	<button id="bBchild${list.PRD_NUM }" type="button" class="button button--wayra button--border-medium button--text-upper button--size-s button--text-thick button--inverted">
			                                		상품 담기
			                                	</button>
											</div>
										</div>
									</div>
									</div>
	                                <div class="product__item__text product__item__detail${list.PRD_NUM }">
										<p>
 											<h6>${list.PRD_NAME }</h6>												
 										</p>
                                   		<h5>${list.PRD_PRICE }원</h5>
                                	</div>
                            	<script type="text/javascript">
	                            	var selectSize;
	                            	function sizeClick(e){
	                            		selectSize=$(e).html();
	                            	}
                            		$('#btnBuy${list.PRD_NUM }').on('click', function(){
                            			var ORDER_PRDCODE = '${list.PRD_CODE }';
                            			var ORDER_PRDSIZE = selectSize;
                            			var ORDER_AMOUNT =  '1';
                            			var data = {};
        								var itemList = [];
        								data["ORDER_PRDCODE"] = ORDER_PRDCODE;
    									data["ORDER_PRDSIZE"] = ORDER_PRDSIZE;
    									data["ORDER_AMOUNT"] = ORDER_AMOUNT;
    									console.log(data["ORDER_AMOUNT"]);
    									itemList.unshift(data);
    									
    									$.ajax({
    										   url : "/direct/checkout",
    										   type : "POST",
    										   data : JSON.stringify(itemList),
    										    headers: {
    										      'Accept': 'application/json',
    										      'Content-Type': 'application/json'
    										    },
    										   success : function(data){
    												location.href="/direct/checkout";
    										   },
    										   error : function(){
    										   		alert("보내기 실패");
    										   }
 										});
                            		})
	                            	$('.listToBuy${list.PRD_CODE }').on('click', function(){	
	                            		var code = '${list.PRD_CODE }';
										var sendData = {"code":code};
										var stockArrays = new Array();
		                            	$.ajax({
		                            	    url:'/listToCart',
		                            	    method:"POST",
		                            	    data:sendData,
		                            	    success:function(data){
		                            	    	var respData = data;
		                            	    	var sizeStr = 215;
		    									stockArrays = respData.stocks;
				                            	for(var i=0; i < stockArrays.length; i++){
			                            			sizeStr += 5; 
				                            		$('.list').append("<li data-value='0' onclick='sizeClick(this)' class='option sizeList' style='text-align: center; font-size: 20px;'>"+String(sizeStr)+"</li>");
				                            	}
		                            	    }
		                            	});
	                            	});
                            		
	                            	
	                    
	                        		$('#ajaxToCart${list.PRD_CODE }').on('click', function(){
	                        			var numCode = '${list.PRD_NUM }';
										var sendData = {"PRDNUM":numCode, "PRDSIZE":selectSize};
	                        			$.ajax({
	                        				url: '/ajaxToCart',
	                        				method: 'POST',
	                        				data:sendData,
	                        				success:function(data){
	                        					var toCart = confirm("상품이 장바구니 담겼습니다.\n장바구니로 이동하시겠습니까?");
	                        					if(toCart){
	                        						location.href = "/cart.do";
	                        					}
	                        				}
	                        			})
	                        		})
	                            	$('.listToCart${list.PRD_CODE }').on('click', function(){
		                            	var code = '${list.PRD_CODE }';
										var sendData = {"code":code};
										var stockArrays = new Array();
		                            	$.ajax({
		                            	    url:'/listToCart',
		                            	    method:'POST',
		                            	    data:sendData,
		                            	    success:function(data){
		                            	    	var respData = data;
												var sizeStr = 215;
		    									stockArrays = respData.stocks;
				                            	for(var i=0; i < stockArrays.length; i++){
			                            			sizeStr += 5; 
				                            		$('.list').append("<li data-value='0' onclick='sizeClick(this)' class='option sizeList' style='text-align: center; font-size: 20px;'>"+String(sizeStr)+"</li>");
				                            	}
		                            	    }
		                            	});
   	                            	});
                            	
                            		$('.product__item__detail${list.PRD_NUM }').on('click', function(){
                            			var prdCode = "${list.PRD_CODE}";
                            			location.href = "/product/prdCode="+prdCode;
                            		})
                            
                            		
								     $("#modal_close_btn${list.PRD_CODE }").click(function(){
								        if(cartCheck === "true"){								        	
									    	 $("#modal${list.PRD_CODE }").attr("style", "display:none");
									    	 cartCheck = "false";
								        }
								    });
                            		
                            		 $("#modal_open_btn${list.PRD_CODE }").click(function(){
 								    	<%if(session.getAttribute("user") == null){%>
 											var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
 											if(result){
 												location.href="/login.do";
 												return false;
 											}
 											else {
 												return false;
 											}
 										<%}%>
 								    	if(cartCheck === "false"){							    		
 									        $("#modal${list.PRD_CODE }").attr("style", "display:block");
 								        	cartCheck = "true";
 								    	}
 								    });
								     
								    $("#cartModal_open_btn${list.PRD_CODE }").click(function(){
								    	 <%if(session.getAttribute("user") == null){%>
											var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
											if(result){
												location.href="/login.do";
												return false;
											}
											else {
												return false;
											}
										<%}%>
									    if(cartCheck === "false"){								    	
									        $("#cartModal${list.PRD_CODE }").attr("style", "display:block");
									        cartCheck = "true";
									    }
								    });
								     $("#cartModal_close_btn${list.PRD_CODE }").click(function(){
								        if(cartCheck === "true"){									        	
								    	 	$("#cartModal${list.PRD_CODE }").attr("style", "display:none");
								    	 	cartCheck = "false";
								    	
								        }
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
									&maxPrice=${info.maxPrice }&keyWord=${info.keyWord }">다음</a></li>
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
    	$('#PK').attr('checked',true);
	}else if(clickCheck6 === "true"){
// 		$('#green').val('');
		m.style.color = "black";
    	clickCheck6 = "false";
    	$('#PK').attr('checked',false);
	}
	return false;
});



function mover7() {
	var m;
	m = document.getElementById("id07");
	m.style.color = "red";								
}
var clickCheck7 = "false";
function mout7() {
	var m;
	m = document.getElementById("id07");
    if(clickCheck7 === "false"){	                                	
    	m.style.color = "black";
    }
}
$('#id07').on("click", function(e){
	var m;
	m = document.getElementById("id07");
	if(clickCheck7 === "false"){
// 		$('#green').val('green');
    	m.style.color = "red";
    	clickCheck7 = "true";
    	$('#MULTI').attr('checked',true);
	}else if(clickCheck7 === "true"){
// 		$('#green').val('');
		m.style.color = "black";
    	clickCheck7 = "false";
    	$('#MULTI').attr('checked',false);
	}
	return false;
});



function mover8() {
	var m;
	m = document.getElementById("id08");
	m.style.color = "red";								
}
var clickCheck8 = "false";
function mout8() {
	var m;
	m = document.getElementById("id08");
    if(clickCheck8 === "false"){	                                	
    	m.style.color = "black";
    }
}
$('#id08').on("click", function(e){
	var m;
	m = document.getElementById("id08");
	if(clickCheck8 === "false"){
// 		$('#green').val('green');
    	m.style.color = "red";
    	clickCheck8 = "true";
    	$('#BG').attr('checked',true);
	}else if(clickCheck8 === "true"){
// 		$('#green').val('');
		m.style.color = "black";
    	clickCheck8 = "false";
    	$('#BG').attr('checked',false);
	}
	return false;
});


function mover9() {
	var m;
	m = document.getElementById("id09");
	m.style.color = "red";								
}
var clickCheck9 = "false";
function mout9() {
	var m;
	m = document.getElementById("id09");
    if(clickCheck9 === "false"){	                                	
    	m.style.color = "black";
    }
}
$('#id09').on("click", function(e){
	var m;
	m = document.getElementById("id09");
	if(clickCheck9 === "false"){
// 		$('#green').val('green');
    	m.style.color = "red";
    	clickCheck9 = "true";
    	$('#YELLOW').attr('checked',true);
	}else if(clickCheck9 === "true"){
// 		$('#green').val('');
		m.style.color = "black";
    	clickCheck9 = "false";
    	$('#YELLOW').attr('checked',false);
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
	var m7 = document.getElementById("id07");
	var m8 = document.getElementById("id08");
	var m9 = document.getElementById("id09");
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
        if(colorsArray[i]=='PK'){
        	m6.style.color = "red";
        	clickCheck6 = "true";
        	$('#PK').attr('checked',true);
        }
        if(colorsArray[i]=='MULTI'){
        	m7.style.color = "red";
        	clickCheck7 = "true";
        	$('#MULTI').attr('checked',true);
        }
        if(colorsArray[i]=='BG'){
        	m8.style.color = "red";
        	clickCheck8 = "true";
        	$('#BG').attr('checked',true);
        }
        if(colorsArray[i]=='YELLOW'){
        	m9.style.color = "red";
        	clickCheck9 = "true";
        	$('#YELLOW').attr('checked',true);
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

$('.jjimBtn').on("click",function(){
	var prdnum = $(this).find('.prdnumj').val();
	var data = {
			prdnum : prdnum
		}
	var btn = $(this).find("i");
		  $.ajax({
		   type : "POST",
		   url : "/dojjim",
		   data : data,
		   success : function(result){
			   
			   if(result == 'login'){
				   var con = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?");
					if(con){
						location.href="/login.do";
						return false;
					}
					else {
						return false;
					}
			   }else{
				if(btn.hasClass("fa-heart-o")){
					btn.removeClass("fa-heart-o");
					btn.addClass("fa-heart");
				} else {
					btn.removeClass("fa-heart");
					btn.addClass("fa-heart-o");
				}}
				
		   },
		   error : function(){
			    alert("보내기 실패");
			   }
		  }); 
});
(function() {
	var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);
	if(isSafari) {
		document.getElementById('support-note').style.display = 'block';
	}
})();
</script>
</html>