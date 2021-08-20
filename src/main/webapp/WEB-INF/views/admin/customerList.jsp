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
	.hidden-col { display: none; }
</style> 


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	
	var no = "";
	
	
	


	function selectNum(target) {
	    var tbody = target.parentNode;
	    var trs = tbody.getElementsByTagName('tr');
	 
	    var backColor = "#ffffff";
	    var textColor = "black";
	    var orgBColor = "#eeeeee";
	    var orgTColor = "#000";
	 
	  		  	 
	    for ( var i = 0; i < trs.length; i++ ) {
	        if ( trs[i] != target ) {
	            trs[i].style.backgroundColor = backColor;
	            trs[i].style.color = textColor;
	        } else {
	            trs[i].style.backgroundColor = orgBColor;
	            trs[i].style.color = orgTColor;
	            var td = trs[i].getElementsByTagName('td');
	            no = td[0].innerText;
	        
	        }
	    }

	}
	
	function customerModify() {
		if (no != "") {
			location.href = 'customerEdit?CUS_NUM=' + no;
			
		} else {
		  alert('수정할 회원을 선택하십시오.');
		}
	}
	
	function customerDelete() {
		if (no != "") {
			if (confirm('해당 회원을 삭제하시겠습니까?')) {
				location.href = 'customerDelete?CUS_NUM=' + no;
			}	
		} else {
			  alert('삭제할 회원을 선택하십시오.');
			}
	}
</script>
<style>
	.hidden-col { display: none; }
</style>
<!-- <script>
function tel(a)
{
	console.log(CUS_TEL);
	  //var test = a.getCUS_TEL();
	  var testDate = a.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	  document.getElementById(CUS_TEL).innerHTML=testData;
	}
	//return testDate;




/* $(document).ready(function() {
                
  var test = "${CustomerVO.CUS_TEL}";
  var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
  
  $("#CUS_TEL").text(testDate);
 
}); */
</script> -->
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
   <br><br>


	<div class="container-fluid" style="padding: 0 30px;">
	<center><h2>고객 관리</h2></center>
	<div class="row">
	
			<table style="border: 0px">
			<tr>
			<!-- <td align="right">
			
			</td> -->
			<td align="right">
			<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='customerInputForm'">신규 회원 등록</button>
			&nbsp;
			<input type="button" class="btn btn-primary btn-sm"	onclick="customerModify()" value="회원정보 수정" />
			&nbsp;
			<input type="button" class="btn btn-danger btn-sm" onclick="javascript:customerDelete()" value="회원 정보 삭제" />
			</td>
			</tr>
			</table>
			<br><br>
			<div class="col-lg-12" id="ex1_Result1" ></div>
			<div class="col-lg-12" id="ex1_Result2" ></div> 
	<table id="customerlist" class="table table-hover"
				style="text-align: center; border: 0px solid #dddddd">
		<thead>
			<tr>
				<!-- <th>번호</th> -->
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>포인트</th>
				<th>가입일자</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty customerList }">
				<tr>
					<td colspan="10" align="center">데이터가 없습니다.</td>
				</tr>
				</c:when>
					<c:when test="${!empty customerList}">
			<c:forEach var="row" items="${customerList }" varStatus="status">
		<tr onclick="javascript:selectNum(this);">
			<td class="hidden-col">${row.CUS_NUM }</td>
			<td>${row.CUS_ID }</td>
			<td>${row.CUS_NAME }</td>
			<td>${row.CUS_GENDER }</td>
			<td>${row.CUS_EMAIL }</td>
			<td>${row.CUS_ADDR}</td>
			<%-- <td>${row.CUS_TEL}</td> --%>  
			<td><script>
			function tel(a) {
				  var testDate = a.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
				  return testDate;
				}
			document.write(tel('${row.CUS_TEL}'));
			</script></td> 
			<td>${row.CUS_BIRTH }</td>
			<td>${row.CUS_POINT }</td>
			<td>
			<fmt:formatDate value="${row.CUS_REGDATE}" pattern="yyyy-MM-dd" />
			</td>
			</tr>
			
			</c:forEach> 
			</c:when>
			</c:choose>
		</tbody>
	</table>
	<div align="center">
<ul class="pagination">
			<c:choose>
				<c:when test="${pageInfo.getPage()<=1}">
					<li class="page-item disabled"><a class="page-link" aria-disabled="true">이전</a></li>
				</c:when>
				<c:when test="${pageInfo.getStartPage()==1}">
					<li class="page-item"><a class="page-link"
						href="customerList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
						tabindex="-1">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="customerList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
						tabindex="-1">이전</a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="${pageInfo.getStartPage()}"
				end="${pageInfo.getEndPage()}" varStatus="state">
				<c:choose>
					<c:when test="${pageInfo.getPage()==state.index}">
						<li class="page-item active" aria-current="page"><a
							class="page-link">${state.index}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="customerList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${pageInfo.getPage() >= pageInfo.getMaxPage()}">
					<li class="page-item disabled"><a class="page-link"
						aria-disabled="true">다음</a></li>
				</c:when>
				<c:when test="${pageInfo.getEndPage()==pageInfo.getMaxPage()}">
					<li class="page-item"><a class="page-link"
						href="customerList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="customerList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
		<br><br>
		<form>
		<div class="form-row">
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-2">
					<select name="fieldName" id="fieldName" class="form-control">
				<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
				<option ${(param.fieldName == "CUS_NAME")? "selected" : ""}
					value="CUS_NAME">이름</option>
				<option ${(param.fieldName == "CUS_ID")? "selected" : ""}
					value="CUS_ID">아이디</option>
			</select> 
			</div>
			<div class="form-group col-md-5">
			<input type="text" class="form-control" placeholder="Search"
				name="searchWord" value="${param.searchWord}" /> 
				</div>
				<div class="form-group col-md-1">
				<input type="submit" class="btn btn-primary" value="검색" />
				</div>
				<div class="form-group col-md-2"></div>
			</div>
		</form>
		</div>
	</body>
</html>