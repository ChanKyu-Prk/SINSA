<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.sidebar2 {
	display: none;
}

@media screen and (max-width: 720px) {
	.sidebar__item {
		text-align: center;
	}
	.sidebar {
		display: none;
	}
	.sidebar2 {
		display: inline-block;
		width: 100%;
		margin-bottom: 30px;
	}
}
</style>
<meta charset="UTF-8">

<div class="col-sm-12 col-md-3 ">
	<div class="sidebar">
		<div class="sidebar__item">
			<h4>나의 쇼핑</h4>
			<ul>
				<li><a href="/myOrderList/1">주문 내역 조회</a></li>
				<li><a href="/cart.do">장바구니</a></li>
				<li><a href="/myReviewList/1">상품 후기</a></li>
				<li><a href="/myProductQnA/1">상품 문의</a></li>
				<li><a href="/jjimList/1">찜 목록</a></li>
				<li><a href="/recentView/1">최근 본 상품</a></li>

			</ul>

			<div class="addmargin"></div>
			<h4>나의 정보</h4>
			<ul>
				<li><a href="/myPage">회원 정보</a></li>
				<li><a href="/privateInfoChange">개인정보 수정</a></li>
				<li><a href="/passChange">비밀번호 변경</a></li>
				<li><a href="/leave">회원 탈퇴</a></li>

			</ul>

		</div>

	</div>
	<div class="sidebar2">

		<div class="row">
			<div class="sidebar__item col-6">
				<h4>나의 쇼핑</h4>
				<ul>
					<li><a href="/myOrderList/1">주문 내역 조회</a></li>
					<li><a href="/cart.do">장바구니</a></li>
					<li><a href="/myReviewList/1">상품 후기</a></li>
					<li><a href="/myProductQnA/1">상품 문의</a></li>
					<li><a href="/jjimList/1">찜 목록</a></li>
					<li><a href="/recentView/1">최근 본 상품</a></li>

				</ul>
			</div>
			<div class="addmargin "></div>
			<div class="sidebar__item col-6">
				<h4>나의 정보</h4>
				<ul>
					<li><a href="/myPage">히원 정보</a></li>
					<li><a href="/privateInfoChange">개인정보 수정</a></li>
					<li><a href="/passChange">비밀번호 변경</a></li>
					<li><a href="/leave">회원 탈퇴</a></li>

				</ul>
				
			</div>

		</div>

<hr>
	</div>
</div>
