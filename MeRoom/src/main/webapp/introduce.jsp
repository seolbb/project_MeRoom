<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>introduce</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04e4ecfb59c9ab442746ac3e049acdea"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">

<style>
	

.top_bar {
	font-family: 'Nanum Gothic Coding', monospace;
 	width: 1180px;
    border-bottom: 3px solid #bcbcbc;
  	margin: 0 auto;
    padding: 10px;
    text-align: left;

}


.top_bar h2{

	font-family: 'Nanum Gothic Coding', monospace;
 	letter-spacing: -0.05em;
 	display: flex; 
    font-weight: 500;
	
}

.location h3{
	font-family: 'Nanum Gothic Coding', monospace;
	width: 1180px;
	margin: 0 auto;
	text-align: left;

}

location_map {
	display: block;


}


#map {

	width: 1180px;
	margin: 0 auto;
	text-align: left;

}

.icon_icon{
	width: 1180px;
  	margin: 0 auto;
    padding: 20px;
    font-family: 'Nanum Gothic Coding', monospace;

}

 .material-icons{
	text-align: left;
    display: flex;
    float: left;

}

.icon_icon p{
	text-align: left;
	 display: flex;
	 font-family: 'Nanum Gothic Coding', monospace;
}


.line{
	 border-bottom: 1px solid #bcbcbc;
	width: 1180px;
	margin: 0 auto;

}

.Transportation_information h3{
	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-family: 'Nanum Gothic Coding', monospace;

}

.Transportation_information .material-icons {

	text-align: left;
    display: flex;
    float: left;
    

}

.busbus{

	width: 1180px;
	margin: 0 auto;


}





.bus_1{

	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-family: 'Nanum Gothic Coding', monospace;
	padding: 15px;
}


.bus_2{
	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-family: 'Nanum Gothic Coding', monospace;
	padding: 15px;

}

.fee{
	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-family: 'Nanum Gothic Coding', monospace;



}

.time{
	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-family: 'Nanum Gothic Coding', monospace;
}


.information_taxi{
	width: 1180px;
	margin: 0 auto;
	text-align: left;


}

.number{
	font-size: 20px;
	font-weight: 600;
	
	

}


.taxi_text{
	width: 1180px;
	margin: 0 auto;
	text-align: left;
	font-size: 13px;
	color: gray;
}


.mycar{
	width: 1180px;
	margin: 0 auto;
	text-align: left;


}


.mycar_p{
	padding: 15px;


}
</style>
</head>


<body>
	<%@ include file="mainheader.jsp"%>
	<br>
	<div class="top_bar">
		<h2>오시는 길</h2>
	</div>
	<br>
	<br>
	
	<div class="location">
		<h3>위치 안내 </h3>
	</div>
	<br>
	<br>
	<div class="location_map">
	<div id="map" style="width:500px;height:400px;"></div>
	<script>

		var mapContainer = document.getElementById('map'), 
		mapOption = {
			center : new kakao.maps.LatLng(33.43084679413674, 126.92772588242559), 
			level : 3
		
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); 

		
		var markerPosition = new kakao.maps.LatLng(33.43084679413674, 126.92772588242559);

		
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		
		marker.setMap(map);

		
	</script>
</div>
<br>
<br>
<br>
	<div class="icon_icon">
	<i class="material-icons">place</i><strong>MeRoom in 제주</strong>
	<p>제주특별자치도 서귀포시 성산읍 섭지코지로</p>
	</div>
 	
 	<div class="line">
 	</div>
 	<br>
 	
 	<div class="Transportation_information">
 	<h3>교통안내</h3>
 	<br>
 	<div class="information_content">
 	<div class="busbus">	
 	<i class="material-icons">directions_bus_filled</i><strong>급행버스</strong>
 	</div>	
 	<br>
		<p class="bus_1">111번, 112번 : 제주국제공항 도착층 게이트 1번 앞 1번 정류장 [표선/성산/남원 방면] 에서 탑승 <br>
           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<i class="material-icons">arrow_right_alt</i> 성산 환승 정류장 '고성리 회전교차로' 하차</p>

		<p class="bus_2">101번 : 제주국제공항 도착층 게이트 2번 앞 2번 정류장 [5.16로 일주동로 방면] 에서 탑승<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<i class="material-icons">arrow_right_alt</i> 성산 환승 정류장 '고성리 한국물류' 하차</p>
		<br>
		<br>
		<div class="fee">
		<i class="material-icons">payment</i><strong>버스요금</strong>
		<br>
		<p>성인 3,000원&nbsp; &nbsp; 청소년 2,400원&nbsp; &nbsp;어린이 1,500원 </p>
 		</div>
 		<br>
 		<div class="time">
 			<i class="material-icons">schedule</i><strong>소요시간</strong>
 			<br>
 			<p>약 1시간 10분</p>
 		</div>
 		
 	</div>
 	
 	</div>
 	<br>
 	
 	<div class="line">
 	</div>
 	<br>
 	
 	<div class="information_taxi">
 		<i class="material-icons">local_taxi</i><strong>택시이용</strong>&nbsp; &nbsp;<strong>동성 콜택시</strong><p class="number">064-782-8200</p><br>
 		<p class="taxi_text">
 		<br>
 		“동성콜택시는 성산지역 콜택시예요. 제주공항에서 플레이스로 오실 때, 공항 밖 택시 줄을 기다리지 않으셔도 돼요.<br>
		공항에 내리신 후, 동성콜택시에 전화하시면 게이트 앞에서 바로 탑승 가능! 플레이스까지 보다 저렴하고 편안하게 오실 수 있답니다.”<br>
 		</p>
 		
 	</div>
 	<br>
 	<br>
 	
 	<div class="line">
 	</div>
 	<br>
 	
 	<div class="mycar">
 		<i class="material-icons">drive_eta</i><strong>자가용 이용</strong>
 		<br>
 		<p class="mycar_p">네비게이션에 ‘미룸’ 으로 입력 <br>
 		도로명 제주특별자치도 서귀포시 성산읍 섭지코지로 107 &nbsp; &nbsp;지번 제주특별자치도 서귀포시 성산읍 고성리 127-2
 		</p>

 	</div>
 	<br>
 	<br>
 	<br>
 	
 	
 	
 	
 <%@ include file="mainfooter.jsp"%> 

</body>
</html>