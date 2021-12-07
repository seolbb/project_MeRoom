<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  <!-- reset cdn 갖고와서 사용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- bootstrap start-->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
   

<style>

.top_bar {

 	width: 1180px;
    border-bottom: 1px solid #bcbcbc;
  	margin: 0 auto;
    padding: 10px;

}



.top_bar h4{
	text-align: left;
 	letter-spacing: 4px;
    display: flex;
    float: left;
    margin:12px auto;
  

}

.top_bar p{
	text-align: right;
    display: flex;
    justify-content: flex-end;
    font-size: 12px;
    padding: 15px;
    color:gray;
    margin: 5px auto;
}




input[type=text], select, textarea {
	width: 70%;
	padding: 12px;
	border: 2px solid #015B28;
	border-radius: 4px;
	resize: vertical;
	justify-content: center

}



.label_form {
	padding: 12px 5px 9px 120px;
	display: inline-block;
	font-weight: 600;
	font-family: 'Nanum Gothic Coding', monospace;
}

.row2{
	padding-left: 500px
}
.row2:after{
	content:"";
	display: table;
	clear: both;
}

.padding{
	width:30px;
	height : 10px;
	display: inline-block;
	float:left;
}
button[type=button],.btn_submit a {
	padding-right: 20px;
	background-color: white;
	cursor: pointer;
	display : inline-block;
	float : left;
	border : 2px solid #015B28;
	color: #015B28;
	margin: 0 auto;
	padding: 13px 13px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight: 700;
}

