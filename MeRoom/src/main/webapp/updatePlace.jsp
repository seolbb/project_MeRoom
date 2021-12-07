<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<title>update</title>
<style>
	#result_card img{
	max-width: 100%;
    height: auto;
    display: block;
    padding: 5px;
    margin-top: 10px;
    margin: auto;	
}
#result_card {
	position: relative;
}
.imgDeleteBtn{
    position: absolute;
    top: 0;
    right: 5%;
    background-color: #ef7d7d;
    color: wheat;
    font-weight: 900;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    line-height: 26px;
    text-align: center;
    border: none;
    display: block;
    cursor: pointer;	
}
</style>

</head>
<script>
	$(document).ready(
			function() {
				//summernote 툴바 설정
				var toolbar = [
						// 글꼴 설정
						[ 'fontname', [ 'fontname' ] ],
						// 글자 크기 설정
						[ 'fontsize', [ 'fontsize' ] ],
						// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
						[
								'style',
								[ 'bold', 'italic', 'underline',
										'strikethrough', 'clear' ] ],
						// 글자색
						[ 'color', [ 'forecolor', 'color' ] ],
						// 표만들기
						[ 'table', [ 'table' ] ],
						// 글머리 기호, 번호매기기, 문단정렬
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						// 줄간격
						[ 'height', [ 'height' ] ],
						// 그림첨부, 링크만들기, 동영상첨부
						[ 'insert', [ 'picture', 'link', 'video' ] ],
						// 코드보기, 확대해서보기, 도움말
						[ 'view', [ 'codeview', 'fullscreen', 'help' ] ],
				// 추가한 글꼴
				];

				//summernote 세팅
				var setting = {
					height : 300,
					minHeight : null,
					maxHeight : null,
					focus : true,
					lang : 'ko-KR',
					toolbar : toolbar,
					//  추가한 폰트 이름
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체',
							'바탕체' ],
					// 추가한 폰트사이즈
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ],
					callbacks : { //여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								console.log(files[i].name)
								uploadSummernoteImageFile(files[i], this);
							}
						}
					}
				};

				$('#summernote').summernote(setting);

			});

	//게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다
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
				console.log("data : " + data.url);
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
</script>

<body>

	<h2 style="text-align: center;">장소 수정</h2>

	<div style="width: 60%; margin: auto;">
		<form method="post" action="updatePlace.do">
			<!-- <div class="form-group">
        <label for="label">카테고리</label><br>
        <select name="oCategory">
            <option value="힐링">힐링</option>
            <option value="액티비티">액티비티</option>
            <option value="DIY">DIY</option>
        </select>
    </div> -->
<!-- 			<<div style="width: 60%; margin: auto;"> -->
<!-- 		<form action="getPlaceList.do" method="post" -->
<!-- 			enctype="multipart/form-data"> -->
			<div class="form-group">
				<label for="label">장소명</label>
				<input type="text" class="form-control" id="label" name="ptitle" value="${place.ptitle }">
			</div>
			<div class="form-group">
				<label for="label">시간</label>
				<input type="text" class="form-control" id="label" name="ptime"value="${place.ptime }">
			</div>
			<div class="form-group">
				<label for="label">전화번호</label>
				<input type="text" class="form-control" id="label" name="pphone" value="${place.pphone }">
			</div>
			<div class="form-group">
				<label for="label">위치</label>
				<input type="text" class="form-control" id="label" name="plocation" value="${place.plocation }">
			</div>
			<div class="form-group">
				<div class="form_section_title" id = "label" name="pfilepath">
					<label>이미지(파일경로)</label>
				</div>
				<div class="form_section_content">
					<input type="file" multiple="multiple" id="fileItem" name="uploadFile" style="height: 30px;">
					<div id="uploadResult">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="label">상세정보</label>
				<textarea id="summernote" name="pcontent"></textarea>
			</div>
<!-- 			<div class="form-group">
				<label for="label">파일경로</label> 
				<input type="text" class="form-control" id="label" name="pfilepath">
			</div> -->
			<div class="form-group">
				<label for="label">위도</label> 
				<input type="text" class="form-control" id="label" name="plat">
			</div>
			<div class="form-group">
				<label for="label">경도</label> 
				<input type="text" class="form-control" id="label" name="plng">
			</div>
			<div class="form-group">
				<label for="label">텍스트</label> 
				<input type="text" class="form-control" id="label" name="ptext">
			</div>

			<button type="submit" class="btn btn-info">등록하기</button>
			<a href="deletePlace.do?pid=${place.pid }">삭제</a>

		</form>
	</div>
<script>
	

	// 기존이미지 출력 
	
	let pid = '<c:out value="${place.pid }"></c:out>'
	let uploadResult = $("#uploadResult");
	
	$.getJSON("display.do", {pid : pid}, function(arr){
		
		console.log(arr);
		
		if(arr.length === 0) {
			
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='img/udo.jpg'>";
			str += "</div>";
			
			uploadResult.html(str);
			return;
		}
		
		let str = "";
		let obj = arr[0];
		
		let fileCallPath = encodeURIComponent(obj.upload + "s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id ='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "'";
		str += ">";
		str += "<img src='display.do?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='"+ fileCallPath +"'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value'" + obj.fileName + "'>";
		str += "<input type='hidden' name='imageList[0].uuid' value'" + obj.uuid + "'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value'" + obj.uploadPath + "'>";
		str += "</div>";
		
		uploadResult.html(str);
		
	}); //
	
	
	
	
	// 이미지 삭제 버튼
	function deleteFile() {
		
		$("#result_card").remove();
	}////
	
	
	// 이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	
	
	// 다시 이미지 등록
	
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($("#result_card").length > 0){
			deleteFile();
		}
		
		alert("동작");
				
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: "uploadAjaxAction.do",
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    		alert("성공");
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});		

		
	});
		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과되었습니다.");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		console(obj);
		
		// DB
		
		let str = "";
		let fileCallPath = encodeURIComponent(obj.pfilepath);
		console.log("fileCallPath : " + fileCallPath);
		
		//let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		//replace 적용 하지 않아도 가능
		//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
   		uploadResult.innerHTML = str;     
        
	}
	
	
	
	
	
</script>	

</body>
</html>