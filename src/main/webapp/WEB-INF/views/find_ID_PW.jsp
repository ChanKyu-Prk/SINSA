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

.tabnav:hover {
	border-bottom: 1px solid white !important;
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
	/* 	display: flex; */
	display: grid;
	place-items: center;
	margin: 100px 0px 300px 0px;
	/* 	min-height: 200vh; */
}

.button-login-join {
	display: block;
	text-align: center;
}

.button_login {
	width: 200px !important;
	height: 50px !important;
	margin: 30px 7px 0px 0px;
	background-color: white !important;
	color: #222020 !important;
	border-radius: 0px !important;
	border: 1px solid #222020 !important;
	font-weight: bold !important;
}

.button_join {
	width: 200px !important;
	height: 50px !important;
	margin: 30px 0px 0px 7px;
	background-color: #222020 !important;
	color: white !important;
	border-radius: 0px !important;
	border: 1px solid #222222 !important;
	font-weight: bold !important;
}

.description {
	text-align: center;
	margin: 0px 0px 50px 0px;
	font-size: 19px;
}

.head {
	text-align: center;
	margin: 0px 0px 30px 0px;
	font-size: 30px;
}

.input_code {
	width: 420px !important;
	border-radius: 0px !important;
}

.button_code {
	margin: 0px 0px 0px 10px;
	width: 130px !important;
	border-radius: 0px !important;
}

.input_email {
	width: 420px !important;
	margin: 0px 0px 0px 0px !important;
	border-radius: 0px !important;
}

.button_email {
	margin: 0px 0px 0px 10px;
	width: 130px !important;
	border-radius: 0px !important;
}

.input_CUS_NAME_forID {
	border-radius: 0px !important;
}

.button_require_ID {
	border-radius: 0px !important;
	background-color: #222020 !important;
	border: 1px solid #222020 !important;
}

.button_require_PW {
	border-radius: 0px !important;
	background-color: #222020 !important;
	border: 1px solid #222020 !important;
}

.input_CUS_ID_forPW {
	border-radius: 0px !important;
}

.input_CUS_EMAIL_forPW {
	border-radius: 0px !important;
	margin: 0px 0px 0px 0px;
}

