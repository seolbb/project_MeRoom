<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>글목록</h1>
	<h3>관리자님 환영합니다...</h3>

	<!-- 데이터 표시 영역 -->
	<table>
		<tr>
			<th>클래스번호</th>
			<th>클래스명</th>
			<th>수강날짜</th>
			<th>수강시간</th>
		</tr>
	<c:if test="${not empty classList }">
		<c:forEach var="vo" items="${classList }">
		<tr>
			<td>${vo.oIdx }</td>
			<td><a href="getClass.do?oIdx=${vo.oIdx }">${vo.oName }</a></td>
			<td>${vo.oDate }</td>
			<td>${vo.oTime }</td>
		</tr>
		</c:forEach>
	</c:if>	
	<c:if test="${empty classList }">
		<tr>
			<td colspan="5" class="center">데이터가 없습니다</td>
		</tr>
	</c:if>
	</table>
	
	<p><a href="createClass.jsp">새글등록</a></p>
	<p><a href="onedayMain.jsp">원데이메인</a></p>

</div>



</body>
</html>