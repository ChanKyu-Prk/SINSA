<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript"> 
    function valid(x){
    var alphaDigit= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    
    //아이디의 입력 타당성 검사
    if (x.id.value=="") {
    alert("ID를 입력해 주세요.");
    x.id.focus();
    return; 
    }
    if (x.id.value.length < 4 || x.id.value.length > 15){
    alert("ID는 4~15자 이내여야 합니다.");
    x.id.focus();
    return;
    }
    if (x.id.value.indexOf(" ") >= 0) {
    alert("ID에는 공백이 들어가면 안됩니다.");
    x.id.focus();
    return;
    }
    for (i=0; i<x.id.value.length; i++) {
      if (alphaDigit.indexOf(x.id.value.substring(i, i+1)) == -1) {
      alert("ID는 영문과 숫자의 조합만 사용할 수 있습니다.");
      x.id.focus();
      return;
      }
    }
    
    // 비밀번호의  타당성 검사
    if (x.pass1.value=="") {
    alert("비밀번호를 입력하셔야 합니다.")
    x.pass1.focus();
    return;
    }
    if (x.pass1.value.length < 4) {
    alert("비밀번호는 4자리 이상 입력하셔야 합니다.");
    x.pass1.value="";
    x.pass1.focus();
    return;
    }
    if (x.pass2.value==""){
    alert("비밀번호를 확인 입력해 주셔야 합니다.")
    x.pass2.focus();
    return;
    }
    if (x.pass1.value != x.pass2.value) {
    alert("비밀번호가 서로 일치하지 않습니다.");
    x.pass1.value=x.pass2.value="";
    x.pass1.focus();
    return;
    } 
    if (x.pass1.value.indexOf(" ") >= 0) {
    alert("비밀번호에는 공백이 들어가면 안됩니다.");
    x.pass1.value=x.pass2.value="";
    x.pass1.focus();
    return;
    }
    for (i=0; i<x.pass1.value.length; i++) {
      if (alphaDigit.indexOf(x.pass1.value.substring(i, i+1)) < 0) {
      alert("비밀번호는 영문과 숫자의 조합만 사용할 수 있습니다.");
      x.pass1.value=x.pass2.value="";
      x.pass1.focus();
      return;
      } 
    }
    alert("잘 입력하셨습니다.")
    }
</SCRIPT>


<meta charset="UTF-8">
<title>회원관리</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
$(document).ready(function() {
                
  var test = "${CustomerVO.CUS_TEL}";
  var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  
  $("#CUS_TEL").text(testDate);
 
});
</style>
<style>
body 
{
	font-size: 11pt;
	color: teal;
}

div {
	margin: 0 auto;
}

.msg{
	font-size: 10pt;
	color: red;
}
</style>
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
		<h2>신규 회원 등록</h2>
		<form:form method="post" action="customerInsert" modelAttribute="customerVO">
			<table>
				<%-- <tr>
					<td>CUS_NUM :</td>
					<td><form:input path="CUS_NUM" /></td>
				</tr> --%>
				<%-- <tr>
					<td>아이디 :</td>
					<td><form:input path="CUS_ID" maxlength="20"/>
						<form:errors path="CUS_ID" cssClass="msg" />
					</td>
				</tr>  --%>
				<tr>
					<td>아이디</td>
					<td><input name="CUS_ID"></td>
					</tr>
				<!-- <tr>
					<td>비밀번호</td>
					<td><input type="password"  name="CUS_PWD"></td>
					</tr> -->
				
				
				<tr>
					<td>비밀번호 :</td>
					<td><form:input path="CUS_PWD" /></td>
				</tr>
			
				<tr>
					<td>이름  :</td>
					<td><form:input path="CUS_NAME" /></td>
				</tr>
				
				<tr>
					<td>성별  :</td>
					<td><form:select path="CUS_GENDER">
        					<form:option value="남자"/>
        					<form:option value="여자"/>
						</form:select></td>
				</tr>
				<tr>
					<td>이메일   :</td>
					<td><form:input path="CUS_EMAIL" /></td>
				</tr>
				<tr>
					<td>주소   :</td>
					<td><form:input path="CUS_ADDR" /></td>
				</tr>
				<tr>
					<td>전화번호   :</td>
					<td><form:input path="CUS_TEL" /></td>
				</tr>
				<tr>
					<td>생년월일   :</td>
					<td><form:input path="CUS_BIRTH" /></td>
				</tr>
				 <tr>
					<td>기본 배송지   :</td>
					<td><form:input path="CUS_DELIV_ADDR" /></td>
				</tr> 
				<tr>
					<td>포인트   :</td>
					<td><form:input path="CUS_POINT" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Save"></td>
				</tr>
				<tr>
					<td colspan="2"><a href="customerList">회원정보 리스트</a></td>
				</tr>

			</table>

		</form:form>
	</div>
</body>
</html>