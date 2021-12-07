<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- 데이트피커 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script>
$(function(){
	$('#summernote').summernote({
		height: 500,
		lang: "ko-KR",
		disableResizeEditor: true, 
		callbacks: {
			onImageUpload: function(files,editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i], this);
				}
			}
		}
	});
});

/* 파일을 등록 하면 썸네일을 이미지 저장 후 저장된 이미지를 출력하는 메소드 */
function add_file() {
}

//게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/mr/uploadSummernoteImageFile.do",    //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log("data : " + data.url);
			$(editor).summernote('insertImage', data.url);
		}
	});
}
function back() {
	location.href="/mr/getClassList.do"
}

/* 금액 원단위 변환 */
/*  function inputNumberFormat(obj) {
     obj.value = comma(uncomma(obj.value));
 }

 function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

 function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
 } */
</script>
<style>
* {
	font-family: "Noto Sans KR" !important;
	box-sizing: border-box !important;
}
.main_container {
	max-width: 1180px;
	min-height: 700px;
	margin: 0 auto;
	padding: 10px 0 10px 0;
	display: flex;
}
.right_container {
	padding: 15px 40px;
	width: 980px;
	min-height: 600px;
}
.right_main {
	width: 900px;
	min-height: 570px;
}
.insert_title {
	width: 900px;
	height: 50px;
	line-height: 50px;
	border-bottom: 2px solid lightgray;
	font-size: 20px;
}
.insert_content {
	width: 900px;
	min-height: 520px;
	padding: 20px 20px 0 20px;
}
.content_form {
	width: 860px;
	min-height: 490px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-content: flex-start;
}
.left_box, .right_box {
	width: 430px;
	display: flex;
	flex-wrap: wrap;
}
.right_box > div:nth-child(2) {
	padding-top: 50px;
	padding-left: 30px;
	margin: 0;
	width: 215px;
	height: auto;
}
.right_box > div:nth-child(2) > button {
	margin-left: 125px;
}
input[name=oDate] {
	width: 185px;
}
.small_box {
	width: 185px;
	height: 55px;
	margin: 0 30px 20px 0;
}
.small_box > input {
	width: 180px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
#thumbnail {
	width: 190px;
	border: none;
	box-shadow: none;
}
.small_box > select {
	width: 150px;
	height: 26px;
	border: 1px solid lightgray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
.small_box > div {
	margin-bottom: 5px;
}
.big_box {
	width: 860px;
	min-height: 320px;
	border-top: 1px solid lightgray;
	padding-top: 10px;
}
.big_box > div:first-child {
	margin-bottom: 5px;
}
.big_box img {
	max-width: 750px;
	height: auto;
}
.button_box {
	width: 860px;
	height: 50px;
	display: flex;
	border-top: 2px solid lightgray;
}
.button_box > input {
	width: 70px;
	height: 30px;
	margin: 10px 10px 0 10px;
	border: 2px solid #015b28;
	box-shadow: 1px 1px 1px gray;
	border-radius: 3px;
	background-color: white;
}
.button_box > input:last-child {
	margin-left: 580px;
}
.button_box > input:hover {
	background-color: #f1f1f1;
}
.button_box > input:active {
	background-color: white;
	border: 1px solid #015b28;
	box-shadow: none;
}
.ui-helper-hidden-accessible,
.ui-helper-hidden-accessible,
.ui-tooltip-content {
	display:none !important;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>
<div id="container">
	<!-- 헤더 메뉴 -->
	<%@ include file="/views/adminMainHeader.jsp"%>
	<main class="main_container">
		<!-- 사이드 메뉴 -->
		<%@ include file="/views/management/mgmtSide.jsp"%>
		<div class="right_container">
			<div class="right_main">
				<div class="insert_title">
					원데이 클래스 신규 등록
				</div>
				<!-- 정보 입력 영역 -->
				<div class="insert_content">
					<form action="/mr/insertClass.do" id="form1" class="content_form" method="post" name="insert">
						<!-- 왼쪽 상자 -->
						<div class='left_box'>
							<div class="small_box">
							<div>카테고리</div>
								<select name="oCategory">
									<option value="힐링">힐링</option>
									<option value="액티비티">액티비티</option>
									<option value="DIY">DIY</option>
								</select>
							</div>
							<div class="small_box">
								<div>클래스명</div>
								<input type="text" name="oName" class="data" >
							</div>
							<div class="small_box">
								<div>수강시간</div>
								<input type="time" name="oTime" class="data" >
							</div>
							<div class="small_box">
								<div>수강장소</div>
								<input type="text" name="oLocation" class="data" >
							</div>
							<div class="small_box">
								<div>수강비용</div>
								<input type="number" name="oPrice" id="price" class="data">
							</div>
							<div class="small_box">
								<div>최대인원</div>
								<input type="number" name="oCnt" class="data" >
							</div>
							<div class="small_box">
								<div>썸네일이미지</div>
								<input id="thumbnail" type="file" class="data" name="oImg" onchange="add_file();">
							</div>
						</div>
						<!-- 오른쪽 상자 -->
						<div class='right_box'>
							<div class="small_box">
								<div>수강날짜</div>
								<div id="datepicker"></div>
							</div>
							<div class="small_box">
								<p><input type="text" id="my_hidden_input1" name="oDate"></p>
								<p><input type="text" id="my_hidden_input2" name="oDate"></p>
								<p><input type="text" id="my_hidden_input3" name="oDate"></p>
								<p><input type="text" id="my_hidden_input4" name="oDate"></p>
								<p><input type="text" id="my_hidden_input5" name="oDate"></p>
						        <button type="button" onclick="reset_date();">초기화</button>
							</div>
						</div>
						<!-- 썸머노트 상자 -->
						<div class="big_box">
							<div>추가정보</div>
							<textarea id="summernote" name="oInfo" class="data" style="display: none;" ></textarea>
						</div>
						<!-- 버튼상자 -->
						<div class="button_box">
							<input type="submit" value="등록">
							<input type="reset" value="초기화" onclick="$('#summernote').summernote('reset')">
							<input type="button" value="취소" onclick="back();">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- 풋터 메뉴 -->
	<%@ include file="/views/adminMainFooter.jsp"%>
</div>
</body>
<script>
	/* 달력 */
	let i = 0;
	$('#datepicker').on('changeDate', function() {
		++i;
	    $('#my_hidden_input'+i).val(
	        $('#datepicker').datepicker('getFormattedDate')
	        );
	});
	
	/* 달력에 등록된 날짜로 표시 */
	$("#datepicker").datepicker({format: 'yyyy/mm/dd'});
	
	function reset_date() {
		$('input[name=oDate]').val('');
		i = 0;
	}

</script>
</html>