button[type=button]:hover,.btn_submit a:hover {
	 background: #015B28; 
	 border : 2px solid #015B28;
	 color: white;
}

 .container {
	border-radius: 5px;
	background-color: white;
	padding: 0;
	max-width: 1180px;
	margin: 0 auto;
	box-shadow: 1, 1, 1;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

.row:after {
	content:"";
	display: table;
	clear: both;
}

.input--text:focus {
    border : 3px solid #015B28 !important; /* header #search 선택자를 덮어쓰기 위해서 사용 */

}

.w100{float: left; width: 320px; padding: 12px 12px;}



  /* Vendor prefix(브라우저 업체별 접두어) */
.input--text::-webkit-input-placeholder { color: #cacaca; }
.input--text:-ms-input-placeholder      { color: #cacaca; }
.input--text::-moz-placeholder          { color: #cacaca; }



input.email4{
	width: 70%;
}

.col {
	float: left;
	width: 35%;
	margin-top: 6px;
	font-size: 14px;

}

.col p {

padding: 5px 1px;

}

.form-check_1  {
	float: left;
	padding: 21px;
	font-size: 16px;
	font-weight: 600;
	font-family: 'Nanum Gothic Coding', monospace;
	
}

.form-check_2  {
	float: left;
	padding: 21px;
	font-size: 16px;
	font-weight: 600;
	font-family: 'Nanum Gothic Coding', monospace;

}

.form-check_1 input checkbox{
	font-size: 1em;
    width: 4px; /* 너비 설정 */
    height: 4px; /* 높이 설정 */
    vertical-align: middle;
    cursor: pointer;


}

.privacy{
padding: 12px 5px 9px 120px;
	display: inline-block;
	font-weight: 600;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size : 17px;



}



#ag1 {
	width: 17px; 
    height: 15px; 
    background-color : #015B28;
    

}


</style>



<script>

$(document).ready(function() {
	 

	 $('input[type="checkbox"][name="answer"]').click(function(){
	 
	  if($(this).prop('checked')){
	 
	     $('input[type="checkbox"][name="answer"]').prop('checked',false);
	 
	     $(this).prop('checked',true);
	 
	    }
	  
	   });
	  
	 });
	   



	$(function(){
	    
	    btnClick();
	});


	function btnClick(){
	    $('#btnSubmit').on('click',function(){
	        checkAll();
	    })
	}


	/*초기화 x시 val지우면됨 */


	/*문의유형 */
	function valiAniType(){
	    if("NOT" === $('#any_type option:selected').val()){
	        $('#any_type').focus();
	        alert('문의유형을 선택해주세요');
	        return false;
	    }
	    return true;
	}

	function valiTitle(title){
	    if(title === ''){
	        alert('제목을 입력해주세요');
	        $('#title').val('').focus();
	        return false;
	    }
	    return true;
	}

	function valiContent(content){
	    if(content === ''){
	        alert('내용을 입력해주세요');
	        $('#content').val('').focus();
	        return false;
	    }
	    return true;
	}

	function valiChecked(){
	    if(!$('#ag1').is(':checked')){
	        alert('개인정보 수집에 동의해주세요');
	        $('#ag1').focus();
	        return false;
	    }
	    return true;
	}
	
	function valiQuest() {
		if(!$('#btnSubmit').is(':checked')){
	        alert("일대일 문의가 등록되었습니다. ");
	        $('#btnSubmit').focus();
	        return false;
	}
		  return true;
	}
	
	 
		  

	function checkAll(){
		   
	    if(!valiAniType()){
	        return false;
	    }
	    if(!valiTitle(inq__form.qTitle.value)){
	        return false;
	    }
	    if(!valiContent(inq__form.qContent.value)){
	        return false;
	    }
	    
	    if(!valiChecked()){
	        return false;
	    }
	    
	    if(!valiQuest()){
	    	 return false;
	    }
	     $('#inq__form').prop('method','POST').prop('action','insertQuestion.do').submit();
	}
	/*초기화 x시 val지우면됨 */

	
</script>





</head>
<body>  


	<%@ include file="mainheader.jsp"%>
	<br>
	<br>
	<div class="top_bar"> 
	<h4>personal question</h4>
	<p>※ 문의하신 사항은 성실하게 답변 드리겠습니다. 문의하시기 전에 FAQ를 참고 해주세요</p>
	</div>
	<br>
	<br>
	<br>
	
	<div class="container">
  <form  id="inq__form" enctype="multipart/form-data">
	
     <div class="row">
    <div class="col-25">
      <label for="username" class="label_form">이름</label>
    </div>
    <div class="row">
    <div class="col-75">
		<input type="text" class="input--text"  id="username" name="name" value="${vo.name }">    	
    </div>
    </div>
    </div>
    
    
    <div class="row">
    <div class="col-25">
      <label for="userid" class="label_form">아이디</label>
    </div>
    <div class="row">
    <div class="col-75">
		<input type="text" class="input--text"  id="userid" name="memberid" value="${vo.memberId }">    	
    </div>
    </div>
    </div>
    
    
  
    <div class="row">
    <div class="col-25">
      <label for="username" class="label_form">이메일</label>
    </div>
    <div class="row">
    <div class="col-75">
		<input type="text" class="input--text"  id="email" name="email" value="${vo.email }"> 
   	 </div>
    </div>
    </div>
    
    <div class="row">
    <div class="col-25">
      <label for="userid" class="label_form">휴대폰 번호</label>
    </div>
    <div class="row">
    <div class="col">
		<input type="text" class="input--text" id="userid" name="phone" value="${vo.phone }"> 
		<p>※ 답변이 등록되면 휴대폰 SMS로 알려드립니다.</p> 
    </div>
    
   <div class="checkBox_yn">
    <div class="form-check_1">
      <input type="checkbox" class="form-check-input" id="check1" name="answer" value="yes" onclick="checkboxYn(this)">
      <label class="form-check-label" for="check1">예</label>
    </div>
     <div class="form-check_2">
      <input type="checkbox" class="form-check-input" id="check1" name="answer" value="no" onclick="checkboxYn(this)">
      <label class="form-check-label" for="check1">아니요</label>
    </div>
    
    </div>
  	</div>
  </div>
  	
  <div class="row">
    <div class="col-25">
      <label for="question" class="label_form">문의 유형 선택</label>
    </div>
    <div class="col-75">
        <select name="anyType" id="any_type" class="input--text">
         <option value="NOT">선택</option>
        <option value="room">숙박이용문의</option>
        <option value="reservation">예약문의</option>
        <option value="oneday">원데이클래스문의</option>
        <option value=" place">플레이스문의</option>
        <option value="other">기타문의</option>
      </select>
    </div>
  </div>
  

  <div class="row">
    <div class="col-25">
      <label for="title" class="label_form">제목</label>
    </div>
    <div class="col-75">
      <input type="text" id="title"  class="input--text" name="qTitle" placeholder="제목">
    </div>
  </div>
  
  <div class="row">
    <div class="col-25">
      <label for="content" class="label_form">내용</label>
    </div>
    <div class="col-75">
      <textarea id="content" name="qContent" class="input--text" placeholder="문의 내용을 상세히 입력해주세요." style="height:200px"></textarea>
    </div>
  </div>
  <br>
  <div class= "privacy">
   <label for="Privacy">개인정보 수집 및 이용에 대한 동의(필수)
  					<input type="checkbox" id="ag1" >
  						<span class="checkmark"></span>
							</label>
							</div>
							<br>
							<br>
  <div class="row2">
     <button type="button" id="btnSubmit">등록</button> 
    <div class="padding"></div>
         		  <p class="btn_submit">
                        <a href="javascript:history.back();" class="btn btn-default">취소</a>
                    </p>  
  </div>
  
  </form>
</div>

<br>	
<br>
<br>	

   <%@ include file="mainfooter.jsp"%> 



</body>
</html>