<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>상세보기</title>
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

	<h2 style="text-align: center;">상세정보보기</h2>

	<div style="width: 60%; margin: auto;">
		<form action="updatePlace.do" method="post"  enctype="multipart/form-data">
			<div class="form-group">
				<label for="label"></label> <input type="hidden"
					class="form-control" id="label" name="pid" value=${place.pid }>
			</div>
		
			<div class="form-group">
				<label for="label">장소명</label> <input type="text"
					class="form-control" id="label" name="ptitle" value=${place.ptitle }>
			</div>
			<div class="form-group">
				<label for="label">영업시간</label> <input type="text"
					class="form-control" id="label" name="ptime" value=${place.ptime }>
			</div>
			<div class="form-group">
				<label for="label">전화번호</label> <input type="text"
					class="form-control" id="label" name="pphone" value=${place.pphone }>
			</div>
			<div class="form-group">
				<label for="label">내용</label> <input type="text"
					class="form-control" id="label" name="pcontent" value=${place.pcontent }>
			</div>
			<div class="form-group">
				<label for="label">위도</label> <input type="text"
					class="form-control" id="label" name="plat" value=${place.plat }>
			</div>
			<div class="form-group">
				<label for="label">경도</label> <input type="text"
					class="form-control" id="label" name="plng" value=${place.plng }>
			</div>
			<div class="form-group">
				<label for="label">썸네일이름</label> <input type="text"
					class="form-control" id="label" name="pfile" value=${place.pfile }>
			</div>
			<div class="form-group">
				<label for="label">상세정보</label>
				<textarea id="summernote" name="oInfo"></textarea>
			</div>

			<button type="submit" class="btn btn-info">수정하기</button> 
			
			<a href="deletePlace.do?pid=${place.pid }">삭제</a>

		</form>

	</div>

</body>
</html>