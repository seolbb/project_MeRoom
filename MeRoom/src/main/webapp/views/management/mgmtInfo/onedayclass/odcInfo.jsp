<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 데이트 피커 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="views/management/mgmtInfo/onedayclass/css/datePicker.css">
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
		url : "uploadSummernoteImageFile.do", //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			location.href=data.url;
			$(editor).summernote('insertImage', data.url);
		}
	});
}

/* 원데이 클래스 등록 / 수정 버튼 판단하여 해당 팝업 표시 *********************************************/
var process = "";
function new_odc(type) {
	//summernote 세팅
	if (type == 'new') { /* 신규등록 진행 */location.href="/mr/views/management/mgmtInfo/onedayclass/odcInsert.jsp" }
	if (type == 'back') { /* 목록으로 돌아가기 */location.href="/mr/getClassList.do" }
	if (type == 'update') { /* 정보 수정 진행 */location.href="/mr/views/management/mgmtInfo/onedayclass/odcUpdate.jsp" }
	if (type == 'delete') {
		if (confirm("클래스 정보를 삭제하시겠습니까?")) {
			var form = document.createElement("form");
			var objs;
			objs = document.createElement('input');
			objs.setAttribute('type', 'text');
			objs.setAttribute('name', 'oIdx');
			objs.setAttribute('value', ${oneday.oIdx});
			form.appendChild(objs);
			form.setAttribute('method', 'post');
			form.setAttribute('action', '/mr/deleteClass.do');
			document.body.appendChild(form);
			form.submit();
		}
	}
}

	/* 원데이 클래스 이름 클릭시 상세 정보 출력 ajax **********************************************************/
function go_detail(type) {
	$.ajax({
		data : { oIdx : type },
		type : "POST",
		dataType : "json",
		url : "/mr/getClass.do",
		success : function(data) {
			console.log("print data : " + JSON.stringify(data));
			let html = "";
			html += "<div class='class_basic'><p>클래스명</p><div>[" + data.oCategory + "] " + data.oName + "</div></div>";
			html += "<div class='class_basic'><p>위치/시간</p><div>" + data.oLocation + " / " + data.oTime + "</div></div>";
			html += "<div class='class_basic'><p>수강비용</p><div>" + data.oPrice + "</div></div>";
			html += "<div class='class_basic'><p>최대인원</p><div>" + data.oCnt + "</div></div>";
			html += "<div class='class_basic'><p>썸네일이미지</p><div>" + data.oImg + "</div></div>";
			$(".left_box").html(html);
		
			html = "<div class=" + 'class_info' + "><p>추가정보</p><div>" + data.oInfo + "</div></div>";
			$(".big_box").html(html);
			
			$(".main_box").hide();
			$("#odc_info_i").show();
		},
		error : function() {
			alert("실패~~");
		},
	});
	$('#datepicker').datepicker({ 
		dateFormat: "yy/mm/dd",
		regional: "ko",
		beforeShowDay: available
	});
}
var oDate = "${oneday.oDate}";
var arr = oDate.split(",");
var availableDates = arr;
function available(date) {
	var thismonth = date.getMonth()+1;
	var thisday = date.getDate();
	if(thismonth<10){
		thismonth = "0"+thismonth;
	}
	if(thisday<10){
		thisday = "0"+thisday;
	}
	ymd = date.getFullYear() + "/" + thismonth + "/" + thisday;
	if ($.inArray(ymd, availableDates) >= 0) {
   		return [true,"",""];
	} else {
   		return [false,"",""];
	}
};

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
	display: flex;
}

.odc_searchbox input {
	height: 30px;
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

.list_table th, td {
	border-width: 0 0 2px 0;
	border-style: none none solid none;
	border-color: white white lightgray white;
	min-height: 30px;
	line-height: 30px;
	text-align: center;
}

.list_table th {
	font-size: 17px;
	font-weight: 500;
}

.list_table td {
	font-size: 14px;
}

.odc_number:hover {
	text-decoration: underline;
}
/* 예약 상세 내역 팝업 창 (hidden) */
.odc_inner {
	display: none;
	width: 900px;
	min-height: 570px;
	background-color: white;
}
/* .odc_inner * {
	border: 1px dotted red;
} */
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
	width: 645px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.class_basic {
	height: 50px;
	line-height: 50px;
	display: flex;
	border-bottom: 1px solid lightgray;
}
.class_basic:first-child {
	width: 640px;
}
.class_basic:nth-child(2) {
	width: 280px;
}
.class_basic:nth-child(3) {
	width: 180px;
}
.class_basic:nth-child(4) {
	width: 180px;
}
.class_basic:last-child {
	width: 640px;
	height: 100px;
}
.infobox_content div p {
	width: 90px;
	margin: 0;
	text-align: right;
}

.class_basic div {
	margin-left: 20px;
}

.class_info {
	width: 870px;
	min-height: 100px;
	margin-top: 20px;
}
.class_info > div {
	margin: 20px 0 20px 30px;
}
.class_info > div p {
	text-align: left;
	width: 750px;
}
.class_info > div img {
	max-width: 750px;
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
		<%@ include file="/views/management/mgmtSide.jsp"%>
		<div class="right_container">
			<div class="right_main">
				<div class="main_box">
					<div class="odc_title">
						<div class="title_text">원데이 클래스</div>
					</div>
					<%@ include
						file="/views/management/mgmtInfo/onedayclass/odcHeader.jsp"%>
	
					<!-------- 원데이 클래스 전체 목록 출력 시작 ---------------------------------------------------------->
					<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
					<!-- 전체 목록 테이블 -->
					<div class="odc_list">
						<table class="list_table">
							<colgroup>
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:50%">
								<col style="width:20%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>카테고리</th>
									<th>강좌명</th>
									<th>장소</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty classList}">
								<c:forEach var="oneday" items="${classList }">
								<tr>
									<td>${oneday.oIdx}</td>
									<td>${oneday.oCategory}</td>
									<td><a href='javascript:go_detail("${oneday.oIdx}")'>${oneday.oName}</a></td>
									<td>${oneday.oLocation}</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${	empty classList}">
								<tr>
									<td colspan="5">입력된 데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
					<!-- 페이징 및 등록 버튼 -->
					<div class="odc_searchbox">
						<input type="button" value="클래스등록" onclick="new_odc('new');"
							class="new_odc_button">
						<!-- 등록 버튼 -->
					</div>
				</div>
				<!-- 원데이 클래스 전체목록 출력 끝 ================================================================ -->

				<!-- 예약 상세 내역 (hidden 처리됨 / function을 통한 show처리) ======================================= -->
				<div class="odc_inner" id="odc_info_i">
					<div class="odc_infobox">
						<div class="infobox_title" id="infobox_title_print">
							원데이클래스상세 정보
						</div>
						<div class="infobox_content" id="infobox_print">
							<!-- 예약내역 상세 정보 표시 구간 (ajax 처리) -->
							<div class='left_box'>
								<!-- 왼쪽 정보 출력 -->
							</div>
							<div class='right_box'>
								<div id="datepicker"></div>
								<!-- 수강날짜 출력 -->
							</div>
							<div class="big_box">
								<!-- 상세정보 출력 -->
							</div>
						</div>
						<div class="infobox_buttonbox">
							<input type="button" value="수정" onclick="new_odc('update');">
							<input type="button" value="삭제" onclick="new_odc('delete')">
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