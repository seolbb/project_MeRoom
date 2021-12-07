<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 후기함</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#wrap {min-height: 810px;}
.con {
    margin: 0 auto;
    max-width: 1280px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    padding-left: 40px;
    padding-right: 40px;
}
.con1 {
    margin: 0 auto;
    max-width: 1280px;
    margin-top: 150px;
    margin-left: auto;
    margin-right: auto;
    padding-left: 40px;
    padding-right: 40px;
}
table{
	width: 100%;
    border-top: 2px solid black;
    border-bottom: 1px solid black;
    border-spacing: 2px;
    border-collapse: collapse
    
}
table>thead>tr {
    padding: 12px 0;
    line-height: 20px;
    font-size: 14px;
    font-weight: 500;
}

tbody {
    vertical-align: middle;
}

td, th {
    padding: 15px 5px;
    vertical-align: middle;
    text-align: center;
    
}
.tb{
   border-bottom:1px solid #e4e4e4;
}

#info { 
	text-align: center;
	padding: 15px 20px;
}

.content {
	border-bottom: 1px solid #e4e4e4;
}

.btn{
	background-color: white;
    border: 2px solid #015B28;
    color: #015B28;
    padding: 8px 18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin: 4px 2px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;

}

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
    font-size: 32px;
    font-weight: 500;
    letter-spacing: -0.05em;
    margin-bottom: 40px;
}
.subLink {
	display: flex;
	
}

.subT {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: -0.05em;
    margin-bottom: 25px;
}
</style>
</head>
<script>

	function reviewWrite() {
		window.name = "parentPage";
		window.open('reviewWrite.jsp','후기작성','width=500, height=600, scrollbars=yes');
	}
	

</script>


<body>
<%@ include file="mainheader.jsp" %>

<div id="wrap">
   <div class="con">
   		<div class="title">나의 후기함</div>
   		<div class="subLink">
	   		<a class="subT" href="reviewWriteList.do">후기 작성</a>
	   		<div class="subT">&nbsp;&nbsp; / &nbsp;&nbsp;</div>
	   		<a class="subT" href="getReviewList.do">후기 내역</a>
		</div>      
       <table class="list">
      	<c:if test="${empty rlist }">
      		<thead>
		         <tr class="tb">
		            <th>객실</th>
		            <th>객실명</th>
		            <th>예약번호</th>
		            <th>체크인</th>
		            <th>체크아웃</th>
		            <th>후기</th>
		         </tr>
        	</thead>
			<tr>
			<td colspan="7">작성할 후기 내역이 없습니다</td>
			</tr>
		</c:if>
         <c:if test="${not empty rlist }">
		<c:forEach var="rlist" items="${rlist }">
         <thead>
         <tr class="tb">
            <th>객실</th>
            <th>객실명</th>
            <th>예약번호</th>
            <th>체크인</th>
            <th>체크아웃</th>
            <th>후기</th>
         </tr>
         </thead>
         
         <tbody>
            <tr class="item content">
               <c:set var="thumb" value="${rlist.file_name}"></c:set>
               <c:set var="thumbimg" value="${fn:substringBefore(thumb, ',') }"></c:set>
               <td class="item-img"><img src="./images/uploadFiles/${thumbimg }" width="100" height="100"></td>
               <td class="item-room">${rlist.rm_kind }</td>
               <td id="info" class="item-info">${rlist.r_idx } </td>
               <td class="item-price">${rlist.r_start_date }</td>
               <td class="item-count">${rlist.r_end_date }</td>
               <td class="item-cancel"><button class="btn" onclick="window.open('reviewWrite.jsp?r_idx=${rlist.r_idx }','후기작성','width=600, height=600, scrollbars=yes')">후기쓰기</button></td>
               
            </tr>

         </tbody>
         </c:forEach>
      </c:if>
      
      
      </table>
      
   </div>

</div>


<br><br><br>

<%@ include file="mainfooter.jsp" %>
</body>
</html>