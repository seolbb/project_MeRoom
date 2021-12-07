<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="mainheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광명소</title>
<script src=https://code.jquery.com/jquery-3.6.0.min.js></script>


<style>
.mainphoto {
	padding-left: 30px;
	padding-right: 30px;
}

.mainphoto img {
	width: 100%;
	height: 500px;
}

* {
	box-sizing: border-box;
}

body {
	padding: 20px;
	font-family: Arial;
}

/* Center website */
.main {
	max-width: 1180px;
	margin: auto;
	min-height: 810px;
	padding-bottom: 300px;
}

h1 {
	font-size: 50px;
	/* word-break: break-all;  줄바꿈 속성*/
}

.image {
	width: 263px;
	height: 200px;
}

.mapsize {
	width: 1180px;
	margin: 0 auto;
	display: flex;
}

#map {
	width: 590px;
	/* margin: 0 auto; */
	height: 500px;
}

.detail {
	padding-left: 30px;
}

.wrap {
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	/* width: 200px;
	height: 100px; */
	overflow: hidden;
}

.wrap .info {
	width: 286px;
	height: 100px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.body {
	display: flex;
}

.title {
	background: #eee;
	height: 30px;
	font-size: 18px;
	font-weight: bold;
}

.info_list {
	/* border: 1px solid red; */
	display: inline-block;
	list-style: none;
	max-width: 1180px;
	margin: 0 auto;
	padding: 0px;
	padding-top: 30px;
}

li {
	float: left;
	display: block;
}

.info_list::after {
	display: table;
	content: '';
	clear: both;
}

.list1 {
	display: flex;
	width: 295px;
	/* border-bottom: 1px solid #ccc; */
	border-top: 2px solid #ccc;
	padding: 10px 0 10px 10px;
	margin-bottom: 20px;
}

.tit, .desc {
	padding-left: 10px;
}

.container_map_info {
	max-width: 1180px;
	margin: 0 auto;
	padding-bottom: 30px;
}

.bottom { /* 사진 + 문구 */
	max-width: 1180px;
	flex-wrap: wrap;
	align-items: flex-start;
	/* 	padding-left: 120px;
	padding-right: 120px; */
	margin: 100px auto;
}

.bottom img { /* 사진 크기 */
	width: 100%;
	height: 100%;
}

.ajaxImg img{
	width: 200px;
	height: 200px;
	
}

.container {
  position: relative;
  max-width: 800px; /* Maximum width */
  margin: 0 auto; /* Center it */
  height: 500px;
}

.container .content {
  position: absolute; /* Position the background text */
  bottom: 0; /* At the bottom. Use top:0 to append it to the top */
  background: rgb(0, 0, 0); /* Fallback color */
  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: #f1f1f1; /* Grey text */
  width: 100%; /* Full width */
  padding: 20px; /* Some padding */
}

</style>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fe93fd259e379f4433d83e2cf4ecc9&libraries=services,clusterer,drawing">
</script>
<script>
	let mapContainer;
	let map;
	let infowindow;
	let marker;
	let idx2;
	let positions;
	let num;
	let lat;
	let lng;
	let str;
	let comma;
	$(function() {

		mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450292728008115,
					126.7437479196733), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도를 생성합니다

		// 맵 지도 확대 막아놓기
		map.setZoomable(false);

		// 지도 컨트롤 표시
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		console.log("가나다라마바사아자차카타파하");
		
			//str = "";
			//<c:forEach var="place" items="${placeList }">;	
			 //console.log( ${place.plat} + ", " + ${place.plng});
			 //console.log("lat: " + ${place.plat} + ", lng: "  + ${place.plng});
			//str += "'${place.plat}" + ","  + "'${place.plng}'";
			//str += '${place.plat}' + ","  + '${place.plng}';
			//console.log("dsada")
			//str += '${place.plng}' + ", " ;
			//</c:forEach>;
			//console.log(typeof(str));
			//console.log("str : " + str);
			
			positions = [
				<c:forEach var="place" items="${placeList }" varStatus="status">	
				{lat: '${place.plat}', lng: '${place.plng}', num: ${status.count}},
				</c:forEach>
				
				
			];
			
		
// 		  positions = [
// 			{lat: '33.50501258357466', lng: '126.95396213085922', num: 1 }, // 우도
// 			{lat: '33.45914922413397', lng: '126.94105283259414', num: 2 }, // 성산일출봉
// 			{lat: '33.48559985217574', lng: '126.80846876443752', num: 3 }, // 비자림
// 			{lat: '33.55669805571196', lng: '126.7844263496564', num: 4 }, // 월정리
// 			{lat: '33.433022647872804', lng: '126.9279807581892', num: 5 }, // 아쿠아플라넷
// 			{lat: '33.55839499843472', lng: '126.75991617439291', num: 6 }, // 김녕해수욕장
// 			{lat: '33.448961127348255', lng: '126.91603758120543', num: 7 }, // 맛나식당
// 			{lat: '33.31377843488247', lng: '126.78142329732736', num: 8 }, // 판타스틱버거
// 			{lat: '33.25154552414869', lng: '126.56768863081678', num: 9 }, // 오는정김밥
// 			{lat: '33.48517001240744', lng: '126.38111487456602', num: 10 }, // 랍스터빈
// 			{lat: '33.51698399690752', lng: '126.51707420340547', num: 11 } // 자매국수
// 			];  

 		console.log(positions);
 		console.log("positions : " + positions);
 		
 		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : new kakao.maps.LatLng(positions[i].lat, positions[i].lng),
				image : markerImage, // 마커 이미지 
				clickable : true
			});
			
			//console.log(marker.position);
