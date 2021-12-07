<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MeRoom main</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
  <style>

/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 600px;
}

.carousel-inner {
	width: 97%;
	margin: 0 auto;
}

.carousel-item active img {
	margin: 0 auto;
	width: 600px;
	background-image: cover;
}

.promotion {
	letter-spacing: 4px;
	display: block;
	margin: 30px 0px;
	text-align: left;
	margin: 0 auto;
}

.column {
	float: left;
	width: 33.33%;
	padding: 5px;
	text-align: center;
}

.row {
	margin: 0 auto;
}

.row::after {
	content: "";
	clear: both;
	display: table;
}

.promo {
	text-align: center;
	font-size: 24px;
	font-family: 'Noto Sans KR', sans-serif;
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
	transform: scale(1.1); 
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

.div-wrap {
	overflow: hidden;
	position: relative;
	color: black;
}


rent_car {
 position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}



.div-wrap img {
	height: 500px;
}

.sub{
	position: relative;

}

.main-title {
	position: absolute;
	top : 40%;
	left: 0.1px;
	z-index: 1;
	color : white;
	width : 100%;
	text-align : center;
	font-size : 35px;
	font-family: 'Noto Sans KR', sans-serif;


}


.main-content{
	font-size : 25px;
	color : white;

}



.title {
	position: absolute;
	top : 35%;
	left: 0.1px;
	z-index: 1;
	color : white;
	width : 100%;
	text-align : center;
	font-size : 28px;
	font-family: 'Noto Sans KR', sans-serif;	


}

.content{

	font-size : 20px;

}


.explore {
	font-size: 25px;
	text-align: center;
	font-weight: 700;
	color: #015B28;
	letter-spacing: 3px;
}

.explore:hover {
	text-decoration: none;
	color: #015B28;
}

.div-wrap-place{
	margin-left: 20px;
	overflow: hidden;
	position: relative;
	color: black;
	width: 50%;
	height: 50%;


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
	font-family: 'Noto Sans KR', sans-serif;
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
	width: 1180px;
}


.column {
	float: left;
	
	padding: 5px;
}


.nw {
	letter-spacing: 4px;
	display: block;
	width: 1180px;
	margin: 30px 0px;
	text-align: left;
	margin: 0 auto;
}

.newsbottom {
	width: 1180px;
	border-top: 2px solid #bcbcbc;
	margin: 30px 0px;
	text-align: left;
	margin: 0 auto;
}

.newsbox_1 {
	width: 1180px;
}

.newsbox1_1 img {
	height: 100px;
}

 .image12 {
	width: 100%;
	
}

 .newsbox_2 {
	
}

.margin {

	padding-top: 80px;

}

.margin img {
	transform: scale3d(1, 1, 1) rotate(0deg);
	transition: 1s transform;
	will-change: transform;
	transform-origin: 50% 50%;
	overflow: hidden;
	width:300px;
	height : auto;
}

.margin img:hover {
	cursor: pointer;
	transform: scale(1.05); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
	-o-transform: scale(1.05);
	-moz-transform: scale(1.05);
	-webkit-transform: scale(1.05);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

.nov {
	font-weight: 500px;
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}

.margin_2 {
	padding-top: 80px;

}

.image13 {
	width: 100%;
	
}

.margin_2 img {
	transform: scale3d(1, 1, 1) rotate(0deg);
	transition: 1s transform;
	will-change: transform;
	transform-origin: 50% 50%;
	overflow: hidden;
	width:50%;
}

.margin_2 img:hover {
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

.nov_2 {
	font-weight: 500px;
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
}

.news_text {
	float: right;



}

.div-wrap-news{
	margin-left: 20px;
    overflow: hidden;
    position: relative;
    color: black;
    width: 50%;



}


.slideshow-container{
	margin: 0 auto;
	display: flex;
	padding: 3px;
    display: flex;
    width: 45%;
    float: right;
	margin-top: -547px;
}


.slideshow-containe img {
	transform: scale3d(1, 1, 1) rotate(0deg);
	transition: 1s transform;
	will-change: transform;
	transform-origin: 50% 50%;
	overflow: hidden;
	width:50%;
}

.slideshow-containeimg:hover {
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

.bookclub{

	position: relative;
	bottom: 57%;
	left: 23%;
	z-index: 1;
	color : white;
	width : 100%;
	text-align : center;
	font-size : 37px;
	font-family: 'Noto Sans KR', sans-serif;	
	

}


.bookclub a{
	style : none;
	
}

.bookclub_content{

	font-size : 27px;

}



</style> 
 


<body>

	<%@ include file="mainheader.jsp"%>

<br>
	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
			<li data-target="#demo" data-slide-to="4"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/treetree.jpg" alt="christmas"><span class="main-title">12월, 미룸에서 보내는 크리스마스<br>
				<span class="main-content">사랑하는 사람들과 추억을 만드세요.</span></span></div>
			<div class="carousel-item">
				<img src="img/lobby.jpg" alt="tree"><span class="main-title">워케이션, 여행하며 출근해요<br>
				<span class="main-content">회의 공간에서 일할 수 있어요.</span></span></div>
			<div class="carousel-item">
				<img src="img/suiteroom.jpg" alt="christmas"><span class="main-title">편안한 공간에서 휴식<br>
				<span class="main-content">휴식하면서 배우는 액티비티가 준비되어 있어요</span></span></div>
				
			<div class="carousel-item">
	            <img src="img/resto.jpg" alt="christmas"><span class="main-title">멋진 디너를 즐겨요<br>
	            <span class="main-content">주변 맛집을 추천해드려요.</span></span></div>
	            
	         <div class="carousel-item">
	            <img src="img/starstar.jpg" alt="christmas"><span class="main-title">제주의 밤하늘,<br>
	            <span class="main-content">미룸과 같이 걸어봐요.</span></span></div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<br>
	<br>

	<div class="row">
		<div class="column">
			<div class="div-wrap">
			<div class="sub"><a href="#"><img src="img/benz.jpg" alt="car" style="width: 100%"></a><span class="title">렌터카 예약하기 <br><span class="content"> 렌터카 예약도 미룸과 함께하세요</span></span></div>
			</div>
		</div>
	<div class="column">
		<div class="div-wrap">
			<div class="sub"><a href="#"><img src="img/dounut.jpg" alt="place" style="width: 100%"></a><span class="title">플레이스 둘러보기 <br><span class="content"> 맛집을 둘러보세요</span></span></div>
		</div>
	</div>
	<div class="column">
		<div class="div-wrap">
			<div class="sub"><a href="#"><img src="img/fall.jpg" alt="fall" style="width: 100%"></a><span class="title">11월 제주 둘러보기 <br><span class="content"> 제주의 늦가을 </span></span></div>
		</div>
	</div>
</div>



	<br>
	<br>
	<a class="explore" href="#"><p> EXPLORE PLACE</p></a>
	
	<br>
	<br>
	
	<div class="row_second">
		<div class="column col_second">     
			<div class="div-wrap-place">
			<div class="promo_p">
			<a href="#"><img src="img/dinner.jpg" alt="restorant" style="width: 98%"><span class="title">미룸이 추천하는 디너 <br><span class="content">성산에서 가장 맛있는 레스토랑</span></span></a>
			
			</div>
			</div>
			
			<div class="div-wrap-place">
			<div class="promo_p">
			<a href="#"><img src="img/mocha.jpg" alt="cafe" style="width: 100%"><span class="title">성산에서 분위기 좋은 카페<br><span class="content">인스타 감성이 있는 카페</span></span></a>
			</div>
			</div>
		</div>
	</div>

	

	<br>
	<br>
	<br>
	<br>
	<br>
	
	<div class="news">
		<p class="nw">NEWS</p>
		<br>
		<br>
	
	<div class="newsbottom">
			<div class="newsbox_1">
				<div class="image12">
					<div class="margin">
					<div class="div-wrap-news">
						<a href="#"><img src="img/christmas.jpg" alt="news"></a>
						<div class="news_text">
						<p class="nov">12월, 크리스마스는 미룸과 함께</p>
						<p class="fall">12월, 미룸에서 보내는 크리스마스<br>
							사랑하는 사람들과 성산을 걸으며<br>
							미룸에서 편안한 휴식을 보내는 여행<br></p>
							<p>2021. 11. 17</p>
						</div>
							</div>
					</div>
					
					
				<div class="margin_2">
						<div class="div-wrap-news">
							<a href="#"><img src="img/fallfall.jpg" alt="news"></a>
							<div class="news_text">
							<p class="nov_2">11월, 늦가을의 제주 미룸</p>
							<p class="fall_2">늦은 가을 제주의 풍경과 미룸에서의 시간<br>
							천천히 제주 가을 속을 걸으며<br>
							정취와 낭만을 만끽하는 여행.<br></p>
							<p>2021. 11. 3</p>
							</div>
							</div>
							</div>
							
					
					<div class="slideshow-container">
						<div class="mySlides_fadet"><a href="#"><img src="img/bookstore.jpg" alt="bookclub" style="width: 100%"><span class="bookclub">
						북클럽 '책인아웃'<br><span class="bookclub_content">'책인아웃' 멤버 모집 중</span></span></a>
						</div>
						
					</div>		
				</div>


				
					</div>
				</div>
			</div>

		<br>
		<br>
		<br>




  
  
  
  
  <%@ include file="mainfooter.jsp"%>
  


</body>
</html>