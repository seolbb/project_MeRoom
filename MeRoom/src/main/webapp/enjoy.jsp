<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mainheader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fe93fd259e379f4433d83e2cf4ecc9"></script>
<meta charset="UTF-8">
<title>부대시설</title>
<style>
.mainphoto {
	padding-left: 30px;
	padding-right: 30px;
}

.mainphoto img { /* 가장 맨 위 사진 */
	width: 100%;
	height: 500px;
}

.main { /* 사진 + 문구 */
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

.main img { /* 사진 크기 */
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
	padding-top: 150px;
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
	transform-origin: 50% 50%;
}

.bg {
	/* display: flex;
	justify-content: center; */
	
}
</style>
</head>
<body>
	<div class="mainphoto">
		<img alt="enjoy" src="img/sea.jpg">
	</div>

	<div class="main">
		<div class="bg">
			<a href="foods.do"> 
				<div class="bg_img">
					<img alt="dining" src="img/foods.jpg">
				</div>
				<div class="bg_text">
					<div class="bg_text_align">
						<h1>FOODS</h1>
					</div>
				</div>
			</a>
		</div>
		<div class="bg">
			<a href="entertains.do">
				<div class="bg_text">
					<div class="bg_text_align">
						<h1>ENTERTAINS</h1>

					</div>
				</div>
				<div class="bg_img">
					<img alt="dining" src="img/jejusea.png">
				</div>
			</a>
		</div>

<!-- 		<div class=""> -->
<!-- 			<div class=""> -->
<!-- 				<h1>MEROOM</h1> -->
<!-- 			</div> -->
<!-- 		</div> -->


	</div>
	<%@ include file="mainfooter.jsp"%>
</body>
</html>




