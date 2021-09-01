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
	<script type="text/javascript">
	var message = "${msg}";	
		if (message) {
			alert(message);				
		}
	</script>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<div class="container-fluid" style="padding: 0 30px;">
	<center><h2>주문 관리</h2></center>
	<br>
	<p>${ sdate } ~ ${ edate } 기간 내  검색된 주문 건수 ${ allcount - cancelcount }건, 환불 요청 및 처리 건수 ${ cancelcount }건</p>
	<p>( 매출금액 <fmt:formatNumber value="${ sales - minus }" pattern="#,###,###"/>원, 환불금액 <fmt:formatNumber value="${ minus }" pattern="#,###,###"/>원 )</p><br>
	
	<br>
			<form>
			<div class="form-row">
				<div class="form-group col-md-3">
				<button type="button" class="btn btn-outline-primary btn-lg"
	onclick="location.href='orderList?fieldName=order_state&searchWord=결제완료'">출고요청 : ${ shippingreq }건</button>
	<button type="button" class="btn btn-outline-primary btn-lg"
	onclick="location.href='orderList?fieldName=order_state&searchWord=취소요청'">취소요청 : ${ cancelreq }건</button>
				</div>
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
				<div class="form-group col-md-1"></div>
			</div>
		</form>
		<div class="row">
			
			<br>
			<br>
			
			<table class="table table-hover" id="thetable"
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
								<tr>
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
								<form:hidden path="order_price" value="${ e.order_price }" />
								<form:hidden path="order_cusid" value="${ e.order_cusid }" />

											<td style="padding:6px 3px;">
											
											<select	name="order_delivcomp" class="form-control form-control-sm">
												<option value="우체국 택배">우체국 택배</option>
												<option value="CJ대한통운">CJ대한통운</option>
												<option value="로젠택배">로젠택배</option>
												<option value="한진택배">한진택배</option>
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
								<form:hidden path="order_prdcode" value="${ e.order_prdcode }" />
								<form:hidden path="order_prdsize" value="${ e.order_prdsize }" />
								<form:hidden path="order_price" value="${ e.order_price }" />
								<form:hidden path="order_usepoint" value="${ e.order_usepoint }" />
											<td style="padding:6px 3px;" >${ e.order_delivcomp }</td>
											<td style="padding:6px 3px;">${ e.order_delivnum }</td>
											<td style="padding:6px 3px;">
												<button type="submit" class="btn btn-danger btn-sm">취소처리</button>
												<script
												  src="https://code.jquery.com/jquery-3.3.1.min.js"
												  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
												  crossorigin="anonymous"></script><!-- jQuery CDN --->
<!-- 												<script>
												  var url = document.location.href;
												  function cancelPay() {
												    jQuery.ajax({
												      "url": "admin/orderCancel", // 예: http://www.myservice.com/payments/cancel
												      "type": "POST",
												      "contentType": "application/json",
												      "data": JSON.stringify({
												        "merchant_uid": "${e.order_num}", // 예: ORD20180131-0000011
												        "cancel_request_amount": ${order_price}, // 환불금액
												        "reason": "테스트 결제 환불" // 환불사유
												      }),
												      "dataType": "json"
												    });
												    alert('취소처리되었습니다');
												  }
												</script> -->
												
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
											<td style="padding:6px 3px;">
												<a data-toggle="modal" href="#exampleModalCenter" class="delivBtn">${ e.order_delivnum }</a>
											</td>
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
								href="orderList?page=${pageInfo.getStartPage()}&sdate=${param.sdate}&edate=${param.edate}&fieldName=${param.fieldName}&searchWord=${param.searchWord}"
								tabindex="-1">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="orderList?page=${pageInfo.getStartPage()-1}&sdate=${param.sdate}&edate=${param.edate}&fieldName=${param.fieldName}&searchWord=${param.searchWord}"
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
									href="orderList?page=${state.index}&sdate=${param.sdate}&edate=${param.edate}&fieldName=${param.fieldName}&searchWord=${param.searchWord}">${state.index}</a></li>
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
								href="orderList?page=${pageInfo.getEndPage()}&sdate=${param.sdate}&edate=${param.edate}&fieldName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="orderList?page=${pageInfo.getEndPage()+1}&sdate=${param.sdate}&edate=${param.edate}&fieldName=${param.fieldName}&searchWord=${param.searchWord}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br>
		<br>

	</div>
	
		<!-- Modal -->
<div class="modal" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">
 배송 조회</h5>
        <button type="button" class="close" data-dismiss="modal"  >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="container-fluid">
    <div id="testtest">
        <table class="table">
        <tr>
        <td>송장 번호 : </td>
        <td class="td_deliv_num"></td>
        <td class="td_deliv_comp"></td>
        </tr>
        </table>
    </div>

    <div class="col-12">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>시간</th>
                <th>현재 위치</th>
                <th>배송 상태</th>
            </tr>
            </thead>
            <tbody id="tbodyA">
           
            </tbody>
        </table>
    </div>
