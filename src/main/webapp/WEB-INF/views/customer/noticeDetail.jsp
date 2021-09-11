<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.con_top_margin {
	margin-top: 40px;
}

.addmargin {
	margin-top: 40px;
}

.subjecet {
	text-align: center;
	font-size: 27pt;
}

.title_col {
	font-size: 23px;
}

.title_row {
	margin-top: 25px;
	margin-bottom: 25px;
	padding-bottom: 25px;
	border-bottom: solid 1px #bebebe;
}

.date_col {
	text-align: right;
}

.content_col {
	padding-top: 15px;
	padding-bottom: 35px;
	border-bottom: solid 1px #bebebe;
	margin-bottom: 25px;
}
.btnDiv{
text-align: center;
	padding-top : 10px;
	padding-bottom: 10px;
	margin-bottom: 15px;
}
.listBtn {
	padding-right: 50px;
	padding-left: 50px; 
	padding-top : 10px;
	padding-bottom: 10px;
	background-color: black;
	color: white;
	padding-top: 10px;
	cursor: pointer;
}
</style>
<title>SINSA : 공지사항</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>

	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="customerCenterBar.jsp"></jsp:include>
			<div class="col-sm-12 col-md-9">
				<div class="subjecet">
					<span>공지사항</span>
				</div>
				<hr>

				<div class="container">
					<div class="row title_row">
						<div class="col-10 title_col">${noticeDetail.notice_title }</div>
						<div class="col-2 date_col">${noticeDetail.notice_regdate }</div>
					</div>
					<div class="row">
						<div class="col-12 content_col">

							${fn:replace(noticeDetail.notice_content,replaceChar,"<br/>") }</div>
					</div>

					<div class="btnDiv">
						<span class="listBtn">목록</span>
					</div>



				</div>






			</div>


<input type="hidden" value="${page }" class="cPage">
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$('.listBtn').on("click",function(){
	var page = $('.cPage').val();
	location.href="/notice/"+page;
});
</script>
</html>
