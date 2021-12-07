<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 
	
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<meta charset="UTF-8">
<title>News main</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #000;
}

h3 {
	text-align: center;
	font-family: Arial, Sans-serif;
	font-size: 16px;
	font-weight: 500;
}

.body__container {
	font-family: Arial, Sans-serif;
	font-size: 16px;
	font-weight: 500;
	color: #333;
}

.container-full {
	margin: 0 auto;
}

.main_image {
	margin: 0 auto;
}

.main_image img {
	display: flex;
	width: 100%;
	height: 600px;
}


.main-title {
	position: absolute;
	top : 31%;
	left: 0.1px;
	z-index: 1;
	color : white;
	width : 100%;
	text-align : center;
	font-size : 35px;
	font-family: Arial, Sans-serif;
	padding: 30px;

}


.main-content{
	bottom: 70%;
	font-size : 20px;
	color : white;
	font-family: 'Noto Sans KR', sans-serif;
	
}




div(style:padding-left ~right:30px) {
	div (style: height:600px){
    <img>
    div(style : line-height : 1;
	font-size: 40px;
	color: #fff;
	top: 50%;
	transform: translateY(-50%);
	animation-name: top-image-title;
	){
	<
	span
	>
}

div(style:bottom: 70px ; font-size: 14px ; color: #fff ; animation-name: top-image-summary 
	 ;) { <span >
	
}

}
}


.nw_bar{

	width: 1180px;
  	margin: 0 auto;
    padding: 10px;



}

.nw {
	text-align: left;
 	letter-spacing: 5px;
    display: flex;
    float: left;
    margin:22px auto;
}


.nw_p {

	text-align: right;
	letter-spacing: 5px;
    display: flex;
    justify-content: flex-end;
    font-size: 12px;
    padding: 15px;
    color:gray;
    margin: 5px auto;
    font-family: Arial, Sans-serif;



}



.newsbottom {
	max-width: 1180px;
	border-top: 2px solid #bcbcbc;
	margin: 30px 0px;
	text-align: left;
	margin: 0 auto;
}

.newsbox_1 {
	width : 100%;
	display: flex;

}

.newsbox1_1 img {
	height: 100px;
}

.image12 {

	border-right: 2px solid #bcbcbc;
}

.newsbox_2 {
	width : 50%;
	float:left;
}

.margin {
	text-align: center;
	padding-top: 80px;
}

.margin img {
	transform: scale3d(1, 1, 1) rotate(0deg);
	transition: 1s transform;
	will-change: transform;
	transform-origin: 50% 50%;
	overflow: hidden;
	width: 100%;
}


