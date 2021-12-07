<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(function () {
})

function search_all() {
	$("select option[text='전체선택']").attr('selected', true);
	$("#search_form").submit();
}

/* 버튼 판독 후 해당 페이지/컨트롤러 호출 */
var process = "";
function new_odc(type) {
	if (type == 'answer') { /* 답변등록하기 (/mr/insertAnswer.do)*/
		if(!$("textarea[name=aContent]").val()) {
			alert("답변 작성 후 등록 버튼을 눌러주세요");
			return false;
		}
		if($("textarea[name=aContent]").val()) {
			alert("답변을 등록합니다." + $("textarea[name=aContent]").val());
			$("form[name=answer]").submit();
		}
	}
	if (type == 'answerUpdate') {alert("answerUpdate 실행");}
	if (type == 'back') { /* 목록으로 돌아가기 */
		$(".answer_hidden").hide();
		$("#odc_info_i").hide();
	}
	if (type == 'update') { /* 정보 수정 진행 */location.href="/mr/views/management/mgmtInfo/QnA/QnAUpdate.jsp" }
	if (type == 'delete') {
		if (confirm("회원이 남긴 문의가 삭제됩니다. 삭제를 진행하시겠습니까?")) {
			var form = document.createElement("form");
			var objs;
			objs = document.createElement('input');
			objs.setAttribute('type', 'text');
			objs.setAttribute('name', 'fIdx');
			objs.setAttribute('value', ${question.qIdx});
			form.appendChild(objs);
			form.setAttribute('method', 'post');
			form.setAttribute('action', '/mr/deleteQuestion.do');
			document.body.appendChild(form);
			form.submit();
		}
	}
}
/* 자주 묻는 질문 이름 클릭시 상세 정보 출력 ajax **********************************************************/
function go_detail(type) {
	$.ajax({
		data : { qIdx : type },
		type : "POST",
		dataType : "json",
		url : "/mr/getQuestion.do",
		success : function(data) {
			$(".answer_hidden").hide();
			console.log("print data : " + JSON.stringify(data));
			if (data.aContent == null) {
				let html = "";
				html += "<div class=" + 'class_basic' + "><p></p><div>" + data.qTitle + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>작성일</p><div>" + data.qRegdate + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>작성자</p><div>" + data.memberid + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>연락처</p><div>" + data.phone + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>이메일</p><div>" + data.email + "</div></div>";
				html += "<div class=" + 'class_info' + "><div>" + data.qContent + "</div></div>";
				$("input[name=button_trans]").val("답변등록");
				$("input[name=button_trans]").attr("onclick", "new_odc('answer')");
				$("#infobox_print").html(html);
				$("#odc_info_i").show();
			}
			if (data.aContent != null) {
				let html = "";
				html += "<div class=" + 'class_basic' + "><p></p><div>" + data.qTitle + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>작성일</p><div>" + data.qRegdate + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>작성자</p><div>" + data.memberid + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>연락처</p><div>" + data.phone + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>이메일</p><div>" + data.email + "</div></div>";
				html += "<div class=" + 'class_info' + "><div>" + data.qContent + "</div></div>";
				$("#infobox_print").html(html);
				$("#odc_info_i").show();
				$(".answer_hidden").html("<div class=" + 'answer_text' + "><div>" + data.aContent + "</div></div>")
				$("input[name=button_trans]").val("답변수정");
				$("input[name=button_trans]").attr("onclick", "new_odc('answerUpdate')");
				$(".answer_hidden").show();
			}
			history.pushState(null, null, location.href);
			window.onpopstate = function(event) {
				$(".answer_hidden").hide();
				$("#odc_info_i").hide();
			}
			
			
		},
		error : function() {
			alert("실패~~");
		}
	});
}

/* 문의 작성자 아이디 클릭시 해당 유저의 정보로 이동 */
function go_member(memberid) {
	alert("멤버 정보로 이동");
}
</script>
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

