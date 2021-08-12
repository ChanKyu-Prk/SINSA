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
    <c:forEach begin="0" end="11" step="1" varStatus="status">
	<style>
		#modal {
			display:none;
		
			position:absolute;
			width:100%;
			height:100%;
			z-index:999999;
		}
		

		#modal .modal_content {
			width:300px;
			margin:100px auto;
			padding:20px 10px;
			background:#fff;
			border: 2px solid #666;
		}
	</style>
	</c:forEach>
</style>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">


</head>
<body>

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
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">                   
       
                    
                                <input type="text" name="keyword" placeholder="찾으시는 상품을 검색해주세요">
                                <button type="button" id="searchBtn" class="site-btn">검색</button>
                                <script>
                                	document.getElementById("searchBtn").onclick = function(){
                                		let keyword = document.getElementsByName("keyword")[0].value;
                                		console.log("검색중...!");

                                		location.href = "/getProductListPage?num=1&condition="+"${condition}"+"&keyword="+keyword;
                                	};
                                </script>
                                
                                
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
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
	                            <c:if test="${condition eq 'all' or condition eq 'sneakersForAll' 
	                            								 or condition eq 'converseForAll'
	                            								 or condition eq 'slipOnForAll'
	                            								 or condition eq 'muleForAll'}">
	                                <li><a href="/getProductListPage?num=1&condition=sneakersForAll">스니커스</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=converseForAll">캔버스화</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=slipOnForAll">슬립온</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=muleForAll">뮬</a></li>
	                            </c:if>
	                            <c:if test="${condition eq 'new' or condition eq 'sneakersForNew' 
	                            								 or condition eq 'converseForNew'
	                            								 or condition eq 'slipOnForNew'
	                            								 or condition eq 'muleForNew'}">
	                                <li><a href="/getProductListPage?num=1&condition=sneakersForNew">스니커스</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=converseForNew">캔버스화</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=slipOnForNew">슬립온</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=muleForNew">뮬</a></li>
	                            </c:if>
	                            <c:if test="${condition eq 'best' or condition eq 'sneakersForBest' 
	                            								  or condition eq 'converseForBest'
	                            								  or condition eq 'slipOnForBest'
	                            								  or condition eq 'muleForBest'}">
	                                <li><a href="/getProductListPage?num=1&condition=sneakersForBest">스니커스</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=converseForBest">캔버스화</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=slipOnForBest">슬립온</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=muleForBest">뮬</a></li>
	                            </c:if>
	                            <c:if test="${condition eq 'men' or condition eq 'onlySneakersForMen'
	                            								 or condition eq 'onlyConverseForMen'
	                            								 or condition eq 'onlySlip-onForMen'
	                            								 or condition eq 'onlyMuleForMen'}">
	                                <li><a href="/getProductListPage?num=1&condition=onlySneakersForMen">스니커스</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=onlyConverseForMen">캔버스화</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=onlySlip-onForMen">슬립온</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=onlyMuleForMen">뮬</a></li>
	                            </c:if>
	                            <c:if test="${condition eq 'women' or condition eq 'onlySneakersForWomen'
	                            								   or condition eq 'onlyConverseForWomen'
	                            								   or condition eq 'onlySlip-onForWomen'
	                            								   or condition eq 'onlyMuleForWomen'}">
	                                <li><a href="/getProductListPage?num=1&condition=onlySneakersForWomen">스니커스</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=onlyConverseForWomen">캔버스화</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=onlySlip-onForWomen">슬립온</a></li>
	                                <li><a href="/getProductListPage?num=1&condition=onlyMuleForWomen">뮬</a></li>
	                            </c:if>


                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>가격</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
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
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>색상</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="white">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gray">
                                <label for="gray">
                                    Gray
                                    <input type="radio" id="gray">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                    Green
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>베스트 상품</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Large
                                    <input type="radio" id="large">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                    Medium
                                    <input type="radio" id="medium">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                    Small
                                    <input type="radio" id="small">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="tiny">
                                    Tiny
                                    <input type="radio" id="tiny">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>신상</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${path}/resources/img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                            
                                            	<c:forEach var="pl" items="${ProductList }">
													<p>
 														<h6>${pl.PRD_NAME }</h6>
													</p>
												</c:forEach>
                                             
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${path}/resources/img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${path}/resources/img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${path}/resources/img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${path}/resources/img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="${path}/resources/img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
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
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/product/discount/pd-2.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Vegetables</span>
                                            <h5><a href="#">Vegetables’package</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/product/discount/pd-3.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Mixed Fruitss</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/product/discount/pd-4.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/product/discount/pd-5.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="${path}/resources/img/product/discount/pd-6.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Dried Fruit</span>
                                            <h5><a href="#">Raisin’n’nuts</a></h5>
                                            <div class="product__item__price">$30.00 <span>$36.00</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                         
                                    <h6><span>${page.count  }</span> Products found</h6>
                            
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="list" items="${list }">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="${path}/resources/img/product/${list.PRD_IMAGE }">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                        <li><a id="modal_open_btn"><i class="fa fa-retweet"><b>바로구매</b></i></a></li>
	                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                    </ul>
	                                </div>
				                    <div id="modal">
										<div class="modal_content">
											<h2>모달 창</h2>
											
											<p>모달 창 입니다.</p>
											
											<button type="button" id="modal_close_btn">
												모달 창 닫기
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
	                        </div>

							<script>
							    $("#modal_open_btn").click(function(){
							        $("#modal").attr("style", "display:block");
							    });
							   
							     $("#modal_close_btn").click(function(){
							        $("#modal").attr("style", "display:none");
							    });      
							</script>

						</c:forEach>
                    </div>
                    

                    
                    <div class="product__pagination">
	                    <c:if test="${page.prev }">
	                        <a href="/getProductListPage?num=${page.startPageNum - 1 }&condition=${condition}"><i class="fa fa-long-arrow-left"></i></a>
	                    </c:if>
	                    
	                    <c:forEach begin="${page.startPageNum}" end="${page.endPageNum }" var="num">
	                    
	                    	<c:if test="${ select != num }">
	                        	<a href="/getProductListPage?num=${num }&condition=${condition}">${num }</a>
	                    	</c:if>
	                    	
	                    	<c:if test="${ select == num }">
	                    		<b>${num }</b>
	                    	</c:if>
	                    </c:forEach>
	                    
	                    <c:if test="${page.next }">
	                        <a href="/getProductListPage?num=${page.endPageNum + 1 }&condition=${condition} "><i class="fa fa-long-arrow-right"></i></a>
	                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="../footer.jsp" />  
    <!-- Footer Section End -->


</body>
</html>