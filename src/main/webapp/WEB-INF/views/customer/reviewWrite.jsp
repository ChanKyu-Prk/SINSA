<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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

.thumbPic {
	
}

.reviewPic {
	
}

table {
	width: 100%;
}

.prd_brand_td {
	font-size: 12px;
	color: grey;
}

.prd_name_td {
	font-size: 18px;
	font-weight: bold;
}

.prd_size_td {
	font-size: 12px;
	color: grey;
}

.imgtd {
	padding: 15px;
}

.tableLeftMargin {
	padding-left: 40px;
}

#stars a {
	color: #DCDCDC;
}

#stars a.on {
	color: #0b89fd !important;
}

#stars a.overM {
	color: #B0E0E6;
}

.starAlign {
	text-align: center !important;
	padding: auto;
}

.star {
	font-size: 50px;
	cursor: default;
}

.starCheck {
	display: none;
}

.title_row {
	text-align: center;
}

.select_box {
	padding-right: 3px !important;
	padding-left: 3px !important;
}

.select_box1 {
	border: solid 2px #FFFFFF;
	background-color: #F3F6FA;
	border-radius: 10px;
	padding: 0px;
	width: 100%;
	display: block;
	cursor: pointer;
}

.select_box1.overM {
	background-color: #B0E0E6;
}

.select_box1.on {
	background-color: #0b89fd;
}

.select_row {
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 25px;
	margin-top: 10px;
}

.inputFile {
 	display: none; 
}

.title_select_val {
	display: none;
}

.Tbold {
	font-weight: bold;
}

.imgTable {
	width: 100%;
}

.reviewPic {
	border: 1px solid #DCDCDC;
	width: 100%;
}

.reviewPicAdd {
	border: 1px solid #DCDCDC;
	cursor: pointer;
}

#contentArea {
	margin: 15px;
	width: 100%;
	resize: none;
	border: solid 1px #DCDCDC;
	width: 100%;
}

.reviewPic {
	background-color: #DCDCDC;
}

#submitBtn {
	background-color: #0b89fd;
	border: 0;
	outline: 0;
	padding: 10px;
	width: 150px;
}

