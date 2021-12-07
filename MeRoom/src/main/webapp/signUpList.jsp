<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--폰트어섬추가 -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
<style>
.wrap {height: 810px;}

.panel-body {
	text-align : center;

}

.btn {
	display:block;
    height: 50px;
    margin: 0 auto;
    margin-top: 20px;
    width: 300px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 2px solid #015B28;
    background-color: #fff;
    border-radius: 0px;
}

.text{
	font-family: Arial, Sans-serif;
}

</style>



<body>
<%@ include file="mainheader.jsp" %>

	    
	    <div class="wrap" >
 
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
                
                <div class="panel-heading">
                    회원가입
                </div>
                <br>
                <div class="panel-body">
                	<button class="btn">회원가입</button>
                	<br><br><br>
                
                	<div class="panel text">
           			SNS 아이디로 간편가입하기
           			</div>
           			
                	<div class="out">
			            <img class="logo" alt="kakao" src="img/kakao.png" >
			            <img class="logo" alt="naver" src="img/naver.png">
			            <img class="logo" alt="naver" src="img/google.png" >
		            </div>
                  
                </div>
                  <br>

                </div>
            </div>

        </div>





<%@ include file="mainfooter.jsp" %>
</body>
</html>