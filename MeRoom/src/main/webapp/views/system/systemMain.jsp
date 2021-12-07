<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미룸 - 관리자페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
* {
	font-family: "Noto Sans KR" !important;
}
 	#main_container { 
		max-width: 1180px;
		margin: 0 auto;
 		width: 100%;
 		height: 300px;
 		padding: 10px 0 10px 0;
 	}
</style>
</head>
<body>

<div id="container">
	<%@ include file="/views/adminMainHeader.jsp" %> <!-- 헤더 메뉴 -->
	
	<main>
	<div id="main_container">
		시스템 관리
	</div>
	</main>
		
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>

</body>
</html>