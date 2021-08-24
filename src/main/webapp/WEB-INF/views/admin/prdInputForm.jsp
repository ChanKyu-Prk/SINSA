<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

div {
	margin: 0 auto;
}
</style>
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
	$('#reviewPic1').removeAttr("src").attr("src",
			"/resources/img/default.png");
	$('#reviewPic2').removeAttr("src").attr("src",
			"/resources/img/default.png");

	var sel_files = [];
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	if(filesArr.length>3){
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
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="true" />
	<br><br>
	
	<div>
		<h2>신규 상품 등록</h2>
		<form:form method="post" action="prdInsert" modelAttribute="prdVO" enctype="multipart/form-data">
			<form:hidden path="prd_image"/>

  			
						<div class="row">
							<input id="input_file" multiple="multiple" name="multipartFile"
								type="file" accept="image/jpeg, image/jpg, image/png"
								class="inputFile">



							<table class="imgTable">
								<colgroup>
									<col width="250px">
									<col width="250px">
									<col width="250px">
									<col width="250px">
								</colgroup>
								<tr>
									<td class="imgtd"><div class="img_td_row">
											<img class="reviewPic" alt="리뷰 사진" title="리뷰 사진"
												id="reviewPic0" src="/resources/img/default.png" />

										</div></td>
									<td class="imgtd"><div class="img_td_row">
											<img class="reviewPic" alt="리뷰 사진" title="리뷰 사진"
												id="reviewPic1" src="/resources/img/default.png" />

										</div></td>
									<td class="imgtd"><div class="img_td_row">
											<img class="reviewPic" alt="리뷰 사진" title="리뷰 사진"
												id="reviewPic2" src="/resources/img/default.png" />

										</div></td>
									<td class="imgtd"><div class="img_td_row">
											<img class="reviewPicAdd" alt="리뷰 사진 추가" title="리뷰 사진 추가"
												src="/resources/img/camera.png" />

										</div></td>
								</tr>

							</table>

						</div>

  			
			<form:hidden path="fieldName" value="${param.fieldName}"/>
			<form:hidden path="searchWord" value="${param.searchWord}"/>
			<table>
				<tr>
					<td>상품코드 :</td>
					<td><form:input path="prd_code" /></td>
				</tr>
				<tr>
					<td>상 품 명 :</td>
					<td><form:input path="prd_name" /></td>
				</tr>
				<tr>
					<td>카테고리 :</td>
					<td><form:select path="prd_category">
        					<form:option value="러닝"/>
        					<form:option value="농구"/>
        					<form:option value="축구"/>
        					<form:option value="아웃도어"/>
        					<form:option value="테니스"/>
        					<form:option value="트레이닝"/>
        					<form:option value="샌들/슬리퍼"/>
        					<form:option value="스케이트보딩"/>
        					<form:option value="골프"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td>구분 :</td>
					<td>
						<form:select path="prd_gender">
        					<form:option value="공용"/>
        					<form:option value="남성"/>
        					<form:option value="여성"/>
						</form:select>
					</td>
				<tr>
				<tr>
					<td>가격 :</td>
					<td><form:input path="prd_price" /></td>
				</tr>
				<tr>
					<td>브랜드 :</td>
					<td>
						<form:select path="prd_brand">
        					<form:option value="NIKE"/>
        					<form:option value="ADIDAS"/>
        					<form:option value="FILA"/>
        					<form:option value="PUMA"/>
        					<form:option value="CONVERSE"/>
        					<form:option value="REEBOK"/>
        					<form:option value="NEWBALANCE"/>
        					<form:option value="LACOSTE"/>
						</form:select>
					</td>
				<tr>
				<tr>
					<td>색상 :</td>
					<td>
						<form:select path="prd_color">
        					<form:option value="WH"/>
        					<form:option value="BK"/>
        					<form:option value="GREY"/>
        					<form:option value="RED"/>
        					<form:option value="BLUE"/>
        					<form:option value="PK"/>
        					<form:option value="NEON"/>
        					<form:option value="BG"/>
        					<form:option value="SK"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td>상품설명 :</td>
					<td>
						<form:textarea path="prd_detail" cols="50" rows="5" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Save"></td>
				</tr>
				<tr>
					<td colspan="2"><a href="prdList">상품리스트</a></td>
				</tr>

			</table>

		</form:form>
	</div>
</body>
</html>