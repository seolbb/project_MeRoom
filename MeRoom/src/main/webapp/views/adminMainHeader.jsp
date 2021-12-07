<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8">
<title></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
    /*공통 부분 */
a{
    text-decoration: none;
    color: #000;
}
.header{
    max-width: 1180px;
    margin: 0 auto;
    padding: 0 0%;
    position: relative;
    align-items: center;
    display: flex;
    height: 100px;
    justify-content: space-between;
    border-bottom: 1px solid lightgray; 
}
.header .logo{
    display: flex;
    align-items: center;
}

.right-nav{
    display: flex;
    align-items: center;
    list-style: none;
}
.img__link > span{
    text-align: center;
    margin-left: 13px;
    font-weight: 500;
    font-size: 14px;
    color: #015B28;
}
.header .main__link{
	text-align: center;
    margin-left: 30px;
    padding: 0;
    background: transparent;
    font-weight: 500;
    font-size: 18px;
    line-height: 19px;
    color: #015B28;
}
.header .sub__link{
    margin-right: 30px;
    padding: 0;
    background: transparent;
    font-weight: 500;
    font-size: 15px;
    line-height: 19px;
    color: #015B28;
}
.header .main__link:hover, .sub__link:hover {
    color:  black;
    text-decoration: underline;
}
#reser{       
	border-style: solid;
	color: #015B28;
	margin: auto;
	padding: 10px 10px;
}     
#reser:hover{
    color: black;	
}
</style>   
<body> 
	<header class="header">
    	<div class="logo">
			<a class="img__link" href="/mr/views/management/mgmtMain.jsp"><img src="/mr/img/MEROOM11.png" alt="logo" width="100" ><br><span>관리자페이지</span></a>
			<a class="main__link" href="/mr/views/management/mgmtMain.jsp">영업</a><!-- jsp -> controller 변경예정 -->
			<a class="main__link" href="/mr/getEnjoyListAdmin.do">정보</a>
<!-- 			<a class="main__link" href="/mr/views/system/systemMain.jsp">시스템</a> -->
		</div>  
		<ul class="right-nav">
			<li><a class="sub__link" href="#">#종대의(관리자)</a></li>
			<li><a id="reser" class="sub__link" href="/mr/main.jsp">메인으로</a></li>
		</ul>
	</header>
</body>
</html>
