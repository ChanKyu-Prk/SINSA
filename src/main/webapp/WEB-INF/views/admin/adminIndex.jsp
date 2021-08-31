<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.chart_container{
	float: left;
}
</style>

</head>
<body>
<jsp:include page="adminHeader.jsp" />

<div>
		<div style="width: 27%" class="chart_container">
			<canvas id="canvas"></canvas>
		</div>




		<div style="width: 27%" class="chart_container">
			<canvas id="canvas2"></canvas>
		</div>




		<div style="width: 27%" class="chart_container">
			<canvas id="canvas3"></canvas>
		</div>
</div>





	<div style="width: 27%">

		<div>
			<canvas id="canvas4"></canvas>
		</div>

	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

	<script>
		var chartLabels = [];
		var chartData = [];
		$.getJSON("http://localhost:8090/incomeList", function(data) {
			$.each(data, function(inx, obj) {
				chartLabels.push(obj.PRD_NUM);
				chartData.push(obj.PRD_PRICE);
			});
			createChart();
			createChart2();
			createChart3();
			createChart4();
			console.log("create Chart")

		});

		var lineChartData = {
			labels : chartLabels,
			datasets : [ {

				label : "Date Income",
				fillColor : "rbga(151,187,205,0.2)",
				strokeColor : "rbga(151,187,205,1)",
				pointColor : "rbga(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rbga(151,187,205,1)",
				data : chartData
			}

			]

		}

		function createChart() {

			var ctx = document.getElementById("canvas").getContext("2d");

			LineChartDemo = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			})
		}

		function createChart2() {

			var ctx = document.getElementById("canvas2").getContext("2d");

			LineChartDemo = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			})
		}
		
		function createChart3() {

			var ctx = document.getElementById("canvas3").getContext("2d");

			LineChartDemo = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			})
		}
		
		function createChart4() {

			var ctx = document.getElementById("canvas4").getContext("2d");

			LineChartDemo = Chart.Line(ctx, {
				data : lineChartData,
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			})
		}
	</script>
	
	
</body>
</html>