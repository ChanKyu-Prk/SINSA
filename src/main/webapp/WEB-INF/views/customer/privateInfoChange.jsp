<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

.user_wrap {
	margin-top: 25px;
}

.user_name {
	
}

.user_input_box {
	
}

.user_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.user_input_re {
	color: red;
	display: none;
}

.user_input_re_0 {
	color: red;
	display: none;
}

.gender_wrap {
	margin-top: 25px;
}

.gender_name {
	padding: 0px !important;
}

.gender_input_box {
	
}

.gender_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.tel_wrap {
	margin-top: 25px;
}

.tel_name {
	
}

.tel_input_box {
	
}

.tel_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.tel_input_re {
	color: red;
	display: none;
}

.tel_input_re_0 {
	color: red;
	display: none;
}

.birth_wrap {
	margin-top: 25px;
}

.birth_name {
	padding: 0px !important;
}

.birth_input_box {
	
}

.padding0 {
	padding: 0 !important;
}

.birth_input {
	padding: 5px;
	width: 95%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.birth_input_re {
	color: red;
	display: none;
}

.gender_input_re {
	color: red;
	display: none;
}
/* 메일 영역 */
.mail_wrap {
	margin-top: 25px;
}

.mail_name {
	
}

.mail_input_box {
	padding-left: 0px !important;
}

.width100 {
	width: 100%;
}

.mail_input {
	padding: 0 !important;
	width: 100%;
	height: 38px;
	border: none;
	background-color: #ebebe4;
}

.mail_input_2 {
	padding: 0 !important;
	width: 100%;
	height: 38px;
	border: none;
	background-color: #ebebe4;
}

.mail_input_select_wrap {
	
}

#mail_input_select {
	display: none;
}

.mail_input_select {
	padding: 0 !important;
	width: 100% !important;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.eamil_ {
	top: 5px;
}

#mail_check_wrap {
	display: none;
}

.mail_check_wrap {
	margin-top: 7px;
}

.mail_update_btn_wrap {
	padding: 0 !important;
	text-align: center;
	height: 40px;
	border: 1px solid #c1bfc1;
	cursor: pointer;
}

.mail_update_btn {
	display: table;
	width: 100% !important;
	padding: 0 !important;
	text-align: center;
	height: 40px;
	border: 1px solid #c1bfc1;
	cursor: pointer;
}

.mail_check_input_box {
	padding: 0px !important;
}

