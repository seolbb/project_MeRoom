<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* 후기 작성 가능한 숙박 리스트 보여줄지 말지 고민해보기 */

#wrap {
	min-height: 810px;
}

.con {
	margin: 0 auto;
	max-width: 1280px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 40px;
	padding-right: 40px;
}

table {
	width: 100%;
	border-top: 2px solid black;
	border-spacing: 2px;
	border-collapse: collapse;
	
}

table>thead>tr {
	padding: 12px 0;
	line-height: 20px;
	font-size: 14px;
	font-weight: 500;
}

tbody {
	vertical-align: middle;
}

td, th {
	padding: 15px 10px;
	vertical-align: middle;
	text-align: center;
}

.tb {
	border-bottom: 1px solid #e4e4e4;
	/* background-color: #f3f3f3; */
}

#info {
	text-align: left;
	padding: 15px 20px;
	width: 80%;
}

.content {
	border-bottom: 1px solid #e4e4e4;
}
.btnG {
	width: 20%;
}
.btn {
	background-color: white;
	border: 2px solid #015B28;
	color: #015B28;
	padding: 6px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 600;
}

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 32px;
	font-weight: 500;
	letter-spacing: -0.05em;
	margin-bottom: 40px;
}
.date {
	text-align: left;
	padding-left: 20px;
}

.subT {
	text-align: left;
	
}
.answer {
	background-color: #f3f3f3;
	padding: 15px 20px;
	text-align: left;
}


</style>
</head>
<body>
	<%@ include file="mainheader.jsp"%>

	<div id="wrap">
		<div class="con">
			<div class="my">
				<p class="title">나의 문의내역</p>
			</div>
			<table class="list">
			<c:if test="${empty qnaList }">
				<thead>
					<tr class="tb">
						<th class="subT">등록된 문의내역에 없습니다.</th>
					</tr>
				</thead>	
			</c:if>
			<c:if test="${not empty qnaList }">
			<c:forEach var="qnaList" items="${qnaList }">
				<thead>
					<tr class="tb">
						<th class="subT">${qnaList.qTitle } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ${qnaList.qRegdate } </th>
						<th>답변유무 : ${qnaList.qYn }</th>
					</tr>
				</thead>
				<tbody>
					<tr class="item content">
						<td id="info" class="item-info">
						${qnaList.qContent }
						</td>
						<td class="item btnG">
						<button class="btn" onclick="location.href='deleteQuestion.do?qIdx=${qnaList.qIdx }'">삭제</button>
						</td>
					</tr>
					<c:set var="content" value="${qnaList.aContent}"></c:set>
					<c:if test="${empty content }">

					
					</c:if>
					<c:if test="${not empty content }">
						<tr>
							<td class="answer" >관리자</td>
							<td class="answer" >${qnaList.aRegdate }</td>
						</tr>
						<tr>
							<td class="answer" colspan="2">
							${qnaList.aContent }
							</td>
						</tr>	
					
					</c:if>
						

				</tbody>
				</c:forEach>
				</c:if>
			</table>

		</div>
	</div>


	<br>
	<br>
	<br>

	<%@ include file="mainfooter.jsp"%>
</body>
</html>