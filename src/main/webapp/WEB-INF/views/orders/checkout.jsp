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
	height: 20px;
	vertical-align: middle;
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
				<form action="#">
					<div class="row mx-auto px-0">
						<div class="col-lg-8 col-md-6">
							<h5 class="mb-2">구매자정보</h5>
							<div class="row borderTop">
								<label for="CUS_NAME" class="col-lg-3">이름<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="CUS_NAME" name="CUS_NAME" type="text"
										maxlength="49" required="required" /></span>
								</div>
							</div>
							<div class="row">
								<label for="CUS_TEL" class="col-lg-3">휴대폰 번호<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="CUS_TEL" name="CUS_TEL" type="tel"
										maxlength="11" required="required" /></span>
								</div>
							</div>
							<div class="row">
								<label for="CUS_EMAIL" class="col-lg-3">이메일<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="CUS_EMAIL" name="CUS_EMAIL"
										type="email" maxlength="100" required="required" /></span>
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
								<label for="ORDER_MEMO" class="col-lg-3">배송시 요청사항<span
									class="inpReq">*</span></label>
								<div class="checkout__input col-lg-6">
									<span><input id="ORDER_MEMO" name="ORDER_MEMO"
										type="text" required="required" maxlength="40" /></span>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>결제정보</h4>
								<ul>
									<li>총 주문 가격 <span>750000원</span></li>
									<li>할인 <span>5000원</span></li>
									<li>포인트 사용 <span>300P</span></li>
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
</body>

</html>