.input_CUS_NAME_forPW {
	border-radius: 0px !important;
}
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />



	<div class="wrapper">
		<div class="tab">
			<div class="head"> 아이디/비밀번호 찾기</div>
			<div class="description">아이디와 비밀번호는 가입 시 입력하신 정보를 통해 찾을 수 있습니다.</div>
			<ul class="tabnav">
				<li><a href="#tab01">아이디 찾기</a></li>
				<li><a href="#tab02">비밀번호 찾기</a></li>
			</ul>
			<div class="tabcontent">
				<div id="tab01">
					<!--아이디 -->
					<form name="findIDForm">
						<div class="form-group first">
							<label for="username">이름</label> <input type="text"
								name="input_CUS_NAME_forID" id="CUS_NAME"
								class="form-control input_CUS_NAME_forID"
								placeholder="이름을 입력해주세요">
							<div id="fill-out-name"></div>
						</div>


						<div>
							<label for="email">이메일</label>
						</div>
						<div class="input-group mb-3">
							<input type="text" name="input_CUS_EMAIL_forID" id="CUS_EMAIL"
								class="form-control input_CUS_EMAIL_forID input_email"
								placeholder="이메일을 입력해주세요"> <span
								id="button_receive_code_for_ID"
								class="btn btn-outline-secondary button_email"
								onclick="sendCodeForID();">인증번호 요청</span>
						</div>

					</form>

					<div class="input-group mb-3">
						<span><input id="inputCodeForID" name="inputCodeForID"
							type="text"
							class="form-control input_check_code_forID input_code"
							placeholder="인증번호 6자리를 입력해 주세요" aria-label="Recipient's username"
							aria-describedby="button-addon2" disabled="disabled"></span> <span><button
								class="btn btn-outline-secondary input_check_code_forID button_code"
								type="button" id="button-addon2" onclick="checkCodeForID();"
								disabled="disabled">인증 확인</button></span>
					</div>

					<form>
						<div class="form-group">
							<button type="button"
								class="btn btn-block py-2 btn-primary button_require_ID"
								onclick="showID();" disabled="disabled">이메일로 아이디 요청</button>
						</div>
					</form>

					<div class="button-login-join">
						<span><button type="button"
								onclick="location.href='login.do'"
								class="btn py-2 btn-primary button_login">로그인</button></span> <span><button
								type="button" class="btn py-2 btn-primary button_join"
								onclick="location.href='join.do'">회원가입</button></span>
					</div>

				</div>



				<div id="tab02">
					<!--비밀번호-->

					<form name="findPWForm">
						<div class="form-group first">
							<label for="username">아이디</label> <input type="text"
								name="input_CUS_ID_forPW" id="CUS_ID"
								class="form-control input_CUS_ID_forPW"
								placeholder="아이디를 입력해주세요">
							<div id="fill-out-name"></div>
						</div>

						<div class="form-group first">
							<label for="username">이름</label> <input type="text"
								name="input_CUS_NAME_forPW" id="CUS_NAME"
								class="form-control input_CUS_NAME_forPW"
								placeholder="이름을 입력해주세요">
							<div id="fill-out-name"></div>
						</div>

						<div>
							<label for="email">이메일</label>
						</div>
						<div class="input-group mb-3">
							<input type="text" name="input_CUS_EMAIL_forPW" id="CUS_EMAIL"
								class="form-control input_CUS_EMAIL_forPW input_email"
								placeholder="이메일을 입력해주세요"> <span
								id="button_receive_code_for_PW"
								class="btn btn-outline-secondary button_email"
								onclick="sendCodeForPW();">인증번호 요청</span>
						</div>
					</form>


					<div class="input-group mb-3">
						<span><input id="inputCodeForPW" name="inputCodeForPW"
							type="text"
							class="form-control input_check_code_forPW input_code"
							placeholder="인증번호 6자리를 입력해 주세요" aria-label="Recipient's username"
							aria-describedby="button-addon2" disabled="disabled"></span> <span><button
								class="btn btn-outline-secondary input_check_code_forPW button_code"
								type="button" id="button-addon2" onclick="checkCodeForPW();"
								disabled="disabled">인증 확인</button></span>
					</div>

					<form>
						<div class="form-group">
							<button type="button"
								class="btn btn-block py-2 btn-primary button_require_PW"
								onclick="showPW();" disabled="disabled">이메일로 비밀번호 요청</button>
						</div>
					</form>

					<div class="button-login-join">
						<span><button type="button"
								onclick="location.href='login.do'"
								class="btn py-2 btn-primary button_login">로그인</button></span> <span><button
								type="button" class="btn py-2 btn-primary button_join"
								onclick="location.href='join.do'">회원가입</button></span>
					</div>

				</div>



			</div>
		</div>
	</div>
	<!--tab-->






	<jsp:include page="footer.jsp" />




	<script type="text/javascript">
		//아이디찾기
		var arr1 = new Array();
		<c:forEach items="${customerList}" var="customerList">
		arr1.push({
			CUS_NAME : "${customerList.CUS_NAME}",
			CUS_EMAIL : "${customerList.CUS_EMAIL}"
		});
		</c:forEach>

		var customerList = '<c:out value="${customerList}"/>';
		var codeCheckForID = $(".input_check_code_forID");
		var button_require_ID = $(".button_require_ID");

		var codeForID = "";
		var CUS_ID = "";

		function sendCodeForID() {
			var count = 0;
			var codeData = {
				CUS_NAME : $('input[name="input_CUS_NAME_forID"]').val(),
				CUS_EMAIL : $('input[name="input_CUS_EMAIL_forID"]').val()
			}
			if ($('input[name="input_CUS_NAME_forID"]').val() == "") {
				$('input[name="input_CUS_NAME_forID"]').focus();
				alert('이름을 입력해주세요')
			} else if ($('input[name="input_CUS_EMAIL_forID"]').val() == "") {
				$('input[name="input_CUS_EMAIL_forID"]').focus();
				alert('이메일을 입력해주세요')
			}

			for (var i = 0; i < arr1.length; i++) {

				if (arr1[i].CUS_NAME === codeData.CUS_NAME
						&& arr1[i].CUS_EMAIL === codeData.CUS_EMAIL) {
					// 					alert(arr1.length);
					$
							.ajax({
								url : "sendCodeForID.do",
								type : "POST",
								data : codeData,
								success : function(result) {
									codeForID = result;
									document
											.getElementById('button_receive_code_for_ID').innerHTML = "재요청";
									codeCheckForID.attr("disabled", false);

									alert("인증번호가 발송되었습니다.");
								}
							});
				} else {
					count++;

					if (count === arr1.length && codeData.CUS_NAME.length >= 1
							&& codeData.CUS_EMAIL.length >= 1) {
						alert("입력정보와 일치하는 회원정보가 존재하지 않습니다.");
					}

				}
			}

		}

		function checkCodeForID() {

			var inputCodeForID = $('input[name="inputCodeForID"]').val();

			if (codeForID == inputCodeForID) {
				button_require_ID.attr("disabled", false);
				alert('인증되었습니다. 아이디 요청 버튼을 눌러주세요');
			} else {
				alert('정확한 인증번호 6자리를 입력해주세요.');
			}
		}

		function showID() {

			var codeData = {
				CUS_ID : $('input[name="input_CUS_ID_forID"]').val(),
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


	<script type="text/javascript">
		//비밀번호 찾기
		var arr2 = new Array();
		<c:forEach items="${customerList}" var="customerList">
		arr2.push({
			CUS_ID : "${customerList.CUS_ID}",
			CUS_NAME : "${customerList.CUS_NAME}",
			CUS_EMAIL : "${customerList.CUS_EMAIL}"
		});
		</c:forEach>

		var customerList = '<c:out value="${customerList}"/>';
		var codeCheckForPW = $(".input_check_code_forPW");
		var button_require_PW = $(".button_require_PW");

		var codeForPW = "";
		var CUS_PWD = "";

		function sendCodeForPW() {
			var count = 0;
			var codeData = {
				CUS_ID : $('input[name="input_CUS_ID_forPW"]').val(),
				CUS_NAME : $('input[name="input_CUS_NAME_forPW"]').val(),
				CUS_EMAIL : $('input[name="input_CUS_EMAIL_forPW"]').val()
			}
			if ($('input[name="input_CUS_ID_forPW"]').val() == "") {
				$('input[name="input_CUS_ID_forPW"]').focus();
				alert('아이디를 입력해주세요')
			} else if ($('input[name="input_CUS_NAME_forPW"]').val() == "") {
				$('input[name="input_CUS_NAME_forPW"]').focus();
				alert('이름을 입력해주세요')
			} else if ($('input[name="input_CUS_EMAIL_forPW"]').val() == "") {
				$('input[name="input_CUS_EMAIL_forPW"]').focus();
				alert('이메일을 입력해주세요')
			}

			for (var i = 0; i < arr2.length; i++) {

				if (arr2[i].CUS_ID === codeData.CUS_ID
						&& arr2[i].CUS_NAME === codeData.CUS_NAME
						&& arr2[i].CUS_EMAIL === codeData.CUS_EMAIL) {
					// 					alert(arr2.length);
					$
							.ajax({
								url : "sendCodeForPW.do",
								type : "POST",
								data : codeData,
								success : function(result) {
									codeForPW = result;
									document
											.getElementById('button_receive_code_for_PW').innerHTML = "재요청";
									codeCheckForPW.attr("disabled", false);

									alert("인증번호가 발송되었습니다.");

								}
							});
				} else {
					count++;

					if (count === arr2.length && codeData.CUS_ID.length >= 1
							&& codeData.CUS_NAME.length >= 1
							&& codeData.CUS_EMAIL.length >= 1) {
						alert("입력정보와 일치하는 회원정보가 존재하지 않습니다.");
					}
				}
			}
		}

		function checkCodeForPW() {

			var inputCodeForPW = $('input[name="inputCodeForPW"]').val();

			if (codeForPW == inputCodeForPW) {
				button_require_PW.attr("disabled", false);
				alert('인증되었습니다. 비밀번호 요청 버튼을 눌러주세요');
			} else {
				alert('정확한 인증번호 6자리를 입력해주세요.');
			}
		}

		function showPW() {

			var codeData = {
				CUS_ID : $('input[name="input_CUS_ID_forPW"]').val(),
				CUS_NAME : $('input[name="input_CUS_NAME_forPW"]').val(),
				CUS_EMAIL : $('input[name="input_CUS_EMAIL_forPW"]').val()
			}
			$.ajax({
				url : "showPW.do",
				type : "POST",
				data : codeData,
				success : function(result) {
					CUS_PWD = result;
					alert("요청하신 비밀번호를 회원님의 이메일로 전송했습니다.");

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