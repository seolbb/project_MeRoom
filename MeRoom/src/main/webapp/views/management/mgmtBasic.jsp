<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(document).ready(function() {
	$("#summernote").summernote( {disableResizeEditor: true, height : 100, toolbar : [['insert',['picture', 'link', 'video']]]});
});

//게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile.do",    //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			alert("성공");
			console.log("data : " + data.url);
			$(editor).summernote('insertImage', data.url);
		},
		fail : function() {
			alert("실패");
		}
	});
}
	
	
</script>
<style>
.right_main {
	width: 900px;
	height: 570px;
	position: relative;
}
/* .right_main * {
	border: 1px dotted red;
} */
.basic_main {
	width: 900px;
	height: 570px;
	display: flex;
}
/* 전체 공통 */
.basic_left > div:nth-child(n+2):nth-child(-n+3),
.left_box3 > div,
.right_box1 {
	border-width: 0 0 0 0;
	border-style: none solid solid none;
	border-color: white gray gray white;
	box-shadow: 1px 1px 3px lightgray;
	background-color: #f7f7f7;
	border-radius: 3px;
}
.title {
	display: flex;
	justify-content: space-around;
	border-bottom: 1px solid gray;
	margin-bottom: 5px;
}
.title a {
	
}
.link {
	margin-left: 15px;
	font-size: 14px;
}
.link:hover {
	text-decoration: underline;
}
.link a {
	color: #3366BB;
}
/* 왼쪽 박스 */
.basic_left {
	width: 600px;
	height: 570px;
}
.basic_left > div:nth-child(n+2) {
	margin: 30px 30px 0 10px;
}

.left_title {
	width: 560px;
	height: 50px;
	line-height: 50px;
	font-size: 18px;
	font-weight: 500;
	margin: 10px 30px 10px 10px;
	border-bottom: 2px solid gray;
}
.left_box1, .left_box2 {
	width: 560px;
	height: 120px;
	display: flex;
}
.count_box {
	height: 80px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}
.count_box > div {
	height: 25px;
	text-align: right;
	font-size: 14px;
}
.count_box > div:nth-child(odd) {
	width: 90px;
}
.count_box > div:last-child {
	margin-left: 60px;
}
.count_box > div:last-child > a {
	color: #3366BB;
}
.count_box > div:last-child > a:hover {
	text-decoration: underline;	
}
.left_box3 {
	width: 560px;
	height: 160px;
	display: flex;
}
.box3_left {
	width: 275px;
	height: 160px;
}
.box3_left > div {
	width: 215px;
	height: 150px;
	margin: 10px 30px 0 30px; 
	text-align: center;
}
.box3_right {
	width: 275px;
	height: 160px;
	margin-left: 10px;
}
/* 왼쪽 박스 내용 */
.left_box1 > div, .left_box2 > div {
	width: 150px;
	margin: 10px 0 10px 30px;
}
/* 오른쪽 박스 */
.basic_right {
	width: 300px;
	height: 570px;
}
.basic_right > div:nth-child(2) {
	margin: 30px 10px 10px 10px;
}
.right_title {
	width: 280px;
	height: 50px;
	line-height: 50px;
	font-size: 18px;
	font-weight: 500;
	border-bottom: 2px solid gray;
	margin: 10px;
}
.right_box1 {
	width: 280px;
	height: 460px;
}
.print_box {
	width: 280px;
	height: 300px;
}
.summernote_box {
	width: 280px;
	height: 160px;
	
	
}
</style>
</head>
<div class="right_main">
	<div class="basic_main">
		<div class="basic_left">
			<div class="left_title">
				영업 기초 정보
			</div>
			<div class="left_box1">
				<div class="link_box">
					<div class="title">신규 문의<a href="/mr/getQuestionList.do">2건</a></div> <!-- 1:1문의 전체 목록으로 이동 (최신문의 순으로 출력) -->
					<div class="link"><a href="/mr/getQnA.do">예약 후 취소 관련 </a></div> <!-- 해당하는 1:1문의글의 상세 정보 화면으로 이동 -->
					<div class="link"><a href="/mr/getQnA.do">부대 시설 관련 문의</a></div>
					<div class="link"><a href="/mr/getQnA.do">원데이 클래스 관련</a></div>
				</div>
				<div class="link_box">
					<div class="title">미응답 문의<a href="/mr/getQuestionList.do">1건</a></div> <!-- 1:1문의 전체 목록으로 이동 (미응답 문의 / 최신순으로 출력) -->
					<div class="link"><a href="/mr/getQnA.do">예약 후 취소 관련 </a></div> <!-- 해당하는 미응답 1:1 문의글의 상세 정보 화면으로 이동 -->
					<div class="link"><a href="/mr/getQnA.do">부대 시설 관련 문의</a></div>
					<div class="link"><a href="/mr/getQnA.do">원데이 클래스 관련</a></div>
				</div>
				<div class="count_box">
					<div>주간문의건수</div><div>##건</div>
					<div>응답완료</div><div>##건</div>
					<div>미응답문의</div><div>##건</div>
					<div><a href="/mr/getQuestionList.do">상세보기 </a></div> <!-- 1:1문의 전체 목록으로 이동 (최신문의 순으로 출력) -->
				</div>
			</div>
			<div class="left_box2">
				<div class="link_box">
					<div class="title">신규 예약<a href="/mr/getResvList.do">2건</a></div> <!-- 객실예약 전체 목록으로 이동 (최신예약 순으로 출력) -->
					<div class="link"><a href="/mr/getResv.do">21/12/25 - 401호</a></div> <!-- 해당 예약 건 상세 정보로 이동 -->
					<div class="link"><a href="/mr/getResv.do">21/12/25 - 402호</a></div>
					<div class="link"><a href="/mr/getResv.do">21/12/25 - 403호</a></div>
				</div>
				<div class="count_box">
					<div>금일예약확정</div><div>##건</div>
					<div>입실 완료</div><div>##건</div>
					<div>입실 예정</div><div>##건</div>
					<div></div>
				</div>
				<div class="count_box">
					<div>주간예약확정</div><div>##건</div>
					<div>방문예정</div><div>##건</div>
					<div>방문완료</div><div>##건</div>
					<div><a href="/mr/getResvlist.do">상세보기 ></a></div> <!-- 객실예약 전체 목록으로 이동 (최신예약 순으로 출력) -->
				</div>
			</div>
			<div class="left_box3">
				<div class="box3_left">
					<div class="link_box">
					<div class="title">금일 진행예정 클래스<a href="/mr/getClassList.do">2건</a></div> <!-- 원데이 클래스 예약 목록으로 이동 -->
					<div class="link"><a href="/mr/getOdcResv.do">요가 클래스 / 11시 / 11인</a></div> <!-- 금일 진행 예정인 클래스 상세 정보로 이동 -->
					<div class="link"><a href="/mr/getOdcResv.do">야간 하이킹 / 18시 / 7인</a></div>
				</div>
				</div>
				<div class="box3_right">
				
				</div>
			</div>
		</div>
		<div class="basic_right">
			<div class="right_title">
				특이사항
			</div>
			<div class="right_box1">
				<div class="print_box">
				
				</div>
				<div class="summernote_box">
					<textarea id="summernote">
					
					</textarea>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>