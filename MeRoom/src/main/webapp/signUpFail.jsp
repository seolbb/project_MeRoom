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
<body>
<%@ include file="mainheader.jsp" %>
<div id="wrap">
	<div class="container">
	<div class="img">
		<img alt="logo" src="img/MEROOM3.png" width="500" height="297">
	</div>
	<div class="line">
		<p>
		회원가입 실패
		</p>
		<p>다시 회원가입 해주세요<br>
		지속적인 오류가 발생할 경우 관리자에게 연락부탁드립니다.<br><br>
		<button class="btn" onclick="location.href='signUp.jsp'">회원가입</button>
		</p>
	</div>
	</div>
</div>





<%@ include file="mainfooter.jsp" %>
</body>
</html>