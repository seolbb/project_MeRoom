<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 데이트 피커 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="views/management/mgmtInfo/onedayclass/css/datePicker.css">
<script>
$(function(){
	var arr = [];
	<c:forEach items="${orList}" var="item">
		arr.push('${item.orDate}');
	</c:forEach>
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
	$('#datepicker').datepicker({ 
		dateFormat: "yy/mm/dd",
		regional: "ko",
		beforeShowDay: available
// 		onSelect: function(dateText, inst) {
// 			var date = $(this).val();
// 			$.ajax({
// 				data: { "orDate" : date},
// 				type: "post",
// 				datatype: "json",
// 				url: "/mr/getDayList.do",
// 				success: function(data) {
// 					console.log(data);
// 					$.each(data, function(index, item) { // 데이터 =item
// 						console.log(item.oName);
// 					});
// 					$.each(data, function(i, elt) {
// 						console.log(elt.oIdx);
// 					})
// 					let html = "";
// 					html += "<c:if test='${not empty data }'>"
// 					html += "<c:forEach var='dayList' items='${data }'>"
// 					html += "<tr>"
// 					html += "<td><a href='javascript:go_detail('${dayList.oName }', '${dayList.orDate }')' class='odc_number'>${dayList.oName }</a></td>"
// 					html += "<td>${dayList.orDate }</td>"
// 					html +=	"</tr>"
// 					html += "</c:forEach>"
// 					html += "</c:if>"
// 					html += "<c:if test='${empty data }'>"
// 					html +=	"<tr>"
// 					html += "<td colspan='2'>입력된 데이터가 존재하지 않습니다.</td>"
// 					html += "</tr>"
// 					html += "</c:if>"
// 					$(".list_table tbody").html(html);
// 				},
// 				error : function(request,status,error) {
// 					console.log("실패");
// 					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 				},
				
// 			})
// 		}
	});
});

function odc_search(type) {
	if (type == 'condition') {
		$("#search_form").submit();
	}
	if (type == 'all') {
		$("input[name=mName]").val("");
		$("input[name=orDate]").val("");
		$("input[name=oName]").val("");
		$("#search_form").submit();
	}
}

function new_odc(type) {
	//summernote 세팅
	if (type == 'new') { /* 신규등록 진행 */location.href="/mr/views/management/mgmtInfo/onedayclass/odcRsvInsert.jsp" }
	if (type == 'back') { /* 목록으로 돌아가기 */location.href="/mr/getRsvList.do" }
	if (type == 'update') { /* 정보 수정 진행 */location.href="/mr/views/management/mgmtInfo/onedayclass/odcRsvUpdate.jsp" }
	if (type == 'delete') {
// 		if (confirm("클래스 정보를 삭제하시겠습니까?")) {
// 			var form = document.createElement("form");
// 			var objs;
// 			objs = document.createElement('input');
// 			objs.setAttribute('type', 'text');
// 			objs.setAttribute('name', 'oIdx');
// 			objs.setAttribute('value', ${oneday.oIdx});
// 			form.appendChild(objs);
// 			form.setAttribute('method', 'post');
// 			form.setAttribute('action', '/mr/deleteClass.do');
// 			document.body.appendChild(form);
// 			form.submit();
// 		}
	}
}

