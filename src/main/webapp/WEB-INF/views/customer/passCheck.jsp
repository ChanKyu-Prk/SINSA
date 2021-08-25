<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/848d8f1fa9.js"
	crossorigin="anonymous"></script>
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

.pw-eye1 {
	position: absolute;
	float: right;
	top: 15px;
	bottom: 0;
	right: 10px;
	margin: auto 2px;
	height: 30px;
	font-size: 17px;
	color: #c0c0c0;
	cursor: pointer;
}

.pw-eye1-1 {
	position: absolute;
	float: right;
	top: 15px;
	bottom: 0;
	right: 9px;
	margin: auto 2px;
	height: 30px;
	font-size: 17px;
	color: #c0c0c0;
	cursor: pointer;
	display: none;
}

.pw_input_box {
	position: relative;
	margin-top : 15px;

}
.marginAuto{
	margin: auto;
	display: table-cell;
	vertical-align: middle;
}
.pw_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.passwWrap {
	text-align: left;
	width: 50%;
	margin: auto;
	display : table;
	min-height: 200px;
}
.padding_0{
padding : 0px !important;
}
.submitBtn {
	width: 100%;
	float: right;
	height: 40px;
	border: 1px solid #c1bfc1;
}
</style>
<title>SINSA : ${page }</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<span>${page }</span>
				</div>
				<hr>

				<c:choose>
					<c:when test="${page == '비밀번호 변경' }">
						<form action="/passChange" method="post">
					</c:when>
					<c:otherwise>
						<form action="/privateInfoChange" method="post">
					</c:otherwise>
				</c:choose>
				<div class="passwWrap">
					<div class=" container marginAuto">
						<div class="row">비밀번호 입력</div>
						<div class="row pw_input_box">
							<div class="col-10 padding_0">
								<input type="password" class="pw_input" name="password"
									placeholder="비밀번호를 입력하세요."> <i
									class="far fa-eye pw-eye1"></i> <i
									class="far fa-eye-slash pw-eye1-1"></i>
							</div>

							<div class="col-2 padding_0">
								<input type="submit" value="확인" class="submitBtn">
							</div>
						</div>



					</div>
				</div>
				</form>

			</div>
			<hr />
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>


<script type="text/javascript">
	$(function() { // 눈표시 클릭 시 패스워드 보이기
		$('.pw-eye1').on('click', function() {
			$('.pw-eye1').css("display", "none");
			$('.pw-eye1-1').css("display", "inline-block");
			$('.pw_input').attr("type", "text");
		});
		$('.pw-eye1-1').on('click', function() {
			$('.pw-eye1-1').css("display", "none");
			$('.pw-eye1').css("display", "inline-block");
			$('.pw_input').attr("type", "password");
		});
	});
	
	$('.pw_input').on("focusin", function() {
		$('.pw_input').css("border-color", "black");
	});
	$('.pw_input').on("focusout", function() {
		$('.pw_input').css("border-color", "#c1bfc1");
	});
</script>
</html>