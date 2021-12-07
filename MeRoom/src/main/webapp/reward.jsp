<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적립금</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#wrap {
	min-height: 810px;
}

.container {
	margin: 0 auto;
	max-width: 1279px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 40px;
	padding-right: 40px;
}

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
    font-size: 32px;
    font-weight: 500;
    letter-spacing: -0.05em;
    margin-bottom: 40px;
}

table{
	width: 100%;
    border-top: 2px solid black;
    border-bottom: 1px solid #e4e4e4;
    border-spacing: 2px;
    border-collapse: collapse
    
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
    padding: 15px 5px;
    vertical-align: middle;
    text-align: center;
    
}
.tb{
   border-bottom:1px solid #e4e4e4;
}
/* .total {
	text-align: right;
	padding-right: 40px;
} */
.txt {
	font-size: 18px;
	padding-bottom: 0px;
}
</style>
</head>
<script>
	$(document).ready(function(){
		let point = $("#point").val();
		if (point < 0) {
			$("#point").css("color", "red");
		}
	});
	



</script>

<body>
	<%@ include file="mainheader.jsp"%>
	<div id="wrap">
		<div class="container">
			<div class="my">
				<p class="title">적립금 내역</p>
			</div>
			<br>
			<div>
			<div class="subT">
				<ul>
					<li class="total txt">총 사용가능 적립금 &nbsp;  : &nbsp; ${total }&nbsp;p</li>
				</ul>
				<br>
			</div>
			<br>
				<table>
					
					<thead>
						<tr class="tb">
							<th>일시</th>
							<th>내역</th>
							<th>적립금</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty list}">
							<c:forEach var="listReward" items="${list }">
								<tr class="tb">
									<td>${listReward.reward_date }</td>
									<td >${listReward.re_category }</td>
									<td id="point">${listReward.point }</td>
								</tr>
							</c:forEach>
						</c:if>
						
						<c:if test="${empty list }">
							<tr>
								<td colspan="3">적립내역이 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br><br>
	<%@ include file="mainfooter.jsp"%>
</body>
</html>