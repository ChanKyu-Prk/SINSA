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
	<p>${ sdate } ~ ${ edate } 기간 내  주문 건수 ${ allcount }건( 매출금액 <fmt:formatNumber value="${ sales }" pattern="#,###,###"/>원 )</p>
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
				            
				            //From의 초기값을 오늘 날짜로 설정
				            $('#sdate').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				            //To의 초기값을 내일로 설정
				            $('#edate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				        });
    					</script>
				</div>
				<div class="form-group col-md-1">
					<select name="fieldName" id="fieldName" class="form-control">
						<option ${(param.fieldName == "order_cusid")? "selected" : ""} value="order_cusid">아이디</option>
						<option ${(param.fieldName == "order_num")? "selected" : ""} value="order_num">주문번호</option>
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
						<th>주문번호</th>
						<th>주문일자</th>
						<th>아이디</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>사이즈</th>
						<th>수량</th>
						<th>수령인</th>
						<th>연락처</th>
						<th>배송지</th>
						<th>금액</th>
						<th>포인트사용</th>
						<th>상태</th>
						<th>배송메모</th>
						<th>택배사</th>
						<th>송장번호</th>
						<th>테스트1</th>
						<th>테스트2</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty orderList }">
							<tr>
								<td colspan="10" align="center">모든 요청에 대한 처리가 완료되었습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty orderList}">

							<c:forEach var="e" items="${ orderList }">
								<tr onclick="javascript:selectNum(this);">
									<td>${ e.order_num }</td>
									<td><fmt:formatDate pattern="yy-MM-dd HH:mm:ss" value="${ e.order_regdate }" /></td>
									<td>${ e.order_cusid }</td>
									<td>${ e.order_prdcode }</td>
									<td>${ e.order_prdname }</td>
									<td>${ e.order_prdsize }</td>
									<td>${ e.order_amount }</td>
									<td>${ e.order_receiver }</td>
									<td>${ e.order_tel }</td>
									<td>${ e.order_addr }</td>
									<td><fmt:formatNumber value="${ e.order_price }" pattern="#,###,###"/></td>
									<td><fmt:formatNumber value="${ e.order_usepoint }" pattern="#,###,###"/></td>
									<td>${ e.order_state }</td>
									<td>${ e.order_memo }</td>
 									<c:choose>
 										<c:when test="${ e.order_state == '결제완료' }">
							<form:form method="post" action="delivUpdate" modelAttribute="orderInfo">
								<form:hidden path="order_num" value="${ e.order_num }" />
								<form:hidden path="order_prdcode" value="${ e.order_prdcode }" />
								<form:hidden path="order_prdsize" value="${ e.order_prdsize }" />
								<form:hidden path="order_amount" value="${ e.order_amount }" />

											<td>
											
											<select	name="order_delivcomp" class="form-control">
												<option value="우체국">우체국</option>
												<option value="대한통운">대한통운</option>
												<option value="로젠택배">로젠택배</option>
											</select>

											
											</td>
											<td>
												<input type="number" name="order_delivnum" class="form-control">
											</td>
											<td>
												<button type="submit" class="btn btn-primary btn-sm">발송처리</button>
											</td>
							</form:form>			
										</c:when>
										<c:when test="${ e.order_state == '취소요청' }">
											<td>${ e.order_delivcomp }</td>
											<td>${ e.order_delivnum }</td>
											<td>
												<input type="button" class="btn btn-danger btn-sm" onclick="" value="취소처리" />
											</td>
										</c:when>
										<c:otherwise>
											<td>${ e.order_delivcomp }</td>
											<td>${ e.order_delivnum }</td>
											<td>
												<input type="button" class="btn btn-secondary btn-sm" onclick="" value="발송완료" disabled/>
											</td>
										</c:otherwise>
									</c:choose>
									<td></td>
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