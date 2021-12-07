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

<script>
var sel_files = [];


$(document).ready(function() {
    $("#inputImage").on("change", handleImgFileSelect);
    
}); 

function fileUploadAction() {
    console.log("fileUploadAction");
    $("#inputImage").trigger('click');
}

function handleImgFileSelect(e) {

    // 이미지 정보들을 초기화
    sel_files = [];
    $(".imgs_wrap").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    
    if(files.length > 6){
    	alert("최대 5장까지 업로드 할 수 있습니다.");
    	return;
    }
    
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $(".imgs_wrap").append(html);
            index++;
        }
        reader.readAsDataURL(f);
	

    });
}

function deleteImageAction(index) {            
    console.log("index : "+index);
    sel_files.splice(index, 1);

    var img_id = "#img_id_"+index;
    
    $(img_id).remove();
    img_id = "";
    console.log(sel_files);
}


function back() {
	location.href="/mr/roomList.do"
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
.right_main {
	width: 900px;
	min-height: 570px;
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
	min-height: 520px;
	padding: 10px 0;
}
.content_form {
	width: 900px;
	min-height: 490px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-content: flex-start;
}
.right_box {
	width: 900px;
}
.left_box {
	width: 400px;
}
.left_box .small_box {
	width: 400px;
	height: 80px;
	padding-top: 10px;
	padding-left: 10px;
	border-bottom: 1px solid lightgray;
}
.right_box .small_box {
	width: 900px;
	height: 200px;
	padding: 10px;
	border-bottom: 1px solid lightgray;
	display: flex;
	flex-wrap: wrap;
}
#uploadResult img {
	width: 300px;
	height: 200px;
	margin-right: 10px;
}
#result_card {
	display: flex;
	flex-wrap: nowrap;
}
.imgDeleteBtn {
	cursor: pointer;
}
.left_box input, .left_box select {
	width: 80%;
	border: 1px solid lightgray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
.small_box > div {
	margin-bottom: 5px;
}
.big_box {
	width: 500px;
	min-height: 320px;
	padding-top: 10px;
}
.big_box img {
	max-width: 750px;
	height: auto;
}
.button_box {
	width: 900px;
	height: 50px;
	display: flex;
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
textarea { 
	width: 100%; height : 283px;
	resize: none;
	overflow: auto;
	border: 1px solid lightgray;
}
.ptag {
	font-size: 10px; color : #c0c0c0;
	height: 30px;
	width: 700px;
}
.ptag > p {
	margin-top: 15px;
}
.imgs_wrap { 
	display: inline-block;
	width: 880px;
	height: 150px;
}
[id*='img_id_'] {
	display: block; margin: 10px; float: left;
}
.selProductFile {
	width : 150px;
}
	
.imgs_wrap::after {
	content: ''; display: table; clear: both;
}
.my_button{
    cursor: pointer;
    display: inline-block;
    height: 30px;
    font-weight: 700;
    font-size: 14px;
    background-color: #fff;
    color: #015B28;
    margin: 0;
    border-radius: 3px;
    letter-spacing: 0.1em;
    text-align: center;
    border: 2px solid #015B28;
    white-space: nowrap;
}
	
.my_button:hover{color: #fff; background: #015B28; border : 2px solid #015B28 }
	 
 #inputImage{display: none;}
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
					신규 객실 등록
				</div>
				<div class="insert_content">
					<form action="/mr/addRoom.do" class="content_form" method="post" name="insert" enctype="multipart/form-data">
						<div class="right_box">
							<div class="small_box">
								<input type="button" onclick="fileUploadAction();" class="my_button" value="파일 업로드">
								<input type="file" id="inputImage" multiple="multiple" name="file" class="ct_input_g">
								<div class="ptag"><p>※클릭시 이미지 제거</p></div>
								<div>
									<div class="imgs_wrap">
										<img id="img" />
									</div>
								</div>
							</div>
						</div>
						<div class="left_box">
							<div class="small_box">
								<div>객실번호</div>
								<input type="number" name="rmNumber" class="data" required="required">
							</div>	
							<div class="small_box">
								<div>객실종류</div>
								<select name="rmKind" class="form-control" required="required">
						        	<option value="STANDARD">스탠다드</option>
						        	<option value="SUITE">스위트</option>
						        	<option value="DELUX">디럭스</option>
						        </select>
							</div>
							<div class="small_box">
								<div>객실인원</div>
								<input type="text" name="rmArea" class="data" required="required">
							</div>
							<div class="small_box">
								<div>가격</div>
								<input type="text" name="rmPrice" class="data" required="required">
							</div>
						</div>
						<div class="big_box">
							<div class="small_box">
								<div>객실상세정보</div>
								<textarea name="rmInfo" class="data" required="required"></textarea>
							</div>
						</div>
						<div class="button_box">
							<input type="submit" value="등록">
							<input type="reset" value="초기화">
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