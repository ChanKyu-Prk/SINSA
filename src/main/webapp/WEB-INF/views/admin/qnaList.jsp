<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<meta charset="UTF-8">
<title>qnaList</title>

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
	
	function qnaModify() {
		if (no != "") {
			location.href = 'qnaAnswer?qna_num=' + no;
			
		} else {
		  alert('수정할 문의를 선택하십시오.');
		}
	}
	
	function qnaDelete() {
		if (no != "") {
			if (confirm('해당 문의를 삭제하시겠습니까?')) {
				location.href = 'qnaDelete?qna_num=' + no;
			}	
		} else {
			  alert('삭제할 문의를 선택하십시오.');
			}
	}
	
	
</script>
<style>
	.hidden-col { display: none; }
</style>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	<div class="container-fluid" style="padding: 0 30px;">
	<center><h2>문의사항</h2></center>
	<div class="row">
			<table style="border: 0px">
			<tr>
			<td align="right">
			<input type="button" class="btn btn-primary btn-sm"	onclick="qnaModify()" value="답변하기" />
			&nbsp;
			<input type="button" class="btn btn-danger btn-sm" onclick="javascript:qnaDelete()" value="문의삭제" />
			&nbsp;
			</td>
			</tr>
			</table>
			
			<br><br>
			<div class="col-lg-12" id="ex1_Result1" ></div>
			<div class="col-lg-12" id="ex1_Result2" ></div> 
	
	
	<table id="qnalist" class="table table-hover"
				style="text-align: center; border: 0px solid #dddddd">
		<thead>
			<tr>
			
				<!-- <th>번호</th> -->
				<th>고객아이디</th>
				<th>상품코드</th>
				<th>제목</th>
				<th>답변</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty qnaList }">
				<tr>
					<td colspan="10" align="center">데이터가 없습니다.</td>
				</tr>
				</c:when>
					<c:when test="${!empty qnaList}">
			<c:forEach var="e" items="${ qnaList }">
				<tr onclick="javascript:selectNum(this);">
					<td class="hidden-col">${ e.qna_num }</td>
					<td>${ e.qna_cusid }</td>
					<td>${ e.prd_num }</td>
					<td>${ e.qna_title }</td>
					<td>
					<c:if test="${!empty fn:trim(e.qna_answer)}"><font color=whitegreen>답변완료</font></c:if>
             		<c:if test="${empty fn:trim(e.qna_answer)}"><font color=red>답변대기</font></c:if>
					</td>
					<td>
			<fmt:formatDate value="${e.qna_regdate}" pattern="YYYY-MM-dd" />
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
						href="qnaList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
						tabindex="-1">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="qnaList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
							href="qnaList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
						href="qnaList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="qnaList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
		</div>
		<br>
		<br>
		<form>
			<div class="form-row">
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-2">
					<select name="fieldName" id="fieldName" class="form-control">
						<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
						<option ${(param.fieldName == "qna_title")? "selected" : ""}
							value="prd_code">제목</option>
						<option ${(param.fieldName == "qna_cusid")? "selected" : ""}
							value="qna_cusid">아이디</option>
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
		<%-- <form>
			<select name="fieldName" id="fieldName" class="form-control">
				<option ${(param.fieldName == "all")? "selected" : ""} value="all">전체</option>
				<option ${(param.fieldName == "notice_title")? "selected" : ""}
					value="qna_title">제목</option>
				<option ${(param.fieldName == "notice_content")? "selected" : ""}
					value="qna_content">내용</option>
			</select> <input type="text" class="form-control" placeholder="Search"
				name="searchWord" value="${param.searchWord}" /> <input
				type="submit" value="검색" />
		</form> --%>
