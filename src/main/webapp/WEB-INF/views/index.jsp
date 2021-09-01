<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>sinsa</title>



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<style>
.review_date {
	margin: 0px 90px 0px 0px !important;
	padding: 0px 0px 0px 0px;
}

.star {
	width: 25px;
	height: 25px;
	margin: 0px 4px 0px 0px !important;
	/*    padding: 0px 0px 0px 0px; */
}

.empty_star {
	width: 25px;
	height: 25px;
	margin: 0px 4px 0px 0px !important;
}

.div_name_top_trends {
	padding: 0px 0px 0px 0px !important;
}

.toptrends {
	margin: 0px 0px 10px 0px !important;
}

.banner_text {
	font-weight: bold !important;
	-webkit-text-stroke-width: 1px;
	-webkit-text-stroke-color: white
}

.banner_text2 {
	color: black;
	font-weight: bold;
	font-size: 20px;
	-webkit-text-stroke-color: white
}

.banner_sinsa {
	color: black !important;
	font-size: 30px !important;
	/* 	-webkit-text-stroke-color: white; */
	/* 	-webkit-text-stroke-width: 2px; */
}

.banner_cover {
	position: absolute;
	/* 	left: 14px; */
	/* 	top: 100px; */
	/* 	left:80px; */
	/* 	top:160px; */
	height: 250px;
	width: 350px;

	/* 	height: 411px; */
	/* 	width: 450px; */
	/* 	width: 1141px; */
}

.review_title_title {
	color: grey;
	font-size: 15px;
}

/* .review_title_right { */
/* 	padding: 0px 0px 0px 30px; */
/* } */

/* .review_title_left { */
/* 	padding: 0px 0px 0px 35px; */
/* } */
.review_image {
	height: 300px !important;
}
</style>





</head>

