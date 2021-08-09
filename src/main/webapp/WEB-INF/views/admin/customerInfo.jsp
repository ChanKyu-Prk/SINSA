<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerInfo</title>
<Style>
body
{
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
table {
	width: 100%;
}
td.left {
	border: 1px solid;
	width: 30%;
}
textarea {
	width: 100%;
	height: 500px;
}
</style>
<script type="text/javascript">
	function customerDelete(CUS_NUM) {
		if (confirm('회원을 삭제하시겠습니까?')) {
			location.href = 'customerDelete?CUS_NUM=' + CUS_NUM;
		}
	}
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
   <br><br>
<nav>
		SINSA관리자페이지
		<a href="prdList">상품관리</a>
		<a href="stockList">재고관리</a>
		<a href="customerList">고객관리</a>
		<a href="#">리뷰관리</a>
		<a href="#">문의관리</a>
		<a href="#">공지사항</a>
		<a href="#">로그아웃</a>
	</nav>
	<div>
	<h2>회원 정보 상세</h2>
		<form:form method="post" action="customerUpdate" modelAttribute="customerInfo">
			<table>
				<tr>
					<td class="left">아이디</td><td>
					<input type="text" name="CUS_ID" value="${customerInfo.CUS_ID}" readonly/></td>
				</tr><tr>
					<td class="left">이름</td><td>
					<input type="text" name="CUS_NAME" value="${customerInfo.CUS_NAME}" readonly/></td>
				</tr><tr>
					<td class="left">성별</td><td>
					<input type="text" name="CUS_GENDER" value="${customerInfo.CUS_GENDER}" readonly/></td>
				</tr><tr>
					<td class="left">이메일</td><td>
					<input type="text" name="CUS_EMAIL" value="${customerInfo.CUS_EMAIL}"></td>
				</tr><tr>
					<td class="left">주소</td><td>
					<input type="text" name="CUS_ADDR" value="${customerInfo.CUS_ADDR}"></td>
				</tr><tr>
					<td class="left">전화번호</td><td>
					<input type="text" name="CUS_TEL" value="${customerInfo.CUS_TEL}"></td>
				</tr><tr>
					<td class="left">생년월일</td><td>
					<input type="text" name="CUS_BIRTH" value="${customerInfo.CUS_BIRTH}" readonly/></td>
				</tr><tr>
					<td class="left">기본 배송지</td><td>
					<input type="text" name="CUS_DELIV_ADDR" value="${customerInfo.CUS_DELIV_ADDR}"></td>
					<tr>
					<td class="left">포인트</td><td>
					<input type="text" name="CUS_POINT" value="${customerInfo.CUS_POINT}" readonly/></td>
				</tr>
				<tr>
					<td class="left">가입일자</td><td>
					<input type="text" name="CUS_REGDATE" value="${customerInfo.CUS_REGDATE}" pattern="yyyy-MM-dd" readonly/></td>
				</tr>
				</table>
			<tr>
					<td colspan="2"><input type="submit" value="Save"></td>
				</tr>
			<!-- <input type="submit" value="변경사항적용">  -->
		</form:form>
		<p>
			<a href="customerEdit?CUS_NUM=${customerInfo.CUS_NUM }">회원 정보 수정</a>
			<a href="javascript:customerDelete(${customerInfo.CUS_NUM })">회원정보 삭제</a>
		</p>
		<p>
			<a href="customerList">회원 리스트</a>
		</p>
	</div>
	</body>
</html>
	<%-- <div>
		<h2>화원정보</h2>
		회원번호 ${CustomerInfo.CUS_NUM } <br> 아이디 ${customerInfo.CUS_ID } <br> 
		
		이름${CustomerInfo.CUS_NAME }<br> 성별 ${customerInfo.CUS_GENDER } <br>
		  
		이메일${CustomerInfo.CUS_EMAIL } <br>  주소${customerInfo.CUS_ADDR }<br>
		   
		전화번호${CustomerInfo.CUS_TEL } <br> 생년월일${customerInfo.CUS_NUM }<br>
		    
		기본 배송지${CustomerInfo.CUS_DELIV_ADDR }<br>  포인트${customerInfo.CUS_POINT }<br>
		     
		가입날짜 ${CustomerInfo.CUS_REGDATE }
		     
		<p>
			<a href="customerEdit?CUS_NUM=${CustomerInfo.CUS_NUM }">회원정보 수정</a>        
			<a href="javascript:customerDelete=${CustomerInfo.CUS_NUM })">회원정보 삭제</a>
		</p>
		<p>
			<a href="customerList">회원정보 리스트</a>
		</p>
	</div> --%>
