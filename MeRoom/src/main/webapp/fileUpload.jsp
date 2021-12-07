<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
// 이미지 정보들을 담을 배열
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
	    
	    if(files.length > 11){
	    	alert("최대 10장까지 업로드 할 수 있습니다.");
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
	        $(".imgs_wrap").css('border','1px solid black');


	    });
	}
	
	   function deleteImageAction(index) {            
           console.log("index : "+index);
           sel_files.splice(index, 1);

           var img_id = "#img_id_"+index;
           
           $(img_id).remove();
           img_id.clear();
           console.log(sel_files);
       } 
</script>

<style>
	p{margin : 0px; margin-top : 20px; font-size: 10px; color : #c0c0c0;}
	.imgs_wrap{ display: inline-block;}
	[id*='img_id_']{display: block; margin: 10px; float: left;}
	.selProductFile{width : 200px;}
	
	.imgs_wrap::after{content: ''; display: table; clear: both;}
	
	
	
	
.my_button{
    
    cursor: pointer;
    display: inline-block;
    height: 30px;
    font-weight: 700;
    font-size: 14px;
    background-color: #fff;
    color: #015B28;
    margin: 0;

    border-radius: 0;
    letter-spacing: 0.1em;
    text-align: center;
    border: 2px solid #015B28;
    white-space: nowrap;
}
	
.my_button:hover{color: #fff; background: #015B28; border : 2px solid #015B28 }
	 
 #inputImage{display: none;}

</style>
</head>


<body>
	<form action="addRoom.do"  name="detailForm" method="post" enctype="multipart/form-data"> 
	
	 
	 <input type="button" onclick="fileUploadAction();" class="my_button" value="파일 업로드">
		<input type="file" id="inputImage" multiple="multiple" name="file" class="ct_input_g">
		
	
	<div class="ptag"><p>※클릭시 이미지 제거</p></div>
	
	<div>
        <div class="imgs_wrap">
            <img id="img" />
        </div>
    </div>
	
		<input type="submit" value="데이터 전송">
	</form>
</body>
</html>