<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SINSA</title>
<style type="text/css">
.shoping__cart__table tr:first-child, .checkout__form .borderTop {
	border-top: 1.5px solid #7FAD39;
}

.checkout__form .borderTop {
	padding-top: 30px;
}

.shoping__cart__table .tableHead h5, .checkout__form h5 {
	line-height: 36.8px;
}

.checkout__form .row label span {
	color: #dd2222;
}

.checkout__form .row label {
	line-height: 46px;
}

.checkout__form .checkout__order {
	position: -webkit-sticky;
	position: sticky;
	top: 20px;
}

.checkout__input input[type="radio"] {
	width: 20px;
	height: 20px; vertical-align : middle;
	margin-top: -3px;
	border-radius: 10px;
	background: none;
	border: 0;
	box-shadow: inset 0 0 0 1px #9F9F9F;
	box-shadow: inset 0 0 0 1.5px #9F9F9F;
	appearance: none;
	padding: 0;
	margin: 0;
	transition: box-shadow 150ms cubic-bezier(0.95, 0.15, 0.5, 1.25);
	pointer-events: none;
	vertical-align: middle;
}

.checkout__input input[type="radio"]:focus {
	outline: none;
}

.checkout__input input[type="radio"]:checked {
	box-shadow: inset 0 0 0 6px #7fad39;
}

.checkout__input input[type="radio"] ~ span {
	color: #111111;
	display: inline-block;
	line-height: 20px;
	padding: 0 8px;
}

.checkout__input .radioLabel {
	padding: 6px;
	border-radius: 50px;
	display: inline-flex;
	cursor: pointer;
	transition: background 0.2s ease;
	margin: 8px 0;
	-webkit-tap-highlight-color: transparent;
}

.checkout__input .radioLabel:hover, .checkout__input .radioLabel:focus-within
{
	background: rgba(159, 159, 159, 0.1);
}

button[onclick="findAddr()"]{
	height: 38px;
	font-size:14px;
}

input:read-only{
	background-color: #F7F7F7;
}

.checkout__order .points {
	position: relative;
}

.checkout__order .points input {
	width: 120px;
	height: 38px;
	padding-right: 22px;
	position: absolute;
	color: #6f6f6f;
	right: 0;
	border: 1px solid #d5d5d5;
	font-size: 16px;
	color: #b2b2b2;
	border-radius:4px;
}

.checkout__order .points input ~ span {
	position: absolute;
	right: 10px;
}

.avPoint{
	color: #dd2222;
}

