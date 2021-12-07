<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<style>

</style>
</head>
<body>
	<div class="map_wrap">
		<div id="map" style="width: 600px; height: 600px;"></div>
			<!-- position:relative;overflow:hidden; -->

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="" id="keyword" size="30">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	

	<div>
		<p id="result"></p>
	</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1fe93fd259e379f4433d83e2cf4ecc9&libraries=services,clusterer,drawing"></script>
	<script>
// 마커를 담을 배열입니다
	// var marker = [];
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450292728008115,
					126.7437479196733), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	//지도에 컨트롤을 추가해야 지도위에 표시됩니다
	//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 지도에 클릭 이벤트를 등록한다,.
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출한다.
	kakao.maps.event.addListener(map, 'click', function(mouseEvent){
		
		var latlng = mouseEvent.latLng;
		var message = "클릭한 위치의 좌표 (위도, 경도) : " + latlng.getLat() + ", " + latlng.getLng();
		var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;
		
	});
		
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		    searchDetailAddrFromCoords(mouseEvent.latLng, function(result2, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var detailAddr = !!result2[0].road_address ? '<div>도로명주소 : ' + result2[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result2[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' + '<span class="title">법정동 주소정보</span>' +  detailAddr + '</div>';
	
		            // 마커를 클릭한 위치에 표시합니다 
		            //marker.setPosition(mouseEvent.latLng);
		            //marker.setPosition(mouseEvent.latLng);
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);
	
		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		        }   
		    });
		});
	
	
	    function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// // 장소 검색 객체를 생성합니다
		//var ps = new kakao.maps.services.searchPlaces();
		var ps = new kakao.maps.services.Places();
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 키워드로 장소를 검색합니다.
		searchPlaces();
		
	
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
	
		     var keyword = document.getElementById('keyword').value;
	
		     if (!keyword.replace(/^\s+|\s+$/g, '')) {
// 		         alert('장소를 입력해주세요!');
		         return false;
		     }
	
		     // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		     ps.keywordSearch( keyword, placesSearchCB); 
		}
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
	
	function displayMarker(place) {
		// 지도에 마커를 표시하는 함수
		var marker = new kakao.maps.Marker({
			map: map,
			position : new kakao.maps.LatLng(place.y, place.x)
		});
	
		// 마커에 클릭이벤트 등록
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커 클릭시 장소명이 인포위도우에 나타난다.
			 infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		       infowindow.open(map, marker);
		});
		
	}

</script>
</body>
</html>
