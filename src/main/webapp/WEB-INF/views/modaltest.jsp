<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modal</title>

<script src="http://code.jquery.com/jquery-3.3.1.min.js">
</script>

<c:forEach begin="0" end="11" step="1" varStatus="status">
<style>
	#modal${status.index} {
		display:none;
	
		position:absolute;
		width:100%;
		height:50%;
		z-index:999999;
	}
	
	#modal${status.index} h2{
		margin:0;
	}
	
	#modal${status.index} button {
		display:inline-block;
		width:100px;
		margin-left:calc(100% - 100px - 10px);
	}
	
	#modal${status.index} .modal_content {
		width:300px;
		margin:100px auto;
		padding:20px 10px;
		background:#fff;
		border: 2px solid #666;
	}
</style>
</c:forEach>
</head>
<body>

<c:forEach begin="0" end="11" step="1" varStatus="status">
<div id="root">
	<button type="button" id="modal_open_btn${status.index}">
		모달 창 열기
	</button>
</div>

<div id="modal${status.index}">
	<div class="modal_content">
		<h2>모달 창</h2>
		
		<p>모달 창 입니다.</p>
		
		<button type="button" id="modal_close_btn${status.index}">
			모달 창 닫기
		</button>
	</div>
	
	<div class="modal_layer"></div>
</div>

<script>
	$("#modal_open_btn${status.index}").click(function(){
		$("#modal${status.index}").attr("style", "display:block");
	});
	
	$("#modal_close_btn${status.index}").click(function(){
		$("#modal${status.index}").attr("style", "display:none");
	});
</script>

</c:forEach>

</body>
</html>