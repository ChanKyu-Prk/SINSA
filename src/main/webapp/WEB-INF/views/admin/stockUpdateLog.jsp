<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

div {
	margin: 0 auto;
}

table {
	width: 100%;
}

/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>

	<div class="container-fluid" style="padding: 0 30px;">
	<center><h2>입고 내역</h2></center>
		<br><br><br>
			<form>
			<div class="form-row">
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-1">
					<input type="text" id="sdate" name="sdate" class="form-control">
				</div>&#126;
				<div class="form-group col-md-1">
					<input type="text" id="edate" name="edate" class="form-control">
					    <script>
				        $(function() {
				            //모든 datepicker에 대한 공통 옵션 설정
				            $.datepicker.setDefaults({
				                dateFormat: 'yy-mm-dd' //Input Display Format 변경
				                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
				                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
				                ,changeYear: true //콤보박스에서 년 선택 가능
				                ,changeMonth: true //콤보박스에서 월 선택 가능                
				                //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
				                //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
				                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
				                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
				                ,yearSuffix: "&nbsp;" //달력의 년도 부분 뒤에 붙는 텍스트
				                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
				                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
				                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
				                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
				                //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				                //,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
				            });
				 
				            //input을 datepicker로 선언
				            $("#sdate").datepicker();                    
				            $("#edate").datepicker();
				            
 				            if ('${param.sdate}' != null || '${param.sdate}' != "") {
				            	
				            	$("#sdate").datepicker("setDate", '${param.sdate}');
				            	$("#edate").datepicker("setDate", '${param.edate}');
				            }
				            
				            if ('${param.sdate}' == null || '${param.sdate}' == "") {
				            	//From의 초기값을 오늘 날짜로 설정
				            	$('#sdate').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				            	//To의 초기값을 내일로 설정
				            	$('#edate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				            }  
				        });
    					</script>
				</div>
				<div class="form-group col-md-4">
					<input type="text" class="form-control" placeholder="제품코드"
						name="searchWord" value="${param.searchWord}" />
				</div>
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
				<div class="form-group col-md-2"></div>
			</div>
		</form>
		<br><br>
		<div class="row">
			
			<br>
			<br>

			<table id="stockLog" class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<th>입고일시</th>
						<th>코드</th>
						<th>220</th>
						<th>225</th>
						<th>230</th>
						<th>235</th>
						<th>240</th>
						<th>245</th>
						<th>250</th>
						<th>255</th>
						<th>260</th>
						<th>265</th>
						<th>270</th>
						<th>275</th>
						<th>280</th>
						<th>285</th>
						<th>290</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty stockLog }">
							<tr>
								<td colspan="10" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty stockLog}">
							<c:forEach var="e" items="${ stockLog }">
								<tr onclick="javascript:selectNum(this);">
									<td><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${ e.inputdate }" /></td>
									<td>${ e.code }</td>
									<td class="size">${ e.stock_220 }</td>
									<td class="size">${ e.stock_225 }</td>
									<td class="size">${ e.stock_230 }</td>
									<td class="size">${ e.stock_235 }</td>
									<td class="size">${ e.stock_240 }</td>
									<td class="size">${ e.stock_245 }</td>
									<td class="size">${ e.stock_250 }</td>
									<td class="size">${ e.stock_255 }</td>
									<td class="size">${ e.stock_260 }</td>
									<td class="size">${ e.stock_265 }</td>
									<td class="size">${ e.stock_270 }</td>
									<td class="size">${ e.stock_275 }</td>
									<td class="size">${ e.stock_280 }</td>
									<td class="size">${ e.stock_285 }</td>
									<td class="size">${ e.stock_290 }</td>	
									<td id="row_total">${ e.stock_sum }</td>
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
							<li class="page-item disabled"><a class="page-link"
								aria-disabled="true">이전</a></li>
						</c:when>
						<c:when test="${pageInfo.getStartPage()==1}">
							<li class="page-item"><a class="page-link"
								href="stockLog?page=${pageInfo.getStartPage()}&sdate=${param.sdate}&edate=${param.edate}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
								tabindex="-1">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="stockLog?page=${pageInfo.getStartPage()-1}&sdate=${param.sdate}&edate=${param.edate}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
									href="stockLog?page=${state.index}&sdate=${param.sdate}&edate=${param.edate}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
								href="stockLog?page=${pageInfo.getEndPage()}&sdate=${param.sdate}&edate=${param.edate}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="stockLog?page=${pageInfo.getEndPage()+1}&sdate=${param.sdate}&edate=${param.edate}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br>
		<br>

	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
</html>