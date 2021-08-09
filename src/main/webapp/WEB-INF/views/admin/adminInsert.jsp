<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javaBean.member.MemberBean"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
function check_pw(){
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 4 || pw.length> 20){
        window.alert('비밀번호는 4글자 이상, 20글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }
    if(document.getElementById('pw').value !='' && document.getElementById('pwCheck').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pwCheck').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
            document.getElementById('pw').value='';
            document.getElementById('pwCheck').value='';
            join.PASSWORD.focus();
        }
    }
}

function getEmail() {
  var s = document.getElementById("camp");
  var email = s.options[s.selectedIndex].value;
  
  if(email == "직접입력"){
	  document.getElementById('email2').readOnly = false;
	  document.getElementById("email2").value = "";
  }else{
	  document.getElementById('email2').readOnly = true;
	  document.getElementById("email2").value = email;
  }	  	  
}
</script>

<style>
.top {
	text-align: center;
}

.top p {
	font-size: 0.8em;
	color: gray;
}

table {
	margin: auto;
}

tr {
	text-align: center;
}

#button {
	text-align: center;
}


td.td_right {
	text-align: left;
}
</style>

<title>캠핑카장</title>
</head>

<body>
<jsp:include page="adminHeader.jsp" flush="true" />
   <br><br>
	
	<div class="wrap">

		<div class="container">
			


				<section class="top">
					<h2>관리자 회원추가</h2>
					
				</section>
				<br>
				<hr>
				<br>
		<form name="join" action="joinAdminSuccess.camp" method="post"
				onsubmit="return Validation();">


  				<div class="form-group row">
    				<label for="colFormLabel" class="col-sm-2 col-form-label">아이디</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" placeholder="*영문 4자 이상 20자 이하"
      					name="ID" id="ID" value="${param.ID}" required pattern="^([a-z0-9_]){4,20}$">
    				</div>
  				</div>
  				<div class="form-group row">
    				<label for="colFormLabel" class="col-sm-2 col-form-label">비밀번호</label>
    				<div class="col-sm-10">
    					<input
								type="password" required name="PASSWORD" id="pw" class="form-control"
								placeholder="*특수문자 포함 4자 이상 20자 이하" onchange="check_pw()"
								pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{4,10}$">
    				</div>
  				</div>
  				<div class="form-group row">
    				<label for="colFormLabel" class="col-sm-2 col-form-label">비밀번호확인</label>
    				<div class="col-sm-10">
      					<input
								type="password" required name="CONFIRMPWD" id="pwCheck" class="form-control"
								onchange="check_pw()">
    				</div>
    				<label class="col-sm-2"></label>
    				<div id="check" class="cols" style="padding-left:15px;"></div>
  				</div>
  				<div class="form-group row">
    				<label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" id="colFormLabel" placeholder=""  required name="NAME" id="NAME" value="${param.NAME}">
    				</div>
  				</div>
  				<div class="form-group row">
    				<label for="colFormLabel" class="col-sm-2 col-form-label">주소</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" id="colFormLabel" placeholder="" required name="ADDR" id="ADDR">
    				</div>
  				</div>
  				
  				<!--  전화번호 -->
				<div class="form-group row">
					<label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
					<div class="col">
      					<input type="text" class="form-control" placeholder="" required name="TEL1">
    				</div>
    				<div class="col">
      					<input type="text" class="form-control" placeholder="" required name="TEL2">
    				</div>
    				<div class="col">
      					<input type="text" class="form-control" placeholder="" required name="TEL3">
    				</div>
  				</div>
  				<div class="form-group row">
    				<label for="colFormLabel" class="col-sm-2 col-form-label">생년월일</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" id="colFormLabel" placeholder="" required name="JUMIN" id="JUMIN">
    				</div>
  				</div>
				<div class="form-group row">
					<label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
					<div class="col">
      					<input type="text" class="form-control" placeholder="" id="email1" name="EMAIL1"
								onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/gi,'');"
								required />
    				</div>
    				<label class="col-form-label">&#64;</label>
    				<div class="col">
      					<input type="text" class="form-control" placeholder="" id="email2" name="EMAIL2"
								value=""
								onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9.]/gi,'');"
								required />
    				</div>
    				<div class="col">
      					<select id="camp" name="camp" class="custom-select mr-sm-2" onclick="getEmail()">
									<option selected="selected" id="0">직접입력</option>
									<option id="1" value="naver.com">naver.com</option>
									<option id="2" value="hanmail.net">hanmail.net</option>
									<option id="3" value="gmail.com">gmail.com</option>
						</select>
    				</div>
  				</div>

			
					<br>
					<div id="button">
						<button type="button" class="btn btn-outline-dark"
							onclick="history.go(-1);">뒤로가기</button>
						&nbsp;&nbsp; <input type="submit" class="btn btn-dark"
							value="회원추가">
					</div>

			</form>
		</div>


		<br>
		<jsp:include page="footer.jsp" flush="true" />
	</div>
</body>
</html> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
