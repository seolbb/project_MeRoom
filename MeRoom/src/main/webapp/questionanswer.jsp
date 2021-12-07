<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의 답변</title>
</head>
<style>

p{

	text-align: left;
 	letter-spacing: 4px;
    display: block;
    width: 1180px;
    border-bottom: 1px solid #bcbcbc;
    text-align: left;
    margin: 0 auto;
    padding: 20px;


}


#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: lightblue; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
	

</style>



<body>
	<%@ include file="mainheader.jsp"%>

	<p>일대일 문의 답변</p>
	<br>
	<br>



	<div class="container">
  <form action="insertAnswer.do"  method="post">
  
  
 	<table>
			<tr>	
				<th>회원문의번호</th>
				<td>
					<input type="text" name="qIdx2">
				</td>
			<tr>
			<tr>
				<th >내용</th>
				<td>
					<textarea name="aContent" rows="10" cols="40"></textarea>
				</td>
			</tr>
			<tr>	
				<th>답변유무</th>
				<td>
					<input type="text" name="aYn">
				</td>
			<tr>
			
			
			<tr>
				<td colspan="2" class="center">
					<input type="submit" value="새 글등록" >
				</td>
			</tr>
		</table>	
 
 		</form>
 
</div>		



   <%@ include file="mainfooter.jsp"%> 


</body>
</html>