</div>
</div>
</div>
</div>

	<br><br>
	<jsp:include page="footer.jsp"/>
	
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/mixitup.min.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	

<script>


$('.delivBtn').on("click",function(){
	
	var DELIVCOMP = $(this).parent().parent().find('td:eq(14)').text();
	var DELIVNUM = $(this).parent().parent().find('td:eq(15)').text();
	var DEILVCODE = "";
	
	
	if (DELIVCOMP=='DHL'){
		DEILVCODE = 'de.dhl';
	}else if(DELIVCOMP=='Sagawa'){
		DEILVCODE = 'jp.sagawa';
	}else if(DELIVCOMP=='Kuroneko Yamato'){
		DEILVCODE = 'jp.yamato';
	}else if(DELIVCOMP=='Japan Post'){
		DEILVCODE = 'jp.yuubin';
	}else if(DELIVCOMP=='천일택배'){
		DEILVCODE = 'kr.chunilps';
	}else if(DELIVCOMP=='CJ대한통운'){
		DEILVCODE = 'kr.cjlogistics';
	}else if(DELIVCOMP=='GS Postbox 택배'){
		DEILVCODE = 'kr.cvsnet';
	}else if(DELIVCOMP=='CWAY (Woori Express)'){
		DEILVCODE = 'kr.cway';
	}else if(DELIVCOMP=='대신택배'){
		DEILVCODE = 'kr.daesin';
	}else if(DELIVCOMP=='우체국 택배'){
		DEILVCODE = 'kr.epost';
	}else if(DELIVCOMP=='한의사랑택배'){
		DEILVCODE = 'kr.hanips';
	}else if(DELIVCOMP=='한진택배'){
		DEILVCODE = 'kr.hanjin';
	}else if(DELIVCOMP=='합동택배'){
		DEILVCODE = 'kr.hdexp';
	}else if(DELIVCOMP=='홈픽'){
		DEILVCODE = 'kr.homepick';
	}else if(DELIVCOMP=='한서호남택배'){
		DEILVCODE = 'kr.honamlogis';
	}else if(DELIVCOMP=='일양로지스'){
		DEILVCODE = 'kr.ilyanglogis';
	}else if(DELIVCOMP=='경동택배'){
		DEILVCODE = 'kr.kdexp';
	}else if(DELIVCOMP=='건영택배'){
		DEILVCODE = 'kr.kunyoung';
	}else if(DELIVCOMP=='로젠택배'){
		DEILVCODE = 'kr.logen';
	}else if(DELIVCOMP=='롯데택배'){
		DEILVCODE = 'kr.lotte';
	}else if(DELIVCOMP=='SLX'){
		DEILVCODE = 'kr.slx';
	}else if(DELIVCOMP=='성원글로벌카고'){
		DEILVCODE = 'kr.swgexp';
	}else if(DELIVCOMP=='TNT'){
		DEILVCODE = 'nl.tnt';
	}else if(DELIVCOMP=='EMS'){
		DEILVCODE = 'un.upu.ems';
	}else if(DELIVCOMP=='Fedex'){
		DEILVCODE = 'us.fedex';
	}else if(DELIVCOMP=='UPS'){
		DEILVCODE = 'us.ups';
	}else if(DELIVCOMP=='USPS'){
		DEILVCODE = 'us.usps';
	}

	
	
	var src  = "https://apis.tracker.delivery/carriers/" + DEILVCODE +"/tracks/"+DELIVNUM ;

	$.ajax({
		type : "GET",
		url : src,
		dataType: "json",
		success : function(data) {	
			console.log(data);
			$.ajax({
				type : "POST",
				url : "/delev",
				data :JSON.stringify(data),
			    headers: {
				      'Accept': 'application/json',
				      'Content-Type': 'application/json'
				    },
				success : function(progresses) {
				$('.td_deliv_num').html(DELIVNUM);	
				$('.td_deliv_comp').html('('+DELIVCOMP+')');	
					
					
				$("#tbodyA").children().remove(); 
				var str = '<TR>';
	            $.each(progresses , function(i){
	            	
	            	var time = new Date(progresses[i].time).toLocaleString('ko-KR', {timeZone: 'Asia/Seoul'}); 
	                str += '<TD>' + time + '</TD><TD>' + progresses[i].location.name + 
	                '</TD><TD>' + progresses[i].status.text + '</TD>';
	                str += '</TR>';
	           });
	           $("#tbodyA").append(str); 
					
					
				},
				   error : function(){
					    alert("보내기 실패2");
					   }
			})
		},
		   error : function(){
			    alert("보내기 실패1");
			   }
	});
})
</script>
</body>
</html>