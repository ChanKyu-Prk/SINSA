<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<meta charset="UTF-8">
<style type="text/css">
.recentlyViewBar {
	position: -webkit-sticky;
	position: sticky;
	float: right;
	right: 30px;
	z-index: 999;
	top: 40px;
	width: 300px;
	/* 	background-color: #EDEFF2; */
	width: 100px;
	height: 380px -ms-user-select: none;
	-moz-user-select: -moz-none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	box-shadow: 0px 0px 1px 2px #EDEFF2;
}

.recentlyViewthumbPic {
	cursor: pointer;
	box-shadow: 0px 0px 1px 2px #EDEFF2;
}

.recentlyViewBar_table {
	
}

.recentlyViewBar_title {
	height: 50px;
	font-size: 10pt;
	font-weight: bold;
	text-align: center;
}

.recentlyViewBar_td {
	height: 100px;
	max-height: 100px;
	padding: 5px;
}

.recentlyViewBar_paging {
	/* 	height: 30px; */
	text-align: center !important;
}

.td-row {
	max-height: 90px;
	position: relative;
}

#prev {
	cursor: pointer;
	color: #696969;
	font-size: 15pt;
}

#next {
	cursor: pointer;
	color: #696969;
	font-size: 15pt;
}

#firstAndMax {
	cursor: default;
	color: #696969;
	font-size: 15pt;
}

#recentPage {
	padding-left: 8px;
	padding-right: 8px;
}

.prdInfo {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #000;
	opacity: 0.7;
	width: 100%;
	height: 100%;
	cursor: pointer;
	text-align: center;
}

.prdBrand {
	margin-top: 15px;
	font-size: 6pt;
	color: white;
	font-size: 6pt;
}

.prdName {
	color: white;
}

.prdprice {
	color: #EEA9B0;
	font-size: 10pt;
}
</style>


<div class="recentlyViewBar">
	<table class="recentlyViewBar_table">

		<tr class="title_tr">
			<td class="recentlyViewBar_title">최근 본 상품</td>
		</tr>


	</table>

