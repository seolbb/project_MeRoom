<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--폰트어섬추가 -->
<!--  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
 <link rel="stylesheet" href="css/login.css">
<style>


#llogin {
	display:block;
    height: 50px;
    margin: 0 auto;
    margin-top: 20px;
    width: 350px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 1px solid #ccc;
    background-color: #fff;
    border-radius:4px;
}


</style>

</head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

//카카오로그인


</script>


<body>
<%@ include file="mainheader.jsp" %>
   
    <form action="login.do" method="post" id="frm">
       
       <div class="wrap" >
 
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
	                <div class="panel-heading">
	                    로그인
	                </div>
	                <div class="panel-body">
	                    <input type="text" id="id" class="input form-control" name="memberId" placeholder="ID">
	                    <br>
	                      <input type="password" id="pwd" class="input form-control" name="password" placeholder="비밀번호">
	                    <br>
	                    <br>
	                </div>
				</div>
            <button type="submit" id="llogin" class="bbtn" value="Login">로그인</button>
            <br>
            <div class="out">
           	<a href="kakao.do">
	            <img class="logo" alt="kakao" src="img/kakao.png"></a>
	        <a href="naver.do">
	            <img class="logo" alt="naver" src="img/naver.png"></a>
	            <img class="logo" alt="naver" src="img/google.png" >
            </div>
         <br><br>
            <div class="bottom-menu">
                <a href="javascript :join_go();">회원가입</a>
                <a href="javascript:findId_go();">아이디 찾기</a>
                <a href="javascript:findPwd_go();">비밀번호 찾기</a>
            </div>
        </div>
    </div>
    
   </form>
   
   
<%@ include file="mainfooter.jsp" %>
</body>
</html>