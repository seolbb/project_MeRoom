<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 숙박예약함</title>
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
	text-align: left; 
	padding: 15px 20px;
}

.content {
	border-bottom: 1px solid #e4e4e4;
 	color: #A9A9A9;
}

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
    font-size: 32px;
    font-weight: 500;
    letter-spacing: -0.05em;
    margin-bottom: 40px;
}

.subTGrp {
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
<body>
<%@ include file="mainheader.jsp" %>

<div id="wrap">
   <div class="con">
   		 <div class="title">나의 숙박예약함</div>
         <div class="subTGrp">
	         <a class="subT" href="roomState.do">다가올 예약</a>
	         <div class="subT">&nbsp;&nbsp; / &nbsp;&nbsp;</div>
	         <a class="subT" href="roomPassed.do">지난 예약</a>
	         <div class="subT">&nbsp;&nbsp; / &nbsp;&nbsp;</div>
	         <a class="subT" href="roomCancel.do">취소 예약</a>
         </div>
         <br>
         <div class="subT"><ul><li>취소된 예약</li></ul></div>
   	
      <table class="list">
      <c:if test="${empty cancelList }">
      		<thead>
		         <tr class="tb">
		            <th>객실</th>
		            <th>객실명</th>
		            <th>옵션정보</th>
		            <th>객실요금</th>
		            <th>포인트 사용</th>
		            <th>총 결제금액</th>
		            <th>취소</th>
		         </tr>
        	</thead>
			<tr>
			<td colspan="7">취소된 내역이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty cancelList }">
		<c:forEach var="cancelList" items="${cancelList }">
         <thead>
         <tr class="tb">
            <th>객실</th>
            <th>객실명</th>
            <th>옵션정보</th>
            <th>객실요금</th>
            <th>포인트 사용</th>
            <th>총 결제금액</th>
            <th>취소</th>
         </tr>
         </thead>
         
         <tbody>
            <tr class="item content">
               <c:set var="thumb" value="${rsList.file_name}"></c:set>
               <c:set var="thumbimg" value="${fn:substringBefore(thumb, ',') }"></c:set>
               <td class="item-img"><img src="./images/uploadFiles/${thumbimg }" width="100" height="100"></td>
               <td class="item-room">${cancelList.rm_kind }</td>
               <td id="info" class="item-info">
                  예약번호 : ${cancelList.r_idx }<br>
                  체크인 : ${cancelList.r_start_date }<br>
                  체크아웃 : ${cancelList.r_end_date }<br>
                  취소날짜 : ${cancelList.rf_cancel }
               </td>
               <td class="item-price">${cancelList.rm_price }</td>
               <td class="item-count">${cancelList.pay_point }</td>
               <td class="item-total">${cancelList.rf_money }</td>
               <td class="item-cancel">취소완료</td>
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