</style>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<h4 class="mb-5 font-weight-bold">주문/결제</h4>
			<div class="row">
				<div class="col-lg-12 shoping__cart__table">
					<table class="mx-auto px-0">
						<thead>
							<span class="tableHead row mx-auto px-0 mb-2">
								<h5>주문리스트</h5> <a href="#"
								class="ml-auto p-2 primary-btn cart-btn cart-btn-right">주문정보
									수정</a>
							</span>
						</thead>
						<tbody>
							<tr>
								<td class="shoping__cart__item"><span
									class="row mx-auto px-0"> <span> <img
											src="${path}/resources/img/product/details/thumb-1.jpg"
											alt="thumbnail2">
									</span> <span class="my-auto"> <b class="mb-1">상품이름</b>
											<p class="mb-0">GZ5863</p>
											<p class="mb-0">
												<span>사이즈: 250</span>
											</p>
									</span>
								</span></td>
								<td class="shoping__cart__price">55000원</td>
								<td class="shoping__cart__quantity">
									<p class="mb-1">
										수량:<span>1</span>
									</p> <b class="mb-0">무료배송</b>
								</td>
								<td class="shoping__cart__total">55000원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="checkout__form">
				<form action="/direct/checkout">
					<div class="row mx-auto px-0">
						<div class="col-lg-8 col-md-6">
							<h5 class="mb-2">구매자정보</h5>
							<div class="row borderTop">
								<label for="CUS_NAME" class="col-lg-3">이름<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="CUS_NAME" name="CUS_NAME" type="text"
										maxlength="49" required="required" value="${user.CUS_NAME}" readonly/></span>
								</div>
							</div>
							<div class="row">
								<label for="CUS_TEL" class="col-lg-3">휴대폰 번호<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="CUS_TEL" name="CUS_TEL" type="tel"
										maxlength="11" required="required" value="${cusInfo.CUS_TEL}" readonly/></span>
								</div>
							</div>
							<div class="row">
								<label for="CUS_EMAIL" class="col-lg-3">이메일<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="CUS_EMAIL" name="CUS_EMAIL"
										type="email" maxlength="100" required="required" value="${cusInfo.CUS_EMAIL}" readonly/></span>
								</div>
							</div>
							<h5 class="my-2">받는사람정보</h5>
							<div class="row borderTop">
								<label for="CUS_DELIV_ADDR" class="col-lg-3">배송지 선택<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<label for="defaultDeliv" class="radioLabel"> <input
										type="radio" id="defaultDeliv" name="delivAddr"
										value="default" checked> <span>주문자와 동일</span>
									</label> <label for="newDeliv" class="radioLabel"> <input
										type="radio" id="newDeliv" name="delivAddr" value="new" /> <span>신규입력</span>
									</label>
								</div>
							</div>
							<div class="row">
								<label for="ORDER_RECEIVER" class="col-lg-3">이름<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="ORDER_RECEIVER" name="ORDER_RECEIVER"
										type="text" maxlength="49" required="required" /></span>
								</div>
							</div>
							<div class="row">
								<label for="ORDER_TEL" class="col-lg-3">휴대폰 번호<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="ORDER_TEL" name="ORDER_TEL" type="tel"
										maxlength="11" required="required" /></span>
								</div>
							</div>
							<div class="row">
								<label for="ORDER_TEL" class="col-lg-3">주소<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-3">
									<span><input type="text" id="delivAddrZip"
										placeholder="우편번호" title="우편번호" required="required" readonly/></span>
								</div>
								<button type="button" class="col-lg-2 text-center btn btn-secondary" onclick="findAddr()">우편번호 찾기</button>
							</div>
							<div class="row">
								<div class="checkout__input col-lg-9 offset-lg-3">
									<span><input type="text" id="delivAddrRoad"
										placeholder="" title="기본주소" required="required" readonly/></span>
								</div>
							</div>
							<div class="row">
								<div class="checkout__input col-lg-9 offset-lg-3">
									<span><input type="text" id="delivAddrJibun" title="상세주소" placeholder="상세주소를 입력해주세요."/></span>
									<span id="guide" style="color:#999;display:none"></span>
								</div>
								<input type="hidden" id="delivAddrExtra"/>
							</div>
							<div class="row">
								<label for="ORDER_MEMO" class="col-lg-3">배송시 요청사항
								</label>
								<div class="checkout__input col-lg-9">
									<select id="delivMemo" class="mb-2 wide" title="배송시 요청사항">
										<option selected="selected" disabled>배송 시 요청사항을
											선택해주세요.</option>
										<option value="opt01">부재시 경비실에 맡겨주세요.</option>
										<option value="opt02">부재시 문앞에 놓아주세요.</option>
										<option value="opt03">배송전에 연락주세요.</option>
										<option value="opt04">직접 수령 하겠습니다.</option>
										<option value="write">직접입력</option>
									</select> <span> <input id="ORDER_MEMO" name="ORDER_MEMO"
										type="text" required="required" maxlength="40"
										placeholder="요청사항은 40자 이내로 작성해주세요." />
									</span>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>결제정보</h4>
								<ul>
									<li>총 주문 가격 <span>750000원</span></li>
									<li>할인 <span>5000원</span></li>
									<li class="points">포인트 사용 <input placeholder="0" class="text-right"></input><span>P</span><p><small>사용가능한 포인트: <span class="avPoint">5000 P</span></small></p></li>
									<li>배송비 <span>무료</span></li>
								</ul>
								<div class="checkout__order__total">
									총 결제금액 <span>750000원</span>
								</div>
								<button type="submit" class="site-btn">결제하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="../footer.jsp" />
	<!-- Footer Section End -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	function findAddr() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						document.getElementById('delivAddrZip').value = data.zonecode;
						document.getElementById("delivAddrRoad").value = roadAddr;
						document.getElementById("delivAddrJibun").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("delivAddrExtra").value = extraRoadAddr;
						} else {
							document.getElementById("delivAddrExtra").value = '';
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
					}
				}).open();
	}
	</script>
</body>

</html>