.mail_check_input {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.mail_check_button_c {
	display: none;
	text-align: center;
	padding: 0px !important;
	cursor: pointer;
	border: 1px solid #c1bfc1;
	padding-top: 5px;
}

.mail_check_button_c2 {
	display: table;
	text-align: center;
	padding: 0px !important;
	border: 1px solid #c1bfc1;
	padding-top: 5px;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
}

.email_cancel {
	display: table;
	text-align: center;
	padding: 0px !important;
	float: right;
	cursor: pointer;
	border: 1px solid #c1bfc1;
	margin-top: 5px !important;
	text-align: center;
	height: 40px;
}

.mail_check_button {
	display: table;
	text-align: center;
	padding: 0px !important;
	float: right;
	cursor: pointer;
	border: 1px solid #c1bfc1;
	padding-top: 5px;
	text-align: center;
}

.vetical_middle {
	display: table-cell;
	vertical-align: middle;
}

.email-row {
	border: 1px solid #c1bfc1;
	height: 40px;
	margin: 0px !important;
	width: 95%;
	background-color: #ebebe4;
}

.mail_input_re {
	color: red;
	display: none;
}

.mail_input_re_0 {
	color: red;
	display: none;
}

.email_row_2 {
	border: none;
	height: 40px;
	margin: 0px !important;
	width: 95%;
	height: 40px;
}

.email_row_3 {
	border: none;
	height: 40px;
	margin: 0px !important;
	width: 95%;
	height: 40px;
	margin-top: 25px;
}
/* 주소 영역 */
.address_wrap {
	margin-top: 25px;
}

.address_name {
	
}

.address_input_1_box {
	
}

.address_input_1 {
	width: 95%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.address_button {
	width: 100%;
	cursor: pointer;
	border: 1px solid #c1bfc1;
	display: table;
	text-align: center;
}

.address_input_2_wrap {
	margin-top: 7px;
}

.address_input_2_box {
	
}

.address_input_2 {
	margin-top:;
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.address_input_3_wrap {
	margin-top: 7px;
}

.address_input_3_box {
	
}

.address_input_3 {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.address_input_4_wrap {
	margin-top: 7px;
}

.address_input_4_box {
	
}

.address_input_4 {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.address_input_5_wrap {
	margin-top: 7px;
}

.address_input_5_box {
	
}

.address_input_5 {
	width: 100%;
	height: 40px;
	border: 1px solid #c1bfc1;
}

.addr_input_re {
	color: red;
	display: none;
}

.mail_check_input_correct {
	color: green;
	display: none;
}

.mail_check_input_incorrect {
	color: red;
	display: none;
}

.clearfix {
	clear: both;
}

#Ggrey {
	color: #c1bfc1;
}

input::placeholder {
	color: #c1bfc1;
}

#mail_check_input_box_false {
	background-color: #ebebe4;
}

#mail_check_input_box_true {
	background-color: white;
}


.change_button{
border : solid 1px ;
height : 40px;
width : 150px;
float : right;
margin-top : 20px;
margin-bottom : 20px;
border: 1px solid #c1bfc1;
}

</style>
<title>SINSA : 개인정보 수정</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<span>개인정보 수정</span>
				</div>
				<hr>
				<div class="container-h">
					<form action="privateInfoChange" method="post">
						<div class="wrap">
							<div class="user_wrap">
								<div class="user_name">이름</div>
								<div class="user_input_box">
									<input class="user_input" name="CUS_NAME" placeholder=" 이름  입력"
										value="${myInfo.CUS_NAME }">
								</div>
								<div>
									<span class="user_input_re">필수 입력사항 입니다.</span> <span
										class="user_input_re_0">한글만 입력 가능합니다.</span>
								</div>
							</div>
							<div class="tel_wrap">
								<div class="tel_name">전화번호</div>
								<div class="tel_input_box">
									<input class="tel_input" name="CUS_TEL"
										placeholder="  '-'없이 입력해 주세요" value="${myInfo.CUS_TEL }">
								</div>
								<div>
									<span class="tel_input_re">필수 입력사항 입니다.</span> <span
										class="tel_input_re_0">숫자만 입력 가능합니다.</span>
								</div>
							</div>

							<div class="birth_wrap">
								<div class="container BGC">
									<div class="row">
										<div class="birth_name col-9">생년월일</div>
										<div class="gender_name col-3">성별</div>
									</div>
								</div>
								<div class="birth_input_box">
									<div class="container BGCI">
										<div class="row">
											<div class="padding0 col-9">
												<input type="date" id="birth" class="birth_input"
													name="CUS_BIRTH_Date" value="${myInfo.CUS_BIRTH }">
											</div>
											<select class="gender_input col-3" name="CUS_GENDER">
												<option value="" disabled selected id="Ggrey">성별</option>
												<option value="남성"
													<c:if test="${myInfo.CUS_GENDER =='남성'}">selected</c:if>>남성</option>
												<option value="여성"
													<c:if test="${myInfo.CUS_GENDER =='여성'}">selected</c:if>>여성</option>
											</select>
										</div>

									</div>
									<div class="container">
										<div class="row">
											<div class="padding0 col-9">
												<span class="birth_input_re">필수 입력사항 입니다.</span>
											</div>
											<div class="padding0 col-3">
												<span class="gender_input_re">필수 입력사항 </span>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="mail_wrap">

								<div class="mail_name">이메일</div>
								<input type="hidden" value="${email[0] }" id="email1">
								<input type="hidden" value="${email[1] }" id="email2">
								<div class="container">

									<div class="row">
										<div class="col-9 padding0">
											<div class="row email-row">
												<div class="mail_input_box col-6 padding0">
													<input class="mail_input" name="CUS_EMAIL_1"
														placeholder=" 이메일 입력" value="${email[0] }" readonly>
												</div>
												<div class="col-1 padding0 eamil_">@</div>
												<div class="col-5 padding0">
													<input class="mail_input_2" id="mail" name="CUS_EMAIL_2"
														placeholder="직접 입력" value="${email[1] }" readonly>

												</div>
											</div>
										</div>



										<div class="mail_update_btn col-3 padding0">
											<span class="vetical_middle">이메일 변경 </span>
										</div>

										<div class="col-3 padding0 mail_input_select_wrap"
											id="mail_input_select">
											<select class="mail_input_select col-12">
												<option value="" selected>직접 입력</option>
												<option value="google.com">google.com</option>
												<option value="naver.com">naver.com</option>
											</select>
										</div>
									</div>
								</div>
								<div>
									<span class="mail_input_re">필수 입력사항 입니다.</span> <span
										class="mail_input_re_0">이메일 입력해 주세요.</span>
								</div>


								<div class="mail_check_wrap" id="mail_check_wrap">
									<div class="container">
										<div class="row">
											<div class="col-9 padding0">
												<div class="row email_row_2">

													<div class="mail_check_input_box col-9 padding0"
														id="mail_check_input_box_false">
														<input class="mail_check_input" disabled="disabled">
													</div>
													<div class="mail_check_button_c col-3 padding0">
														<span class="vetical_middle"> 확인 </span>
													</div>
													<div class="mail_check_button_c2 col-3 padding0">
														<span class="vetical_middle"> 확인 </span>
													</div>
												</div>
											</div>
											<div class="mail_check_button col-3">
												<span class="vetical_middle" id="send">인증번호 전송</span>
											</div>



										</div>
										<div class="row">
											<div class="col-9 padding0">
											<div class="row email_row_3">
											</div></div>
												<div class="email_cancel col-3">
													<span class="vetical_middle">이메일 변경취소</span>
												</div>
										</div>
									</div>



									<div class="clearfix"></div>
									<span class="mail_check_input_correct">인증번호가 일치합니다</span> <span
										class="mail_check_input_incorrect">인증번호를 다시 확인해주세요.</span> <input
										type="hidden" value="1" class="code_is_correct"
										id="code_is_correct">
								</div>

							</div>


							<div class="address_wrap">
								<div class="address_name">주소</div>

								<div class="container">
									<div class="address_input_1_wrap">
										<div class="row padding0">
											<div class="address_input_1_box col-9 padding0">
												<input class="address_input_1" id="sample4_postcode"
													placeholder="우편번호" name="CUS_ADDR_1" value="${fn:substring(addr[0],1,6) }">
											</div>
											<div class="address_button col-3 padding0">
												<span class="vetical_middle"
													onclick="sample4_execDaumPostcode()">주소 찾기</span>

											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="address_input_2_wrap">
									<div class="address_input_2_box ">
										<input class="address_input_2" id="sample4_roadAddress"
											placeholder="도로명주소" name="CUS_ADDR_2" value="${addr[1]}">
									</div>
								</div>
								<div class="address_input_3_wrap">
									<div class="address_input_3_box">
										<input type="hidden" class="address_input_3"
											id="sample4_jibunAddress" placeholder="지번주소"
											name="CUS_ADDR_3">
									</div>
								</div>
								<div class="address_input_4_wrap">
									<div class="address_input_4_box">
										<input class="address_input_4" id="sample4_detailAddress"
											placeholder="상세주소 입력" name="CUS_ADDR_4" value="${addr[3]}">
									</div>
								</div>
								<div class="address_input_5_wrap">
									<div class="address_input_5_box">
										<input type="hidden" class="address_input_5"
											id="sample4_extraAddress" placeholder="참고항목"
											name="CUS_ADDR_5" value="${addr[2]}">
									</div>
								</div>
								<div>
									<span class="addr_input_re">필수 입력사항 입니다.</span>
								</div>
							</div>

							<span id="guide" style="color: #999; display: none"></span>


							<div class="change_button_wrap">
								<input type="submit" class="change_button" value="변경하기">
							</div>
						</div>
					</form>
				</div>


			</div>
			<hr />


			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</body>
<script>
	var code = ""; //이메일전송 인증번호 저장위한 코드
	$(document)
			.ready(
					function() {
						$(".mail_check_button")
								.click(
										function() {
											var cehckBox = $(".mail_check_input"); // 인증번호 입력란
											var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
											var email_1 = $('.mail_input')
													.val();
											var email_2 = $('.mail_input_2')
													.val();
											if (email_2.length < 1
													|| email_1.length < 1) {
												$('.email-row').css(
														"border-color", "red");
												$('.mail_input_re').css(
														"display", "none");
												$('.mail_input_re_0').css(
														"display",
														"inline-block");
											} else {
												$('.email-row').css(
														"border-color",
														"#c1bfc1");
												$('.mail_input_re').css(
														"display", "none");
												$('.mail_input_re_0').css(
														"display", "none");
												$.ajax({
													type : "GET",
													url : "mailCheck?email_1="
															+ email_1
															+ "&email_2="
															+ email_2,
													success : function(data) {
														code = data;
													}
												});
												cehckBox
														.attr("disabled", false);
												boxWrap
														.attr("id",
																"mail_check_input_box_true");
												document.getElementById('send').innerHTML = "재전송";
												$('.mail_check_button_c').css(
														"display", "table");
												$('.mail_check_button_c2').css(
														"display", "none");
												$('.mail_check_input').attr(
														"placeholder",
														"인증번호를 입력하세요");
											}
										});
						/* 인증번호 비교 */
						$('.mail_check_button_c')
								.on(
										"click",
										function() {
											var inputCode = $(
													".mail_check_input").val(); // 입력코드  
											if (inputCode == code) { // 일치할 경우
												$('.mail_check_input_correct')
														.css("display",
																"inline-block");
												$('.mail_check_input_incorrect')
														.css("display", "none");
												document
														.getElementById('code_is_correct').value = 1;
											} else { // 일치하지 않을 경우
												$('.mail_check_input_correct')
														.css("display", "none");
												$('.mail_check_input_incorrect')
														.css("display",
																"inline-block");
												document
														.getElementById('code_is_correct').value = 0;
											}
										});
					});
	$('.user_input').on("focusin", function() {
		$('.user_input').css("border-color", "black");
	});
	$('.tel_input').on("focusin", function() {
		$('.tel_input').css("border-color", "black");
	});
	$('.gender_input').on("focusin", function() {
		$('.gender_input').css("border-color", "black");
	});
	$('.birth_input').on("focusin", function() {
		$('.birth_input').css("border-color", "black");
	});
	$('.mail_input').on("focusin", function() {
		$('.email-row').css("border-color", "black");
	});
	$('.mail_input_2').on("focusin", function() {
		$('.email-row').css("border-color", "black");
	});
	$('.mail_input_select').on("focusin", function() {
		$('.mail_input_select').css("border-color", "black");
	});
	$('.mail_check_input').on("focusin", function() {
		$('.mail_check_input').css("border-color", "black");
	});
	$('.address_input_1').on("focusin", function() {
		$('.address_input_1').css("border-color", "black");
	});
	$('.address_input_2').on("focusin", function() {
		$('.address_input_2').css("border-color", "black");
	});
	$('.address_input_4').on("focusin", function() {
		$('.address_input_4').css("border-color", "black");
	});
	$('.mail_check_input').on("focusout", function() {
		$('.mail_check_input').css("border-color", "#c1bfc1");
	});
	$('.user_input').on(
			"propertychange change keyup paste input",
			function() {
				var name = $('.user_input').val();
				var checkNum = /[0-9]/;
				var checkUpEng = /[A-Z]/;
				var checkLoEng = /[a-z]/;
				var checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
				var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if (name.length < 1) {
					$('.user_input').css("border-color", "red");
					$('.user_input_re').css("display", "inline-block");
					$('.user_input_re_0').css("display", "none");
				} else if (checkNum.test(name) || checkUpEng.test(name)
						|| checkLoEng.test(name) || checkSpc.test(name)
						|| !checkKor.test(name)) {
					$('.user_input').css("border-color", "red");
					$('.user_input_re').css("display", "none");
					$('.user_input_re_0').css("display", "inline-block");
				} else {
					$('.user_input').css("border-color", "black");
					$('.user_input_re').css("display", "none");
					$('.user_input_re_0').css("display", "none");
				}
			});
	$('.user_input').on(
			"focusout",
			function() {
				var name = $('.user_input').val();
				var checkNum = /[0-9]/;
				var checkUpEng = /[A-Z]/;
				var checkLoEng = /[a-z]/;
				var checkSpc = /[~!@#$%^&*()_+|<>?:{}-]/;
				var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if (name.length < 1) {
					$('.user_input').css("border-color", "red");
					$('.user_input_re').css("display", "inline-block");
				} else if (checkNum.test(name) || checkUpEng.test(name)
						|| checkLoEng.test(name) || checkSpc.test(name)
						|| !checkKor.test(name)) {
					$('.user_input').css("border-color", "red");
					$('.user_input_re').css("display", "none");
					$('.user_input_re_0').css("display", "inline-block");
				} else {
					$('.user_input').css("border-color", "#c1bfc1");
					$('.user_input_re').css("display", "none");
				}
			});
	$('.tel_input').on(
			"propertychange change keyup paste input",
			function() {
				var tel = $('.tel_input').val();
				var checkNum = /[0-9]/;
				var checkUpEng = /[A-Z]/;
				var checkLoEng = /[a-z]/;
				var checkSpc = /[~!@#$%^&*()_+|<>?:{}-]/;
				var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if (tel.length < 1) {
					$('.tel_input').css("border-color", "red");
					$('.tel_input_re').css("display", "inline-block");
					$('.tel_input_re_0').css("display", "none");
				} else if (!checkNum.test(tel) || checkUpEng.test(tel)
						|| checkLoEng.test(tel) || checkSpc.test(tel)
						|| checkKor.test(tel)) {
					$('.tel_input').css("border-color", "red");
					$('.tel_input_re').css("display", "none");
					$('.tel_input_re_0').css("display", "inline-block");
				} else {
					$('.tel_input').css("border-color", "black");
					$('.tel_input_re').css("display", "none");
					$('.tel_input_re_0').css("display", "none");
				}
			});
	$('.tel_input').on(
			"focusout",
			function() {
				var tel = $('.tel_input').val();
				var checkNum = /[0-9]/;
				var checkUpEng = /[A-Z]/;
				var checkLoEng = /[a-z]/;
				var checkSpc = /[~!@#$%^&*()_+|<>?:{}-]/;
				var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if (tel.length < 1) {
					$('.tel_input').css("border-color", "red");
					$('.tel_input_re').css("display", "inline-block");
					$('.tel_input_re_0').css("display", "none");
				} else if (!checkNum.test(tel) || checkUpEng.test(tel)
						|| checkLoEng.test(tel) || checkSpc.test(tel)
						|| checkKor.test(tel)) {
					$('.tel_input').css("border-color", "red");
					$('.tel_input_re').css("display", "none");
					$('.tel_input_re_0').css("display", "inline-block");
				} else {
					$('.tel_input').css("border-color", "#c1bfc1");
					$('.tel_input_re').css("display", "none");
				}
			});
	$('.gender_input').on("change", function() {
		$('.gender_input').css("border-color", "#c1bfc1");
		$('.gender_input_re').css("display", "none");
	});
	$('.gender_input').on("focusout", function() {
		var gender = $('.gender_input').val();
		if (gender == null) {
			$('.gender_input').css("border-color", "red");
			$('.gender_input_re').css("display", "inline-block");
		} else {
			$('.gender_input').css("border-color", "#c1bfc1");
			$('.gender_input_re').css("display", "none");
		}
	});
	$('.birth_input').on("change", function() {
		$('.birth_input').css("border-color", "#c1bfc1");
		$('.birth_input_re').css("display", "none");
	});
	$('.birth_input').on("focusout", function() {
		var birth = $('.birth_input').val();
		if (birth == "") {
			$('.birth_input').css("border-color", "red");
			$('.birth_input_re').css("display", "inline-block");
		} else {
			$('.birth_input').css("border-color", "#c1bfc1");
			$('.birth_input_re').css("display", "none");
		}
	});
	$('.mail_input_select').on("change", function() {
		var select = $('.mail_input_select').val();
		if (select != "") {
			document.getElementById('mail').value = select;
			$('.mail_input_2').attr("readonly", true);
		} else {
			document.getElementById('mail').value = "";
			$('.mail_input_2').attr("readonly", false);
		}
		var mail1 = $('.mail_input').val();
		var mail2 = $('.mail_input_2').val();
		if (mail2.length < 1 || mail1.length < 1) {
		} else {
			$('.email-row').css("border-color", "#c1bfc1");
			$('.mail_input_re').css("display", "none");
			$('.mail_input_re_0').css("display", "none");
		}
	});
	$('.mail_input').on("focusout", function() {
		var mail1 = $('.mail_input').val();
		var mail2 = $('.mail_input_2').val();
		if (mail2.length < 1 || mail1.length < 1) {
			$('.email-row').css("border-color", "red");
			$('.mail_input_re').css("display", "inline-block");
			$('.mail_input_re_0').css("display", "none");
		} else {
			$('.email-row').css("border-color", "#c1bfc1");
			$('.mail_input_re').css("display", "none");
			$('.mail_input_re_0').css("display", "none");
		}
	});
	$('.mail_input_2').on("focusout", function() {
		var mail1 = $('.mail_input').val();
		var mail2 = $('.mail_input_2').val();
		if (mail2.length < 1 || mail1.length < 1) {
			$('.email-row').css("border-color", "red");
			$('.mail_input_re').css("display", "inline-block");
			$('.mail_input_re_0').css("display", "none");
		} else {
			$('.email-row').css("border-color", "#c1bfc1");
			$('.mail_input_re').css("display", "none");
			$('.mail_input_re_0').css("display", "none");
		}
	});
	$('.mail_input_select').on("focusout", function() {
		$('.mail_input_select').css("border-color", "#c1bfc1");
		var mail1 = $('.mail_input').val();
		var mail2 = $('.mail_input_2').val();
		if (mail2.length < 1 || mail1.length < 1) {
		} else {
			$('.email-row').css("border-color", "#c1bfc1");
			$('.mail_input_re').css("display", "none");
			$('.mail_input_re_0').css("display", "none");
		}
	});

	$('.mail_update_btn').on("click", function() {
		$('.mail_update_btn').css("display", "none");
		$('#mail_input_select').css("display", "inline-block");
		$('#mail_check_wrap').css("display", "block");
		$('.mail_input').val("");
		$('.mail_input_2').val("");
		$('.code_is_correct').val(0);
		$('.mail_input').attr("readonly", false);
		$('.mail_input_2').attr("readonly", false);
		$('.mail_input').css("background-color", "white");
		$('.mail_input_2').css("background-color", "white");
		$('.email-row').css("background-color", "white");
	});

	$('.email_cancel').on("click", function() {
		var email1 = $('#email1').val();
		var email2 = $('#email2').val();
		$('.mail_update_btn').css("display", "table");
		$('#mail_input_select').css("display", "none");
		$('#mail_check_wrap').css("display", "none");
		$('.mail_input').val(email1);
		$('.mail_input_2').val(email2);
		$('.code_is_correct').val(1);
		$('.mail_input').attr("readonly", true);
		$('.mail_input_2').attr("readonly", true);
		$('.mail_input').css("background-color", "#ebebe4");
		$('.mail_input_2').css("background-color", "#ebebe4");
		$('.email-row').css("background-color", "#ebebe4");
		$('.email-row').css("border-color", "#c1bfc1");
		$('.mail_input_re').css("display", "none");
		$('.mail_input_re_0').css("display", "none");
	});
	
	
	$('.address_input_1')
			.on(
					"propertychange change keyup paste input",
					function() {
						var addr1 = $('.address_input_1').val();
						if (addr1.length < 1) {
							$('.addr_input_re').css("display", "inline-block");
							$('.address_input_1').css("border-color", "red");
						} else {
							$('.address_input_1').css("border-color", "black");
							if (!(addr1.length < 1 || addr2.length < 1 || addr4.length < 1)) {
								$('.addr_input_re').css("display", "none");
							}
						}
					});
	$('.address_input_2')
			.on(
					"propertychange change keyup paste input",
					function() {
						var addr2 = $('.address_input_2').val();
						if (addr2.length < 1) {
							$('.addr_input_re').css("display", "inline-block");
							$('.address_input_2').css("border-color", "red");
						} else {
							$('.address_input_2').css("border-color", "black");
							if (!(addr1.length < 1 || addr2.length < 1 || addr4.length < 1)) {
								$('.addr_input_re').css("display", "none");
							}
						}
					});
	$('.address_input_4')
			.on(
					"propertychange change keyup paste input",
					function() {
						var addr4 = $('.address_input_4').val();
						if (addr4.length < 1) {
							$('.addr_input_re').css("display", "inline-block");
							$('.address_input_4').css("border-color", "red");
						} else {
							$('.address_input_4').css("border-color", "black");
							if (!(addr1.length < 1 || addr2.length < 1 || addr4.length < 1)) {
								$('.addr_input_re').css("display", "none");
							}
						}
					});
	$('.address_input_1').on("focusout", function() {
		var addr1 = $('.address_input_1').val();
		if (addr1.length < 1) {
			$('.addr_input_re').css("display", "inline-block");
			$('.address_input_1').css("border-color", "red");
		} else {
			$('.address_input_1').css("border-color", "#c1bfc1");
			if (!(addr1.length < 1 || addr2.length < 1 || addr4.length < 1)) {
				$('.addr_input_re').css("display", "none");
			}
		}
	});
	$('.address_input_2').on("focusout", function() {
		var addr2 = $('.address_input_2').val();
		if (addr2.length < 1) {
			$('.addr_input_re').css("display", "inline-block");
			$('.address_input_2').css("border-color", "red");
		} else {
			$('.address_input_2').css("border-color", "#c1bfc1");
			if (!(addr1.length < 1 || addr2.length < 1 || addr4.length < 1)) {
				$('.addr_input_re').css("display", "none");
			}
		}
	});
	$('.address_input_4').on("focusout", function() {
		var addr4 = $('.address_input_4').val();
		if (addr4.length < 1) {
			$('.addr_input_re').css("display", "inline-block");
			$('.address_input_4').css("border-color", "red");
		} else {
			$('.address_input_4').css("border-color", "#c1bfc1");
			if (!(addr1.length < 1 || addr2.length < 1 || addr4.length < 1)) {
				$('.addr_input_re').css("display", "none");
			}
		}
	});
	$('.change_button')
			.on(
					"click",
					function() {
						var name = $('.user_input').val();
						var tel = $('.tel_input').val();
						var birth = $('.birth_input').val();
						var gender = $('.gender_input').val();
						var mail1 = $('.mail_input').val();
						var mail2 = $('.mail_input_2').val();
						var codeCk = $('.code_is_correct').val();
						var addr1 = $('.address_input_1').val();
						var addr2 = $('.address_input_2').val();
						var addr3 = $('.address_input_4').val();
						var checkNum = /[0-9]/;
						var checkUpEng = /[A-Z]/;
						var checkLoEng = /[a-z]/;
						var checkSpc = /[~!@#$%^&*()_+|<>?:{}-]/;
						var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
						if (addr3.length < 1 || addr2.length < 1
								|| addr1.length < 1 || codeCk == 0 || mail2 < 1
								|| mail1 < 1 || gender == null || birth == ""
								|| name < 1 || checkNum.test(name)
								|| checkUpEng.test(name)
								|| checkLoEng.test(name) || checkSpc.test(name)
								|| !checkKor.test(name) || tel.length < 1
								|| !checkNum.test(tel) || checkUpEng.test(tel)
								|| checkLoEng.test(tel) || checkSpc.test(tel)
								|| checkKor.test(tel)) {
							if (addr3.length < 1) {
								$('.address_input_4').focus();
								$('.addr_input_re').css("display",
										"inline-block");
								$('.address_input_4')
										.css("border-color", "red");
							} else {
								$('.addr_input_re').css("display", "none");
								$('.address_input_4').css("border-color",
										"#c1bfc1");
							}
							if (addr2.length < 1) {
								$('.address_input_2').focus();
								$('.addr_input_re').css("display",
										"inline-block");
								$('.address_input_2')
										.css("border-color", "red");
							} else {
								$('.addr_input_re').css("display", "none");
								$('.address_input_2').css("border-color",
										"#c1bfc1");
							}
							if (addr1.length < 1) {
								$('.address_input_1').focus();
								$('.addr_input_re').css("display",
										"inline-block");
								$('.address_input_1')
										.css("border-color", "red");
							} else {
								$('.addr_input_re').css("display", "none");
								$('.address_input_1').css("border-color",
										"#c1bfc1");
							}
							if (codeCk == 0) {
								$('.code_is_correct').focus();
								$('.mail_check_input_correct').css("display",
										"none");
								$('.mail_check_input_incorrect').css("display",
										"inline-block");
							} else {
								$('.mail_check_input_correct').css("display",
										"inline-block");
								$('.mail_check_input_incorrect').css("display",
										"none");
							}
							if (mail2 < 1) {
								$('.mail_input_2').focus();
								$('.email-row').css("border-color", "red");
								$('.mail_input_re').css("display",
										"inline-block");
								$('.mail_input_re_0').css("display", "none");
							} else {
								$('.email-row').css("border-color", "#c1bfc1");
								$('.mail_input_re').css("display", "none");
								$('.mail_input_re_0').css("display", "none");
							}
							if (mail1 < 1) {
								$('.mail_input').focus();
								$('.email-row').css("border-color", "red");
								$('.mail_input_re').css("display",
										"inline-block");
								$('.mail_input_re_0').css("display", "none");
							} else {
								$('.email-row').css("border-color", "#c1bfc1");
								$('.mail_input_re').css("display", "none");
								$('.mail_input_re_0').css("display", "none");
							}
							if (gender == null) {
								$('.gender_input').focus();
								$('.gender_input').css("border-color", "red");
								$('.gender_input_re').css("display",
										"inline-block");
							} else {
								$('.gender_input').css("border-color",
										"#c1bfc1");
								$('.gender_input_re').css("display", "none");
							}
							if (birth == "") {
								$('.birth_input').focus();
								$('.birth_input').css("border-color", "red");
								$('.birth_input_re').css("display",
										"inline-block");
							} else {
								$('.birth_input')
										.css("border-color", "#c1bfc1");
								$('.birth_input_re').css("display", "none");
							}
							if (tel.length < 1) {
								$('.tel_input').focus();
								$('.tel_input').css("border-color", "red");
								$('.tel_input_re').css("display",
										"inline-block");
								$('.tel_input_re_0').css("display", "none");
							} else if (!checkNum.test(tel)
									|| checkUpEng.test(tel)
									|| checkLoEng.test(tel)
									|| checkSpc.test(tel) || checkKor.test(tel)) {
								$('.tel_input').focus();
								$('.tel_input').css("border-color", "red");
								$('.tel_input_re').css("display", "none");
								$('.tel_input_re_0').css("display",
										"inline-block");
							} else {
								$('.tel_input').css("border-color", "#c1bfc1");
								$('.tel_input_re').css("display", "none");
								$('.tel_input_re_0').css("display", "none");
							}
							if (name < 1) {
								$('.user_input').focus();
								$('.user_input').css("border-color", "red");
								$('.user_input_re').css("display",
										"inline-block");
								$('.user_input_re_0').css("display", "none");
							} else if (checkNum.test(name)
									|| checkUpEng.test(name)
									|| checkLoEng.test(name)
									|| checkSpc.test(name)
									|| !checkKor.test(name)) {
								$('.user_input').focus();
								$('.user_input').css("border-color", "red");
								$('.user_input_re').css("display", "none");
								$('.user_input_re_0').css("display",
										"inline-block");
							} else {
								$('.user_input').css("border-color", "#c1bfc1");
								$('.user_input_re').css("display", "none");
								$('.user_input_re_0').css("display", "none");
							}
							event.preventDefault()
							event.stopPropagation()
						} else {
							if (ajt = 1) {
								if (confirm("회원 정보를 변경 하시겠습니까?") == true) { //확인
									document.removefrm.submit();
								} else { //취소
									event.preventDefault();
									event.stopPropagation();
								}
							} else {
								event.preventDefault();
								event.stopPropagation();
							}
						}
					});

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}
						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'none';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'none';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
						$('.address_input_1').css("border-color", "#c1bfc1");
						$('.address_input_2').css("border-color", "#c1bfc1");
					}
				}).open();
	}
</script>
</html>