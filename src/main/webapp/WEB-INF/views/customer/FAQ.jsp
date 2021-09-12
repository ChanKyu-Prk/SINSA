<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.con_top_margin {
	margin-top: 40px;
}

.addmargin {
	margin-top: 40px;
}

.subjecet {
	text-align: center;
	font-size: 27pt;
}

#exclamation {
	width: 100px;
	height: 100px;
	fill: grey;
}

.no_row {
	min-height: 250px;
	display: table;
	padding-top: 50px;
}

.no_col {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	display: table-cell;
}

.Q {
	text-align: center;
	background-color: black;
	color: white;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: table-cell;
	vertical-align: middle;
}

.A {
	text-align: center;
	background-color: black;
	color: white;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: table-cell;
	vertical-align: middle;
}

.Q_open {
	font-weight: bold;
	float: right;
	font-size: 20px;
}
.Q_close {
	font-size: 20px;
	display : none;
	font-weight: bold;
	float: right;
	color: black;
}

.Q_row {
	cursor: pointer;
	
}
.A_row {
border-bottom: solid 1px #bebebe;
}

.Q_Q_col {
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.A_A_col {
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #EDEFF2;
	display: none;
}

.Q_col {
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;

}

.A_col {
	margin-top: 10px;
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #EDEFF2;
	display: none;
}

.FAQList {
	margin-bottom: 30px;
}

@media screen and (max-width: 720px) {
.Q_Q_col {
	margin-bottom: 0px;
	padding-bottom:0px;
	border-bottom: none;
}

.A_A_col {
	margin-bottom: 0px;
	border-bottom: none;
}

.Q_col {

}

.A_col {
	margin-top: 0px;
		padding-top: 0px;
}
}
</style>
<title>SINSA FAQ</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>

	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="customerCenterBar.jsp"></jsp:include>
			<div class="col-sm-12 col-md-9">
				<div class="subjecet">
					<span>FAQ</span>
				</div>
				<hr>

				<div class="container FAQList">

					<div class="container">

						<c:choose>
							<c:when test="${fn:length(FAQ) == 0}">


								<div class="row no_row">
									<div class="col-12 no_col">
										<svg xmlns="http://www.w3.org/2000/svg" id="exclamation"
											class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
												d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
</svg>
										<br>FAQ가 없습니다.
									</div>
								</div>




							</c:when>
							<c:otherwise>
								<c:forEach var="faq" items="${FAQ}" varStatus="status">
									<div class="row Q_row">
										<input type="hidden" value="0" class="displayState">
										<div class="col-sm-12 col-md-1 Q_Q_col">
											<div class="Q">Q</div>
										</div>
										<div class="col-sm-12 col-md-11 Q_col">${faq.faq_q }
											<span class="Q_open">∨</span>
											<span class="Q_close">∧</span>
										</div>
									</div>
									<div class="row A_row">
										<div class="col-sm-12 col-md-1 A_A_col">
											<div class="A">A</div>
										</div>
										<div class="col-sm-12 col-md-11 A_col">${faq.faq_a }</div>
									</div>


								</c:forEach>
							</c:otherwise>
						</c:choose>


					</div>
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$('.Q_row').on("click", function() {
		var test = $(this).find('.displayState');
		if (test.val() < 1) {
			$(this).next().find('.A_A_col').css("display", "inline-block");
			$(this).next().find('.A_col').css("display", "inline-block");

			$(this).children().find('.Q_open').css("display", "none");
			$(this).children().find('.Q_close').css("display", "inline-block");
			test.val(1);
		} else {

			$(this).next().find('.A_A_col').css("display", "none");
			$(this).next().find('.A_col').css("display", "none");

			$(this).children().find('.Q_open').css("display", "inline-block");
			$(this).children().find('.Q_close').css("display", "none");
			test.val(0);
		}
	});
</script>
</html>
