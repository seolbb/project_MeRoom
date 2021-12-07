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


<title>자주묻는 질문 작성하기</title>
<style>




p{

	text-align: left;
 	letter-spacing: 4px;
    display: block;
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
 		console.log("Fileupload() 들어옴");
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "Fileupload.do",    //따로 컨트롤러 안에 추가해야됨
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
	
	<p>자주 묻는 질문 작성하기</p>
	<br>
	<br>
	<form action="insertFA.do"  method="post"><div style="width: 60%; margin: auto;">
	
	<div class="form"><label for="label">제목</label><input type="text" name="fTitle" id="fTitle" class="form-control"></div>
	
	<div class="form"><label for="label">내용</label><textarea id="summernote" name="fContent" ></textarea></div>
	
	</div>
	<br>
	<div class="row">
    <input type="submit" value="등록하기">
 
 	 </div>	
 	 </form>
 	 <br>
 	 
 	 
 	 
</body>
</html>