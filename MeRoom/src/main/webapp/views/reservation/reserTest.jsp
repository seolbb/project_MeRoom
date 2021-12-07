<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>룸</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
    <link rel="stylesheet" href="/mr/css/jsCalendar.css">
    <!-- font 설정-->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

    <!--jsCalendarAPI -->
    <script type="text/javascript" src="/mr/js/jsCalendar.min.js"></script>
    <script src="/mr/js/jsCalendar.datepicker.js"></script>
    <script src="/mr/js/reservation.js"></script>
    
    <link rel="stylesheet" href="/mr/css/reserTest.css">
</head>
<script>
$(function(){
	

	$('input[name="count"]').val($('.value').text());
	$('input[name="rmArea"]').val($('.value2').text());
	
    let today = new Date();
    let year = today.getFullYear();
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);

    let dateString = day + '/' + month  + '/' + year;
    
    $('#jsCal1-text').attr('data-min',dateString);
    $('#jsCal2-text').attr('data-min',dateString);

	$('')
})
function searchRoom(e){
	let rmKindName = $(e).children('.info').children('.info-summary').attr('id');
	$('input[name="rmKind"]').val(rmKindName);
	$('#searchForm').submit();
} 
function listCheck(e){
	$('input[name="startDate"]').val($('#jsCal1-text').val());
	$('input[name="endDate"]').val($('#jsCal2-text').val());
	$('input[name="count"]').val($('.value').text());
	$('input[name="rmArea"]').val($('.value2').text());
	
	if($('#jsCal1-text').val() =='체크인'){
		alert("체크인을 확인해주세요");
		return;
	}else if($('#jsCal2-text').val() =='도착 날짜'){
		alert("체크아웃을 확인해주세요");
		return;
	}else if(${vo == null}){
		alert("로그인을 한 후 이용할 수 있습니다.");
		return;
	}
	
	
	
	let result = {
			"startDate" : $('#jsCal1-text').val(),
			"endDate" : $('#jsCal2-text').val(),
			"rmArea" : $('.value2').text(),
			"count" : $('.value').text()
	}
	
	$.ajax("getRoomList.do", {
		type: "POST",
		data : JSON.stringify(result),
		dataType: "json",
		contentType:'application/json;charset=utf-8',
		
		success: function(data){
			let dpHtml = '';
			
			$.each(data, function(index, obj){
				console.log(this);
				 let images = this.fileName.split(",");
				 let imagesItem ='';
				 
				 $(images).each(function(index, obj){ 
					 if(obj.indexOf('Thumb') != -1){
						 imagesItem += "./images/uploadFiles/"+obj; 
					 }else{
						//기본 이미지
					 } 
					 	 
				 });
				 
					dpHtml += '<div class="list-item">';
					dpHtml += '<a class="link-item" onclick="searchRoom(this)">'; 
                    dpHtml += '<span class="image">';
					dpHtml += '<span class="zoom-image" style="background-image: url('+imagesItem+');">';                        
			//		dpHtml += '<span class="zoom-image" style="background-image: url(./images/uploadFiles/2021-11-13221900stardard1.png);">';                        
                    dpHtml += '</span> </span>';  
                    dpHtml += '<span class="info">';
                    dpHtml += '<span class="info-title">';
                    dpHtml += '<span>'+this.rmKind+'</span>';
                    dpHtml += '</span>';
                    if(this.rmKind === 'STANDARD'){
                    	dpHtml += '<span class="info-summary" id="STANDARD">"혼행자"에 여행고 숙면을 지원하는 편안한 잠자리</span>'; 
                    }else if(this.rmKind === 'SUITE'){  
						dpHtml += '<span class="info-summary" id="SUITE">다차원의 지원과 혜택을 느낄수 있는 잠자리 </span>';
					}else{
						dpHtml += '<span class="info-summary" id="DELUX">편안하게 수면을 취하고 편하게 쉴 수 있는 공간</span>';
					}	   
                    dpHtml += '<span class="info-price">';
                    dpHtml += '<span class="current">￦</span>';
                    if(this.rmKind === 'STANDARD'){
                    	dpHtml += '<span class="real-price">150,000</span>';
                    }else if(this.rmKind === 'SUITE') {
                    	dpHtml += '<span class="real-price">350,000</span>';
                    }else{
                    	dpHtml += '<span class="real-price">250,000</span>';
                    }
                    dpHtml += '</span>';     
                    dpHtml += '</span>';  
                    dpHtml += '</a>';        
					dpHtml += '</div>'; 

			});
			
			$('#realItem').html(dpHtml);
		},
		error: function(){
			alert("실패~~");
		}
	
	});
	
}

