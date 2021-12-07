<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EnjoyList</title>
<style>
#container {
	width: 700px;
	margin: 0 auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

th {
	background-color: orange;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}
</style>
</head>
<body>
	<div id="container">
		<h1>글목록</h1>
		<form action="getEnjoy.do" method="post"> <!-- getEnjoyList.do -->
			<table>
				<tr>
					<th width="100">번호</th>             
					<th width="200">카테고리</th>
					<th width="100">제목</th>
					<th width="300">한줄요약</th>
					<th width="200">전화번호</th>
					<th width="100">위치</th>
					<th width="100">가격</th>
					<th width="200">운영시간</th>
					<th width="200">상세정보</th>
					<th width="100">파일명</th>
				</tr>
				
			<c:if test="${not empty enjoyList }">
				<c:forEach var="enjoy" items="${enjoyList }">
				<tr>
					<td>${enjoy.eid }</td>
					<td>${enjoy.ecategory }</td>
					<td>
						<a href="getEnjoy.do?eid=${enjoy.eid }">${enjoy.etitle }</a>
					</td>
					<td>${enjoy.etitle }</td>
					<td>${enjoy.etext }</td>
					<td>${enjoy.ephone }</td>
					<td>${enjoy.elocation }</td>
					<td>${enjoy.eprice }</td>
					<td>${enjoy.etime }</td>
					<td>${enjoy.einfo }</td>
				</tr>
				</c:forEach>
			</c:if>	
			<c:if test="${empty enjoyList }">
				<tr>
					<td colspan="10" class="center">데이터가 없습니다.</td>
				</tr>
			</c:if>				
			</table>
			
			<p>
			<a href="insertEnjoy.jsp">등록</a>
			<a href="history.back();">뒤로가기</a>
			</p>
			
		</form>
		
	</div>

</body>
</html>