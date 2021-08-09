<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
body {
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}
table { 
	width: 100%;
	border: 1px solid; 
}
</style>
<style>
$(document).ready(function() {
                
  var test = "${CustomerVO.CUS_TEL}";
  var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  
  $("#CUS_TEL").text(testDate);
 
});
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

	<div>
	<h2>신사 관리</h2>
	<table>
		<thead>
			<tr>
				<!-- <th>순번</th> -->
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>주소</th>
				<th>전화번호</th>
				<td id="CUS_TEL" />
				<th>생년월일</th>
				<th>기본 배송지</th>
				<th>포인트</th>
				<th>가입일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${customerList }">
		<tr>
			<td>${row.CUS_ID }</td>
			<td><a href="customerInfo?CUS_NUM=${ row.CUS_NUM }">${ row.CUS_NAME }</a></td>
			<td>${row.CUS_GENDER }</td>
			<td>${row.CUS_EMAIL }</td>
			<td>${row.CUS_ADDR }</td>
			<td>${row.CUS_TEL }</td>
			<td>${row.CUS_BIRTH }</td>
			<td>${row.CUS_DELIV_ADDR }</td>
			<td>${row.CUS_POINT }</td>
			<td>
			<fmt:formatDate value="${row.CUS_REGDATE}" pattern="yyyy-MM-dd" />
			</td>
			<%-- <td>${row.CUS_REGDATE }</td> --%>
			<td>
				<input type="button" onclick="location.href='customerEdit?CUS_NUM=${ row.CUS_NUM }'" value="수정" />
				<input type="button" onclick="javascript:customerDelete(${ row.CUS_NUM })" value="삭제" />
				</td>
			</tr>
			</c:forEach> 
		</tbody>
	</table>

	<p><a href="customerInputForm">신규 회원 등록</a></p></div>
	
	<!-- <div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
	<form name="adminLogin" method="post" action="j_security_check">
	<form name="adminLogin" method="post" action="j_security_check">
	<h3 style="text-align: center;">관리자 로그인</h3>
	<div class="form-group">
		<input type="text" class="form-control" placeholder="아이디" name="j_username" maxlength="20">
	</div>
	<div class="form-group">
		<input type="password" class="form-control" placeholder="비밀번호" name="j_password" maxlength="20">
	</div>
	<input type="submit" class="btn btn-primary fomr-control" value="로그인">
	</form>
	</div>
	</div> -->
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ page import="com.test.*, java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <%@ include file="../include/customer_header.jsp" %> 
</head>
<body>
 <center>
 <%@ include file="../include/customer_menu.jsp" %> 
	<h2>회원 목록</h2>
	<div class="panel panel-default">
			<div class="panel-heading">회원 정보 입력</div>
			<div class="panel-body">
			    <!-- action="확장자 방식의 서블릿요청주소 -->
				<form action="customerList" method="post">
					<div class="form-group">
						<!-- name="" 속성은 JSP 프로그램 진행시 필수 속성 -->
						<!-- 식별자는 자료형 클래스의 멤버명으로 작성할 것 -->
						<!-- 동일 자료 동일 식별자 원칙 -->	
						<div class="form-group">
						<label for="CUS_ID">아이디:</label> <input type="text"
							class="form-control" id="CUS_ID" name="CUS_ID" required>
					</div>
					<div class="form-group">
						<label for="CUS_PWD">비밀번호:</label> <input type="text"
							class="form-control" id="CUS_PWD" name="CUS_PWD" required>
					</div>
						<label for="CUS_NAME">이름:</label> <input type="text"
							class="form-control" id="CUS_NAME" name="CUS_NAME" required>
					</div>
					<div class="form-group">
						<label for="CUS_GENDER">성별:</label> <input type="text"
							class="form-control" id="CUS_GENDER" name="CUS_GENDER" required>
					</div>
					<div class="form-group">
						<label for="CUS_EMAIL">이메일:</label> <input type="text"
							class="form-control" id="CUS_EMAIL" name="CUS_EMAIL" required>
					</div>
					<div class="form-group">
						<label for="CUS_ADDR">주소:</label> <input type="text"
							class="form-control" id="CUS_ADDR" name="CUS_ADDR" required>
					</div>
					<div class="form-group">
						<label for="CUS_TEL">전화번호:</label> <input type="text"
							class="form-control" id="CUS_TEL" name="CUS_TEL" required>
					</div>
					<div class="form-group">
						<label for="CUS_BIRTH">생년월일:</label> <input type="text"
							class="form-control" id="CUS_BIRTH" name="CUS_BIRTH" required>
					</div>
					
					<button type="submit" class="btn btn-default">추가</button>
					
					</form>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">회원 명단 출력</div>
			<div class="panel-body">
				테이블 태그
				<table class="table table-striped">
					<thead>
						<tr>
							<th>순번</th>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>이메일</th>
							<th>주소</th>
							<th>전화번호</th>
							<th>생년월일</th>
							<th>기본 배송지</th>
							<th>가입일자</th>
						</tr>
					</thead>
	<table border="1" wigth="700px">
		<tr>
			<th>순번</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>생년월일</th>
			<th>기본 배송지</th>
			<th>가입일자</th>
		</tr>
		<c:forEach var="row" items="${cutomerList }">
		<tr>
			<td>${row.CUS_NUM }</td>
			<td>${row.CUS_ID }</td>
			<td>${row.CUS_NAME }</td>
			<td>${row.CUS_GENDER }</td>
			<td>${row.CUS_EMAIL }</td>
			<td>${row.CUS_ADDR }</td>
			<td>${row.CUS_TEL }</td>
			<td>${row.CUS_BIRTH }</td>
			<td>${row.CUS_DELIV_ADDR }</td>
			<td>${row.CUS_REGDATE }</td>
			</tr>
			</c:forEach> 
			     
	<form method="post" class="form-inline">

					<div class="form-group">
						<button type="button" class="btn btn-default">

							문제) EL를 이용한 동적 데이터 출력
							Count <span class="badge">${count}</span>
						</button>
					</div>
		 <div id="">
		 <input type="button" value="추가" onclick="location.href='customerInsert'">
      <button type="button" class="btn btn-dark" onClick="location.href='customerInsert'">회원추가</button> 
      <button type="button" class="btn btn-dark" onClick="location.href=''">회원수정</button>
      <button type="button" class="btn btn-dark" onClick="location.href=''">회원삭제</button>
      </div>
	</table>
	
	<div class="form-group">
						<input type="text" class="form-control" id="svalue" name="svalue">
					</div>

					<button type="submit" class="btn btn-default">Search</button>

			</div>
		</div>
</body>
</html> --%>