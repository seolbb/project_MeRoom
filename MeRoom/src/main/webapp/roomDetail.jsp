<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
textarea{ width: 100%; height : 100px; }


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

.imgs_wrap{
	margin-bottom: 20px;
}
img{
	margin-right: 5px;
}
</style>
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
	
   
	
	
	$(function(){
		
		//저장 되어 있는 이미지 불러오기
		let dpHtml = '';
		let strlet = "${roomOne.fileName}".split(',');
		let rmKind = '${roomOne.rmKind}';
		$(strlet).each(function(i){
			console.log(strlet[i]);
			
			dpHtml += "<img width='170px'; src=./images/uploadFiles/"+strlet[i]+">";
		});
		 $(".imgs_wrap").append(dpHtml);
		 $(".imgs_wrap").css('border','1px solid black');
		
	
		 if(rmKind === "STANDARD"){
			 $("#rmKind option:eq(0)").attr("selected", "selected");
		 }else if(rmKind === "SUITE"){
			 $("#rmKind option:eq(1)").attr("selected", "selected");
		 }else if(rmKind === "DELUX"){
			 $("#rmKind option:eq(2)").attr("selected", "selected");
		 }
		 
	})
	//파일 수정	
	function roomUpdate(){
		$('#formRoom').submit();
	}
	//파일 삭제
	function remove(){
		location.href='roomDelete.do?rmNumber=${roomOne.rmNumber}'
	}
</script>
</head>
<body>
<h2 style="text-align: center;">객실 상세조회</h2>

<div style="width: 60%; margin: auto;">
  <form action="roomUpdate.do" id="formRoom" name="detailForm" method="post" enctype="multipart/form-data"> 
    <div class="form-group">
        <label for="label">객실번호</label>
        <input type="text" class="form-control" id="rmNumber" name="rmNumber" value="${roomOne.rmNumber}" readonly>
      </div>
    <div class="form-group" >
        <label for="label">객실종류</label>
        <select name="rmKind" class="form-control" id="rmKind" >
        	<option value="STANDARD">스텐다드</option>
        	<option value="SUITE">스위트</option>
        	<option value="DELUX">디럭스</option>
        </select>
     	<!--  <input type="text" class="form-control" id="rmArea" name="rmArea" value="${roomOne.rmKind}">-->
      </div>
      <div class="form-group">
        <label for="label">객실인원</label>
        <input type="text" class="form-control" id="rmArea" name="rmArea" value="${roomOne.rmArea}">
      </div>
      
       <div class="form-group">
        <label for="label">가격</label>
        <input type="text" class="form-control" id="rmPrice" name="rmPrice" value="${roomOne.rmPrice}">
      </div>
      
       <div class="form-group">
        <label for="label">객실상세정보</label>
        <textarea name="rmInfo">${roomOne.rmInfo}</textarea>
      </div>
      
      

			<div>
		        <div class="imgs_wrap">
		    
		        </div>
		    </div>
	
    
       <div class="form-group">
        <input type="button" onclick="fileUploadAction();" class="my_button" value="파일 업로드">
		<input type="file" id="inputImage" multiple="multiple" name="file" class="ct_input_g">
		
	  </div>
      
      <input type="button" class="btn btn-info" onclick="roomUpdate()" value="수정하기" >
      <input type="button" class="btn btn-info" onclick="remove()" value="삭제하기">
      <button type="button" onclick="javascript:history.back(-1);">뒤로가기</button>
      
</form>

</div>

</body>

</html>