</div>
<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var recPage = 0;
	$
			.getJSON(
					"http://localhost:8090/recentlyview/1",
					function(data) {
						var recPrdImg = [];
						var recPrdName = [];
						var recPrdCode = [];
						var recPrdPrice = [];
						var recPrdBrand = [];
						var recListCount = 0;
						var recMaxPage = 0;
						var prev = 'prev';
						var next = 'next';

						$.each(data, function(inx, obj) {
							recPrdImg.push(obj.prdimg);
							var txt = obj.prdname;
							if (obj.prdname.length > 5) {
								txt = txt.substr(0, 5) + "...";
							}
							recPrdName.push(txt);
							recPrdCode.push(obj.prdcode);
							recPrdBrand.push(obj.prdbrand);
							recPrdPrice.push(obj.prdprice);
							recListCount = obj.listCount;
							recMaxPage = obj.maxPage;
							recPage = obj.page;
						});
						var str = '<TR>';
						if (recPage == 1) {
							prev = 'firstAndMax';
						}
						if (recMaxPage == 1) {
							next = 'firstAndMax';
						}
						if (recPrdName.length == 3) {
							$
									.each(
											data,
											function(i) {
												str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
														+ recPrdCode[i]
														+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
														+ recPrdName[i]
														+ '사진" title="'
														+ recPrdName[i]
														+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
														+ recPrdImg[i]+'" />'
														+ '<span class="prdInfo"><div class="prdBrand">'
														+ recPrdBrand[i]
														+ '</div><div class="prdName">'
														+ recPrdName[1]
														+ '</div><div class="prdprice">'
														+ recPrdPrice[i]
														+ '원</div></div></span></td>'
												str += '</TR>';
											});
							str += '<tr>'
									+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
									+ recPage
									+ ' / '
									+ recMaxPage
									+ '</span><span id = "'+next+'">&gt;</span></td>'
									+ '</tr>'
							$(".recentlyViewBar_table").append(str);

						} else if (recPrdName.length == 2) {
							$
									.each(
											data,
											function(i) {
												str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
														+ recPrdCode[i]
														+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
														+ recPrdName[i]
														+ '사진" title="'
														+ recPrdName[i]
														+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
														+ recPrdImg[i]+'" />'
														+ '<span class="prdInfo"><div class="prdBrand">'
														+ recPrdBrand[i]
														+ '</div><div class="prdName">'
														+ recPrdName[1]
														+ '</div><div class="prdprice">'
														+ recPrdPrice[i]
														+ '원</div></div></span></td>'
												str += '</TR>';
											});
							str += '<tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
									+

									'<tr>'
									+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
									+ recPage
									+ ' / '
									+ recMaxPage
									+ '</span><span id = "'+next+'">&gt;</span></td>'
									+ '</tr>'
							$(".recentlyViewBar_table").append(str);
						} else if (recPrdName.length == 1) {
							$
									.each(
											data,
											function(i) {
												str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
														+ recPrdCode[i]
														+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
														+ recPrdName[i]
														+ '사진" title="'
														+ recPrdName[i]
														+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
														+ recPrdImg[i]+'" />'
														+ '<span class="prdInfo"><div class="prdBrand">'
														+ recPrdBrand[i]
														+ '</div><div class="prdName">'
														+ recPrdName[1]
														+ '</div><div class="prdprice">'
														+ recPrdPrice[i]
														+ '원</div></div></span></td>'
												str += '</TR>';
											});
							str += '<tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr><tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
									+

									'<tr>'
									+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
									+ recPage
									+ ' / '
									+ recMaxPage
									+ '</span><span id = "'+next+'">&gt;</span></td>'
									+ '</tr>'
							$(".recentlyViewBar_table").append(str);
						} else {

							str += '<td class="recentlyViewBar_td"><div class="td-row"></div></td></tr><tr><td class="recentlyViewBar_td">'
									+ '<div class="td-row">최근 본 <br>상품이<br>없습니다.</div></td></tr><tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
									+ '<tr>'
									+ '<td class="recentlyViewBar_paging"></td>'
									+ '</tr>'
							$(".recentlyViewBar_table").append(str);
						}
						;
					});
	function createRecView(data) {

	};

	$(document)
			.on(
					"click",
					'#next',
					function() {
						var recPrdImg = [];
						var recPrdName = [];
						var recPrdCode = [];
						var recPrdPrice = [];
						var recPrdBrand = [];
						var recListCount = 0;
						var recMaxPage = 0;
						var nextpage = recPage + 1;
						var prev = 'prev';
						var next = 'next';

						$
								.ajax({
									type : "GET",
									url : "http://localhost:8090/recentlyview/"
											+ nextpage,
									dataType : "json",
									success : function(data) {
										$(".title_tr").nextAll().remove();
										$.each(data, function(inx, obj) {
											recPrdImg.push(obj.prdimg);
											var txt = obj.prdname;
											if (obj.prdname.length > 5) {
												txt = txt.substr(0, 5) + "...";
											}
											recPrdName.push(txt);
											recPrdCode.push(obj.prdcode);
											recPrdBrand.push(obj.prdbrand);
											recPrdPrice.push(obj.prdprice);
											recListCount = obj.listCount;
											recMaxPage = obj.maxPage;
											recPage = obj.page;
										});

										var str = '<TR>';
										if (recPage == 1) {
											prev = 'firstAndMax';
										}
										if (recMaxPage == recPage) {
											next = 'firstAndMax';
										}
										if (recPrdName.length == 3) {
											$
													.each(
															data,
															function(i) {
																str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
																		+ recPrdCode[i]
																		+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
																		+ recPrdName[i]
																		+ '사진" title="'
																		+ recPrdName[i]
																		+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
																		+ recPrdImg[i]+'" />'
																		+ '<span class="prdInfo"><div class="prdBrand">'
																		+ recPrdBrand[i]
																		+ '</div><div class="prdName">'
																		+ recPrdName[1]
																		+ '</div><div class="prdprice">'
																		+ recPrdPrice[i]
																		+ '원</div></div></span></td>'
																str += '</TR>';
															});
											str += '<tr>'
													+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
													+ recPage
													+ ' / '
													+ recMaxPage
													+ '</span><span id = "'+next+'">&gt;</span></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);

										} else if (recPrdName.length == 2) {
											$
													.each(
															data,
															function(i) {
																str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
																		+ recPrdCode[i]
																		+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
																		+ recPrdName[i]
																		+ '사진" title="'
																		+ recPrdName[i]
																		+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
																		+ recPrdImg[i]+'" />'
																		+ '<span class="prdInfo"><div class="prdBrand">'
																		+ recPrdBrand[i]
																		+ '</div><div class="prdName">'
																		+ recPrdName[1]
																		+ '</div><div class="prdprice">'
																		+ recPrdPrice[i]
																		+ '원</div></div></span></td>'
																str += '</TR>';
															});
											str += '<tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
													+

													'<tr>'
													+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
													+ recPage
													+ ' / '
													+ recMaxPage
													+ '</span><span id = "'+next+'">&gt;</span></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);
										} else if (recPrdName.length == 1) {
											$
													.each(
															data,
															function(i) {
																str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
																		+ recPrdCode[i]
																		+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
																		+ recPrdName[i]
																		+ '사진" title="'
																		+ recPrdName[i]
																		+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
																		+ recPrdImg[i]+'" />'
																		+ '<span class="prdInfo"><div class="prdBrand">'
																		+ recPrdBrand[i]
																		+ '</div><div class="prdName">'
																		+ recPrdName[1]
																		+ '</div><div class="prdprice">'
																		+ recPrdPrice[i]
																		+ '원</div></div></span></td>'
																str += '</TR>';
															});
											str += '<tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr><tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
													+

													'<tr>'
													+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
													+ recPage
													+ ' / '
													+ recMaxPage
													+ '</span><span id = "'+next+'">&gt;</span></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);
										} else {

											str += '<td class="recentlyViewBar_td"><div class="td-row"></div></td></tr><tr><td class="recentlyViewBar_td">'
													+ '<div class="td-row">최근 본 <br>상품이<br>없습니다.</div></td></tr><tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
													+ '<tr>'
													+ '<td class="recentlyViewBar_paging"></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);
										}
										;

									},
									error : function() {
										alert("보내기 실패1");
									}
								});
					});

	$(document)
			.on(
					"click",
					'#prev',
					function() {
						var recPrdImg = [];
						var recPrdName = [];
						var recPrdCode = [];
						var recPrdPrice = [];
						var recPrdBrand = [];
						var recListCount = 0;
						var recMaxPage = 0;
						var prevpage = recPage - 1;
						var prev = 'prev';
						var next = 'next';

						$
								.ajax({
									type : "GET",
									url : "http://localhost:8090/recentlyview/"
											+ prevpage,
									dataType : "json",
									success : function(data) {
										$(".title_tr").nextAll().remove();
										$.each(data, function(inx, obj) {
											recPrdImg.push(obj.prdimg);
											var txt = obj.prdname;
											if (obj.prdname.length > 5) {
												txt = txt.substr(0, 5) + "...";
											}
											recPrdName.push(txt);
											recPrdCode.push(obj.prdcode);
											recPrdBrand.push(obj.prdbrand);
											recPrdPrice.push(obj.prdprice);
											recListCount = obj.listCount;
											recMaxPage = obj.maxPage;
											recPage = obj.page;
										});
										var str = '<TR>';
										if (recPage == 1) {
											prev = 'firstAndMax';
										}
										if (recMaxPage == recPage) {
											next = 'firstAndMax';
										}
										if (recPrdName.length == 3) {
											$
													.each(
															data,
															function(i) {
																str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
																		+ recPrdCode[i]
																		+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
																		+ recPrdName[i]
																		+ '사진" title="'
																		+ recPrdName[i]
																		+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
																		+ recPrdImg[i]+'" />'
																		+ '<span class="prdInfo"><div class="prdBrand">'
																		+ recPrdBrand[i]
																		+ '</div><div class="prdName">'
																		+ recPrdName[1]
																		+ '</div><div class="prdprice">'
																		+ recPrdPrice[i]
																		+ '원</div></div></span></td>'
																str += '</TR>';
															});
											str += '<tr>'
													+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
													+ recPage
													+ ' / '
													+ recMaxPage
													+ '</span><span id = "'+next+'">&gt;</span></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);

										} else if (recPrdName.length == 2) {
											$
													.each(
															data,
															function(i) {
																str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
																		+ recPrdCode[i]
																		+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
																		+ recPrdName[i]
																		+ '사진" title="'
																		+ recPrdName[i]
																		+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
																		+ recPrdImg[i]+'" />'
																		+ '<span class="prdInfo"><div class="prdBrand">'
																		+ recPrdBrand[i]
																		+ '</div><div class="prdName">'
																		+ recPrdName[1]
																		+ '</div><div class="prdprice">'
																		+ recPrdPrice[i]
																		+ '원</div></div></span></td>'
																str += '</TR>';
															});
											str += '<tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
													+

													'<tr>'
													+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
													+ recPage
													+ ' / '
													+ recMaxPage
													+ '</span><span id = "'+next+'">&gt;</span></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);
										} else if (recPrdName.length == 1) {
											$
													.each(
															data,
															function(i) {
																str += '<td class="recentlyViewBar_td"><div class="td-row"><input type="hidden" value="'
																		+ recPrdCode[i]
																		+ '" class="recentlyViewprdcode"><img class="recentlyViewthumbPic" alt="'
																		+ recPrdName[i]
																		+ '사진" title="'
																		+ recPrdName[i]
																		+ '"src="${pageContext.request.contextPath}/resources/prdImg/'
																		+ recPrdImg[i]+'" />'
																		+ '<span class="prdInfo"><div class="prdBrand">'
																		+ recPrdBrand[i]
																		+ '</div><div class="prdName">'
																		+ recPrdName[1]
																		+ '</div><div class="prdprice">'
																		+ recPrdPrice[i]
																		+ '원</div></div></span></td>'
																str += '</TR>';
															});
											str += '<tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr><tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
													+

													'<tr>'
													+ '<td class="recentlyViewBar_paging"><span id="'+prev+'">&lt;</span><span id ="recentPage">'
													+ recPage
													+ ' / '
													+ recMaxPage
													+ '</span><span id = "'+next+'">&gt;</span></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);
										} else {

											str += '<td class="recentlyViewBar_td"><div class="td-row"></div></td></tr><tr><td class="recentlyViewBar_td">'
													+ '<div class="td-row">최근 본 <br>상품이<br>없습니다.</div></td></tr><tr><td class="recentlyViewBar_td"><div class="td-row"></div></td></tr>'
													+ '<tr>'
													+ '<td class="recentlyViewBar_paging"></td>'
													+ '</tr>'
											$(".recentlyViewBar_table").append(
													str);
										}
										;

									},
									error : function() {
										alert("보내기 실패1");
									}
								});
					});

	$(document).on("mouseover", '.td-row', function() {
		$(this).find('.prdInfo').css("display", "inline-block");
	});
	$(document).on("mouseout", '.td-row', function() {
		$(this).find('.prdInfo').css("display", "none");
	});

	$(document).on("click", '.prdInfo', function() {
		var prdcode = $(this).parent().find('input').val();
		location.href = '/product/prdCode=' + prdcode;
	});
</script>
