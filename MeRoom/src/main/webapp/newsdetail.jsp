<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>news detail</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
</head>
<style>
<style>

*{

font-family: 'Nanum Gothic Coding', monospace;
box-sizing: border-box
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
    margin: -5px;
    display: flex;
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

.center_intro{
   margin: 0 auto;
}

.center_intro img{
   width: 900px;
   height: 500px;
   text-align: center; 
   display: block;
   margin-left: auto;
   margin-right: auto;
   
}

.program{
   text-align: center;


}

.activity {
   color: brown;
   font-size: 23px;
   font-weight: 700;

}


.activity_1{
   font-weight: 600;
   font-size: 19px;

}


.activity_intro{

   text-align: center;
   font-size: 17px;

}


body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}


.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}


.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}


.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}


.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}


.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}


.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
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


.newContent {
   margin: 0 auto;
   text-align: center;


}

.newContent img{
   width : 750px;


}
</style>


</style>


<body>

	<%@ include file="mainheader.jsp"%>
	<br>
	<br>
	<div class="top_bar">
		<h3>${news.neTitle }</h3>
		<p> ${news.neRegdate }</p>	
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="main">
	<h3>${news.neSubtitle }</h3><br>
	</div> 
 

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
	</div>
	<br>
	<br>
	<br>
	
	


			<div class="newContent">
			<p>${news.neContent }</p>
			</div>
			
			




		<br>
		<div class="row">
  	 	 <a href="getNewsList.do"><input type="submit" value="LIST"></a>
  		</div>



	
	

 <%@ include file="mainfooter.jsp"%> 

</body>
</html>