<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${path}/resources/login_resources/fonts/icomoon/style.css">

<link rel="stylesheet"
	href="${path}/resources/login_resources/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${path}/resources/login_resources/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet"
	href="${path}/resources/login_resources/css/style.css">

<style>
.form {
	text-align: center !important;
}
</style>


<style>
/*tab css*/
.tab {
	float: left;
	width: 600px;
	height: 500px;
}

.tabnav {
	font-size: 0;
	width: 602px;
	border: 1px solid #ddd;
	border-right: 0px solid #ddd;
/*  	border-bottom: 3px solid black;  */
}

.tabnav li {
	display: inline-block;
	height: 46px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.tabnav li a:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}

.tabnav li a.active:before {
/* 	background: black; */
	
}

.tabnav li a.active {
	border-bottom: 3px solid #fff !important;
/* 	border-right: 3px solid black; */
/* 	border-left: 3px solid black; */
/* 	border-top: 3px solid black; */
}

.tabnav li a {
/* 	border-bottom: 3px solid black; */
	position: relative;
	display: block;
	background: #f8f8f8;
	color: #000;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
	width: 299px;
}

.tabnav li a:hover, .tabnav li a.active {
	background: #fff;
/* 	color: black; */
}

.tabcontent {
	padding: 20px;
	height: 400px;
	border: 0px solid #ddd;
	border-top: none;
}

