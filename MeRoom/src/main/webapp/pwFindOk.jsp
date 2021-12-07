<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--폰트어섬추가 -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<style>
.result{
    text-align: center;
    font-size: 20px;
    font-weight: bold;
}
.content{
    font-size: 17px;
}
.panel-default>.panel-heading{
    background-color : #f5f5f5;
    color:  black;
}

.button-box{
    display: flex;
    justify-content: center;
}
.btn{
    margin:  0 0;
    margin-top: 20px;
    width: 130px;
}
span{
    font-weight: 600;
    color: red;
}



</style>
<body>
<%@ include file="mainheader.jsp" %>

       
       <div class="wrap" >
 
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
                   
                <div class="panel-heading">
                    
                    비밀번호 찾기
                </div>
                <div class="panel-body">
                    <p class="result"><p>
                        <hr>
                        <br>
                    <p class="content">임시 비밀번호가 성공적으로 보내졌습니다.</p>
                    <br>
             
                </div>
            </div>
            <div class="button-box">
            <input type="button" class="btn btn-default btn01"  value="로그인" onclick="loginReal.jsp">

         
         <br><br>
        </div>     
        <br><br>

        </div>
    </div>
   </body>





<%@ include file="mainfooter.jsp" %>
</body>
</html>