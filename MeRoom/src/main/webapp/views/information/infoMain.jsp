<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미룸 - 관리자페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
* {
	font-family: "Noto Sans KR" !important;
	box-sizing: border-box !important;
}
.main_container { 
	max-width: 1180px;
	height: 700px;
	margin: 0 auto;
	padding: 10px 0 10px 0;
	display: flex;
}
#right_container {
	padding: 15px 40px;
	width: 980px;
	height: 600px;
}
</style>
<script>
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawTrendlines);

	function drawTrendlines() {
	      var data = new google.visualization.DataTable();
	      data.addColumn('timeofday', '몰라');
	      data.addColumn('number', '항목1');
	      data.addColumn('number', '항목2');

	      data.addRows([
	        [{v: [8, 0, 0], f: '8 am'}, 1, .25],
	        [{v: [9, 0, 0], f: '9 am'}, 2, .5],
	        [{v: [10, 0, 0], f:'10 am'}, 3, 1],
	        [{v: [11, 0, 0], f: '11 am'}, 4, 2.25],
	        [{v: [12, 0, 0], f: '12 pm'}, 5, 2.25],
	        [{v: [13, 0, 0], f: '1 pm'}, 6, 3],
	        [{v: [14, 0, 0], f: '2 pm'}, 7, 4],
	        [{v: [15, 0, 0], f: '3 pm'}, 8, 5.25],
	        [{v: [16, 0, 0], f: '4 pm'}, 9, 7.5],
	        [{v: [17, 0, 0], f: '5 pm'}, 10, 10],
	      ]);
	      
	      var options = {
	        title: '사실은 여기가 제목',
	        hAxis: {
	          title: '가로',
	          format: 'h:mm a',
	          viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          }
	        },
	        vAxis: {
	          title: '여기는 세로 설명'
	        }
	      };

	      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	    }
</script>
</head>
<body>

<div id="container">
	<%@ include file="/views/adminMainHeader.jsp" %> <!-- 헤더 메뉴 -->
	
	<main>
		<div class="main_container">
			<%@ include file="/views/information/infoSide.jsp" %> <!-- 사이드 메뉴 -->
			<div id="right_container">
			<%@ include file="/views/information/infoBasic.jsp" %>
			</div>
		</div>
	</main>
		
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>

</body>
</html>