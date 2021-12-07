<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
/*공통 부분 */
*{
    box-sizing: border-box;
}
a{
    text-decoration: none;
    color: #000;
}


input{
    font-weight: 500;
    max-width: 100%;
    transition: border .2s ease-in-out;
}

.input:not([type="checkbox"]) {
    outline: none;
}
.w500{
    width: 500px !important;
}

.w15{
    width: 15% !important;

}

.w25{
    width: 25% !important;
}


  /* INPUT */
  .input--text {
    height: 40px;
    width: 400px;
    padding: 0 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px;
    outline: none;
    box-sizing: border-box;
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075); /* .75 아니고 .075 주의 */
  }
  .input--text:focus {
    border-color: #51a7e8 !important; /* header #search 선택자를 덮어쓰기 위해서 사용 */
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075), 0 0 5px rgba(81, 167, 232, .5);
  }
  /* Vendor prefix(브라우저 업체별 접두어) */
  .input--text::-webkit-input-placeholder { color: #cacaca; }
  .input--text:-ms-input-placeholder      { color: #cacaca; }
  .input--text::-moz-placeholder          { color: #cacaca; }

    .name{
        width: 200px;
    }
    .address{
        width: 600px;
    }



#wrap{
    min-height: 610px;
    padding: 30px 0 60px;
    max-width: 1180px;
    margin: 0 auto;

    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 400;
    color: #333;
   
}

.btngroups{
    display: flex;
	justify-content: center;
    padding-top: 20px;
  
}


.h2-Text{
    font-size: 14px;
    color: #999;
    padding-bottom: 17px;
    position: relative;
}

.h2-Text strong{
    display: inline-block;
    font-size: 20px;
    color: #333;
    vertical-align: middle;
}
.tb_main{
    width: 100%;
    color: #333;
    line-height: 1.3em;
}

table{
    table-layout: fixed;
    width: 100%;
    border-collapse: collapse;
}

.tb_main th{
    padding: 10px 10px 6px 20px;
    border-bottom: 1px solid #f1f1f1;
    background-color: #f9f9f9;
    text-align: left;
    vertical-align: middle;
    font-weight: bold;
    height: 50px;
}


.id-check{
    border-top: 2px solid black;
}
.tb_main th strong{
    font-size: 13px;
    font-weight: bold;
}

.tb_main th strong em{
    font-size: 14px;
    color: red;
}
p{
    margin:  0 0px;
}

.tb_main td{
    border-bottom: 1px solid #f1f1f1;
    padding: 10px;
    color: #333;
    vertical-align: middle;
    word-wrap: break-word;
}


#idCheck {
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
  font-weight: 500;
}



.btn {
	display:block;
	float: left; 
	width: 150px;
    height: 50px;
    margin: 10px 10px;
    padding: 10px 10px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 2px solid #015B28;
    background-color: white;
    
    
}


</style>


<script>
$(function(){
	$("#btnclick").click(function(){
			var realPw = "${vo.password}";
			var pwd = $("#pwd").val();
		if (realPw != pwd) {
			alert("비밀번호가 틀렸습니다.");
			return false;
		} else {
			return true;
		}
	});
});

</script>
<body>
<%@ include file="mainheader.jsp" %>

 <div id="wrap">

	<form id="form1" action="delete.do" method="post">
		<div class="h2-Text">
			<strong>회원 탈퇴</strong>
		</div>
		<br>
		<div>
		회원 탈퇴 전, 아래의 내용을 꼼꼼히 확인 하신 후 탈퇴하시길 바랍니다.<br><br>
		1. 탈퇴 후 회원님의 예약내역은 삭제되며, 추후 재가입 하더라도 복구되지 않습니다.<br>
		2. 고객님의 정보는 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 관리되며
		회원 정보 및 관련 기록을 정해진 기간 동안 보관합니다.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;이후 보관기간이 종료되었을 시 회원 정보 및 관련 기록은 지체 없이 파기됩니다.<br>
		</div>
<br><br>
		<table class="tb_main">
			<colgroup>
				<col style="width: 200px">
				<col>
			</colgroup>
			<tr class="id-check">
			<tbody>
				<tr>
					<th><strong>아이디</strong></th>
					<td>
					${vo.memberId }
					<input type="hidden" name="memberId" id="id" value="${vo.memberId }">
					</td>
				</tr>
			
	
				<tr>
					<th><strong>비밀번호<em>*</em></strong></th>
					<td>
					<input type="password" name="password" id="pwd" class="input--text" required>
					</td>
				</tr>
				

				
				<br> 
		          </tbody>
            </table>
     
			<div class="btngroups">
				 <button type="submit" class="btn btn-success" id="btnclick">탈퇴하기</button>
				 <button type="button" class="btn btn-default" id="back01" onclick="history.back()">취소하기</button>
           	 </div>
        </form>    
	 </div>
	<br> 
<%@ include file="mainfooter.jsp" %>

</body>
</html>