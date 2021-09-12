<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://kit.fontawesome.com/848d8f1fa9.js"
	crossorigin="anonymous"></script>
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

.notice {
	background-color: #EDEFF2;
}

.notice2 {
	list-style: square;
	margin-left: 30px;
}

.leaveBrn {
	height: 40px;
	border: solid 1px;
	width: 150px;
	float: right;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid #c1bfc1;
}

@media screen and (max-width: 720px) {
	.leaveBrn {
		float: none;
	}
	form{
	text-align: center;
	}
}
</style>
<title>SINSA 회원탈퇴</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>
	<div class="container con_top_margin">
		<div class="row">
			<jsp:include page="myPageSideBar.jsp"></jsp:include>
			<div class="col-sm-12 col-md-9">
				<div class="subjecet">
					<span>회원탈퇴</span>
				</div>
				<hr>



				<div class="notice">
					<ul class="notice2">
						<li>서비스 이용에 불편을 끼쳐드려 죄송합니다</li>
						<li>항상 고객만족을 위해 최선을 다하는 SINSA가 되겠습니다.</li>
						<li>진행 중인(구매확정 되지 않은) 주문 건이 있는 경우 탈퇴가 불가능합니다.</li>
						<li>탈퇴 시 보유중인 포인트와 거래정보 등이 모두 삭제됩니다.</li>
						<li>회원 탈퇴 후 철회가 불가능합니다.</li>
					</ul>
				</div>
				<form action="/leave" method="post">
					<button type="submit" class="leaveBrn">탈퇴하기</button>
				</form>
			</div>
			<hr />





		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>


</body>
<script>
	$('.leaveBrn').on("click", function() {
		var canleave = "${canleave}";
		if (ajt = 1) {
			if (confirm("정말로 회원탈퇴 하시겠습니까?\n회원탈퇴 후 철회는 불가능합니다.") == true) { //확인
				if (canleave == 'X') {
					alert("진행 중인(구매확정 되지 않은) 주문 건이 있는 경우 탈퇴가 불가능합니다.");
					event.preventDefault();
					event.stopPropagation();
				} else {
					alert("회원 탈퇴가 정상적으로 완료되었습니다.");
				}
			} else { //취소
				event.preventDefault();
				event.stopPropagation();
			}
		} else {
			event.preventDefault();
			event.stopPropagation();
		}
	});
</script>
</html>