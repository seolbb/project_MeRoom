<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미룸 - 관리자페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
* {
	font-family: "Noto Sans KR" !important;
	box-sizing: border-box !important;
}
.main_container { 
	max-width: 1180px;
	height: auto;
	margin: 0 auto;
	padding: 10px 0 10px 0;
	display: flex;
}
#right_container {
	padding: 15px 40px;
	width: 980px;
	min-height: 600px;
}
</style>
</head>
<body>

<div id="container">
	<%@ include file="/views/adminMainHeader.jsp" %> <!-- 헤더 메뉴 -->
	
	<main>
		<div class="main_container">
			<%@ include file="/views/management/mgmtSide.jsp" %> <!-- 사이드 메뉴 -->
			<div id="right_container">
			<%@ include file="/views/management/mgmtBasic.jsp" %>
			</div>
		</div>
	</main>
		
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>

</body>
</html>