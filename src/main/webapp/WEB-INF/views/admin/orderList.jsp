<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	font-size: 0.8em;
	
}

/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>

	<div class="container-fluid" style="padding: 0 30px;">
	<p>${ sdate } ~ ${ edate } 기간 내  검색된 주문 건수 ${ allcount - cancelcount }건, 환불 요청 및 처리 건수 ${ cancelcount }건</p>
	<p>( 매출금액 <fmt:formatNumber value="${ sales - minus }" pattern="#,###,###"/>원, 환불금액 <fmt:formatNumber value="${ minus }" pattern="#,###,###"/>원 )</p><br>
	<button type="button" class="btn btn-outline-primary btn-lg"
	onclick="location.href='orderList?fieldName=order_state&searchWord=결제완료'">출고요청 : ${ shippingreq }건</button>
	<button type="button" class="btn btn-outline-primary btn-lg"
	onclick="location.href='orderList?fieldName=order_state&searchWord=취소요청'">취소요청 : ${ cancelreq }건</button>
	<br><br>
			<form>
			<div class="form-row">
				<div class="form-group col-md-2"></div>
				<div class="form-group col-md-1">
					<input type="text" id="sdate" name="sdate" class="form-control">
				</div>
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
				<div class="form-group col-md-1">
					<select name="fieldName" id="fieldName" class="form-control">
						<option ${(param.fieldName == "order_cusid")? "selected" : ""} value="order_cusid">아이디</option>
						<option ${(param.fieldName == "order_num")? "selected" : ""} value="order_num">주문번호</option>
						<option ${(param.fieldName == "order_prdcode")? "selected" : ""} value="order_prdcode">상품코드</option>
						<option ${(param.fieldName == "order_prdname")? "selected" : ""} value="order_prdname">상품명</option>
						<option ${(param.fieldName == "order_addr")? "selected" : ""} value="order_addr">배송지</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<input type="text" class="form-control" placeholder="Search"
						name="searchWord" value="${param.searchWord}" />
				</div>
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
				<div class="form-group col-md-2"></div>
			</div>
		</form>
		<div class="row">
			
			<br>
			<br>
			
			<table class="table table-hover"
				style="text-align: center; border: 0px solid #dddddd">
				<thead>
					<tr>
						<th style="padding:6px 3px;">주문번호</th>
						<th style="padding:6px 3px;">주문일자</th>
						<th style="padding:6px 3px;">아이디</th>
						<th style="padding:6px 3px;">상품코드</th>
						<th style="padding:6px 3px;">상품명</th>
						<th style="padding:6px 3px;">사이즈</th>
						<th style="padding:6px 3px;">수량</th>
						<th style="padding:6px 3px;">수령인</th>
						<th style="padding:6px 3px;">연락처</th>
						<th style="padding:6px 3px;">배송지</th>
						<th style="padding:6px 3px;">금액</th>
						<th style="padding:6px 3px;">포인트사용</th>
						<th style="padding:6px 3px;">상태</th>
						<th style="padding:6px 3px; width:190px;">배송메모</th>
						<th style="padding:6px 3px;">택배사</th>
						<th style="padding:6px 3px;">송장번호</th>
						<th style="padding:6px 3px;">관리자</th>
						<th style="padding:6px 3px;">처리일자</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty orderList }">
							<tr>
								<td colspan="18" align="center">모든 요청에 대한 처리가 완료되었습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty orderList}">

							<c:forEach var="e" items="${ orderList }">
								<tr onclick="javascript:selectNum(this);">
									<td style="padding:6px 3px;">${ e.order_num }</td>
									<td style="padding:6px 3px;"><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${ e.order_regdate }" /></td>
									<td style="padding:6px 3px;">${ e.order_cusid }</td>
									<td style="padding:6px 3px;">${ e.order_prdcode }</td>
									<td style="padding:6px 3px;">${ e.order_prdname }</td>
									<td style="padding:6px 3px;">${ e.order_prdsize }</td>
									<td style="padding:6px 3px;">${ e.order_amount }</td>
									<td style="padding:6px 3px;">${ e.order_receiver }</td>
									<td style="padding:6px 3px;">${ e.order_tel }</td>
									<td style="padding:6px 3px;">${ e.order_addr }</td>
									<td style="padding:6px 3px;"><fmt:formatNumber value="${ e.order_price }" pattern="#,###,###"/></td>
									<td style="padding:6px 3px;"><fmt:formatNumber value="${ e.order_usepoint }" pattern="#,###,###"/></td>
									<td style="padding:6px 3px;">${ e.order_state }</td>
									<td style="padding:6px 3px;">${ e.order_memo }</td>
 									<c:choose>
 										<c:when test="${ e.order_state == '결제완료' }">
							<form:form method="post" action="delivUpdate" modelAttribute="orderInfo">
								<form:hidden path="order_num" value="${ e.order_num }" />
								<form:hidden path="order_prdcode" value="${ e.order_prdcode }" />
								<form:hidden path="order_prdsize" value="${ e.order_prdsize }" />
								<form:hidden path="order_amount" value="${ e.order_amount }" />

											<td style="padding:6px 3px;">
											
											<select	name="order_delivcomp" class="form-control form-control-sm">
												<option value="우체국">우체국</option>
												<option value="대한통운">대한통운</option>
												<option value="로젠택배">로젠택배</option>
											</select>

											
											</td>
											<td style="padding:6px 3px;">
												<input type="number" name="order_delivnum" class="form-control form-control-sm">
											</td>
											<td style="padding:6px 3px;">
												<button type="submit" class="btn btn-primary btn-sm">발송처리</button>
											</td>
							</form:form>			
										</c:when>
							
										<c:when test="${ e.order_state == '취소요청' }">
							<form:form method="post" action="orderCancel" modelAttribute="orderInfo">
								<form:hidden path="order_num" value="${ e.order_num }" />
								<form:hidden path="order_cusid" value="${ e.order_cusid }" />
								<form:hidden path="order_price" value="${ e.order_price }" />
								<form:hidden path="order_usepoint" value="${ e.order_usepoint }" />
											<td style="padding:6px 3px;">${ e.order_delivcomp }</td>
											<td style="padding:6px 3px;">${ e.order_delivnum }</td>
											<td style="padding:6px 3px;">
												<button type="submit" class="btn btn-danger btn-sm" onclick="javascript:alert('취소처리되었습니다');">취소처리</button>
											</td>
							</form:form>
										</c:when>
										<c:when test="${ e.order_state == '취소완료' }">
											<td style="padding:6px 3px;">${ e.order_delivcomp }</td>
											<td style="padding:6px 3px;">${ e.order_delivnum }</td>
											<td style="padding:6px 3px;">
												<input type="button" class="btn btn-danger btn-sm" aria-pressed="true" value="취소완료" disabled/>
											</td>
										</c:when>
										<c:otherwise>
											<td style="padding:6px 3px;">${ e.order_delivcomp }</td>
											<td style="padding:6px 3px;">${ e.order_delivnum }</td>
											<td style="padding:6px 3px;">
												<input type="button" class="btn btn-secondary btn-sm" onclick="" value="발송완료" disabled/>
											</td>
										</c:otherwise>
									</c:choose>
									<td style="padding:6px 3px;"><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${ e.order_process }" /></td>
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
								href="orderList?page=${pageInfo.getStartPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
								tabindex="-1">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="orderList?page=${pageInfo.getStartPage()-1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}"
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
									href="orderList?page=${state.index}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
								href="orderList?page=${pageInfo.getEndPage()}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="orderList?page=${pageInfo.getEndPage()+1}&fielaName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br>
		<br>

	</div>
</body>
</html>