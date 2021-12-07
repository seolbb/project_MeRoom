<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question list</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		text-align: center;
	}
	th { background-color: lightblue; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>






<body>
		
	<%@ include file="mainheader.jsp"%>	
		
		
	<p>personal question list</p>
	<br>
	<br>
		
	<table>
      <tr>
         <th width="100">번호</th>
         <th width="200">이름</th>
         <th width="150">아이디</th>
         <th width="150">이메일</th>
         <th width="150">문의유형</th>
         <th width="150">제목</th>
      
      </tr>
      <c:if test="${not empty questionList }">
         <c:forEach var="question" items="${questionList }">
         <tr>
            <td class="center">${question.qIdx }</td>
            <td>
           		<a href ="getQuestion.do?qIdx=${question.qIdx }"> ${question.name }</a> 
            </td>
            <td>${question.memberid }</td>
            <td>${question.email }</td>
            <td>${question.anyTyp }</td>
            <td>${question.qTitle }</td>
         </tr>
         </c:forEach>
      </c:if>
      <c:if test="${empty questionList }">
         <tr>
            <td colspan="5" class="center">데이터가 없습니다</td>
         </tr>
      </c:if>
   </table>
   
	
	<p><a href="question.jsp">새 글 등록</a> </p>
	
	<%@ include file="mainfooter.jsp"%>

</body>
</html>