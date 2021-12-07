<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="overflow: auto;">
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
	setValue();
	
	$('#summernote').summernote({
		height: 500,
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
		dataType: 'json',
		url : "/mr/uploadSummernoteImageFile.do",    //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(editor).summernote('insertImage', data.url);
		},
		error: function() {
			alert("imageLoad fail")
		}
	});
}

function back() {
	location.href="/mr/getPromotionList.do";
}

function setValue() {
	$('input[name=prTitle]').attr('value', '${promotion.prTitle}');
	$('input[name=prSubtitle]').attr('value', '${promotion.prSubtitle}');
	$('#summernote').val('${promotion.prContent}');
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
	padding: 20px 20px 0 20px;
}
.content_form {
	width: 900px;
	min-height: 490px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-content: flex-start;
}
.left_box .small_box {
	width: 450px;
	height: 80px;
	padding-top: 10px;
	margin-left: 10px;
	border-bottom: 1px solid lightgray;
}
.right_box .small_box {
	width: 400px;
	height: 240px;
	padding: 20px;
	border-bottom: 1px solid lightgray;
	margin-left: 30px;
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
.small_box > input {
	width: 80%;
	border: 1px solid lightgray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
.small_box > div {
	margin-bottom: 5px;
}
.big_box {
	width: 900px;
	min-height: 320px;
}
.big_box > div:first-child {
	margin-bottom: 5px;
}
.big_box img {
	max-width: 750px;
	height: auto;
}
.button_box {
	width: 900px;
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
					프로모션 정보 수정
				</div>
				<div class="insert_content">
					<form action="/mr/updatePromotion.do" class="content_form" method="post" name="insert" enctype="multipart/form-data">
						<div class="left_box">
							<div class="small_box">
								<div>제목</div>
								<input type="text" name="prTitle" class="data" >
							</div>
							<div class="small_box">
								<div>부제목</div>
								<input type="text" name="prSubtitle" class="data" >
							</div>
							<div class="small_box">
								<div>썸네일</div>
								<input type="file" name="uploadFile" class="data" multiple="multiple">
							</div>
						</div>
						<div class="right_box">
							<div class="small_box">
								<div id="uploadResult">
								</div>
							</div>
						</div>
						<div class="big_box">
							<textarea id="summernote" name="prContent" class="data" style="display: none;" ></textarea>
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

<script>
	$("input[type='file']").on("change", function(e) {
		
		// 이미지 존재시 삭제
		if($(".imgDeleteBtn").length > 0) {
			deleteFile();
		}

		let formData = new FormData(); // FormData 객체에 데이터를 추가하는 방법은 FormData.append(key, value) 메서드를 사용
		//파라미터 key의 경우 추가해줄 데이터의 변수를 작성한다고 생각하시면 됩니다.
		//<input> name과 Controller의 url 매핑 메서드의 매개변수 이름과 동일하게 해 주었듯이, key와 추후 추가할 url 매핑 메서드의 매개변수명이 동일해야 합니다.
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileList : " + fileList) // [object FileList]
		console.log("fileObj : " + fileObj);
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
			
		formData.append("uploadFile", fileObj); // 파일이 한개일 때 	
		
		$.ajax({
			url: "/mr/uploadAjax.do", // 서버로 요청보낼 url
			processData : false, // processData랑 contentType false처리해야만 서버전송된다.
			contentType : false,
			data : formData,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				console.log("result : " + result);
				console.log(result);
				showUploadImage(result);
			},
			error : function(result) {
				console.log("이미지 파일이 아닙니다.");
			}
		
		});
	});
	
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB

	function fileCheck(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈가 초과되었습니다.");
			return false;
		}
		
		if (!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	// 이미지 출력
	function showUploadImage(uploadResultArr) {
		// 전달받은 데이터 검증
		if(!uploadResultArr || uploadResultArr.length == 0) {
			return;
			}

		//let uploadResult = $("#uploadResult");
		let uploadResult = document.getElementById("uploadResult");
		 
		let obj = uploadResultArr[0]; // 배열의 첫번재값 
		console.log("obj : " + obj);
		console.log(obj);
		
		// 데이터베이스 저장시 오리저널 경로로 저장한다.~
		let OriFileCallPath = obj.prThumbnail;
		console.log("OriFileCallPath : " + OriFileCallPath);
		
		let str = "";
		//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
		let fileCallPath = encodeURIComponent(obj.prThumbnail);
		console.log("fileCallPath : " + fileCallPath);
		
		str += "<div id='result_card'>";
		str += "<img src='/mr/pictureplay.do?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn'data-file='"+ fileCallPath +"'>x</div>";
		str += "</div>";
		str += "<input type='hidden' name='prThumbnail' value='"+OriFileCallPath+"'>";
		
		uploadResult.innerHTML = str;
	}
	
	function deleteFile() {
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: "/mr/deletepicture.do",
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result) {
				console.log(result);
				console.log("result : " + result);
				
				//x버튼 클릭시 imgDeleteBtn 부분을 없애고 파일 업로드 input 부분을 초기화한다
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result) {
				console.log(result);
				console.log("result : " + result);
				
				alert("파일을 삭제하지 못하였습니다.");
			}
		})	
	}
	
	// 이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
</script>
</body>
</html>