<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$('html').click(function(e) {
		if(!($(e.target).parents().hasClass("news_outer") || $(e.target).hasClass("news_outer") || $(e.target).hasClass("new_news_button"))) {
			$(".news_outer").hide();
		}
	})
	
	function news_search() {

	}
	
	function new_news(type) {
		if (type == 'new') {
			$(".news_outer").hide();
			$(".infobox_title").html("신규 뉴스 등록");
			$(".news_outer").css("top", "150px");
			$(".news_outer").css("left", "150px");
			$("#new_news_o, #new_news_o *").show();
			$("#new_news_o").draggable({
				containment: "html",
				cancel: "#new_news_i"
			});
		}
		if (type == 'update') {
			$(".news_outer").hide();
			$(".infobox_title").html("뉴스 정보 수정");
			$(".news_outer").css("top", "150px");
			$(".news_outer").css("left", "150px");
			$("#new_news_o, #new_news_o *").show();
			$("#new_news_o").draggable({
				containment: "html",
				cancel: "#new_news_i"
			});
		}
	}
	
	function news_detail(newsNum) {
		$(".news_outer").hide();
		$(".infobox_title").html("뉴스 상세 정보");
		$(".news_outer").css("top", "150px");
		$(".news_outer").css("left", "150px");
		$("#news_info_o, #news_info_o *").show();
		$("#news_info_o").draggable({
			containment: "html",
			cancel: "#news_info_i"
		});
	}
</script>
<style>
/* 내용 부분 중간 */
/* 내용 부분 메인 */
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

