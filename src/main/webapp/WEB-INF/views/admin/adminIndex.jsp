<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SINSA관리자모드</title>

<style>
.chart_container {
	float: left;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Ela Admin - HTML5 Admin Template">





<%--     <link rel="stylesheet" href="${path}/resources/assets/bootstrap.min.css" --%>
<!-- 	type="text/css"> -->


<!--     <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png"> -->
<!--     <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png"> -->

<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css"> -->
<%--     <link rel="stylesheet" href="${path}/resources/assets/css/cs-skin-elastic.css"> --%>
<link rel="stylesheet" href="${path}/resources/assets/css/style.css">
<!--     <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet"> -->
<!--     <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet"> -->

<meta charset="UTF-8">
<style>

</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />




	<!-- Content -->
	<div class="content">
		<!-- Animated -->
		<div class="animated fadeIn">
			<!-- Widgets  -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-1">
									<i class="pe-7s-cash"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
										
										<fmt:formatNumber value="${totalSales}" pattern="#,###" />원
										
										</div>
										<div class="stat-heading">${year}년 매출</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-4">
									<i class="pe-7s-users"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
										<%-- <fmt:formatNumber value="${users}" pattern="#,###" />명 --%>
											 <span class="count">${totalUsers}</span>명
										</div>
										<div class="stat-heading">고객 수</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-2">
									<i class="pe-7s-cart"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count">${totalSalesAmount}</span>건
										</div>
										<div class="stat-heading">${year}년 판매건수</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-five">
								<div class="stat-icon dib flat-color-3">
									<i class="pe-7s-browser"></i>
								</div>
								<div class="stat-content">
									<div class="text-left dib">
										<div class="stat-text">
											<span class="count">${totalQna }</span>건
										</div>
										<div class="stat-heading">미답변 문의 수</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Widgets -->
		</div>
	</div>
	<!-- Content -->
	<div class="content">
		<div class="animated fadeIn">
			<div class="row">


				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="mb-3">${year}월간매출</h4>
							<canvas id="lineChart"></canvas>
						</div>
					</div>
				</div>
				
				
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="mb-3">연령/성 회원 수</h4>
							<canvas id="barChart"></canvas>
						</div>
					</div>
				</div>
				<!-- /# column -->
				
				<!-- /# column -->

				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="mb-3">${year}년 판매건수 브랜드 top5</h4>
							<canvas id="pieChart"></canvas>
						</div>
					</div>
				</div>
				<!-- /# column -->
				


				<div class="col-lg-6">
					<div class="card">
						<div class="card-body pieChart">
						<c:set var="now" value="<%=new java.util.Date()%>" />
							<h4 class="mb-3">시간대별 매출 (<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />)</h4>
							<canvas id="singelBarChart"></canvas>
						</div>
					</div>
				</div>
				<!-- /# column -->









<!-- 				<div class="col-lg-6"> -->
<!-- 					<div class="card"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="mb-3">Yearly Sales</h4> -->
<%-- 							<canvas id="sales-chart"></canvas> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- /# column -->

<!-- 				<div class="col-lg-6"> -->
<!-- 					<div class="card"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="mb-3">Team Commits</h4> -->
<%-- 							<canvas id="team-chart"></canvas> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- /# column -->

				

<!-- 				<div class="col-lg-6"> -->
<!-- 					<div class="card"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="mb-3">Rader chart</h4> -->
<%-- 							<canvas id="radarChart"></canvas> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- /# column -->


				<!-- 					<div class="card"> -->
				<!-- 						<div class="card-body"> -->
				<!-- 							<h4 class="mb-3">Line Chart</h4> -->
				<%-- 							<canvas id="lineChart"></canvas> --%>
				<!-- 						</div> -->
				<!-- 					</div> -->


<!-- 				<div class="col-lg-12"> -->
<!-- 					<div class="card"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="mb-3">Doughut Chart</h4> -->
<%-- 							<canvas id="doughutChart"></canvas> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- /# column -->


				


<!-- 				<div class="col-lg-6"> -->
<!-- 					<div class="card"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="mb-3">Polar Chart</h4> -->
<%-- 							<canvas id="polarChart"></canvas> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- /# column -->





			</div>

		</div>
		<!-- .animated -->
	</div>
	<!-- /.content -->
	<div class="clearfix"></div>
	<jsp:include page="footer.jsp"/>
	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${path}/resources/assets/js/main.js"></script>
	<!--  Chart js -->
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>
	<%-- 	<script src="${path}/resources/assets/js/init/chartjs-init.js"></script> --%>
	<!--Flot Chart-->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>






	<input type="hidden" class="1월" value="${salesList[0]}" />




	<script>
	( function ( $ ) {
	    "use strict";


// 	    line chart
	    var ctx = document.getElementById( "lineChart" );
	    ctx.height = 150;
	    var myChart = new Chart( ctx, {
	        type: 'line',
	        data: {
	            labels: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	            datasets: [
	                {
	                    label: "매출액",
	                    borderColor: "rgba(153, 255, 153, 0.9)",
	                    borderWidth: "1",
	                    backgroundColor: "rgba(153, 255, 153, 0.5)",
	                    pointHighlightStroke: "rgba(26,179,148,1)",
	                    data: [ ${salesList[0]}, ${salesList[1]}, ${salesList[2]}, ${salesList[3]}, ${salesList[4]}, ${salesList[5]}, ${salesList[6]}, ${salesList[7]}, ${salesList[8]}, ${salesList[9]}, ${salesList[10]}, ${salesList[11]}, ${salesList[12]} ],
	                            }
	                        ]
	        },
	        options: {
	            responsive: true,
	            tooltips: {
	                mode: 'index',
	                intersect: false
	            },
	            hover: {
	                mode: 'nearest',
	                intersect: true
	            }

	        }
	    } );


	    //bar chart
	    var ctx = document.getElementById( "barChart" );
	    //    ctx.height = 200;
	    var myChart = new Chart( ctx, {
	        type: 'bar',
	        data: {
	            labels: [ "10대 이하", "20대", "30대", "40대", "50대", "60대이상" ],
	            datasets: [
	                {
	                    label: "남성",
	                    data: [ ${usersCountList[0]}, ${usersCountList[1]}, ${usersCountList[2]}, ${usersCountList[3]}, ${usersCountList[4]}, ${usersCountList[5]}],
	                    borderColor: "rgba(0, 153, 255, 0.9)",
	                    borderWidth: "0",
	                    backgroundColor: "rgba(0, 153, 255, 0.5)"
	                            },
	                {
	                    label: "여성",
	                    data: [ ${usersCountList[6]}, ${usersCountList[7]}, ${usersCountList[8]}, ${usersCountList[9]}, ${usersCountList[10]}, ${usersCountList[11]} ],
	                    borderColor: "rgba(0, 153, 255, 0.09)",
	                    borderWidth: "0",
	                    backgroundColor: "rgba(0, 153, 255, 0.07)"
	                            }
	                        ]
	        },
	        options: {
	            scales: {
	                yAxes: [ {
	                    ticks: {
	                        beginAtZero: true
	                    }
	                                } ]
	            }
	        }
	    } );

	

	    //pie chart
	    var ctx = document.getElementById( "pieChart" );
	    ctx.height = 150;
	    var myChart = new Chart( ctx, {
	        type: 'pie',
	        data: {
	            datasets: [ {
	                data: [ ${topBrandList[0].BRAND_ORDERCOUNT}, ${topBrandList[1].BRAND_ORDERCOUNT},${topBrandList[2].BRAND_ORDERCOUNT}, ${topBrandList[3].BRAND_ORDERCOUNT}, ${topBrandList[4].BRAND_ORDERCOUNT}],
	                backgroundColor: [
	                                    "rgba(102, 153, 255 ,0.9)",
	                                    "rgba(77, 255, 77,0.7)",
	                                    "rgba(255, 255, 102,0.5)",
	                                    "rgba(255, 153, 153,0.9)",
	                                    "rgba(255, 51, 0,0.07)"
	                                ],
	                hoverBackgroundColor: [
	                                    "rgba(102, 153, 255 ,0.9)",
	                                    "rgba(77, 255, 77,0.7)",
	                                    "rgba(255, 255, 102,0.5)",
	                                    "rgba(255, 153, 153 ,0.9)",
	                                    "rgba(255, 51, 0,0.07)"
	                                ]

	                            } ],
	            labels: [
	                            "${topBrandList[0].BRAND}",
	                            "${topBrandList[1].BRAND}",
	                            "${topBrandList[2].BRAND}",
	                            "${topBrandList[3].BRAND}",
	                            "${topBrandList[4].BRAND}"
	                        ]
	        },
	        options: {
	            responsive: true
	        }
	    } );

	    
	    
	    
	    var Jan = $(".1월").val();
	    
	    
	    

	    // single bar chart
	    var ctx = document.getElementById( "singelBarChart" );
	    ctx.height = 150;
	    var myChart = new Chart( ctx, {
	        type: 'bar',
	        data: {
	            labels: [ "00시", "02시", "04시", "06시", "08시", "10시", "12시", "14시", "16시", "18시", "20시", "22시" ],
	            datasets: [
	                {
	                    label: "매출액",
	                    data: [ ${dailySalesList[0]}, ${dailySalesList[1]}, ${dailySalesList[2]}, ${dailySalesList[3]}, ${dailySalesList[4]}, ${dailySalesList[5]}, ${dailySalesList[6]}, ${dailySalesList[7]}, ${dailySalesList[8]}, ${dailySalesList[9]}, ${dailySalesList[10]}, ${dailySalesList[11]}, ${dailySalesList[12]} ],
	                    borderColor: "rgba(153, 255, 153, 0.9)",
	                    borderWidth: "0",
	                    backgroundColor: "rgba(153, 255, 153, 0.5)"
	                            }
	                        ]
	        },
	        options: {
	            scales: {
	                yAxes: [ {
	                    ticks: {
	                        beginAtZero: true
	                    }
	                                } ]
	            }
	        }
	    } );




	} )( jQuery );
    
    </script>

</body>
</html>