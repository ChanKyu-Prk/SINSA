<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String getreferer = request.getHeader("Referer");
%>
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
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="true" />
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<form:form method="post" action="prdUpdate" modelAttribute="prdInfo"
				enctype="multipart/form-data">
				<input type="hidden" id="referer" name="referer" value="<%= getreferer %>" />
				<form:hidden path="prd_image"/>
				<form:hidden path="prd_num" />
				<div class="row">
				
				<input id="input_file" multiple="multiple" name="multipartFile"
					type="file" accept="image/jpeg, image/jpg, image/png"
					class="inputFile" style="display: none;">



				<table class="imgTable">
					<colgroup>
						<col width="250px">
						<col width="250px">
						<col width="250px">
						<col width="250px">
						<col width="250px">
						<col width="250px">
					</colgroup>
					<tr>
						<td class="imgtd"><div class="img_td_row">
								<img class="reviewPicAdd" alt="상품 사진 추가" title="상품 사진 추가"
									src="/resources/img/camera.png" />

							</div></td>
						<td class="imgtd"><div class="img_td_row">
								<img class="reviewPic" alt="상품 사진" title="상품 사진" id="reviewPic0"
									src="${pageContext.request.contextPath}\upload\prdImg\ ${param.prd_code}.png" />

							</div></td>
						<td class="imgtd"><div class="img_td_row">
								<img class="reviewPic" alt="상품 사진" title="상품 사진" id="reviewPic1"
									src="${pageContext.request.contextPath}\upload\prdImg\ ${param.prd_code}1.png" />

							</div></td>
						<td class="imgtd"><div class="img_td_row">
								<img class="reviewPic" alt="상품 사진" title="상품 사진" id="reviewPic2"
									src="${pageContext.request.contextPath}\upload\prdImg\ ${param.prd_code}2.png" />

							</div></td>
						<td class="imgtd"><div class="img_td_row">
								<img class="reviewPic" alt="상품 사진" title="상품 사진" id="reviewPic3"
									src="${pageContext.request.contextPath}\upload\prdImg\ ${param.prd_code}3.png" />

							</div></td>
						<td class="imgtd"><div class="img_td_row">
								<img class="reviewPic" alt="상품 사진" title="상품 사진" id="reviewPic4"
									src="${pageContext.request.contextPath}\upload\prdImg\ ${param.prd_code}4.png" />

							</div></td>
					</tr>

				</table>

			</div>
				<br />
				<table class="table table-bordered"
					style="text-align: center; border: 0px solid #dddddd">
					<tr>
						<td>상품코드</td>
						<td style="text-align:left;"><form:hidden path="prd_code"/>&nbsp; ${ prdInfo.prd_code }</td>
						<td rowspan="10"></td>
						<td rowspan="10" width="50%"><form:textarea path="prd_detail" class="form-control"
								style="height: 500px; border: 0px;" /></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><form:input path="prd_name" class="form-control" /></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><form:select path="prd_category" class="form-control">
								<form:option value="러닝" />
								<form:option value="농구" />
								<form:option value="축구" />
								<form:option value="아웃도어" />
								<form:option value="테니스" />
								<form:option value="트레이닝" />
								<form:option value="샌들/슬리퍼" />
								<form:option value="스케이트보딩" />
								<form:option value="골프" />
							</form:select></td>
					</tr>
					<tr>
						<td>구분</td>
						<td><form:select path="prd_gender" class="form-control">
								<form:option value="공용" />
								<form:option value="남성" />
								<form:option value="여성" />
							</form:select></td>
					<tr>
					<tr>
						<td>가격</td>
						<td><form:input path="prd_price" class="form-control" /></td>
					</tr>
					<tr>
						<td>브랜드</td>
						<td><form:select path="prd_brand" class="form-control">
								<form:option value="NIKE" />
								<form:option value="ADIDAS" />
								<form:option value="FILA" />
								<form:option value="PUMA" />
								<form:option value="CONVERSE" />
								<form:option value="REEBOK" />
								<form:option value="NEWBALANCE" />
								<form:option value="LACOSTE" />
							</form:select></td>
					<tr>
					<tr>
						<td>색상</td>
						<td><form:select path="prd_color" class="form-control">
								<form:option value="WH" />
								<form:option value="BK" />
								<form:option value="GREY" />
								<form:option value="RED" />
								<form:option value="BLUE" />
								<form:option value="PK" />
								<form:option value="NEON" />
								<form:option value="BG" />
								<form:option value="SK" />
							</form:select></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><form:input path="prd_disrate" class="form-control" /></td>
					</tr>
				</table>
				<div align="center">
					<input type="submit" class="btn btn-primary" value="변경사항저장">
					<button type="button" class="btn btn-outline-primary" onclick="history.go(-1);">취소</button>
				</div>
				<!-- 				<tr>
					<td colspan="4"><a href="prdList">상품리스트</a></td>
				</tr> -->
				<br><br>

			</form:form>
		</div>
	</div>
	
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/mixitup.min.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
</body>
<script>
$('.reviewPicAdd').on("click", function() {
	$('#input_file').trigger('click');
});

$(window).resize(function() {
	var imgWidth = $('.reviewPic').width();
	$('.reviewPic').height(imgWidth);
});

$('#input_file').on("change", handlerIngsFilesSelect);

function handlerIngsFilesSelect(e) {
	$('#reviewPic0').removeAttr("src").attr("src",
			"/resources/img/default.png");

	var sel_files = [];
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	if(filesArr.length>5){
		$('#input_file').val(null);
		return
	}
	
	var index = 0;
	filesArr.forEach(function(f) {
		sel_files.push(f);

		var reader = new FileReader();
		reader.onload = function(e) {
			$('#reviewPic' + index).attr("src", e.target.result);
			index++;
		}
		reader.readAsDataURL(f);
	});
}
</script>
</html>