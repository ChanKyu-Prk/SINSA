<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SINSA : 회원가입</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/848d8f1fa9.js"
   crossorigin="anonymous"></script>
<%-- <jsp:include page="../header.jsp" /> --%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/join.css"
   type="text/css">
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
   <div class="container-h">
      <form:form method="post" action="customerInsert" modelAttribute="customerVO">
         <div class="wrap">
            <div class="subjecet">
               <span><b>SINSA</b> 회원추가</span>
            </div>
            <div class="id_wrap">
               <div class="id_name">아이디</div>
               <div class="id_input_box">
                  <form:input class="id_input" name="CUS_ID" path="CUS_ID" placeholder=" 아이디 입력 (5~15자)" />
               </div>
               <span class="id_input_re_0">아이디는 5~15자 영어, 숫자만 사용 가능합니다.</span> <span
                  class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
                  class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
                  class="id_input_re_3">필수 입력사항 입니다.</span>
            </div>
            <div class="pw_wrap">
               <div class="pw_name">비밀번호</div>
               <div class="pw_input_box">
                  <form:input type="password" class="pw_input" path="" name="CUS_PWD"
                     placeholder=" 비밀번호(영문 대 소문자, 숫자, 특수문자 조합 8~16자)" /> <i
                     class="far fa-eye pw-eye1"></i> <i
                     class="far fa-eye-slash pw-eye1-1"></i>
               </div>
               <div>
                  <span class="pw_input_re_0">필수 입력사항 입니다.</span> <span
                     class="pw_input_re">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
               </div>
            </div>
            <div class="pwck_wrap">
               <div class="pwck_name">비밀번호 확인</div>
               <div class="pwck_input_box">
                  <input type="password" class="pwck_input" placeholder=" 비밀번호 확인"><i
                     class="far fa-eye pwck-eye2"></i> <i
                     class="far fa-eye-slash pwck-eye2-1"></i>
               </div>
               <div>
                  <span class="pwck_input_re_0">필수 입력사항 입니다.</span> <span
                     class="pwck_input_re">비밀번호가 일치하지 않습니다.</span>
               </div>
            </div>
            <div class="user_wrap">
               <div class="user_name">이름</div>
               <div class="user_input_box">
                  <input class="user_input" name="CUS_NAME" placeholder=" 이름  입력">
               </div>
               <div>
                  <span class="user_input_re">필수 입력사항 입니다.</span> <span
                     class="user_input_re_0">한글만 입력 가능합니다.</span>
               </div>
            </div>
            <div class="tel_wrap">
               <div class="tel_name">전화번호</div>
               <div class="tel_input_box">
                  <input class="tel_input" name="CUS_TEL" placeholder="  '-'없이 입력해 주세요">
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
                              name="CUS_BIRTH_Date">
                        </div>
                        <select class="gender_input col-3" name="CUS_GENDER">
                           <option value="" disabled selected id="Ggrey">성별</option>
                           <option value="남자">남자</option>
                           <option value="여자">여자</option>
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
               <div class="container">
               
               
               
               
               
				
                  <div class="row">
                     <div class="col-9 padding0">
                        <div class="row email-row">
                        
                        
                           <div class="mail_input_box col-5 padding0">
                           
                              <input class="mail_input" name="CUS_EMAIL_1" placeholder="이메일 입력">
                                 
                                
                           </div>
                           
                           <div class="col-1 padding0 eamil_">@</div>
                           <div class="col-4 padding0">
                              <input class="mail_input_2" id="mail" name="CUS_EMAIL_2" placeholder="직접 입력">
                           </div>
                           <div class="col-2 padding0">
                           <input type="button" class="btn btn-outline-secondary" value="중복확인" onclick="emailChk();">
                           </div>
                        </div>
                     </div>

                     <div class="col-3 padding0">
                        <select class="mail_input_select col-12">
                           <option value="" selected>직접 입력</option>
                           <option value="gmail.com">gmail.com</option>
                           <option value="naver.com">naver.com</option>
                           <option value="daum.net">daum.net</option>
                           <option value="nate.com">nate.com</option>
                        </select>
                     </div>
                  </div>
               </div>
               <div>
                  <span class="mail_input_re">중복확인을 꼭 해주세요.</span> <span
                     class="mail_input_re_0">이메일 입력해 주세요.</span>
               </div>
            </div>   

            <div class="address_wrap">
               <div class="address_name">주소</div>

               <div class="container">
                  <div class="address_input_1_wrap">
                     <div class="row padding0">
                        <div class="address_input_1_box col-9 padding0">
                           <input class="address_input_1" id="sample4_postcode"
                              placeholder="우편번호" name="CUS_ADDR_1">
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
                        placeholder="도로명주소" name="CUS_ADDR_2">
                  </div>
               </div>
               <div class="address_input_3_wrap">
                  <div class="address_input_3_box">
                     <input type="hidden" class="address_input_3"
                        id="sample4_jibunAddress" placeholder="지번주소" name="CUS_ADDR_3">
                  </div>
               </div>
               <div class="address_input_4_wrap">
                  <div class="address_input_4_box">
                     <input class="address_input_4" id="sample4_detailAddress"
                        placeholder="상세주소 입력" name="CUS_ADDR_4">
                  </div>
               </div>
               <div class="address_input_5_wrap">
                  <div class="address_input_5_box">
                     <input type="hidden" class="address_input_5"
                        id="sample4_extraAddress" placeholder="참고항목" name="CUS_ADDR_5">
                  </div>
               </div>
               <div>
                  <span class="addr_input_re">필수 입력사항 입니다.</span>
               </div>
            </div>

            <span id="guide" style="color: #999; display: none"></span>


            <div class="join_button_wrap">
               <input type="submit" class="join_button" value="추가하기">
            </div>
         </div>
      </form:form>
   </div>

   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function emailChk(){
       var codeData = {
    		   CUS_EMAIL_1 : $('input[name="CUS_EMAIL_1"]').val(),
    		   CUS_EMAIL_2 : $('input[name="CUS_EMAIL_2"]').val()
           }
       $.ajax({
         url : "mailChk",
         type : "POST",
         data : codeData,
         success : function(result) {
        	 if(result == 0){
        		 alert("사용 가능한 이메일입니다.");
        	 }else{
        		 alert("이미 사용중인 이메일입니다.");
        	 }
         }
      });
    } 
</script> 
   <jsp:include page="../footer.jsp" />

</body>
<script src="${path}/resources/js/join.js"></script>
</html>