<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#wrap {
	height: 810px;
}
.container {
	/* display:block; */
	margin-top: 100px;
}
.img {
	display:flex;
	justify-content: center;
} 

.line {
	text-align: center;
} 

.btn {
	width: 220px;
    height: 50px;
    margin: 30px 10px;
    padding: 10px 10px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 3px solid #015B28;
    background-color: white;
    cursor: pointer;
    
}

</style>
</head>

<script>
	$(function() {
		location.href="/newReward?memverId=" + ${vo.memberId};
	});
</script>
<body>
<%@ include file="mainheader.jsp" %>
<div id="wrap">
	<div class="container">
	<div class="img">
		<img alt="logo" src="img/MEROOM3.png" width="500" height="297">
	</div>
	<div class="line">
		<p>
		${vo.nickname} 님 환영합니다!!
		</p>
		<p>MEROOM에 가입해주셔서 감사합니다.<br>
		회원정보는 개인 정보 보호법에 의거하여 철저히 관리됩니다.<br><br>
		가입선물로 적립금 5000p가 적립되었습니다.<br>
		지금 당장 적립금을 사용해보세요!<br>
		<button class="btn" onclick="location.href='/mr/views/reservation/room.jsp'">객실 예약하러가기</button>
		</p>
	</div>
	</div>
</div>





<%@ include file="mainfooter.jsp" %>
</body>
</html>