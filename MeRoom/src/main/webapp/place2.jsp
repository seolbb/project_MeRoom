 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mainheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fe93fd259e379f4433d83e2cf4ecc9"></script>
<meta charset="UTF-8">
<title>주변소개</title>

<style>
.mainphoto {
	padding-left: 30px;
	padding-right: 30px;
}

.mainphoto img { /* 가장 맨 위 사진 */
	width: 100%;   
	height: 500px;
}

.main {  /* 사진 + 문구 */
	max-width: 1180px;
	flex-wrap: wrap;
	align-items: flex-start;
/* 	padding-left: 120px;
	padding-right: 120px; */
	margin: 100px auto;
	
}

.bg_img { /* 사진 */
	width: 50%;
	height: 350px;
	margin: 0;
	overflow: hidden;
}

.main img {  /* 사진 크기 */ 
	width: 100%;
	height: 100%;
}

.bg a {
	/* padding-left: 100px;
	padding-right: 100px; */
	width: inherit;
	display: flex;
	margin: 0;
	text-decoration: none;
	color: black;
	
}

.bg_text {
	width: 50%;
	height: 350px;
	margin: 0;
}

.bg_text_align {
	height: 400px;
	padding-top: 100px;
	padding-bottom: 100px;
	text-align: center; 
}

.bg:hover img {
	transform: scale3d(1.08, 1.08, 1.08) rotate(0deg);
    /* display: block; */
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: #f7f7f7;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    transition: 1s transform;
    will-change: transform;
    transform-origin: 50% 50% ;

}


.bg {
	/* display: flex;
	justify-content: center; */ 
}



</style>
</head>
<body>
	<div class="mainphoto">
		 <img alt="enjoy" src="img/background.jpg">
	</div>

	<div class="main">
		<div class="bg">
			<a href="touristCopy6.jsp">
				<div class="bg_img">
					<img alt="dining" src="img/place.jpg">
				</div>
				<div class="bg_text">
					<div class="bg_text_align">
						<h1>tourist</h1>
					</div>
				</div>
			</a>
		</div>
		<div class="bg">
			<a href="touristCopy6.jsp">
				<div class="bg_text">
					<div class="bg_text_align">
						<h1>restaurant</h1>
						
					</div>
				</div>
				<div class="bg_img">
					<img alt="dining" src="img/tastehouse.jpg">
				</div>
			</a>
		</div>
	
	</div>
	<%@ include file="mainfooter.jsp"%>
</body>
</html>




<!-- <div>
	<h1>주변소개</h1>
	<hr>
	<h3>주변소개 및 가볼만한 곳</br>
		도두봉, 이호태우해변, 해안도로, 용담해안도로, 한라수목원, 용두암, 협재해수욕장</h3>
	 
	 <div class=picture_content>
		<div id="map" style="width:300px; height:400px;"></div>
		<script>
			var container = document.getElementById("map");
			var options = {
				center: new kakao.maps.LatLng(37.30477, 127.06093),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
		</script>
	</div> 
</div> -->