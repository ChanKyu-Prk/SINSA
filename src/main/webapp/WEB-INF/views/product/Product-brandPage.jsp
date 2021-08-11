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
    <h1>BRAND</h1>
    
    <table border="1">
    	<tr>
    		<td>나이키</td>
    		<td>아디다스</td>
    		<td>반스</td>
    		<td>컨버스</td>
    		<td>퓨마</td>
    	</tr>
    	
    	<tr>
   			<td>휠라</td>
    		<td>뉴발란스</td>
    		<td>리복</td>
    		<td>호킨스</td>
    		<td>누오보</td>
    	</tr>
    </table>

    
    <table border="1">
    	<tr>
	    	<td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>G</td><td>H</td><td>I</td><td>J</td><td>K</td><td>L</td>
	    	<td>M</td><td>N</td><td>O</td><td>P</td><td>Q</td><td>R</td><td>S</td><td>T</td><td>U</td><td>V</td><td>W</td><td>X</td>
	    	<td>Y</td><td>Z</td><td>123</td>    
    	</tr>
    	<tr>
    		<td>가</td><td>나</td><td>다</td><td>라</td><td>마</td><td>바</td><td>사</td><td>아</td>
	    	<td>자</td><td>차</td><td>카</td><td>타</td><td>파</td><td>하</td>
    	</tr>
    </table>
    
    <hr/>
    <h2>A</h2>
    <span>AKIII CLASSIC</span> <span>ADIDAS</span> <span>ASICS</span>
    <hr />
    
    <h2>B</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>C</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>D</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>E</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>F</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>G</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>H</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>I</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>J</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>K</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>L</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>M</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>N</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>O</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>P</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>Q</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>R</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>S</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>T</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>U</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>V</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>W</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>X</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>Y</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>Z</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>123</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>가</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>나</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>다</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>라</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>마</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>바</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>사</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>아</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>자</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>차</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>카</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>타</h2>
    <span></span> <span></span> <span></span>
    <hr />
    
    <h2>파</h2>
	<span></span> <span></span> <span></span>
	<hr />
	
    <h2>하</h2>
	<span></span> <span></span> <span></span>
	<hr />
    
    <!-- Footer Section Begin -->
	    <jsp:include page="../footer.jsp" />  
    <!-- Footer Section End -->

</body>
</html>