</script>
<style>
form .params .input-select button:hover{
	color: #015B28; font-weight: 800;
}
</style>
<body>
	   
  
     	<%@include file="mainheader.jsp"%>
        

        
        <main>
            <div class="body__container">
                <div class="container-full">
                    <div class="main-image">
                        <div class="main-bg" style="background-image:url(./img/bedroom.jpg);"></div>
                        <div class="title main-title">
                            <span class="single">
                                <span class="single-two">To TRAVEL</span>
                            </span>
                        </div>
                    </div>
                </div>
            
            
                <div class="reservation-search">
                    <div class="container-full">
                        <div class="image-samll">
                            <div class="bg-image" style="background-image: url(img/airplane.jpg);"> </div>
                            <div class="title-res">
            
                                <span>reservation</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="reservation-sc">
                    <div class="container">
                        <div class="relative">
                            <div class="sc-form2">
                                <div class="params">
                                   <div class="box-data">CHECK-IN</div>
                                   <div class="box-data">CEHCK-OUT</div>
                                   <div class="box-data2">ROOM</div>
                                   <div class="box-data2">PERSON</div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
      



                <div class="reservation-sc">
                    <div class="container">
                        <div class="relative">
                            <div class="sc-form">
                                <form id="searchForm" action="reserDetail.do" method="post"> 
                                    <!-- js로 value값 넣어 줘야함-->
                                    <input type="hidden" name="startDate">
                                    <input type="hidden" name="endDate">
                                    <input type="hidden" name="count">
                                    <input type="hidden" name="rmArea"> 
                                    <input type="hidden" name="rmKind"> 
                                    <div class="params">
                                        <div class="input-date">
                                                <input type="text" id="jsCal1-text" name="arrivalDate"
                                                value="체크인"
                                                data-datepicker=''
                                                data-class="auto-jsCalendar  material-theme green"
                       							
                                                /> 
                                        </div>

                                        <div class="input-date">
                                            <input type="text" id="jsCal2-text" name="resultDate"
                                            value="체크아웃"
                                            data-datepicker=''
                                            data-class="auto-jsCalendar  material-theme green"/> 
                                       </div>
                                       <!-- 객실 -->
                                       <div class="input-select">
                                           <button id="btn-select" type="button" data-name="room-count" onclick="btn_select()">
                                               <span class="wrap">
                                                   <span class="total">
                                                       객실
                                                       <span class="value">1</span>개
                                                   </span>
                                               </span>
                                           </button>

                                           <div id="selectBox" class="select" >
                                               <div class="item" data-value="1">객실 1개</div>
                                               <div class="item" data-value="2">객실 2개</div>
                                               <div class="item" data-value="3">객실 3개</div>
                                               <div class="item" data-value="4">객실 4개</div>
                                               <div class="item" data-value="5">객실 5개</div>
                                               <div class="item" data-value="6">객실 6개</div>
                                               <div class="item" data-value="7">객실 7개</div>
                                               <div class="item" data-value="8">객실 8개</div>
                                               <div class="item" data-value="9">객실 9개</div>
                                               <div class="item" data-value="10">객실 10개</div>
                                           </div>
                                       </div>


                                       <!-- 인원수 -->
                                       <div class="input-select">
                                        <button id="btn-select2" class="btn2" type="button" data-name="adult-count" onclick="btn_select2()">
                                            <span class="wrap">
                                                <span class="total2">
                                                    성인
                                                    <span class="value2">1</span>명
                                                </span>
                                            </span>
                                        </button>

                                        <!-- 여기 box2 수정해야함 -->
                                        <div id="selectBox2" class="select" >
                                            <div class="item" data-value="1">성인 1명</div>
                                            <div class="item" data-value="2">성인 2명</div>
                                            <div class="item" data-value="3">성인 3명</div>
                                            <div class="item" data-value="4">성인 4명</div>
                                            <div class="item" data-value="5">성인 5명</div>
                                            <div class="item" data-value="6">성인 6명</div>
                                            <div class="item" data-value="7">성인 7명</div>
                                            <div class="item" data-value="8">성인 8명</div>
                                            <div class="item" data-value="9">성인 9명</div>
                                            <div class="item" data-value="10">성인 10명</div>
                                        </div>
                                    </div>   
                                    </div>


                                    <div class="submit">
                                        <div class="search-one">
                                            <button type="button" onclick="listCheck(this)">예약확인</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="reservation-result">
                        <div class="reser-group">
                            <div class="container">
                                <div class="relative">
                                    <div class="result-header">ROOM</div>
                                    <div class="dynamic-list">
                                        <div id="realItem" class="items">
                                            <!-- 여기서부터 위에 SEARCH 버튼 클릭시 동적 생성 해줘야함-->
                                            <!-- <div class="list-item">
                                                <a class="link-item" onclick="searchRoom()">
                                                    <span class="image">
                                                        <span class="zoom-image" style="background-image: url(img/romm.jpg);">
                                                        </span>
                                                    </span>

                                                    <span class="info">
                                                        <span class="info-title">
                                                            <span>STANDARD</span>
                                                        </span>

                                                        <span class="info-summary">'혼행자'에 여행고 숙면을 지원하는 편안한 잠자리
                                                        </span>

                                                        <span class="info-price">
                                                            <span class="current">￦</span>
                                                            <span class="real-price">55,000</span>
                                                        </span>
                                                    </span>
                                                </a>
                                            </div> -->
                                            <!-- 여기까지 예시임-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </main>


        <%@include file="../../mainfooter.jsp"%>
</body>
</html>