.right_container {
	padding: 15px 40px;
	width: 980px;
	height: 600px;
}
/* 내용 부분 중간 */
/* 내용 부분 메인 */
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
	width: 900px;
	height: 100px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	padding: 10px;
	margin: 0;
}
#search_form > div {
	margin-top: 20px;
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
	width: 160px;
	height: 30px;
	display: flex;
	margin: 0 10px 15px 10px;
}
.form_shorttext {
	width: 160px;
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
	border-spacing: 0;
}
th, td {
	text-align: center;
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
.odc_inner {
	display: none;
	width: 900px;
	height: 570px;
	background-color: white;
	position: absolute;
	top: 0px;
	left: 0px;
}
.odc_infobox {
	width: 900px;
	height: 570px;
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
	min-height: 200px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}

.class_basic {
	width: 250px;
	height: 35px;
	margin-top: 15px;
	display: flex;
	border-bottom: 1px solid lightgray;
}

.class_basic > p, .class_info > p {
	width: 70px;
	margin: 0;
	text-align: right;
}

.class_basic div {
	margin-left: 20px;
}
.class_basic:first-child {
	width: 600px;
}
.class_basic:nth-child(2) {
	width: 300px;
}
.class_basic:nth-child(3) {
	width: 350px;
}
.class_basic:nth-child(5) {
	width: 300px;
}
.class_info {
	width: 900px;
	margin-top: 40px;
	padding-bottom: 40px;
	border-bottom: 1px solid lightgray;
}
.class_info > div {
	width: 800px;
	margin-left: 40px;
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
	padding-top: 20px;
	border-top: 2px solid lightgray;
}

.infobox_buttonbox>input {
	width: 80px;
	height: 35px;
	text-align: center;
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
/* 개인 문의 답변 출력/입력 */
.answerbox {
	position: relative;
	width: 900px;
	min-height: 160px;
}
.answer_hidden {
	position: absolute;
	width: 900px;
	min-height: 160px;
	background-color: white;
}
.answer_text {
	width: 900px;
	margin-top: 40px;
	padding-bottom: 40px;
}
.answer_text > div {
	width: 800px;
	margin-left: 40px;
}
form[name=answer] {
	position: absolute;
	width: 900px;
	min-height: 160px;
	margin-bottom: 0;
}
form[name=answer] > textarea {
	width: 800px;
	margin-left: 50px;
	margin-top: 20px;
	min-height: 120px;
}
</style>
</head>
<div class="container">
	<%@ include file="/views/adminMainHeader.jsp" %> <!-- 헤더 메뉴 -->
	
	<main>
	<div class="main_container">
		<%@ include file="/views/management/mgmtSide.jsp" %> <!-- 사이드 메뉴 -->
		<div class="right_container">
<div class="right_main">
	<div class="news_title">
		QnA
	</div>
	<div class="news_searchbox">
		<form id="search_form" action="/mr/getQuestionList.do" method="post">
			<div class="form_selectbox">
				<select name="anyTyp">
					<option value="">전체선택</option>
					<option value="room">객실정보</option>
					<option value="reservation">예약문의</option>
					<option value="oneday">원데이클래스</option>
					<option value="place">주변정보</option>
					<option value="other">기타문의</option>
				</select>
			</div>
			<div class="form_shortbox">
				<input type="text" name="qTitle" class="form_shorttext" placeholder="제목을 입력하세요">
			</div>
			<div class="form_shortbox">
				<input type="text" name="qContent" class="form_shorttext" placeholder="내용을 입력하세요">
			</div>
			<div class="buttonbox">
				<input type="submit" value="조회">
				<input type="reset" value="전체조회" onclick="search_all();">
			</div>
		</form>
	</div>
	<div class="news_list">
		<table class="list_table">
		<colgroup>
			<col style="width:5%">
			<col style="width:15%">
			<col style="width:40%">
			<col style="width:15%">
			<col style="width:15%">
		</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변유무</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty questionList}">
				<c:forEach var="question" items="${questionList }">
				<tr>
					<td>${question.qIdx}</td>
					<td>${question.anyTyp }</td>
					<td><a href="javascript:go_detail(${question.qIdx })">${question.qTitle}</a></td>
					<td><a href="javascript:go_member('${question.memberid}')">${question.memberid}</a></td>
					<td>${question.qRegdate}</td>
					<td>${question.qYn}</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${	empty questionList}">
				<tr>
					<td colspan="6">입력된 데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
	<!-- 문의 상세 내역 (hidden) -->
	<div class="odc_inner" id="odc_info_i">
		<div class="odc_infobox">
			<div class="infobox_title" id="infobox_title_print">
				1:1 문의 
			</div>
			<div class="infobox_content" id="infobox_print">
				<!-- 고객문의 상세 정보 표시 구간 (ajax 처리) -->
			</div>
			<div class="answerbox">
				<!-- 고객 문의에 대한 관리자 답변 summernote -->
				<form action="/mr/insertAnswer.do" name="answer" method="post">
					<input type="hidden" name="qIdx2" value="${question.qIdx }">
					<textarea name="aContent" style="resize: none; overflow: auto;"></textarea>
				</form>
				<!-- 답변이 존재하는 경우 textarea 자리에  div로 답변 내용 출력 -->
				<div class="answer_hidden" style="display: 'hidden';">
					
				</div>
			</div>
			<div class="infobox_buttonbox">
				<input type="button" value="답변등록" onclick="new_odc('answer')" name="button_trans">
				<input type="button" value="삭제" onclick="new_odc('delete')">
				<input type="button" value="목록" onclick="new_odc('back');">
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