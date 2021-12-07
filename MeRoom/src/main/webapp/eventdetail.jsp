<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>news detail</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<style>

*{

font-family: 'Nanum Gothic Coding', monospace;
box-sizing: border-box;

}

.top_bar {

 	width: 1180px;
    border-bottom: 3px solid #bcbcbc;
  	margin: 0 auto;
    padding: 20px;

}



.top_bar h3{
	text-align: left;
 	letter-spacing: 5px;
    display: flex;
    margin: -5px;
    float: left;
  
}

.top_bar p{
	text-align: right;
    letter-spacing: 5px;
    display: flex;
    justify-content: flex-end;
}

.main {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;

}

.main h3 {
	font-weight: 500px;

}

.center {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
}



.center_2{
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
}

input[type=submit] {
	background-color: white;
	cursor: pointer;
	display:block;
	border-style: solid;
	color: #015B28;
	margin: 0 auto;
	padding: 16px 21px;
	font-weight: 600;
	font-size: 19px;
}

input[type=submit]:hover {
	 color: black;
}

.eventContent{
	max-width: 750px;


}


.center_2 img{
	width:750px;



}


</style>

</head>
<body>

	<%@ include file="mainheader.jsp"%>
	<div class="top_bar">
		<h3>${event.evTitle }</h3>
		<p> ${event.evRegdate }</p>	
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="main">
	<h3>${event.evSubtitle }</h3><br>
	</div> 
 
	<br>
	<br>
	<div class="center">
	<p>+ <br>
	코로나19 예방
	MeRoom에서는 코로나바이러스를 대비해 전 직원 마스크 착용과 프런트 데스크 및 각 업장에 손세정제를 구비해두었습니다. <br>
	또한 정기방역으로 보다 철저하게 준비하고 있습니다. 걱정 없이 안전하게 MeRoom에서 위생관리에 더욱 신경 쓰도록 하겠습니다.</p>

	</div>
	<div class="center_2">
	<p>
	+<br>
	일부 프로그램 및 업장 운영 시간은 코로나19 단계에 따라 상시적으로 변동될 수 있습니다.
	</p>
	<br>
	<br>
	
		<p class="eventContent"> ${event.evContent }</p>
		
		
		<br>
		<div class="row">
  	 	 <a href="getEventList.do"><input type="submit" value="LIST"></a>
  		</div>
		
	</div>
	<br>
	<br>








	<br>
	<br>
	
	
	

 <%@ include file="mainfooter.jsp"%> 

</body>
</html>