// 			console.log("positions[i].lat: " + positions[i].lat);
// 			console.log("positions[i].lng : " + positions[i].lng);
			console.log("positions[0].lat : " + positions[0].lat );
			console.log("positions[0].lng : " + positions[0].lng);
			(function(marker, positions) {
				kakao.maps.event.addListener(marker, 'click', function() {
					//console.log("marker.getPosition()) 값 : " + String(marker.getPosition())); //substr(0,(indexof(',')) 
				 	//console.log("스플릿 : " + String(marker.getPosition()).split(','));
					console.log("0번인덱스  : " + positions[0].lat  + ", " +  positions[0].lng);
					//console.log("positions[0] : " + positions[0]);
					//console.log("positions[10] : " + positions[10]);
					let str2 = String(marker.getPosition()).split(',');
					
					console.log("위도값 : " + str2[0].substr(1,str2[0].length-1));
					console.log("경도값 : " + str2[1].substr(1,str2[1].indexOf(')')-1));
					
					let resultLat = str2[0].substr(1,str2[0].length-1);
					let lastLat = resultLat.substr(0,10);
					console.log("결과위도값 " +resultLat.substr(0,10));
					
					let resultLng = str2[1].substr(1,str2[1].indexOf(')')-1);
					let lastLng = resultLng.substr(0,10);
					console.log("결과경도값 " +resultLng.substr(0,10));
					
					let LatLng = new kakao.maps.LatLng(resultLat, resultLng);
					
					for(var j=0; j<positions.length; j++){
						if (positions[j].lat.includes(lastLat) && positions[j].lng.includes(lastLng)) {
							console.log(positions[j].num);  // 값 한개만 일치
							idx2 = positions[j].num;  // 값 한개만 일치
							map.panTo(LatLng);
						}
					}
					
					getJsonPlaceData();

				});

			})(marker,positions);
		}
	});

	// 이미지 클릭시 화면 이동
	function clickImage(idx, param1, param2) {

		idx2 = idx;
		var moveLatLng = new kakao.maps.LatLng(param1, param2);
		map.panTo(moveLatLng);
		getJsonPlaceData();
	}

	function markerClick(num2, lat, lng) {
		num = num2;
		var moveLatLng = new kakao.maps.LatLng(lat, lng);
		map.panTo(moveLatLng);
		

	}
</script>

</head>
<body>
	<div class="mainphoto">
		<img alt="enjoy" src="img/jejudo4.jpg">
	</div>
	<div class="center">
		<h1 style="text-align: center">tourist[:여행]</h1>
		<h1 style="text-align: center">여행에 빠지다</h1>
	</div>



	<div class="mapsize" style="border: 1px solid black">
		<div id="map"></div>
		<div id="detail">
			<div class="container">
			  <!-- <img src='/upload/"+ data.pfilepath + "' style="width:100%;"> -->
			  <img src="img/sungsan3.jpg" alt="성산" style="width:100%; height:100%;">
			  <div class="content">
			    <h1> " + data.ptitle + "</h1>
			    <p>" + " 운영시간 : " + data.ptime + "</p>
			    <p>" + " 전화번호 : " + data.pphone + "</p>
			    <p>" + " 위치 : " + data.plocation + "</p>
			    <p>" + data.pfilepath + "</p>
			  </div>
			</div>
			
			
