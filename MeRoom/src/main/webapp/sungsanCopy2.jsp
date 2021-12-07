<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mainheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fe93fd259e379f4433d83e2cf4ecc9"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta charset="UTF-8">
<title>성산일출봉</title>
<style>
.mainphoto img { /* 가장 맨 위 사진 */
	width: 100%;
	height: 500px;
}

.mainphoto {
	padding-left: 30px;
	padding-right: 30px;
	padding-bottom: 50px;
}

.main {
	padding-bottom: 50px;
}

.container {
	width: 1180px;
	margin: 0 auto;
	text-decoration: none;
}

.content {
	width: 1180px;
	height: 500px;
	display: flex;
	margin: 0 auto;
	padding-bottom: 50px;
}

.text {
	padding-left: 50px;
	width: 680px;
	height: 500px;
	margin: 0;
	border: 1px solid black;
}

#map {
	width: 500px;
	height: 500px;
	padding-left: 50px;
}

.sliders {
	overflow: hidden;
	width: 1180px;
	margin: 0 auto;
	padding-bottom: 50px;
}

.bxslider img {
	width: 100%;
	height: 500px;
}
</style>
<script>
	$(function() {
		$(".bxslider").bxSlider({
			auto : true,
			speed : 500, // 애니메이션 속도
			pause : 3000, // 애니메이션 유지시간 5초
			mode : 'horizontal', // 슬라이드모드 = fade, horizontal, vertical 있다.
		});
	});
</script>
</head>
<body>

	<div class="mainphoto">
		<img alt="sungsan" src="img/jejustone.png">
	</div>

	<div class="main">
		<div class="sliders">
			<ul class="bxslider">
				<li><a href="#"><img src="img/sungsan.jpg" alt="이미지1"></a></li>
				<li><a href="#"><img src="img/sungsan1.jpg" alt="이미지2"></a></li>
				<li><a href="#"><img src="img/sungsan2.jpg" alt="이미지3"></a></li>
			</ul>
		</div>

		<div class="content">
			<div class="text">
				<h1>성산일출봉</h1>
			</div>
			<div id="map"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fe93fd259e379f4433d83e2cf4ecc9&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.45827, 126.94299), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(33.45827, 126.94299);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>

	<%@ include file="mainfooter.jsp"%>
</body>
</html>



