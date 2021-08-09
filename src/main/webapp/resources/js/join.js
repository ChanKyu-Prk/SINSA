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

	$('.id_input').on("focusin", function() {
		$('.id_input').css("border-color", "black");
	});

	$('.pw_input').on("focusin", function() {
		$('.pw_input').css("border-color", "black");
	});

	$('.pwck_input').on("focusin", function() {
		$('.pwck_input').css("border-color", "black");
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

	$('.id_input').on(
			"propertychange change keyup paste input",
			function() {

				var CUS_ID = $('.id_input').val();
				var data = {
					CUS_ID : CUS_ID
				}
				var checkKor = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{5,15}$/.test(CUS_ID);
				var check1 = /^(?=.*[^a-zA-Z0-9]).{5,15}$/.test(CUS_ID);

				if (CUS_ID.length < 1) {
					$('.id_input').css("border-color", "red");
					$('.id_input_re_0').css("display", "none");
					$('.id_input_re_1').css("display", "none");
					$('.id_input_re_2').css("display", "none");
					$('.id_input_re_3').css("display", "inline-block");
				} else if (CUS_ID.length < 5 || 15 < CUS_ID.length || checkKor
						|| check1) {
					$('.id_input').css("border-color", "red");
					$('.id_input_re_0').css("display", "inline-block");
					$('.id_input_re_1').css("display", "none");
					$('.id_input_re_2').css("display", "none");
					$('.id_input_re_3').css("display", "none");
				} else {
					$.ajax({
						type : "post",
						url : "/IdCheck",
						data : data,
						success : function(result) {
							if (result != 'fail') {
								$('.id_input').css("border-color", "green");
								$('.id_input_re_0').css("display", "none");
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								$('.id_input_re_3').css("display", "none");
							} else {
								$('.id_input').css("border-color", "red");
								$('.id_input_re_0').css("display", "none");
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								$('.id_input_re_3').css("display", "none");
							}
						}// success 종료
					}); // ajax 종료	
				}
			});// function 종료

	$('.id_input').on(
			"focusout",
			function() {
				var CUS_ID = $('.id_input').val();
				var data = {
					CUS_ID : CUS_ID
				}
				var checkKor = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{5,15}$/.test(CUS_ID);
				var check1 = /^(?=.*[^a-zA-Z0-9]).{5,15}$/.test(CUS_ID);

				if (CUS_ID.length < 1) {
					$('.id_input').css("border-color", "red");
					$('.id_input_re_3').css("display", "inline-block");
				} else if (CUS_ID.length < 5 || 15 < CUS_ID.length || checkKor
						|| check1) {
					$('.id_input').css("border-color", "red");
					$('.id_input_re_0').css("display", "inline-block");
				} else {
					$.ajax({
						type : "post",
						url : "/IdCheck",
						data : data,
						success : function(result) {
							if (result != 'fail') {
								$('.id_input').css("border-color", "#c1bfc1");
							} else {

							}
						}// success 종료
					}); // ajax 종료	
				}

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
	
	$('.tel_input').on("focusout", function() {
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

	$('.join_button')
			.on(
					"click",
					function() {
						var CUS_ID = $('.id_input').val();
						var pass = $('.pw_input').val();
						var passck = $('.pwck_input').val();
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
						var checkKor2 = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{8,16}$/
								.test(pass);
						var check1 = /^(?=.*[^a-zA-Z0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8,16}$/
								.test(pass);
						var checkKor3 = /^(?=.*[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{5,15}$/
								.test(CUS_ID);
						var check3 = /^(?=.*[^a-zA-Z0-9]).{5,15}$/.test(CUS_ID);
						var data = {
							CUS_ID : CUS_ID
						}

						if (addr3.length < 1 || addr2.length < 1
								|| addr1.length < 1 || codeCk == 0 || mail2 < 1
								|| mail1 < 1 || gender == null || birth == ""
								|| name < 1 || checkNum.test(name)
								|| checkUpEng.test(name)
								|| checkLoEng.test(name) || checkSpc.test(name)
								|| !checkKor.test(name) || tel.length < 1||!checkNum.test(tel) 
								|| checkUpEng.test(tel)
								|| checkLoEng.test(tel) || checkSpc.test(tel)
								|| checkKor.test(tel)
								||passck.length < 1
								|| pass != passck || pass.length < 1
								|| pass.length < 8 || 16 < pass.length
								|| !check1 || checkKor2 || CUS_ID.length < 1
								|| CUS_ID.length < 5 || 15 < CUS_ID.length
								|| checkKor3 || check3) {

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
								$('.tel_input_re').css("display", "inline-block");
								$('.tel_input_re_0').css("display", "none");
							} else if (!checkNum.test(tel) || checkUpEng.test(tel)
									|| checkLoEng.test(tel) || checkSpc.test(tel)
									|| checkKor.test(tel)) {
								$('.tel_input').focus();
								$('.tel_input').css("border-color", "red");
								$('.tel_input_re').css("display", "none");
								$('.tel_input_re_0').css("display", "inline-block");
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

							if (CUS_ID.length < 1) {
								$('.id_input').focus();
								$('.id_input').css("border-color", "red");
								$('.id_input_re_0').css("display", "none");
								$('.id_input_re_1').css("display", "none");
								$('.id_input_re_2').css("display", "none");
								$('.id_input_re_3').css("display",
										"inline-block");
							} else if (CUS_ID.length < 5 || 15 < CUS_ID.length
									|| checkKor3 || check3) {
								$('.id_input').focus();
								$('.id_input').css("border-color", "red");
								$('.id_input_re_0').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								$('.id_input_re_2').css("display", "none");
								$('.id_input_re_3').css("display", "none");
							}

							event.preventDefault()
							event.stopPropagation()
						} else {

							var ajt = 0;
							$.ajax({
								type : "post",
								url : "/IdCheck",
								data : data,
								success : function(result) {
									if (result != 'fail') {
										$('.id_input').css("border-color",
												"#c1bfc1");
										$('.id_input_re_0').css("display",
												"none");
										$('.id_input_re_1').css("display",
												"none");
										$('.id_input_re_2').css("display",
												"none");
										$('.id_input_re_3').css("display",
												"none");
										ajt = 1;
									} else {
										$('.id_input').focus();
										$('.id_input').css("border-color",
												"red");
										$('.id_input_re_0').css("display",
												"none");
										$('.id_input_re_2').css("display",
												"inline-block");
										$('.id_input_re_1').css("display",
												"none");
										$('.id_input_re_3').css("display",
												"none");

									}
								}// success 종료
							}); // ajax 종료	

							if (ajt = 1) {
								if (confirm("회원가입을 하시겠습니까?") == true) { //확인

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