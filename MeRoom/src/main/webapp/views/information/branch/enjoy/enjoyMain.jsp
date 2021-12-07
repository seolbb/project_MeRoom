<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
});

/* 게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다 */
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/mr/uploadSummernoteImageFile1.do", //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(editor).summernote('insertImage', data.url);
		}
	});
}

/* 버튼 판독 후 해당 페이지/컨트롤러 호출 */
var process = "";
function new_odc(type) {
	if (type == 'new') { /* 신규등록 진행 */location.href="/mr/views/information/branch/enjoy/enjoyInsert.jsp" }
	if (type == 'back') { /* 목록으로 돌아가기 */location.href="/mr/getEnjoyListAdmin.do" }
	if (type == 'update') { /* 정보 수정 진행 */location.href="/mr/views/information/branch/enjoy/enjoyUpdate.jsp" }
}

function delete_enjoy(idx) {
	if (confirm("해당 시설정보을 삭제하시겠습니까?")) {
		var form = document.createElement("form");
		var objs;
		objs = document.createElement('input');
		objs.setAttribute('type', 'text');
		objs.setAttribute('name', 'eid');
		objs.setAttribute('value', idx);
		form.appendChild(objs);
		form.setAttribute('method', 'post');
		form.setAttribute('action', '/mr/deleteEnjoy.do');
		document.body.appendChild(form);
		form.submit();
	}
}
/* 자주 묻는 질문 이름 클릭시 상세 정보 출력 ajax **********************************************************/
function go_detail(type) {
	$.ajax({
		data : { eid : type },
		type : "POST",
		dataType : "json",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		url : "/mr/getEnjoy.do",
		success : function(data) {
			let html = "";
			html += "<div class='class_basic'><p>카테고리</p><div>" + data.ecategory + "</div></div>";
			html += "<div class='class_basic'><p>부대시설명</p><div>" + data.etitle + "</div></div>";
			html += "<div class='class_basic'><p>한줄소개</p><div>" + data.etext + "</div></div>";
			html += "<div class='class_basic'><p>전화번호</p><div>" + data.ephone + "</div></div>";
			html += "<div class='class_basic'><p>위치</p><div>" + data.elocation + "</div></div>";
			html += "<div class='class_basic'><p>가격</p><div>" + data.eprice + "</div></div>";
			html += "<div class='class_basic'><p>영업시간</p><div>" + data.etime + "</div></div>";
			html += "<div class='class_basic'><p></p><div></div></div>";
			$(".left_box").html(html);
			
			html = "<div class='class_basic'><div><img src='/upload/" + data.efilepath + "'/></div></div>";
			$(".right_box").html(html);
			
			html = "<div class='class_info'><div>" + data.einfo + "</div></div>";
			$(".big_box").html(html);
			
			$("input[name=delete_button]").attr("onclick", "delete_enjoy(" + data.eid + ")");
			
			$(".main_box").hide()
			$(".odc_inner").show();
		},	
		error : function() {
			alert("실패~~");
		}
	});
}

</script>
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

.right_container {
	padding: 15px 40px;
	width: 980px;
	min-height: 600px;
}
.right_header {
	width: 900px;
	height: 35px;
	display: flex;
	position: relative;
}

#underLine1 {
	position: absolute;
	left: 0px;
	top: 27px;
	width: 75px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}

#underLine {
	position: absolute;
	right: 0px;
	top: 27px;
	width: 720px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}

.right_menu>a {
	font-size: 16px;
	font-weight: 300;
	color: lightgray;
	margin-left: 10px;
}

#right_info>a {
	font-size: 22px;
	font-weight: 500;
	color: #015b28;
}
/* 내용 부분 중간 */
/* 내용 부분 메인 */
.right_main {
	width: 900px;
	min-height: 570px;
	position: relative;
}
.main_box {
	width: 900px;
	min-height: 570px;
	position: absolute;
}
/* .right_main * {
	border: 1px dotted red;
} */
.odc_title {
	width: 900px;
	height: 50px;
	line-height: 50px;
}

.title_text {
	width: 900px;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	font-weight: 300;
}

.odc_searchbox {
	width: 900px;
	height: 50px;
	line-height: 50px;
	display: flex;
}

.odc_searchbox input {
	width: 75px;
	height: 25px;
	line-height: 20px;
	text-align : center;
	font-size: 14px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid gray;
	box-shadow: 1px 1px 1px gray;
	text-align: center; font-size : 14px; cursor : pointer; border-radius :
	3px; border : 1px solid gray; box-shadow : 1px 1px 1px gray;
	margin: 10px 0 0 800px;
}

.odc_searchbox input:active {
	box-shadow: 0px 0px 0px white;
}

