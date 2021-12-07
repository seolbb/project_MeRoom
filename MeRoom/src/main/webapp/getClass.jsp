<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
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
	<h1>글상세(getClass.jsp)</h1>
	
	<form action="updateClass.do" method="post">
		<input type="hidden" name="oIdx" value="${oneday.oIdx }">
	<table>
		<tr>
			<th width="70">클래스명</th>
			<td>
				<input type="text" name="title" value="${oneday.oName }">
			</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<input type="text" name="title" value="${oneday.oCategory }">
			</td>
		</tr>
		<tr>
			<th>수강날짜</th>
			<td>
				<input type="text" name="title" value="${oneday.oDate }">
			</td>
		</tr>
		<tr>
			<th>수강시간</th>
			<td>
				<input type="text" name="title" value="${oneday.oTime }">
			</td>
		</tr>
		<tr>
			<th>수강장소</th>
			<td>
				<input type="text" name="title" value="${oneday.oLocation }">
			</td>
		</tr>
		<tr>
			<th>수강가격</th>
			<td>
				<input type="text" name="title" value="${oneday.oPrice }">
			</td>
		</tr>
		<tr>
			<th>수강인원</th>
			<td>
				<input type="text" name="title" value="${oneday.oCnt }">
			</td>
		</tr>
		<tr>
			<th>상세정보</th>
			<td>
				<input type="text" name="title" value="${oneday.oInfo }">
			</td>
		</tr>
		<tr>
			<th>썸네일이미지</th>
			<td>
				<input type="text" name="title" value="${oneday.oImg }">
			</td>
		</tr>
		<tr>
			<td colspan="9" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	
	<p>
		<a href="createClass.jsp">글등록</a>
		<a href="deleteClass.do?oIdx=${oneday.oIdx }">글삭제</a>
		<a href="getClassList.do">글목록</a>
	</p>
	
</div>

</body>
</html>