<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<title>news write</title>
<style>


p{

	text-align: left;
 	letter-spacing: 4px;
    display: block;
    width: 1180px;
    margin: 0 auto;
    padding: 20px;


}


input[type=submit] {
	background-color: white;
	cursor: pointer;
	display:block;
	border-style: solid;
	color: #015B28;
	margin: 0 auto;
	padding: 10px 10px;
}

input[type=submit]:hover {
	 color: black;
}


  #result_card img{
      max-width: 30%;
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





</style>



<script>
    $(document).ready(function() {
          /* $('#summernote').summernote({
                 placeholder: 'content',
                minHeight: 370,
                maxHeight: null,
                focus: true, 
                lang : 'ko-KR'
          }); */
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
 		console.log("uploadImageFile() 들어옴");
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadImageFile.do",    //따로 컨트롤러 안에 추가해야됨
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
	
	<p>News 작성하기</p>
	<br>
	<br>
	<form action="insertNews.do"  method="post" enctype="multipart/form-data"><div style="width: 60%; margin: auto;">
	
	<div class="form"><label for="label">제목</label><input type="text" name="neTitle" id="label" class="form-control"></div>

	<div class="form"><label for="label">부제목</label><input type="text" name="neSubtitle" id="label" class="form-control"></div>
	
	<div class="form-group">
	<div class="form_section_title">
	<label>썸네일</label>
	</div>
	<div class="form_section_content">
	<input type="file" multiple="multiple" id="fileItem" name="uploadFile" style="height: 30px;">
	<div id="uploadResult">
		
	</div>
	</div>															
	</div>
	
	<div class="form"><label for="label">내용</label><textarea id="summernote" name="neContent"></textarea></div>
	

	</div>
	<br>
	<div class="row">
    <input type="submit" value="등록하기">
 	 </div>	
 	 </form>
 	 <br>
 	 
 	 
 	
<script>

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
		
		
			console.log("fileList : " + fileList) // [object FileList]
			console.log("fileObj : " + fileObj);
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type);
			
		formData.append("uploadFile", fileObj); // 파일이 한개일 때 	
		
	
		$.ajax({
			url: "uploadAjaxPOST.do", // 서버로 요청보낼 url
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
		let OriFileCallPath = obj.neThumbnail;
		console.log("OriFileCallPath : " + OriFileCallPath);
		
		let str = "";
		//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
		let fileCallPath = encodeURIComponent(obj.neThumbnail);
		console.log("fileCallPath : " + fileCallPath);
		
		str += "<div id='result_card'>";
		str += "<img src='screenplay.do?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn'data-file='"+ fileCallPath +"'>x</div>";
		str += "</div>";
		str += "<input type='hidden' name='neThumbnail' value='"+OriFileCallPath+"'>";
		
		uploadResult.innerHTML = str;
		
	}
	
	function deleteFile() {
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: "deleteThumnail.do",
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
	
	// 이미지 삭제 버튼 동작
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	

	
</script> 	
 	
 	 	 
 	 
</body>
</html>