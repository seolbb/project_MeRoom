<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 </head>
<style>

.container {
	border: 2px solid #015B28;
    margin: 15px 10px;
}
.title {
	font-size : 20px;
	margin: 0px;
	padding: 5px 5px 15px 13px ;
}

.head {
	margin: 10px;
    padding-top: 9px;
    padding-right: 9px;
    border-bottom: 1px solid #ddd;
    font-weight: 600;
}
.star {
	display: flex;
	justify-content: center;
	font-size: 18px;
	padding-bottom: 15px;
}

.starbox {
	margin: 20px;
	padding: 20px 10px;
}

.textbox {
	position: relative;
    margin: 11px 20px 0;
    padding: 10px 10px 11px;
    border: 1px solid #cbcbcb;
    background-color: #f4f4f4;
}

.tbox {
	width: 100%;
    min-height: 100px;
    border: none;
    background-color: transparent;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    font-size: 13px;
    line-height: 19px;
    color: #555;
    vertical-align: top;
    resize: none;

}
.starbox {
	border-bottom: 1px solid #cbcbcb;
}

.rating {
  display: flex;
  width: 100%;
  justify-content: center;
  overflow: hidden;
  flex-direction: row-reverse;
  height: 50px;
  position: relative;
  padding-bottom: 20px;
}

.rating-0 {
  filter: grayscale(100%);
}

.rating > input {
  display: none;
}

.rating > label {
  cursor: pointer;
  width: 40px;
  height: 40px;
  margin-top: auto;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='126.729' height='126.73'%3e%3cpath fill='%23e3e3e3' d='M121.215 44.212l-34.899-3.3c-2.2-.2-4.101-1.6-5-3.7l-12.5-30.3c-2-5-9.101-5-11.101 0l-12.4 30.3c-.8 2.1-2.8 3.5-5 3.7l-34.9 3.3c-5.2.5-7.3 7-3.4 10.5l26.3 23.1c1.7 1.5 2.4 3.7 1.9 5.9l-7.9 32.399c-1.2 5.101 4.3 9.3 8.9 6.601l29.1-17.101c1.9-1.1 4.2-1.1 6.1 0l29.101 17.101c4.6 2.699 10.1-1.4 8.899-6.601l-7.8-32.399c-.5-2.2.2-4.4 1.9-5.9l26.3-23.1c3.8-3.5 1.6-10-3.6-10.5z'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: center;
  background-size: 76%;
  transition: .3s;
}

.rating > input:checked ~ label,
.rating > input:checked ~ label ~ label {
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='126.729' height='126.73'%3e%3cpath fill='%23fcd93a' d='M121.215 44.212l-34.899-3.3c-2.2-.2-4.101-1.6-5-3.7l-12.5-30.3c-2-5-9.101-5-11.101 0l-12.4 30.3c-.8 2.1-2.8 3.5-5 3.7l-34.9 3.3c-5.2.5-7.3 7-3.4 10.5l26.3 23.1c1.7 1.5 2.4 3.7 1.9 5.9l-7.9 32.399c-1.2 5.101 4.3 9.3 8.9 6.601l29.1-17.101c1.9-1.1 4.2-1.1 6.1 0l29.101 17.101c4.6 2.699 10.1-1.4 8.899-6.601l-7.8-32.399c-.5-2.2.2-4.4 1.9-5.9l26.3-23.1c3.8-3.5 1.6-10-3.6-10.5z'/%3e%3c/svg%3e");
}


.rating > input:not(:checked) ~ label:hover,
.rating > input:not(:checked) ~ label:hover ~ label {
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' width='126.729' height='126.73'%3e%3cpath fill='%23d8b11e' d='M121.215 44.212l-34.899-3.3c-2.2-.2-4.101-1.6-5-3.7l-12.5-30.3c-2-5-9.101-5-11.101 0l-12.4 30.3c-.8 2.1-2.8 3.5-5 3.7l-34.9 3.3c-5.2.5-7.3 7-3.4 10.5l26.3 23.1c1.7 1.5 2.4 3.7 1.9 5.9l-7.9 32.399c-1.2 5.101 4.3 9.3 8.9 6.601l29.1-17.101c1.9-1.1 4.2-1.1 6.1 0l29.101 17.101c4.6 2.699 10.1-1.4 8.899-6.601l-7.8-32.399c-.5-2.2.2-4.4 1.9-5.9l26.3-23.1c3.8-3.5 1.6-10-3.6-10.5z'/%3e%3c/svg%3e");
}

.content {
	 margin: 10px 10px;
    padding: 10px 10px;
}

.btngroups{
    display: flex;
	justify-content: center;
    padding: 20px 0px;
}

.btn {
	display:block;
	float: left; 
	width: 140px;
    height: 40px;
    margin: 10px 10px;
    padding: 10px 10px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 2px solid #015B28;
    background-color: white;
    cursor: pointer;
    
}
/* #in {
	background-color: #015B28;
	color: white;
}  */

placeholder {
	color: gray;
}

</style>

<script>

	function popupClose(form){
		form.target = opener.name;
		form.submit();
		if(opener != null) {
			opener.insert = null;
			
			self.close();
		}
	}
	
  	$(function(){
  		
		$(".cancel").click(function(){
			window.close();
		});
		
		$("#in").click(function(){
			
			if ($("input[name=score]:radio:checked").length < 1) {
				alert("별점을 체크하세요");
				return false;
			}
		
		})
	
	}) 
	


</script>

<body>
<div class="container">
<form name="writeRv" method="get" action="review.do" target="parentPage">
	<div class="head">
	<p class="title">후기쓰기</p>
	</div>

	
	<div class="starbox">
		<p class="star">MEROOM과 함께한 시간 어떠셨나요?</p>
		<div>
			<div class="rating">
		 	  <input type="radio" class="rating"name="score" id="rating-5" value="5">
			  <label for="rating-5"></label>
	  	      <input type="radio" class="rating" name="score" id="rating-4" value="4">
		      <label for="rating-4"></label>
		      <input type="radio" class="rating" name="score" id="rating-3" value="3" >
		      <label for="rating-3"></label>
		      <input type="radio" class="rating" name="score" id="rating-2" value="2">
		      <label for="rating-2"></label>
		      <input type="radio" class="rating" name="score" id="rating-1" value="1">
		      <label for="rating-1"></label>
			</div>
		
		</div>
	</div>
	<div class="content">
		<p class="star">좀 더 자세히 적어주세요</p>
		<div class="textbox">
			<textarea name="rv_content" class="tbox" placeholder="최소 10자 이상 입력해주세요" required></textarea>
		</div>
	</div>
		<div class="btngroups">
		<button class="btn cancel">취소</button>
		<button type="submit" id="in" class="btn input" onclick="window.close()">등록</button>
		<input type="hidden" id="room" name="r_idx" value="${param.r_idx }">
	</div>
</form>
</div>


</body>
</html>