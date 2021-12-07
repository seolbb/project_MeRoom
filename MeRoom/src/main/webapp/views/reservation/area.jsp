<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<link rel="stylesheet" href="/mr/css/area1.css">
<script>

$(document).ready(function() {
	
	 var images = "${roomVO.fileName }".split(",");
	 var imagesItem 
	 
	 var imagese2= "room-3.jpg";
	 $(images).each(function(index, obj){ 
		 if(obj.indexOf('Thumb') != -1){
			 //썸네일 이미지~~~~
		 }else{
			 //기본 이미지 출력
			 imagesItem += "<li><a href='/mr/reserIsDelete.do'><img src='./images/uploadFiles/"+ obj +"'"
		     imagesItem += "></a></li>"
			 console.log(typeof(obj) +": " + obj); 
		 } 
		 
		 console.log(index + ":", obj); 		 
	 });
	 
	$('.bxslider').html(imagesItem);
	
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
    
    
     $('.first span').html($('.first span').text().replace(/\B(?=(\d{3})+(?!\d))/g, ",")) 
    
     
	
});

</script>
</head>

<body>
		<%@include file ="mainheader.jsp" %>
		
	        <main>
	     
            <div class="body__container">
                <div class="container-full">
                    <div class="main-image">
                        <div class="main-bg" style="background-image:url(./img/areaImage.jpg);"></div>
                        <div class="title main-title">
                            <span class="single">
                                <span class="single-two">${roomVO.rmKind }</span>
                            </span>
                        </div>
                        <div class="title2 title ">
                            <span class="single-one">양질의 수면과 그동안 지친 에너지를 충전할 수 있는 방</span>
                        </div>
                    </div>
                </div>

                <div class="container-narrow">
                    <div class="room-info">
                        <div class="subject">INFO</div>
                        <div class="subtitle">
                            <span>최소한의 필요 공간으로 가장 이용하기 편한 방</span>
                        </div>
                        <div class="summary">
                            <span>
                                "효율성이 가득한 공간"
                                <br>
                                "들어가자 마자 편안하게 취침을 할 수 있는 나만의 편안한 공간"
                            </span>
                        </div>

                        <div class="btngroup">
                            <a href="reserIsDelete.do" class="resBtn">예약하기</a>
                        </div>
                    </div>

                    <div class="container-full">
                        <div class="slide-wrap">
                            <div class="sl-title">
                            <c:choose>
							<c:when test="${roomVO.rmKind eq 'STANDARD'}">스탠다드방</c:when>
							<c:when test="${roomVO.rmKind eq'DELUX'}">디럭스방</c:when>
							<c:when test="${roomVO.rmKind eq'SUITE'}">스위트방</c:when>
							</c:choose>			
                            </div>
                        </div>
                    </div>


                    <div class="slide-main zoom">
                        <ul class="bxslider">
                  <!--           <li><a href="reserTest.jsp"><img src="./img/room-2.jpg" alt="이미지1"></a></li>
                            <li><a href="reserTest.jsp"><img src="./img/room-2.jpg" alt="이미지2"></a></li>
                            <li><a href="reserTest.jsp"><img src="./img/room-3.jpg" alt="이미지3"></a></li> -->
                        </ul>
                    </div>



                    <div class="rest-detail">
                        <div class="detail-container">
                            <div class="rest-title">DETAIL INFO</div>
                            <div class="rest-wrap">
                            </div>
                            <div class="rest-tail">
                                <p>이용 시설</p>

                                <ul>
                                    <li class="list-st">정원 
                                        <ul>
                                            <li class="first">1인 ${roomVO.rmArea-1 }실(최대  ${roomVO.rmArea }인까지 가능)</li>
                                        </ul>
                                    </li>

                                    
                                    <li class="list-st">ROOM 
                                        <ul>
                                        	<li class="first">${roomVO.rmInfo }</li>
                                        
                                        <!-- 
                                            <li class="first">여름엔 쉬원하고 겨울에는 따뜻한 가장 편안하게 참들수 있는 침대</li>
                                            <li>항상 깨끗하게 소독 세탁하는 침구류  </li>
                                            <li>성산일출봉과 만날 수 있는 발코니 창</li>
                                            <li>체크인 13:00 / 체크 아웃 11:00</li>
                                            <li>전 객실 금연</li>
                                            <li>객실 크기 13m²</li> -->
                                        </ul>
                                    </li>

                                    <li class="list-st">FACILITY 
                                        <ul>
                                            <li class="first">미룸 다이닝룸</li>
                                            <li>도렐 제주본점</li>
                                            <li>아우어 베이커리</li>
                                            <li>스피닝울프</li>
                                            <li>수영장</li>
                                            <li>체육관</li>
                                        </ul>
                                    </li>

                                    <li class="list-st">PRICE 
                                        <ul>
                                            <li class="first">정상가 <span>${roomVO.rmPrice }</span>원</li>
                                            <li>1인 추가요금 10,000원</li>
                                            <li>객실 이용은 상황에 따라 변동될 수 있습니다.</li>

                                        </ul>
                                    </li>
                                </ul>

                                <h6>예약 취소 안내</h6>
                                <ul>
                                    <li>예약 당일 취소시 100% 환불</li>
                                    <li>체크인 3일 전 18:00까지: 위약금 없이 취소 가능</li>
                                    <li>체크인 3일 전 18:00이후: 아침 점심 취소 가능</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
                
        </main>
        
        <%@include file ="../../mainfooter.jsp" %>
</body>
</html>