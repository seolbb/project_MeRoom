<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 1DAYCLASS 예약함</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
   text-align: left; 
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
<script>

</script>
<%@ include file="mainheader.jsp" %>

<div id="wrap">
   <div class="con">
         <div class="title">나의 1DAYCLASS 예약함</div>
         <div class="subTGrp">
	         <a class="subT" href="onedayState.do">다가올 예약</a>
	         <div class="subT">&nbsp;&nbsp; / &nbsp;&nbsp;</div>
	         <a class="subT" href="onedayPassed.do">지난 예약</a>
	         <div class="subT">&nbsp;&nbsp; / &nbsp;&nbsp;</div>
	         <a class="subT" href="onedayCancel.do">취소 예약</a>
         </div>
         <br>
         <div class="subT"><ul><li>지난 예약</li></ul></div>

      <table class="list">
      	<c:if test="${empty oneList }">
      		<thead>
		         <tr class="tb">
		            <th>클래스</th>
		            <th>클래스명</th>
		            <th>옵션정보</th>
		            <th>수량</th>
		            <th>총 결제금액</th>
		         </tr>
        	</thead>
			<tr>
			<td colspan="7">지난 예약내역이 없습니다</td>
			</tr>
		</c:if>
         <c:if test="${not empty oneList }">
		<c:forEach var="oneList" items="${oneList }">
         <thead>
         <tr class="tb">
            <th>클래스</th>
		    <th>클래스명</th>
		    <th>옵션정보</th>
		    <th>수량</th>
		    <th>총 결제금액</th>
         </tr>
         </thead>
         
         <tbody>
            <tr class="item content">
                <td class="item img"><img src="/upload/${oneList.oImg }"  width="100" height="100"></td>
               <td class="item one">${oneList.oName }</td>
               <td id="info" class="item">
                  예약번호 : ${oneList.orIdx }<br>
                  수강날짜 : ${oneList.orDate }<br>
                  수강시간 : ${oneList.orTime }<br>
                  수강장소 : ${oneList.oLocation }
               </td>
               <td class="item count">${oneList.orCount }</td>
               <td class="item total">${oneList.opMoney }원</td>
               
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