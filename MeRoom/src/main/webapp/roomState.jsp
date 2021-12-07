<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 숙박예약함</title>
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
function cancelBtn(){
   let IMP = window.IMP;
   IMP.init("imp58969486");
   
   
   let result = {
      "rIdx" : '201051524320', //예약 번호 받아서 입력해야함 !!!
      "rfInfo" : '[주문자 취소]환불조건에 따라 환불처리',
      "rfMoney" : '24000'
   }
   
   $.ajax({
      url : "reserRefund.do",
      type : "post",
      contentType : 'application/json;charset=utf-8',
      data: JSON.stringify(result),
      
   success:function(result){
      console.log(result)
      alert('정상적으로 환불이 되었습니다.');
   }, error : function(request,status,error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
      }
   });
}


</script>
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
         <div class="subT"><ul><li>다가올 예약</li></ul></div>
      <table class="list">
      	<c:if test="${empty rsList }">
      		<thead>
		         <tr class="tb">
		            <th>객실</th>
		            <th>객실명</th>
		            <th>옵션정보</th>
		            <th>객실요금</th>
		            <th>인원</th>
		            <th>총 결제금액</th>
		            <th>취소</th>
		         </tr>
        	</thead>
			<tr>
			<td colspan="7">예약사항이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty rsList }">
		<c:forEach var="rsList" items="${rsList }">
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
               <td class="item-room">${rsList.rm_kind }</td>
               <td id="info" class="item-info">
                  예약번호 : ${rsList.r_idx }<br>
                  체크인 : ${rsList.r_start_date }<br>
                  체크아웃 : ${rsList.r_end_date }<br>
                  결제수단 : ${rsList.pay_mns }
               </td>
               <td class="item-price">${rsList.rm_price }</td>
               <td class="item-count">${rsList.pay_point }</td>
               <td class="item-total">${rsList.price }</td>
               <td class="item-cancel"><button class="btn" onclick="location.href='reserRefund.do?rIdx=${rsList.r_idx}&rfMoney=${rsList.price }'">예약취소</button></td>
               
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