<body>


	<!-- Page Preloder -->
	<!--    <div id="preloder"> -->
	<!--       <div class="loader"></div> -->
	<!--    </div> -->


	<jsp:include page="header.jsp" />



	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__search d-flex justify-content-center">
						<div class="hero__search__form ">
							<form action="#">
								<input type="text" placeholder="찾으시는 상품을 검색해주세요">
								<button type="submit" class="site-btn">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="hero__item set-bg"
						data-setbg="${path}/resources/img/banner/베너.jpg">
						<div class="hero__text">
							<%-- 							<img class="banner_cover" src="${path}/resources/img/banner/베너커버.png">  --%>

							<span class="banner_sinsa">&nbsp;SINSA</span>
							<h2 class="banner_text">
								이달의 특가 <br>최대 40% 할인!
							</h2>
							<!-- 							<p class="banner_text2">지금 특별한 가격을 만나보세요~</p> -->
							<!-- 							<a href="#" class="primary-btn">SHOP NOW</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="section-title">
				<h2>NEW ARRIVALS</h2>
			</div>
			<div class="row">
				<div class="categories__slider owl-carousel">

					<c:forEach var="list" items="${productList}" varStatus="status">
						<div class="col-lg-3">
							<a href="#">
								<div class="featured__item">





									<c:set var="newProduct_img_array"
										value="${fn:split(list.PRD_IMAGE,'/')}" />

									<div class="featured__item__pic set-bg"
										data-setbg="${path}/resources/img/product/${newProduct_img_array[0]}">




									</div>
									<div class="featured__item__text">
										<h6>${list.PRD_BRAND}</h6>
										<h6>${list.PRD_NAME}</h6>
										<h5>${list.PRD_PRICE}원</h5>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>TOP TRENDS</h2>
					</div>



					<div class="col-lg-12">
						<div class="product__details__tab div_name_top_trends">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation"><a
									class="nav-link active" id="infoTab" data-toggle="tab"
									href="#tabs-1" role="tab" aria-selected="true">전체</a></li>
								<li class="nav-item" role="presentation"><a id="reviewTab"
									class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
									aria-selected="false">운동화</a></li>
								<li class="nav-item" role="presentation"><a id="qnaTab"
									class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
									aria-selected="false">스포츠</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-1" role="tabpanel">
									<div class="product__details__tab__desc">


										<div class="row">



											<c:forEach var="list" items="${topProductList}"
												varStatus="status">
												<div class="col-md-3">
													<div class="featured__item">
														<c:set var="bestProduct_img_array"
															value="${fn:split(list.PRD_IMAGE,'/')}" />

														<div class="featured__item__pic set-bg"
															data-setbg="${path}/resources/img/product/${bestProduct_img_array[0]}">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6 class="toptrends">${list.PRD_BRAND}</h6>
															<h6 class="toptrends">${list.PRD_NAME}</h6>
															<h5 class="toptrends">${list.PRD_PRICE}</h5>
														</div>

													</div>
												</div>
											</c:forEach>


										</div>


									</div>
								</div>
								<div class="tab-pane" id="tabs-2" role="tabpanel">
									<div class="product__details__tab__desc">

										<div class="row">

											<c:forEach var="list" items="${topSneakersProductList}"
												begin="0" end="7" varStatus="status">
												<div class="col-md-3">
													<div class="featured__item">
														<c:set var="bestSneakersProduct_img_array"
															value="${fn:split(list.PRD_IMAGE,'/')}" />

														<div class="featured__item__pic set-bg"
															data-setbg="${path}/resources/img/product/${bestSneakersProduct_img_array[0]}">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6 class="toptrends">${list.PRD_BRAND}</h6>
															<h6 class="toptrends">${list.PRD_NAME}</h6>
															<h5 class="toptrends">${list.PRD_PRICE}</h5>
														</div>

													</div>
												</div>
											</c:forEach>


										</div>




									</div>
								</div>
								<div class="tab-pane" id="tabs-3" role="tabpanel">
									<div class="product__details__tab__desc">

										<div class="row">

											<c:forEach var="list" items="${topSportsProductList}"
												begin="0" end="7" varStatus="status">
												<div class="col-md-3">
													<div class="featured__item">
														<c:set var="bestSportSProduct_img_array"
															value="${fn:split(list.PRD_IMAGE,'/')}" />

														<div class="featured__item__pic set-bg"
															data-setbg="${path}/resources/img/product/${bestSportSProduct_img_array[0]}">
															<ul class="featured__item__pic__hover">
																<li><a href="#"><i class="fa fa-heart"></i></a></li>
																<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
															</ul>
														</div>
														<div class="featured__item__text">
															<h6 class="toptrends">${list.PRD_BRAND}</h6>
															<h6 class="toptrends">${list.PRD_NAME}</h6>
															<h5 class="toptrends">${list.PRD_PRICE}</h5>
														</div>

													</div>
												</div>
											</c:forEach>


										</div>
									</div>
								</div>
							</div>
						</div>




					</div>
				</div>


			</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${path}/resources/img/banner/베너.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${path}/resources/img/banner/베너.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->



	<!-- Blog Section Begin -->
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>REVIEW</h2>
					</div>
				</div>
			</div>
			<div class="row">



				<c:forEach var="list" items="${reviewList}" varStatus="status">

					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">

								<c:set var="img_array" value="${fn:split(list.REV_IMAGE,'/')}" />

								<%-- 							<c:out var="image" value='${img_array[0]}' /> --%>
								<img src="${path}/resources/img/review/${img_array[0]}" alt=""
									class="review_image">
							</div>
							<div class="blog__item__text">
								<ul>
									<li class="review_date"><i class="fa fa-calendar-o "></i>
										<fmt:formatDate value="${list.REV_REGDATE}"
											pattern="yyyy-MM-dd" /></li>


									<c:if test="${list.REV_STAR eq 0}">
										<li class="star"><div style="display: flex;">
												<img src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star">
											</div></li>
									</c:if>
									<c:if test="${list.REV_STAR eq 1}">
										<li class="star"><div style="display: flex;">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star">
											</div></li>
									</c:if>
									<c:if test="${list.REV_STAR eq 2}">
										<li class="star"><div style="display: flex;">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star">
											</div></li>
									</c:if>
									<c:if test="${list.REV_STAR eq 3}">
										<li class="star"><div style="display: flex;">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/empty_star.png"
													class="empty_star"> <img
													src="${path}/resources/img/empty_star.png"
													class="empty_star">
											</div></li>
									</c:if>
									<c:if test="${list.REV_STAR eq 4}">
										<li class="star"><div style="display: flex;">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/empty_star.png"
													class="empty_star">
											</div></li>
									</c:if>
									<c:if test="${list.REV_STAR eq 5}">
										<li class="star"><div style="display: flex;">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
												<img src="${path}/resources/img/star.png" class="star">
											</div></li>
									</c:if>


								</ul>

								<h5>
									<c:set var="Array" value="${fn:split(list.REV_TITLE,'/')}" />



									<div class="container">
										<div class="row">
											<div class="col-6">
												<span class="review_title_title review_title_left">사이즈
													:&nbsp;</span><span><c:out value='${Array[0]}' /><br></span>
												<span class="review_title_title review_title_left">착화감
													:&nbsp;</span><span><c:out value='${Array[2]}' /></span>
											</div>
											<div class="col-6">
												<span class="review_title_title review_title_right">색상
													:&nbsp;</span><span><c:out value='${Array[1]}' /><br></span>
												<span class="review_title_title review_title_right">배송
													:&nbsp;</span><span><c:out value='${Array[3]}' /></span>
											</div>
										</div>
									</div>



								</h5>
								<c:set var="REV_CONTENT" value="${list.REV_CONTENT}]" />
								<c:if test="${fn:length(REV_CONTENT) <= 70}">
									<p>${list.REV_CONTENT}</p>

								</c:if>
								<c:if test="${fn:length(REV_CONTENT) > 70}">
								${fn:substring(REV_CONTENT,0,70)}.....
								
								</c:if>




							</div>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</section>
	<!-- Blog Section End -->


	<jsp:include page="footer.jsp" />


</body>

</html>