.wrapper {
	display: flex;
	display: grid;
	place-items: center;
	min-height: 100vh;
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />



	<div class="wrapper">
		<div class="tab">
			<ul class="tabnav">
				<li><a href="#tab01">아이디 찾기</a></li>
				<li><a href="#tab02">비밀번호 찾기</a></li>
			</ul>
			<div class="tabcontent">
				<div id="tab01">
					<!--탭1 내용 -->
					<form name="loginFrm">
						<div class="form-group first">
							<label for="username">이름</label> <input type="text"
								name="input_CUS_NAME_forID" id="CUS_NAME" class="form-control input_CUS_NAME_forID"
								placeholder="이름을 입력해주세요">
							<div id="fill-out-name"></div>
						</div>
						
						


						<div class="form-group last mb-3">
							<label for="email">이메일</label> <input type="text"
								name="input_CUS_EMAIL_forID" id="CUS_EMAIL" class="form-control input_CUS_EMAIL_forID"
								placeholder="이메일을 입력해주세요">
						</div>
						<div class="form-group">
							<span id="button_receive_code"
								class="btn btn-block py-2 btn-primary" onclick="sendCode();">인증번호
								요청</span>
						</div>

					</form>

					<div class="input-group mb-3">
						<input id="inputCode" name="inputCode" type="text"
							class="form-control input_check_code_forID"
							placeholder="인증번호 6자리를 입력해 주세요" aria-label="Recipient's username"
							aria-describedby="button-addon2" disabled="disabled">
						<button class="btn btn-outline-secondary input_check_code_forID"
							type="button" id="button-addon2" onclick="checkCode();"
							disabled="disabled">인증 확인</button>
					</div>

					<form>
						<div class="form-group">
							<button type="button"
								class="btn btn-block py-2 btn-primary button_require_ID"
								onclick="showID();" disabled="disabled">이메일로 아이디 요청</button>
						</div>
					</form>
				</div>







				<div id="tab02">
					<!--탭2 내용 -->




					<form action="find_PWD.do" method="post">
						<div class="form-group first">
							<label for="username">아이디</label> <input type="text"
								name="CUS_ID" class="form-control" placeholder="아이디를 입력해주세요">
						</div>

						<div class="form-group first">
							<label for="username">이름</label> <input type="text"
								name="CUS_NAME" class="form-control" placeholder="이름을 입력해주세요">
						</div>

						<div class="form-group last mb-3">
							<label for="email">이메일</label> <input type="text"
								name="CUS_EMAIL" class="form-control" placeholder="이메일을 입력해주세요">
						</div>

						<div class="form-group">
							<input type="button" value="인증번호 받기" name="checkNum"
								class="btn btn-block py-2 btn-primary code_check">
						</div>


						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Recipient's username"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button"
								class="code_check" id="button-addon2">인증 확인</button>
						</div>
						<input type="submit" value="비밀번호 찾기"
							class="btn btn-block py-2 btn-primary">
					</form>
				</div>



			</div>
		</div>
	</div>
	<!--tab-->






	<jsp:include page="footer.jsp" />




	<script type="text/javascript">
		var arr = new Array();
		<c:forEach items="${customerList}" var="customerList">
		arr.push({
			CUS_NAME : "${customerList.CUS_NAME}",
			CUS_EMAIL : "${customerList.CUS_EMAIL}"
		});
		</c:forEach>

		var customerList = '<c:out value="${customerList}"/>';
		var codeCheck = $(".input_check_code_forID");
		var button_require_ID = $(".button_require_ID");

		var code = "";
		var CUS_ID = "";

		function sendCode() {
			var count = 0;
			var codeData = {
				CUS_NAME : $('input[name="input_CUS_NAME_forID"]').val(),
				CUS_EMAIL : $('input[name="input_CUS_EMAIL_forID"]').val()
			}
			
			

			if($('input[name="input_CUS_NAME_forID"]').val() == ""){
				$('input[name="input_CUS_NAME_forID"]').focus();
				alert('이름을 입력해주세요')
// 				document.getElementById('fill-out-name').innerHTML = "이름을 입력해주세요";
// 				$('.input_CUS_NAME_forID').css("border-color", "red");
			}else if($('input[name="input_CUS_EMAIL_forID"]').val() == ""){
				$('input[name="input_CUS_EMAIL_forID"]').focus();
				alert('이메일을 입력해주세요')
// 				$('.input_CUS_EMAIL_forID').css("border-color", "red");
			}
			
			
			
			

			for (var i = 0; i < arr.length; i++) {
				
				if (arr[i].CUS_NAME === codeData.CUS_NAME && arr[i].CUS_EMAIL === codeData.CUS_EMAIL) {
// 					alert(arr.length);
					$.ajax({
								url : "sendEmail.do",
								type : "POST",
								data : codeData,
								success : function(result) {
									code = result;
									document
											.getElementById('button_receive_code').innerHTML = "인증번호 재요청";
									codeCheck.attr("disabled", false);

									alert("인증번호가 발송되었습니다.");

								}
							});
				} else {
					count++;
					
					if (count === arr.length && codeData.CUS_NAME.length >= 1 && codeData.CUS_EMAIL.length >= 1) {
						alert("입력정보와 일치하는 회원정보가 존재하지 않습니다.");
					}

				}
			}

		}

		function checkCode() {

			var inputCode = $('input[name="inputCode"]').val();

			if (code == inputCode) {
				button_require_ID.attr("disabled", false);
				alert('인증되었습니다. 아이디 요청 버튼을 눌러주세요');
			} else {
				alert('정확한 인증번호 6자리를 입력해주세요.');
			}
		}

		function showID() {

			var codeData = {
				CUS_NAME : $('input[name="input_CUS_NAME_forID"]').val(),
				CUS_EMAIL : $('input[name="input_CUS_EMAIL_forID"]').val()
			}
			$.ajax({
				url : "showID.do",
				type : "POST",
				data : codeData,
				success : function(result) {
					CUS_ID = result;
					alert("요청하신 아이디를 회원님의 이메일로 전송했습니다.");

				}
			});
		}
	</script>

	<script>
		$(function() {
			$('.tabcontent > div').hide();
			$('.tabnav a').click(function() {
				$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabnav a').removeClass('active');
				$(this).addClass('active');
				return false;
			}).filter(':eq(0)').click();
		});
	</script>






</body>
</html>