<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="https://apis.tracker.delivery/carriers/kr.logen/tracks/99805163533" target="_blank">배송조회</a><br>

<input type="text" id="a" value="kr.logen"><br>
<input type="text" id="b" value="99805163533"><br>
<button class="button">검색</button><br>
<textarea id="c" cols="100" rows="5"></textarea><br>
<input type="text" value="${result.from }"><br>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</body>
<script type="text/javascript">
$('.button').on("click",function(){
	var a = $('#a').val();
	var b = $('#b').val();
	var src  = "https://apis.tracker.delivery/carriers/" + a +"/tracks/"+b 
	
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
				success : function(result) {
						$('#c').val(result.progresses[0].description);
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
</html>