function go_detail(param1, param2) {
	$.ajax({
		data : {'oName' : param1, 'orDate' : param2},
		type : "POST",
		dataType : "json",
		url : "/mr/getRsv.do",
		success : function(data) {
			console.log("print data : " + JSON.stringify(data));
			let html = "";
			html += "<div class='class_basic'><p>클래스명</p><div>[" + data[0].oCategory + "]" + data[0].oName + "</div></div>";
			html += "<div class='class_basic'><p>수강일</p><div>" + data[0].orDate + "</div></div>";
			html += "<div class='class_basic'><p>위치/시간</p><div>" + data[0].oLocation + "/" + data[0].orTime + "</div></div>";
			html += "<div class='class_basic'><p>수강비용</p><div>" + data[0].oPrice + "</div></div>";
			html += "<div class='class_basic'><p>최대인원</p><div>" + data[0].orCount + "</div></div>";
			html += "<div class='class_basic'><p>썸네일이미지</p><div>" + data[0].oImg + "</div></div>";
			$(".left_box").html(html);
			
			html = "<ul>";
			$.each(data, function(index, element) {
				html += "<li>" + element.mName + " /     " + element.orCount + "인</li>"; 
			});
			html += "</ul>";
			$(".right_box").html(html);
			
			html = "<div class=" + 'class_info' + "><p>추가정보</p><div>" + data[0].oInfo + "</div></div>";
			$(".big_box").html(html);
			
			$(".main_box").hide();
			$("#odc_info_i").show();
		},
		error : function(request,status,error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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

#underLine {
	position: absolute;
	right: 0px;
	top: 27px;
	width: 805px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}

.right_menu>a {
	font-size: 16px;
	font-weight: 300;
	color: lightgray;
	margin-left: 10px;
}

#right_list>a {
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
	font-size: 20px;
	font-weight: 300;
}

.odc_searchbox {
	width: 900px;
	display: flex;
	border-width: 0 0 3px 0;
	border-style: none none double none;
	border-color: white white lightgray white;
}

#search_form {
	width: 750px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	padding: 10px;
}

.new_odc {
	width: 150px;
	height: 100px;
}

.new_odc input {
	width: 75px;
	text-align: center;
	font-size: 14px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid gray;
	box-shadow: 1px 1px 1px gray;
	margin: 60px 0 0 50px;
}

.new_odc input:active {
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
	align-content: center;
	margin: 10px 10px 0 10px;
}
.form_shorttext {
	width: 150px;
	height: 25px;
	border-radius: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px gray;
}

.buttonbox {
	width: 230px;
	height: 30px;
	margin: 10px 10px 0 50px;
}

.buttonbox input {
	width: 75px;
	height: 25px;
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
	height: 385px;
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
	width: 600px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.right_box {
	width: 300px;
	border: 1px solid lightgray;
	border-top: 0;
}
.class_basic {
	height: 50px;
	line-height: 50px;
	display: flex;
	border-bottom: 1px solid lightgray;
}
.class_basic:first-child {
	width: 350px;
}
.class_basic:nth-child(2) {
	width: 250px;
}
.class_basic:nth-child(3) {
	width: 260px;
}
.class_basic:nth-child(4) {
	width: 170px;
}
.class_basic:nth-child(5) {
	width: 170px;
}
.class_basic:last-child {
	width: 600px;
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
.new_odc_content {
	width: 570px;
	height: 230px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}

.new_odc_content>div {
	width: 230px;
	height: 30px;
	margin-top: 20px;
	display: flex;
}

.new_odc_content div p {
	width: 70px;
	margin: 0;
	text-align: right;
}

.new_odc_content div input, .new_odc_content div div {
	width: 130px;
	height: 25px;
	margin-left: 20px;
}
</style>
</head>
<div class="container">
	<%@ include file="/views/adminMainHeader.jsp"%>
	<!-- 헤더 메뉴 -->

	<main>
	<div class="main_container">
		<!-- 사이드 메뉴 -->
		<%@ include file="/views/management/mgmtSide.jsp"%>
		<div class="right_container">
			<div class="right_main">
				<div class="main_box">
					<div class="odc_title">원데이 클래스</div>
					<%@ include
						file="/views/management/mgmtInfo/onedayclass/odcHeader.jsp"%>
					<div class="odc_searchbox">
						<form id="search_form" action="/mr/getRsvList.do" method="post">
							<div class="form_shortbox">
								<div class="form_items">예약자명</div>
								<input type="text" name="mName" class="form_shorttext">
							</div>
							<div class="form_shortbox">
								<div class="form_items">수강일</div>
								<input type="date" name="orDate" class="form_shorttext">
							</div>
							<div class="form_shortbox">
								<div class="form_items">클래스명</div>
								<input type="text" name="oName" class="form_shorttext">
							</div>
							<div class="buttonbox">
								<input type="button" value="조회" onclick="odc_search('condition');">
								<input type="button" value="전체조회" onclick="odc_search('all');">
							</div>
						</form>
						<div class="calendar">
							<div id="datepicker"></div>
						</div>
					</div>
					<div class="odc_list">
						<table class="list_table">
							<thead>
								<tr>
									<th>클래스명</th>
									<th>수강일</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${not empty orList }">
								<c:forEach var="rsvList" items="${orList }">
									<tr>
										<td><a href="javascript:go_detail('${rsvList.oName }', '${rsvList.orDate }')"
											class="odc_number">${rsvList.oName }</a></td>
										<td>${rsvList.orDate }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty orList }">
								<tr>
									<td colspan="5">입력된 데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
					<!-- <div class="new_odc">
						<input type="button" value="예약등록" class="new_odc_button" onclick="new_odc('new');">
					</div> -->
				</div>
				<!-- 예약 상세 내역 (hidden) -->
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
	</div>
	</main>
	<%@ include file="/views/adminMainFooter.jsp"%>
	<!-- 풋터 메뉴 -->
</div>

</body>
</html>