.right_container {
	padding: 15px 40px;
	width: 980px;
	height: 600px;
}
.right_main {
	width: 900px;
	height: 570px;
	position: relative;
}
/* .right_main * {
	border: 1px dotted red;
} */
.news_title {
	width: 900px;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	font-weight: 300;
}
.news_searchbox {
	width: 900px;
	height: 100px;
	display: flex;
	border-width: 2px 0 3px 0;
	border-style: solid none double none;
	border-color: lightgray white lightgray white;
}
#search_form {
	width: 750px;
	height: 100px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	padding: 10px;
}
.new_news {
	width: 150px;
	height: 100px;
}
.new_news input {
	width: 75px;
	text-align: center;
	font-size: 14px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid gray;
	box-shadow: 1px 1px 1px gray;
	margin: 60px 0 0 50px;
}
.new_news input:active {
	box-shadow: 0px 0px 0px white;
}
.form_items {
	width: auto;
	height: 25px;
	font-size: 16px;
	text-align: right;
	margin-right: 5px;
}
.form_shortbox {
	width: 230px;
	height: 30px;
	display: flex;
	margin: 5px 10px 15px 0;
}
.form_shorttext {
	width: 150px;
	height: 25px;
	border-radius: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px gray;
}
.buttonbox {
	width: 270px;
	height: 30px;
}
.buttonbox input {
	width: 75px;
	text-align: center;
	font-size: 14px;
	margin-right: 10px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid gray;
	box-shadow: 1px 1px 1px gray;
}
.buttonbox input:active {
	box-shadow: 0px 0px 0px white;
}
.news_list {
	width: 900px;
	height: 420px;
}
.list_table {
	width: 900px;
	height: 410px;
	text-align: center;
	border-spacing: 0;
	margin-top: 10px;
}
th, td {
	border-width: 0 0 2px 0;
	border-style: none none solid none;
	border-color: white white lightgray white;
	line-height: 30px;
}
th {
	font-size: 17px;
	font-weight: 500;
}
td {
	font-size: 14px;
}
.news_number:hover {
	text-decoration: underline;
}
/* 예약 상세 내역 팝업 창 (hidden) */
.news_outer {
	display: none;
	width: 600px;
	height: 400px;
	border: 1px solid gray;
	border-radius: 4px;
	box-shadow: 1px 2px 1px gray;
	background-color: #f5f5f5;
	position: absolute;
	top: 150px;
	left: 150px;
}
.news_inner {
	display: none;
	width: 598px;
	height: 379px;
	margin-top: 20px;
	padding: 14px;
	border-top: 1px solid gray;
	border-radius: 0 0 4px 4px;
	background-color: white;
}
.news_infobox {
	width: 570px;
	height: 350px;
}
.infobox_title {
	width: 570px;
	height: 50px;
	line-height: 50px;
	font-size: 17px;
	font-weight: 600;
	border-bottom: 2px solid lightgray;
}
.infobox_content {
	width: 570px;
	height: 230px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.infobox_content > div {
	width: 230px;
	height: 30px;
	margin-top: 20px;
	display: flex;
}
.infobox_content div p {
	width: 70px;
	margin: 0;
	text-align: right;
}
.infobox_content div div {
	width: 130px;
	margin-left: 20px;
}
.infobox_buttonbox {
	width: 570px;
	height: 70px;
	line-height: 70px;
	border-top: 2px solid lightgray;
}
.infobox_buttonbox > input {
	width: 60px;
	height: 30px;
	text-align: center;
	line-height: 20px;
	margin-left: 10px;
	border: 2px solid #015b28;
	box-shadow: 1px 1px 1px gray;
	border-radius: 3px;
	background-color: white;
}
.infobox_buttonbox > input:hover {
	background-color: #f1f1f1;
}
.infobox_buttonbox > input:active {
	background-color: white;
	border: 1px solid #015b28;
	box-shadow: none;
}
/* 신규 예약 등록 (hidden) */
.new_news_content {
	width: 570px;
	height: 230px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.new_news_content > div {
	width: 230px;
	height: 30px;
	margin-top: 20px;
	display: flex;
}
.new_news_content div p {
	width: 70px;
	margin: 0;
	text-align: right;
}
.new_news_content div input, .new_news_content div div {
	width: 130px;
	height: 25px;
	margin-left: 20px;
}
</style>
</head>
<div class="container">
	<%@ include file="/views/adminMainHeader.jsp" %> <!-- 헤더 메뉴 -->
	
	<main>
	<div class="main_container">
		<%@ include file="/views/information/infoSide.jsp" %> <!-- 사이드 메뉴 -->
		<div class="right_container">
		<div class="right_main">
			<div class="news_title">
				부대시설
			</div>
	<div class="news_searchbox">
		<form id="search_form" action="#" method="post">
			<div class="form_shortbox">
				<div class="form_items">##</div>
				<input type="text" name="id" class="form_shorttext">
			</div>
			<div class="form_shortbox">
				<div class="form_items">##</div>
				<input type="text" name="name" class="form_shorttext">
			</div>
			<div class="buttonbox">
				<input type="button" value="조회" onclick="news_search();">
				<input type="button" value="전체조회" onclick="news_search();">
				<input type="reset" value="초기화">
			</div>
		</form>
		<div class="new_news">
			<input type="button" value="##" onclick="new_news('new');" class="new_news_button">
		</div>
	</div>
	<div class="news_list">
		<table class="list_table">
			<thead>
				<tr>
					<th>##</th>
					<th>##</th>
					<th>##</th>
					<th>##</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach begin="1" end="10" var="num">
				<tr>
					<td>${num }</td>
					<td><a href="javascript:news_detail('20210124')" class="news_number">##</a></td>
					<td>##</td>
					<td>##</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 예약 상세 내역 (hidden) -->
	<div class="news_outer" id="news_info_o">
		<div class="news_inner" id="news_info_i">
			<div class="news_infobox">
				<div class="infobox_title">
				</div>
				<div class="infobox_content">
					<div>
						<p>##</p>
						<div>1</div>
					</div>
					<div>
						<p>##</p>
						<div>##</div>
					</div>
					<div>
						<p>##</p>
						<div>##</div>
					</div>
					<div>
						<p>##</p>
						<div>##</div>
					</div>
				</div>
				<div class="infobox_buttonbox">
					<input type="button" value="수정" onclick="new_news('update');">
					<input type="button" value="삭제">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 예약 등록 팝업 -->
	<div class="news_outer" id="new_news_o">
		<div class="news_inner" id="new_news_i">
			<div class="news_infobox">
				<div class="infobox_title">
				</div>
				<form class="new_news_content" action="#" method="post">
					<div>
						<p>뉴스번호</p>
						<input type="text" name="newsid">
					</div>
					<div>
						<p>제목</p>
						<input type="text" name="grade">
					</div>
					<div>
						<p>작성일</p>
						<input type="text" name="limit">
					</div>
					<div>
						<p>조회수</p>
						<input type="text" name="news_info">
					</div>
				</form>
				<div class="infobox_buttonbox">
					<input type="button" value="등록">
					<input type="button" value="초기화">
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</div>
</main>
		
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>

</body>
</html>