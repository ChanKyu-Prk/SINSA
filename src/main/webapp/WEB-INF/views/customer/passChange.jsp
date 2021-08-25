<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://kit.fontawesome.com/848d8f1fa9.js"
	crossorigin="anonymous"></script>
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
	.pw_wrap {
	margin-top: 25px;
}
.pw_name {
	
}
.pw_input_box {
	position: relative;
}
.pw_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
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
.pw_input_re_0 {
	color: red;
	display: none;
}
.pw_input_re {
	color: red;
	display: none;
}
/* 비밀번호 확인 영역 */
.pwck_wrap {
	margin-top: 25px;
}
.pwck_name {
	
}
.pwck_input_box {
	position: relative;
}
.pwck_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}
.pwck-eye2 {
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
.pwck-eye2-1 {
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
.pwck_input_re {
	color: red;
	display: none;
}
.pwck_input_re_0 {
	color: red;
	display: none;
}

.changeSub{
height : 40px;
border : solid 1px ;
width : 150px;
float : right;
margin-top : 20px;
margin-bottom : 20px;
border: 1px solid #c1bfc1;
}
</style>
<title>SINSA : 비밀번호 변경</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<span>비밀번호 변경</span>
				</div>
				<hr>
<form action="passChange" method="post">
<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input type="password" class="pw_input" name="CUS_PWD"
							placeholder=" 비밀번호(영문 대 소문자, 숫자, 특수문자 조합 8~16자)"> <i
							class="far fa-eye pw-eye1"></i> <i
							class="far fa-eye-slash pw-eye1-1"></i>
					</div>
					<div>
						<span class="pw_input_re_0">필수 입력사항 입니다.</span> <span
							class="pw_input_re">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
					</div>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input type="password" class="pwck_input" placeholder=" 비밀번호 확인"><i
							class="far fa-eye pwck-eye2"></i> <i
							class="far fa-eye-slash pwck-eye2-1"></i>
					</div>
					<div>
						<span class="pwck_input_re_0">필수 입력사항 입니다.</span> <span
							class="pwck_input_re">비밀번호가 일치하지 않습니다.</span>
					</div>
				</div>
<input type="submit" value="변경하기" class="changeSub">

</form>



			</div>
			<hr />




		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</body>
<script >
$('.changeSub')
.on(
		"click",
		function() {
			var pass = $('.pw_input').val();
			var passck = $('.pwck_input').val();
			var checkKor2 = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{8,16}$/
				.test(pass);
			var check1 = /^(?=.*[^a-zA-Z0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,16}$/
				.test(pass);
			if(passck.length < 1|| pass != passck|| pass.length < 1|| pass.length < 8 || 16 < pass.length
					|| !check1 || checkKor2){
			if (passck.length < 1) {
				$('.pwck_input').focus();
				$('.pwck_input_re_0').css("display",
						"inline-block");
				$('.pwck_input').css("border-color", "red");
				$('.pwck_input_re').css("display", "none");
			} else if (pass != passck) {
				$('.pwck_input').focus();
				$('.pwck_input_re_0').css("display", "none");
				$('.pwck_input_re').css("display",
						"inline-block");
				$('.pwck_input').css("border-color", "red");
			} else {
				$('.pwck_input_re').css("display", "none");
				$('.pwck_input_re_0').css("display", "none");
				$('.pwck_input').css("border-color", "#c1bfc1");
			}
			if (pass.length < 1) {
				$('.pw_input').focus();
				$('.pw_input_re_0').css("display",
						"inline-block");
				$('.pw_input_re').css("display", "none");
				$('.pw_input').css("border-color", "red");
			} else if (pass.length < 8 || 16 < pass.length
					|| !check1 || checkKor2) {
				$('.pw_input').focus();
				$('.pw_input_re_0').css("display", "none");
				$('.pw_input_re')
						.css("display", "inline-block");
				$('.pw_input').css("border-color", "red");
			} else {
				$('.pw_input_re_0').css("display", "none");
				$('.pw_input_re').css("display", "none");
				$('.pw_input').css("border-color", "#c1bfc1");
			}
			event.preventDefault()
			event.stopPropagation()
			}else if (ajt = 1) {
				if (confirm("비밀번호를 변경 하시겠습니까?") == true) { //확인
					document.removefrm.submit();
				} else { //취소
					event.preventDefault();
					event.stopPropagation();
				}
			} else {
				event.preventDefault();
				event.stopPropagation();
			}
			
		});
$('.pw_input').on("focusin", function() {
	$('.pw_input').css("border-color", "black");
});
$('.pwck_input').on("focusin", function() {
	$('.pwck_input').css("border-color", "black");
});
$('.pw_input')
.on(
		"propertychange change keyup paste input",
		function() {
			var pass = $('.pw_input').val();
			var passck = $('.pwck_input').val();
			var checkKor = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{8,16}$/
					.test(pass);
			var check1 = /^(?=.*[^a-zA-Z0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,16}$/
					.test(pass);
			if (pass.length < 1) {
				$('.pw_input_re_0').css("display", "inline-block");
				$('.pw_input_re').css("display", "none");
				$('.pw_input').css("border-color", "red");
			} else if (pass.length < 8 || 16 < pass.length
					|| !check1 || checkKor) {
				$('.pw_input_re_0').css("display", "none");
				$('.pw_input_re').css("display", "inline-block");
				$('.pw_input').css("border-color", "red");
			} else {
				$('.pw_input_re_0').css("display", "none");
				$('.pw_input_re').css("display", "none");
				$('.pw_input').css("border-color", "green");
			}
			if (pass == passck) {
				$('.pwck_input_re').css("display", "none");
				$('.pwck_input').css("border-color", "#c1bfc1");
			}
		});
$('.pwck_input').on("propertychange change keyup paste input", function() {
var pass = $('.pw_input').val();
var passck = $('.pwck_input').val();
if (passck.length < 1) {
$('.pwck_input_re_0').css("display", "inline-block");
$('.pwck_input_re').css("display", "none");
} else if (pass != passck) {
$('.pwck_input_re_0').css("display", "none");
$('.pwck_input_re').css("display", "inline-block");
$('.pwck_input').css("border-color", "red");
} else {
$('.pwck_input_re').css("display", "none");
$('.pwck_input').css("border-color", "green");
}
});
$('.pw_input')
.on(
		"focusout",
		function() {
			var pass = $('.pw_input').val();
			var passck = $('.pwck_input').val();
			var checkKor = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{8,16}$/
					.test(pass);
			var check1 = /^(?=.*[^a-zA-Z0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,16}$/
					.test(pass);
			if (pass.length < 1) {
				$('.pw_input_re_0').css("display", "inline-block");
				$('.pw_input').css("border-color", "red");
				$('.pw_input_re').css("display", "none");
			} else if (pass.length < 8) {
				$('.pw_input').css("border-color", "red");
			} else if (16 < pass.length) {
				$('.pw_input').css("border-color", "red");
			} else if (!check1 || checkKor) {
				$('.pw_input_re_0').css("display", "none");
				$('.pw_input_re').css("display", "inline-block");
				$('.pw_input').css("border-color", "red");
			} else {
				$('.pw_input').css("border-color", "#c1bfc1");
			}
		});
$('.pwck_input').on("focusout", function() {
var pass = $('.pw_input').val();
var passck = $('.pwck_input').val();
if (passck.length < 1) {
$('.pwck_input_re_0').css("display", "inline-block");
$('.pwck_input').css("border-color", "red");
$('.pwck_input_re').css("display", "none");
} else if (pass != passck) {
$('.pwck_input_re_0').css("display", "none");
$('.pwck_input_re').css("display", "inline-block");
$('.pwck_input').css("border-color", "red");
} else {
$('.pwck_input_re_0').css("display", "none");
$('.pwck_input').css("border-color", "#c1bfc1");
}
});
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
$(function() { // 눈표시 클릭 시 패스워드 보이기
$('.pwck-eye2').on('click', function() {
$('.pwck-eye2').css("display", "none");
$('.pwck-eye2-1').css("display", "inline-block");
$('.pwck_input').attr("type", "text");
});
$('.pwck-eye2-1').on('click', function() {
$('.pwck-eye2-1').css("display", "none");
$('.pwck-eye2').css("display", "inline-block");
$('.pwck_input').attr("type", "password");
});
});
</script>
</html>