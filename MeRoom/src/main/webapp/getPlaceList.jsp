<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<meta charset="UTF-8">
<title>PlaceList</title>
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
		<form action="getPlace.do" method="post">
			<table>
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						
<!-- 						<select name="searchCondition"> -->
<!-- 							<option value="TITLE">제목</option> -->
<!-- 							<option value="CONTENT">내용</option> -->
<!-- 						</select> -->
<!-- 						--> 
<!-- 					<select name="searchCondition"> -->
<%-- 					<c:forEach var="option" items="${conditionMap }"> --%>
<%-- 						<option value="${option.value }">${option.key }</option> --%>
<%-- 					</c:forEach> --%>
<!-- 					</select> -->
<!-- 					<input type="text" name="searchKeyword"> -->
<!-- 					<input type="submit" value="검색"> -->
<!-- 					</td>				 -->
<!-- 				</tr> -->
			
				<tr>
					<th width="100">번호</th>
					<th width="100">장소명</th>
					<th width="100">시간</th>
					<th width="100">전화번호</th>
					<th width="100">위치</th>
					<th width="100">썸네일</th>
					<th width="150">내용</th>
					<th width="100">파일경로</th>
					<th width="100">위도</th>
					<th width="100">경도</th>
				</tr>
			<c:if test="${not empty placeList }">
				<c:forEach var="place" items="${placeList }">
				<tr>
					<td>${place.pid }</td>
					<td>
						<a href="getPlace.do?pid=${place.pid }">${place.ptitle }</a>
					</td>
					<td>${place.ptime }</td>
					<td>${place.pphone }</td>
					<td>${place.plocation }</td>
					<td>${place.pcontent }</td>
					<td>${place.pfilepath }</td>
					<td>${place.plat }</td>
					<td>${place.plng }</td>
				</tr>
				</c:forEach>
			</c:if>	
			<c:if test="${empty placeList }">
				<tr>
					<td colspan="9" class="center">데이터가 없습니다.</td>
				</tr>
			</c:if>				
			</table>
			
			<p>
			<a href="insertPlace.jsp">등록</a>
			</p>
			<a href="updatePlace.jsp">수정</a>
		</form>
		
	</div>

</body>
</html>