.margin img:hover {
	cursor: pointer;
	transform: scale(1.1);
	-o-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

.nov {
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight: 500px;
	font-size: 20px;
}

.margin_2 {
	text-align: center;
	padding: 80px;
}

.margin_2 img {
	transform: scale3d(1, 1, 1) rotate(0deg);
	transition: 1s transform;
	will-change: transform;
	transform-origin: 50% 50%;
	overflow: hidden;
}

.margin_2 img:hover {
	cursor: pointer;
	transform: scale(1.1); 
	-o-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

.nov_2 {
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 20px;
}

.promotion {
	width: 1180px;
    border-bottom: 2px solid #bcbcbc;
  	margin: 0 auto;
    padding: 10px;
	
}

.promotion_p {
	text-align: left;
 	letter-spacing: 5px;
    display: flex;
    float: left;
    margin:22px auto;


}

.promotion_detail {
	text-align: right;
	letter-spacing: 5px;
    display: flex;
    justify-content: flex-end;
    font-size: 12px;
    padding: 15px;
    color:gray;
    margin: 5px auto;
    font-family: Arial, Sans-serif;

}


.row_second {

	width: 1180px;
	margin-left: auto;
	margin-right: auto;

}

.row_second::after{
	content: "";
	clear: both;
	display: table;
}



.col_second{
	display:flex;
	width: 100%;
}


.column {
	float: left;
	
	padding: 5px;
}
.row_third::after{
	content: "";
	clear: both;
	display: table;
}
.row {
	width: 1100px;
	margin-left: auto;
	margin-right: auto;
}

.row::after {
	content: "";
	clear: both;
	display: table;
}

.promo_p {
	margin: 0 auto;
}

.promo {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 24px;
}

.row, .column {
	overflow: hidden;
}

.column img {
	transform: scale3d(1, 1, 1) rotate(0deg);
	transition: 1s transform;
	will-change: transform;
	transform-origin: 50% 50%;
	overflow: hidden;
}

.column img:hover {
	cursor: pointer;
	transform: scale(1.1); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
	-o-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

.promo_content {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 15px;
}

.detail {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 15px;
}

.line {
	border-bottom: 2px solid #bcbcbc;
	width: 1180px;
	margin: 0 auto;
}

.row_third{

	width: 1100px;
	margin-left: auto;
	margin-right: auto;


}


.event {
	width: 1180px;
    border-bottom: 2px solid #bcbcbc;
  	margin: 0 auto;
    padding: 10px;
}

.event_pp {
	text-align: left;
 	letter-spacing: 5px;
    display: flex;
    float: left;
    margin:22px auto;
}

.event_detail {
	letter-spacing: 5px;
	text-align: right;
    display: flex;
    justify-content: flex-end;
    font-size: 12px;
    padding: 15px;
    color:gray;
    margin: 5px auto;

}


.eve {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 24px;
}

.eve_content {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 15px;
}

.eve_detail {
	text-align: center;
	font-family: 'Nanum Gothic Coding', monospace;
	font-size: 15px;
}

.div-wrap {
	overflow: hidden;
}


.col_third{
	display:flex;
	width: 100%;
}

</style>
</head>
<body>

	<%@ include file="mainheader.jsp"%>


	<div class="body__container">
		<div class="container-full">
			<div class="main_image">
				<img src="img/christmas2.jpg"><span class="main-title">News<br>
				<span class="main-content">MeRoom in Jeju 소식을 알려드립니다. </span></span>
			</div>
		</div>
	</div>
	<br>


	<div class="news">
		<div class="nw_bar">
		<p class="nw">NEWS</p>
		<a class="nw_p" href="getNewsList.do">DETAIL</a>
		</div>
		<br>
		<div class="newsbottom">
			<c:if test="${not empty newsList }">
			<div class="newsbox_1">
			  <c:forEach var="news" items="${newsList }" begin="1" end="2">
				<div class="image12">
					<div class="margin">
					<div class="div-wrap">
						<a href="getNews.do?neIdx=${news.neIdx }"><img src="/newsupload/${news.neThumbnail }" alt="news"/></a>
							<p class="nov">${news.neTitle }</p>
							<p class="fall_2">${news.neSubtitle }</p><br>
							<a href="getNews.do?neIdx=${news.neIdx }"><p>자세히 보기 </p></a>
						</div>
						</div>
						</div>
						</c:forEach>
						</div>
					
					</c:if>
				</div>
				</div>
				
	<br>
	<br>
	<br>
	<br>
	
	<div class="promotion">
		<p class="promotion_p">PROMOTION</p>
		<a class="promotion_detail" href="getPromotionList.do">DETAIL</a>
		<br>
	</div>
	
	<br>
	<div class="row_second">
	<c:if test="${not empty promotionList }">
		<div class="column col_second">     
		  <c:forEach var="promotion" items="${promotionList }" begin="1" end="3">
			<div class="div-wrap">
			<a href="getPromotion.do?prIdx=${promotion.prIdx }"><img src="/promotionupload/${promotion.prThumbnail }" alt="promotion" /></a>
			<div class="promo_p">
			<p class="promo">${promotion.prTitle }</p><br>
			<p class="promo_content">${promotion.prSubtitle }</p><br>
			<a href="getPromotion.do?prIdx=${promotion.prIdx }"><p class="detail">더보기</p></a>
			
			</div>
			</div>
			</c:forEach>
		</div>
	</c:if>
	</div>
 	<br>
	
	<br>
	<div class="event">
		<p class="event_pp">EVENT</p>
		<a class="event_detail"  href="getEventList.do" >DETAIL</a>
		<br>
	</div>
	<br>
	
		<div class="row_third">
		<c:if test="${not empty eventList }">
		<div class="column col_third">
    	  <c:forEach var="event" items="${eventList }" begin="1" end="3">
		<div class="div-wrap">
			<a href="getEvent.do?evIdx=${event.evIdx }"> <img src="/eventupload/${event.evThumbnail }" alt="event"/></a>
			
			<div class="event_p">
			<p class="eve">${event.evTitle }</p><br>
			<p class="eve_content">${event.evSubtitle }</p><br>
			<a href="getEvent.do?evIdx=${event.evIdx }"><p class="eve_detail">더보기</p></a>
			 </div>
			
			
			</div>

			  </c:forEach>
			</div>
		
  			</c:if>
		
	</div>


	
	<br>
	<br>

	<%@ include file="mainfooter.jsp"%>

</body>
</html>