.form_items {
	width: auto;
	height: 25px;
	font-size: 16px;
	text-align: right;
	margin-right: 5px;
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

.odc_list {
	width: 900px;
	height: 435px;
}

.list_table {
	width: 900px;
	text-align: center;
	border-spacing: 0;
	margin-top: 10px;
}

th, td {
	border-width: 0 0 2px 0;
	border-style: none none solid none;
	border-color: white white lightgray white;
	min-height: 30px;
	line-height: 30px;
	text-align: center;
}

th {
	font-size: 17px;
	font-weight: 500;
}

td {
	font-size: 14px;
}

.odc_number:hover {
	text-decoration: underline;
}
/* 예약 상세 내역 팝업 창 (hidden) */
.odc_inner {
	display: none;
	width: 900px;
	background-color: white;
}
.odc_infobox {
	width: 900px;
	min-height: 570px;
}

.infobox_title {
	width: 900px;
	height: 60px;
	line-height: 50px;
	font-size: 17px;
	font-weight: 600;
	border-bottom: 2px solid lightgray;
}

.infobox_content {
	width: 900px;
	min-height: 440px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.left_box {
	width: 500px;
	display: flex;
	align-content:flex-start;
	flex-wrap: wrap;
}
.right_box {
	width: 399px;
	border-left: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}
.left_box > .class_basic {
	width: 250px;
	height: 40px;
	margin-top: 30px;
	display: flex;
	border-bottom: 1px solid lightgray;
}

.right_box > .class_basic {
	width: 400px;
	height: 200px;
	margin-top: 10px;
	display: flex;
}
.right_box img {
	width: 300px;
	height: 200px;
	margin-left: 30px;
	margin-top: 30px;
}

.class_basic > p, .class_info > p {
	width: 90px;
	margin: 0;
	text-align: right;
}

.class_basic div {
	margin-left: 20px;
}

.class_info {
	width: 900px;
	min-height: 100px;
	margin-top: 50px;
}
.class_info img {
	max-width: 750px;
	margin-left: 75px;
}
.class_info > div > p {
	width: 900px;
}
.class_info_inner {
	margin: 0;
	width: 500px;
	height: 200px;
	margin-left: 40px;
	margin-top: 10px;
}

.infobox_buttonbox {
	width: 900px;
	height: 70px;
	line-height: 70px;
	border-top: 2px solid lightgray;
}

.infobox_buttonbox>input {
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

.infobox_buttonbox>input:hover {
	background-color: #f1f1f1;
}

.infobox_buttonbox>input:active {
	background-color: white;
	border: 1px solid #015b28;
	box-shadow: none;
}
/* 신규 예약 등록 (hidden) */
.content_table {
	width: 770px;
	height: 400px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}

.class_basic input {
	width: 150px;
}
</style>
</head>
<body>
<div class="container">
	<!-- 헤더 메뉴 -->
	<%@ include file="/views/adminMainHeader.jsp"%>
	<main class="main_container">
		<!-- 사이드 메뉴 -->
		<%@ include file="/views/information/infoSide.jsp"%>
		<div class="right_container">
			<div class="right_main">
				<div class="main_box">
					<div class="odc_title">
						<div class="title_text">부대시설</div>
					</div>
					<!-- 전체 목록 테이블 -->
					<div class="odc_list">
						<table class="list_table">
						<colgroup>
							<col width="15%">
							<col width="25%">
						</colgroup>
							<thead>
								<tr>
									<th>시설번호</th>
									<th>카테고리</th>
									<th>시설명</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty enjoyList}">
								<c:forEach var="enjoyOne" items="${enjoyList }">
								<tr>
									<td>${enjoyOne.eid}</td>
									<td>${enjoyOne.ecategory}</td>
									<td><a href="javascript:go_detail(${enjoyOne.eid })">${enjoyOne.etitle}</a></td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty enjoyList}">
								<tr>
									<td colspan="5">입력된 데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
					<!-- 페이징 및 등록 버튼 -->
					<div class="odc_searchbox">
						<input type="button" value="시설등록" onclick="new_odc('new');"
							class="new_odc_button">
						<!-- 등록 버튼 -->
					</div>
				</div>
				<!-- 원데이 클래스 전체목록 출력 끝 ================================================================ -->

				<!-- 예약 상세 내역 (hidden 처리됨 / function을 통한 show처리) ======================================= -->
				<div class="odc_inner" id="odc_info_i">
					<div class="odc_infobox">
						<div class="infobox_title" id="infobox_title_print">
							부대시설
						</div>
						<div class="infobox_content" id="infobox_print">
							<div class="left_box">
							
							</div>
							<div class="right_box">
								
							</div>
							<div class="big_box">
							
							</div>
						</div>
						<div class="infobox_buttonbox">
							<input type="button" value="수정" onclick="new_odc('update');">
							<input type="button" value="삭제" name="delete_button">
							<input type="button" value="목록" onclick="new_odc('back');">
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- 풋터 메뉴 -->
	<%@ include file="/views/adminMainFooter.jsp"%>
</div>
</body>
</html>