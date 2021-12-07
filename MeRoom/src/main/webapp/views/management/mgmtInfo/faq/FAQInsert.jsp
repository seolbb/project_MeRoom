<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
$(function(){
	$('#summernote').summernote({
		height: 230,
		lang: "ko-KR",
		disableResizeEditor: true, 
		callbacks: {
			onImageUpload: function(files,editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					uploadImages(files[i], this);
				}
			}
		}
	});
});

//게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다
function uploadImages(file, editor) {
	var data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/mr/uploadSummernoteImageFile.do",    //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log("image.url : " + data.url);
			$(editor).summernote('insertImage', data.url);
		},
		error: function() {
			alert("imageLoad fail")
		}
	});
}
function back() {
	location.href="/mr/getFAListAdmin.do"
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
.right_main {
	width: 900px;
	height: 570px;
}
/* .insert_box {
	border: 1px dotted red;
}
.insert_box * {
	border: 1px dotted red;
} */
/* .insert_box div:not(.big_box *) {
	border: 1px dotted red;
} */
.insert_title {
	width: 900px;
	height: 50px;
	line-height: 50px;
	border-bottom: 2px solid lightgray;
	font-size: 20px;
}
.insert_content {
	width: 900px;
	height: 520px;
	padding: 20px 20px 0 20px;
}
.content_form {
	width: 860px;
	height: 490px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-content: flex-start;
}
.small_box {
	width: 400px;
	height: 55px;
	margin: 0 30px 10px 0;
}
.small_box > input {
	width: 380px;
	border: 1px solid lightgray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
.small_box > div {
	margin-bottom: 5px;
}
.big_box {
	width: 860px;
	height: 320px;
}
.big_box > div:first-child {
	margin-bottom: 5px;
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
					자주묻는질문 등록
				</div>
				<div class="insert_content">
					<form action="/mr/insertFA.do" id="form1" class="content_form" method="post" name="insert">
						<div class="small_box">
							<div>질문</div>
							<input type="text" name="fTitle" class="data" >
						</div>
						<div class="big_box">
							<div>답변</div>
							<textarea id="summernote" name="fContent" class="data" style="display: none;" ></textarea>
						</div>
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
</html>