<!-- 				let dispHtml = "<ul><li>"; -->
 b<!-- 					dispHtml += "<div><h1> " + data.ptitle + "</h1></div>"; -->
<!-- 					dispHtml += "<div><p>" + " 운영시간 : " + data.ptime + "</p></div>"; -->
<!-- 					dispHtml += "<div><p>" + " 전화번호 : " + data.pphone + "</p></div>"; -->
<!-- 					dispHtml += "<div><p>" + " 위치 : " + data.plocation + "</p></div>"; -->
<!-- 					//dispHtml += "<div><p>" + data.pfilepath + "</p></div>"; -->
<!-- 					dispHtml += "<div class='ajaxImg'>" + "<img src='/upload/"+ data.pfilepath + "'></div>"; -->
<!-- 					dispHtml += "</li></ul>"; -->
			
			
			
		</div>
	</div>
	
	<div class="container_map_info">
		<ul class="info_list">
			<c:if test="${not empty placeList }">
				<c:forEach var="place" items="${placeList }">
				<li>
					<div class="list1">
						<div class="map_image">
							<a href="javascript:clickImage(${place.pid }, ${place.plat }, ${place.plng })">
							<img src= "/upload/${place.pfilepath }" width="70" height="70">
							</a>	
						</div>
						<div class="mix">
							<div class="tit">
								${place.ptitle } <em>nature</em>
							</div>
							<div class="desc">${place.ptext }</div>
						</div>
					</div>
				</li>					
				</c:forEach>
			</c:if>
			<c:if test="${empty placeList }">
				<li>
					<p>비어있음</p>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="bottom">
			<div class="wrap">
				<div class="bottom_image">
					<img alt="placebackground" src="img/placebackground.jpg">
				</div>
				<div class="text">
				
				</div>
			</div>
	</div>


	<script>
		function getJsonPlaceData() {
			//alert("getJsonPlaceData() 실행~~");
			let vo = {};
			vo.pid = idx2;
			
			console.log("ajax : " + vo); // object
			console.log(JSON.stringify(vo)); // 문자열

			$.ajax("getJsonPlace.do", {
				type : "post",
				data : JSON.stringify(vo), // {pid : 1}
				// data: "pid=1", // get 방식 요청시 파라미터 전달
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					//alert("성공~~~");
					console.log(data);

					let dispHtml = "<ul><li>";
					dispHtml += "<div><h1> " + data.ptitle + "<h1></div>";
					dispHtml += "<div><p>" + " 운영시간 : " + data.ptime + "</p></div>";
					dispHtml += "<div><p>" + " 전화번호 : " + data.pphone + "</p></div>";
					dispHtml += "<div><p>" + " 위치 : " + data.plocation + "</p></div>";
					//dispHtml += "<div><p>" + data.pfilepath + "</p></div>";
					dispHtml += "<div class='ajaxImg'>" + "<img src='/upload/"+ data.pfilepath + "'></div>";
					dispHtml += "</li></ul>";
					$("#detail").html(dispHtml);

				},
				error : function() {
					alert("실패~~~~");
				}

			});
		}
		
		
		function getJsonClickMarkerData() {
			alert("getJsonClickMarkerData() 실행~~");
			let vo = {};
			vo.pid = num;
			
			console.log("ajax : " + vo); // object
			console.log(JSON.stringify(vo)); // 문자열

			$.ajax("getJsonPlace.do", {
				type : "post",
				data : JSON.stringify(vo), // {pid : 1}
				// data: "pid=1", // get 방식 요청시 파라미터 전달
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					alert("성공~~~");
					console.log(data);

					let dispHtml = "<ul><li>";
					dispHtml += data.pid + ", ";
					dispHtml += "<div><h1> " + data.ptitle + "<h1></div>";
					dispHtml += "<div><p>" + " 운영시간 : " +  data.ptime + "</p></div>";
					dispHtml += "<div><p>" + data.pphone + "</p></div>";
					dispHtml += "<div><p>" + data.plocation + "</p></div>";
					//dispHtml += "<div><p>" + data.pfilepath + "</p></div>";
					dispHtml += "<div>" + "<img src='/upload/'"+ data.pfilepath + "></div>";
					dispHtml += "</li></ul>";
					$("#detail").html(dispHtml);

				},
				error : function() {
					alert("실패~~~~");
				}

			});
		}
		
	</script>

	<%@ include file="mainfooter.jsp"%>
</body>
</html>