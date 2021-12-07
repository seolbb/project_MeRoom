<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<title>클래스 수정하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<style>
   /* 달력 */
   .table-condensed{
       width: 200px;
       height: 200px;
   }
   
   .datepicker table tr td.active.active {
       color: #fff;
       background-color: #015B28;
   }

   .datepicker table tr td.active.active:hover {
       color: #fff;
       background-color: #015B28;
       /* border-color: #193c5a; */
   }

   .inputdate {
       border: none;
       font-size: 20px;
   }
   
   .classDate {
   		/* border: 1px solid black; */
   		padding-left: 50px;
   		display:flex;
   }
   
   .checkedDate {
   		padding: 50px 50px 50px;
   		display: inline-block;
		float: right;
   }
   
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


<script>

$(document).ready(function() {
	//summernote 툴바 설정
	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']],
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
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	   		 // 추가한 폰트사이즈
	   		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
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
		url : "uploadSummernoteImageFile.do",    //따로 컨트롤러 안에 추가해야됨
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

</head>
<body>
<h2 style="text-align: center;">클래스 등록하기</h2>

<div style="width: 60%; margin: auto;">
	<form method="post" action="updateClass.do">
	<div class="form-group">
	    <label for="label">카테고리</label><br>
	    <select name="oCategory">
	        <option value="힐링">힐링</option>
	        <option value="액티비티">액티비티</option>
	        <option value="DIY">DIY</option>
	    </select>
	</div>
	<div class="form-group">
	    <label for="label">클래스명</label>
	    <input type="text" class="form-control" id="label" name="oName" value="${oneday.oName}">
	    </div>
	  <div class="form-group">
	      <label for="label">수강날짜</label>
	      <div class="classDate">
	      <div id="datepicker"></div>
	      <div class="checkedDate">
			<p><input type="text" id="my_hidden_input1" name="oDate"></p>
			<p><input type="text" id="my_hidden_input2" name="oDate"></p>
			<p><input type="text" id="my_hidden_input3" name="oDate"></p>
			<p><input type="text" id="my_hidden_input4" name="oDate"></p>
			<p><input type="text" id="my_hidden_input5" name="oDate"></p>
	      <button type="button" onclick="window.location.reload()">초기화</button>
	  </div>
	  </div>
	</div>
	<div class="form-group">
	  <label for="label">수강시간</label>
	  <input type="time" class="form-control" id="label" name="oTime" value="${oneday.oTime}">
	  <div id="datepicker"></div>
	</div>
	<div class="form-group">
	  <label for="label">수강장소</label>
	  <input type="text" class="form-control" id="label" name="oLocation" value="${oneday.oLocation}">
	</div>
	<div class="form-group">
	  <label for="label">수강가격</label>
	  <input type="number" class="form-control" id="label" name="oPrice" value="${oneday.oPrice}">
	</div>
	<div class="form-group">
	  <label for="label">수강인원</label>
	  <input type="number" class="form-control" id="label" name="oCnt" value="${oneday.oCnt}">
	   </div>
	<div class="form-group">
	     <label for="label">상세정보</label>
	     <textarea id="summernote" name="oInfo" value="${oneday.oInfo}"></textarea>
	</div>
    <div class="form-group">
		<div class="form_section_title">
			<label for="label">썸네일 이미지</label>
		</div>
		<div class="form_section_content">
			<input type="file" multiple="multiple" id="fileItem" name="uploadFile" style="height: 30px;">
			<div id="uploadResult"></div>
		</div>
	</div>
    <button type="submit" class="btn btn-info">등록하기</button>
    <p>
    <a href="deleteClass.do?oIdx=${oneday.oIdx }">글삭제</a>
    <a href="getClassList.do">글목록</a>
    </p>
    
</form>
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

	/* 썸네일 */	
	$("input[type='file']").on("change", function(e) {
		
		// 이미지 존재시 삭제
		if($(".imgDeleteBtn").length > 0) {
			deleteFile();
		}
		
		
		alert("동작");
		
		let formData = new FormData(); // FormData 객체에 데이터를 추가하는 방법은 FormData.append(key, value) 메서드를 사용
		//파라미터 key의 경우 추가해줄 데이터의 변수를 작성한다고 생각하시면 됩니다.
		//<input> name과 Controller의 url 매핑 메서드의 매개변수 이름과 동일하게 해 주었듯이, key와 추후 추가할 url 매핑 메서드의 매개변수명이 동일해야 합니다.
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		/* if (!fileCheck(fileObj.name, fileObj.size)) {
			return false;
		}
		alert("통과"); */
		
			console.log("fileList : " + fileList) // [object FileList]
			console.log("fileObj : " + fileObj);
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type);
			
		formData.append("uploadFile", fileObj); // 파일이 한개일 때 	
	
		$.ajax({
			url: "uploadAjaxAction.do", // 서버로 요청보낼 url
			processData : false, // processData랑 contentType false처리해야만 서버전송된다.
			contentType : false,
			data : formData,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				console.log("result : " + result);
				console.log(result);
				showUploadImage(result);
				alert("성공");
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
		let OriFileCallPath = obj.oImg;
		console.log("OriFileCallPath : " + OriFileCallPath);
		
		let str = "";
		//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
		let fileCallPath = encodeURIComponent(obj.oImg);
		console.log("fileCallPath : " + fileCallPath);
		
		str += "<div id='result_card'>";
		str += "<img src='display.do?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='"+ fileCallPath +"'>x</div>";
		str += "</div>";
		str += "<input type='hidden' name='oImg' value='"+OriFileCallPath+"'>";
		
		uploadResult.innerHTML = str;
		
	}
	
	function deleteFile() {
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: "deleteFile.do",
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result) {
				console.log(result);
				console.log("result : " + result);
				alert("삭제 성공");
				
				
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
	
	/* $(".imgDeleteBtn").click(function(){
		
	}); */
	
	// 이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});

	
	</script>
</html>