<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
<h1>성공성공성공</h1>
<form action="rsvRefund.do"  method="post">
	<button id="submit-btn">예약 취소</button>
</form>
<script>
$('#submit-btn').click(function(){
	   
	   let result = {
	      "orIdx" : '121102115149709',
	      "orfMoney" : '2000'
	   }
	   
 	   $.ajax({
	      url : "rsvRefund.do",
	      type : "post",
			data : JSON.stringify(result),
			contentType:'application/json',
			dataType: 'json',
	   	  success:function(result){
	      console.log(result)
	      alert('정상적으로 환불이 되었습니다.');
	   }, error : function(request,status,error){
	      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
	      }
	   }); 
	});
</script>
</body>
</html>