<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String getreferer = request.getHeader("Referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<meta charset="UTF-8">
<title>reviewList</title>

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

function reviewModify() {
	if (no != "") {
		location.href = 'reviewDetail?rev_num=' + no;
		
	} else {
	  alert('자세히 보실 리뷰를 선택하십시오.');
	}
}

function reviewDelete() {
	if (no != "") {
		if (confirm('해당 리뷰를 삭제하시겠습니까?')) {
			location.href = 'reviewDelete?rev_num=' + no;
		}	
	} else {
		  alert('삭제할 리뷰를 선택하십시오.');
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
	<center><h2>리뷰목록</h2></center>
	<div class="row">
			<table style="border: 0px">
			<tr>
			<td align="right">
			<input type="button" class="btn btn-primary btn-sm"	onclick="reviewModify()" value="상세보기" />
			&nbsp;
			<input type="button" class="btn btn-danger btn-sm" onclick="javascript:reviewDelete()" value="리뷰삭제" />
			&nbsp;
			</td>
			</tr>
			</table>
			
			<br><br>
			<div class="col-lg-12" id="ex1_Result1" ></div>
			<div class="col-lg-12" id="ex1_Result2" ></div> 
	
	
	<table id="reviewlist" class="table table-hover"
				style="text-align: center; border: 0px solid #dddddd">
		<thead>
			<tr>
			
				<!-- <th>번호</th> -->
				<th>고객아이디</th>
				<th>상품코드</th>
				<th>리뷰제목</th>
				<th>리뷰내용</th>
				<th>별점</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty reviewList }">
				<tr>
					<td colspan="10" align="center">데이터가 없습니다.</td>
				</tr>
				</c:when>
					<c:when test="${!empty reviewList}">
			<c:forEach var="e" items="${ reviewList }">
				<tr onclick="javascript:selectNum(this);">
					<td class="hidden-col">${ e.rev_num }</td>
					<%-- <td>${ e.rev_regdate }</td> --%>
					<td>${ e.rev_cusid }</td>
					<td>${ e.rev_prdcode }</td>
					<td>${ e.rev_title }</td>
					<td>${ e.rev_content }</td>
					<td>${ e.rev_star }</td>
				
					<td>
			<fmt:formatDate value="${e.rev_regdate}" pattern="YYYY-MM-dd" />
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
						href="reviewList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
						tabindex="-1">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="reviewList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
							href="reviewList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
						href="reviewList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="reviewList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
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
						<option ${(param.fieldName == "rev_title")? "selected" : ""}
							value="rev_title">제목</option>
						<option ${(param.fieldName == "rev_cusid")? "selected" : ""}
							value="rev_cusid">아이디</option>
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