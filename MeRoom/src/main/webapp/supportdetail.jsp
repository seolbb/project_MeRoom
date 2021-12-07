<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>support detail</title>
</head>
<style>

*{
font-family: 'Nanum Gothic Coding', monospace;


}

.top_bar {

 	width: 1180px;
    border-bottom: 3px solid #bcbcbc;
  	margin: 0 auto;
    padding: 20px;

}



.top_bar h3{
	text-align: left;
 	letter-spacing: 5px;
    display: flex;
	
}

.traffic{
	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-weight: 500;
	font-size: 17px;
	border-bottom: 3px solid #bcbcbc;

}


</style>





<body>
		
	<%@ include file="mainheader.jsp"%>
	<div class="top_bar">
		<h3><a href ="getFA.do?fIdx=${fa.fIdx }">${fa.fTitle }</a></h3>
	</div>
	<br>
	<br>
	<div class="traffic">
	<form action="updateFA.do" method="post">
	<input type="hidden" name="fIdx" value="${fa.fIdx }">
	<p>${fa.fContent }<br>

	</p>
	
	<br>
	
	</form>
	
		<p>
			<a href="supportAdminUpdate.jsp">수정</a>
			<a href="deleteFA.do?fIdx=${fa.fIdx }">삭제</a>
			<a href="getFAList.do">목록</a>
		</p>
			
	
	</div>
			
 <%@ include file="mainfooter.jsp"%> 
</body>
</html>