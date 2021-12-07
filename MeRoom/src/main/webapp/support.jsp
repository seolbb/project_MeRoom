<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>support 메인</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>
<style>


* {
	box-sizing: border-box;
}

h2 {


	
	letter-spacing: 4px;
	text-align: center;
	font-family: Arial, Sans-serif;
	font-size: 16px;
	font-weight: 500;
}

h4 {
	letter-spacing: 4px;
	text-align: center;
	font-family: Arial, Sans-serif;
	font-size: 16px;
	font-weight: 500;
}


.con {
    margin: 0 auto;
    max-width: 1280px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    padding-left: 40px;
    padding-right: 40px;
}




table {
   	width: 100%;
    border-top: 2px solid black;
    border-bottom: 1px solid black;
    border-spacing: 2px;
    border-collapse: collapse
    
	
}


tbody{
	width: 90%;
	height: 70%;
	margin-left: auto; 
	margin-right: auto;
	
}

th{
	padding: 8px;
	text-align: center;
	width: 20%;
	height: 70%;
	justify-content: center;
}

td{

	text-align: center; 
	font-size: 17px;
	padding: 15px;
	width: 30%;
}


p{

	text-align: left;
    display: flex;
    margin: 0 auto;
    padding: 2px;
    font-size: 13px;
    width:600%;


}



input[type=text], select, textarea {
	width: 70%;
	padding: 12px;
	border: 1px solid #015B28;
	border-radius: 4px;
	resize: vertical;
	justify-content: center
}



label {
	padding: 0px 0px 0px 0;
	display: inline-block;
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

.container {
	border-radius: 5px;
	background-color: white;
	padding: 10px;
	max-width: 1180px;
	margin: 0 auto;
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

@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 50%;
		margin-top:0;
	}
}

.pBar{
	width:1180px;
}

.faIcon{
	cursor: pointer;
}


#faContent{
	text-align:left;



}


</style>

<script>
$(function(){
		$('#question').focusout(function(){
			alert("일대일 문의 게시판을 이용해주시기를 바랍니다. ")
			location.href= "question.jsp";
		});
 
		  
		  
		  
});

	function fa_toggle(idx) {	
	$("#faContent_"+idx).toggle("show");
		
		
	}


$(document).ready(function(){
    $(".faContent").hide();
});



  


</script>



</head>
<body>
	
	<%@ include file="mainheader.jsp"%>
	<br>
	<br>
	<h2>FAQ</h2>
	<h4>자주 묻는 질문</h4>
	<br>
		
	
	<div class="con">

	<table class="body__container">
	
	
	
   <tr>
    	 <th>번호</th>
         <th>제목</th>
      </tr>
      <c:if test="${not empty faList }">
         <c:forEach var="fa" items="${faList }">
         <tr>
            <td id="fa_idx">${fa.fIdx }</td>
            <td>
            	${fa.fTitle }
            </td>
           <td>
            	<i class="material-icons faIcon" onclick="fa_toggle(${fa.fIdx})">expand_more</i>
            </td>
            </tr>
            <tr class="faContent" id="faContent_${fa.fIdx }">
            <td></td>
            	<td>
            		<p>${fa.fContent }</p>
            	</td>
            	<td></td>
            </tr>
          
         </c:forEach>
      </c:if>
      <c:if test="${empty faList }">
         <tr>
            <td colspan="5" class="center">데이터가 없습니다</td>
         </tr>
      </c:if>
   </table>
	</div>
		<br>
		<br>


	<br>
	
	
	<p class="pBar">personal question</p>
	
<div class="container">
  <form action="">
  <div class="row">
    <div class="col-25">
      <label for="question">문의 유형 선택</label>
    </div>
    <div class="col-75">
      <select id="question" name="question">
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
      <label for="title">제목</label>
    </div>
    <div class="col-75">
      <input type="text" id="title" name="title"  disabled="disabled">
    </div>
  </div>
  
  <div class="row">
    <div class="col-25">
      <label for="content">내용</label>
    </div>
    <div class="col-75">
      <textarea id="content" name="content" style="height:200px" disabled="disabled"></textarea>
    </div>
  </div>
  <br>
  <div class="row">
    <input type="submit" value="문의보내기">
  </div>
  </form>
</div>
<br>	
	

   <%@ include file="mainfooter.jsp"%> 
   
   
</body>
</html>