.submitDiv {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 30px;
}
</style>
<title>SINSA : 후기 작성</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-9">
				<div class="subjecet">
					<h3>후기 작성</h3>
				</div>
				<hr>
				<div class="container">

					<div class="row">

						<table>
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 80%;">
							</colgroup>
							<tr>
								<td class="imgtd">

									<div class="td-row">
										<img class="thumbPic" alt="상품 대표 사진" title="상품 대표 사진"
											src="/resources/prdImg/shoe.jpg" />

									</div>
								</td>
								<td class="tableLeftMargin">
									<table>
										<tr>
											<td class="prd_brand_td"><span
												class="prd_brand_span span_margin">${product.PRD_BRAND}</span></td>
										</tr>
										<tr>
											<td class="prd_name_td"><span
												class="prd_name_span span_margin">${product.PRD_NAME }</span></td>
										</tr>
										<tr>
											<td class="prd_size_td">사이즈 : ${orderprdsize } mm</td>
										</tr>
									</table>
								</td>
							</tr>

						</table>


					</div>
					<hr>
					<form action="/reviewInsert" method="post"
						enctype="multipart/form-data">
						<input type="hidden" value="${ordernum }" name="REV_ORDERNUM">
						<input type="hidden" value="${product.PRD_CODE }"
							name="REV_PRDCODE"> <input type="hidden"
							value="${orderprdsize }" name="REV_ORDERPRDSIZE">
						<div class="row">
							<div class="col starAlign">
								<p id="stars">
									<a id="star1" class="star"><input type="radio"
										name="REV_STAR" value="1" id="checkStar1" class="starCheck">★</a>
									<a id="star2" class="star"><input type="radio"
										name="REV_STAR" value="2" id="checkStar2" class="starCheck">★</a>
									<a id="star3" class="star"><input type="radio"
										name="REV_STAR" value="3" id="checkStar3" class="starCheck">★</a>
									<a id="star4" class="star"><input type="radio"
										name="REV_STAR" value="4" id="checkStar4" class="starCheck">★</a>
									<a id="star5" class="star"><input type="radio"
										name="REV_STAR" value="5" id="checkStar5" class="starCheck">★</a>
								</p>
							</div>
						</div>

						<div class="row title_row">



							<div class="col-6">
								<div class="row">
									<div class="col-12 Tbold">사이즈</div>
								</div>
								<div class="row select_row">
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tsize" value="작음" class="title_select_val">작음</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tsize" value="적당함" class="title_select_val">적당함
										</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tsize" value="큼" class="title_select_val">큼</span>
									</div>
								</div>
							</div>



							<div class="col-6">
								<div class="row">
									<div class="col-12 Tbold">색상</div>
								</div>
								<div class="row select_row">
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tcolor" value="밝음" class="title_select_val">밝음</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tcolor" value="화면과 같음" class="title_select_val">화면과
											같음</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tcolor" value="어두움" class="title_select_val">어두움</span>
									</div>
								</div>
							</div>



							<div class="col-6">
								<div class="row">
									<div class="col-12 Tbold">착화감</div>
								</div>
								<div class="row select_row">
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tsense" value="편함" class="title_select_val">편함</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tsense" value="적당함" class="title_select_val">적당함</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tsense" value="딱딱함" class="title_select_val">딱딱함</span>
									</div>
								</div>
							</div>

							<div class="col-6">
								<div class="row">
									<div class="col-12 Tbold">배송</div>
								</div>
								<div class="row select_row">
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tdelv" value="빠름" class="title_select_val">빠름</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tdelv" value="괜찮음" class="title_select_val">괜찮음</span>
									</div>
									<div class="col-4 select_box">
										<span class="select_box1"><input type="radio"
											name="Tdelv" value="느림" class="title_select_val">느림</span>
									</div>
								</div>
							</div>



						</div>



						<div class="row">
							<input id="input_file" multiple="multiple" name="multipartFile"
								type="file" accept="image/jpeg, image/jpg, image/png"
								class="inputFile">



							<table class="imgTable">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
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

						<div class="row">

							<textarea rows="5" cols="56" name="REV_CONTENT" id="contentArea"
								placeholder="10자 이상 작성해 주세요"></textarea>
						</div>

						<div class="submitDiv">
							<button type="submit" id="submitBtn">리뷰 작성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

<script>


	$('#stars a').on("click", function() {
		$('.starCheck').attr("checked", false);
		$(this).find('.starCheck').attr("checked", true);

		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
	});
	$('#stars a').on("mouseover", function() {
		$(this).parent().children("a").removeClass("overM");
		$(this).addClass("overM").prevAll("a").addClass("overM");
	});
	$('#stars a').on("mouseout", function() {
		$(this).parent().children("a").removeClass("overM");

	});

	$('.select_box span').on(
			"click",
			function() {
				$(this).parent('.select_box').parent('.select_row').children(
						'.select_box').children('span').find(
						'.title_select_val').attr("checked", false);
				$(this).find('.title_select_val').attr("checked", true);

				$(this).parent().parent().children().children("span")
						.removeClass("on");
				$(this).addClass("on")
			});

	$('.select_box1').on("mouseover", function() {
		$(this).addClass("overM");
	});
	$('.select_box1').on("mouseout", function() {
		$(this).removeClass("overM");
	});

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

	$('#submitBtn').on("click", function() {
		if ($(':radio[name="REV_STAR"]:checked').length < 1) {
			event.preventDefault();
		}
		if ($(':radio[name="Tsize"]:checked').length < 1) {
			event.preventDefault();
		}
		if ($(':radio[name="Tcolor"]:checked').length < 1) {
			event.preventDefault();
		}
		if ($(':radio[name="Tsense"]:checked').length < 1) {
			event.preventDefault();
		}
		if ($(':radio[name="Tdelv"]:checked').length < 1) {
			event.preventDefault();
		}
		var content = $('#contentArea').val();
		if (content.length < 10) {
			event.preventDefault();
		}
	});
</script>
</html>