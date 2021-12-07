<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>룸</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/mr/css/reservationDetail.css">
    
</head>


<script>
    $(function(){
    	// 날짜 계산
    	var kindNum = 0;
    	var sdt = new Date('${roomDeVO.startDate}');
    	var edt = new Date('${roomDeVO.endDate}');
    	var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
    	
    	console.log();
    	
    	let result = 0;
    	if("${roomDeVO.rmKind}" === "STANDARD"){
    		result = 150000 * ${roomDeVO.count} * dateDiff;
    		kindNum = '2%';
    	}else if("${roomDeVO.rmKind}" === "SUITE"){
    		result = 350000 * ${roomDeVO.count} * dateDiff;
    		kindNum = '4%';
    	}else if("${roomDeVO.rmKind}" === "DELUX"){
    		result = 250000 * ${roomDeVO.count} * dateDiff;
    		kindNum = '3%';
    	}
    	
    	
    	$('#priceResult').val(String(result).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    	$('input[name="rmPrice"]').val($('#priceResult').val());

    	
    	$.ajax({
    		url : "/mr/roomReviewList.do",
			type : "POST",
			data : JSON.stringify({"kind":kindNum}),
			dataType: 'json',
			contentType:'application/json;charset=utf-8',
			success: function(data){
				let dpHtml = '';
				console.log(data)
				
				dpHtml += '<table class="list">';
				$.each(data, function(index, obj){
					
					dpHtml+='<thead>';
					dpHtml+='<tr class="tb">';
					dpHtml+='<th>'+this.nickName+'</th>';
					dpHtml+='<th class="date" colspan="2" style="text-align:right; font-weight:500">작성일 : '+this.rvDate+'</th>';
					dpHtml+='</tr> </thead>';
					dpHtml+='<tbody>';
					dpHtml+='<tr class="item content">';
					dpHtml+='<td class="item-star">';
					for(let i=1;i<=5;i++){
						if(this.score == i){
							for(let k=1; k<=i; k++){
								dpHtml += '<span class="fa fa-star checked"></span>';
							}
							
						}
					}
					dpHtml+='</td>'; // 별찍어야함
					dpHtml+='<td id="info" class="item-info">';
					dpHtml+= this.rvContent;
					dpHtml+='</td>';
					dpHtml+='<td class="item btnG">';
					dpHtml+='</td> </tr> </tbody>';
					
				});
				dpHtml+='</table>';
				$('#refundName').html(dpHtml);
				
			},error:function(request,status,error){
				 console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
			}
    	
    	});
    	
    	
    	
        //--------환불 규정 ----------
            //취소 버튼 클릭시
            $('.popup-close').click(wrapclear);
            $('.clear').click(wrapclear);
            //결제하기 클릭시
            $('.payment').click(function(){
                $('#result-form').submit();
            })
            //메인 결제하기 버튼 클릭시
            $('.btn01').click(function(){
                $('.popup-wrap').css('opacity','1').css('display','block');
                return false;
            })
    });
function wrapclear(){
    $('.popup-wrap').css('opacity','0').css('display','none');
}
</script>

<style>
table {
	width: 100%;
	border-spacing: 2px;
	border-collapse: collapse
}

table>thead>tr {
	padding: 12px 0;
	line-height: 20px;
	font-size: 14px;
	font-weight: 500;
}

tbody {
	vertical-align: middle;
}

td, th {
	padding: 7px 5px;
	vertical-align: middle;
	text-align: center;
}

.tb {
	border-bottom: 1px solid #e4e4e4;
	background-color: #f3f3f3;
}

.checked {
  color: orange;
  padding: 1px;
}

#info {
	text-align: left;
	padding: 15px 20px;
	width: 60%;
}

.star{
	width: 20%;
}
.content {
	border-bottom: 1px solid #e4e4e4;
}

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 32px;
	font-weight: 500;
	letter-spacing: -0.05em;
	margin-bottom: 40px;
}
.date {
	text-align: left;
	padding-left: 20px;
}
th{
	width:150px;
}
</style>
<script>
$(function(){
	$('.roomType').	

})
</script>
<body>
	   
   	<%@include file="mainheader.jsp"%>
        
        <main>
            <div class="body__container">
                <div class="container-full">
                    <div class="main-image">
                        <div class="main-bg"></div>
                        <div class="title main-title">
                            <span class="single">
                                <span class="single-two">${roomDeVO.rmKind}</span>
                            </span>
                        </div>

                    </div>
                </div>


                




                <div class="container">
                    <div class="box-full">

                    
                        <div class="relative wrapper" id="reserWrap">
                            <div class="reservation-body">
                                <div class="body_one">
                                    <div class="section-title">
                                        <div class="title2">소개</div>
                                        <div class="doc-body">미룸의 방에서 편안함을 느낄 수 있게 <br>
                                        항상 최선을 다하겠습니다.  <!-- DB에 들어간 DB내용이 들어가야함 --></div>
                                    </div>
                                </div>

                                <div class="body_one">
                                    <div class="section-title section2">
                                        <div class="title2">타입</div>
                                        <div class="doc-body roomType">B타입 <!-- DB에 들어간 DB타입 내용이 들어가야함  그림이미지 들어가야함--> </div>
                                    </div>
                                </div>
                                <div class="body_one">
                                    <div class="section-title section2">
                                        <div class="title2">제공항목</div>
                                        <div class="doc-body">[FACILITY]<br>
									지루하지 않게 TV와 PC를 이용가능하고<br>
									메모지, 연필 등 소장하고 싶은 아날로그 감성 소품<br>
									온도를 마음것 조절할 수 있는 냉/난방<br>
									<br>[AMENITY]<br>
									샴푸 바디워시, 비누<br>
									바스타월 2개<br>
									헤어드라이기 제공 <br>
									
									
									</div> <!-- rmInfo null값이라 갖고와야함 -->
                                    </div>
                                </div>

                                <div class="body_one">
                                    <div class="section-title section2">
                                        <div class="title2">제한인원</div>
                                        
			                             <div class="doc-body">
												<c:choose>
												<c:when test="${roomVO.rmKind eq 'STANDARD'}">3명</c:when>
												<c:when test="${roomVO.rmKind eq'DELUX'}">4명</c:when>
												<c:when test="${roomVO.rmKind eq'SUITE'}">5명</c:when>
												</c:choose>	
										</div>
                                    </div>
                                </div>

                                <div class="body_one">
                                    <div class="section-title section2">
                                        <div class="title2">참고항목</div>
                                        <div class="doc-body">체크인 14:00 / 체크아웃 11:00  |  전객실 금연<br>
                                        					  연휴 : 1/1, 2/10~2/14, 5/3~5/5, 9/17~9/22, 10/3, 10/9, 12/25 </div>
                                    </div>
                                </div>

                                <div class="body_one">
                                    <div class="section-title section2">
                                        <div class="title2">환불규정</div>
                                        <div class="doc-body">"예약 당일 취소시 100% 환불"<br>
													체크인 3일 전 18:00까지: 위약금 없이 취소 가능<br>
														체크인 3일 전 18:00이후: 취소/ 변경  </div>
                                    </div>
                                </div>

                                <div class="body_one">
                                    <div class="section-title section2 ">
                                        <div class="title2">플레이스 소개</div>
                                        <div class="doc-body"><!-- 소개 이미지 -->부대 시설로 이동 </div>
                                    </div>
                                </div>
                                
                                 <div class="body_one">
                                    <div class="section-title section2 section-end">
                                        <div class="title2">후기</div>
                                        <div class="doc-body" id="refundName"><!-- db에서 조인해야함 --> </div>
                                    </div>
                                </div>

                        </div>
                        <div class="reservation-panel">
                            <div class="header2">
                                <div class="title3">
                                    <span>
                                        ${roomDeVO.rmKind}
                                    </span>
                                </div>
                                <div class="summary" style="font-size: 14px;">여행자에 최적화된 숙면과 휴식으로 에너지를 충전할 수 있는 숙소</div>
                            </div>
                            <!--#<header2>-->
                                <form action="/mr/lastReservation.do" method="POST" id="result-form">
                                
                                 <input type="hidden" name="rmKind" value="${roomDeVO.rmKind}"> 
                                 <input type="hidden" name="rmPrice">
                                 <input type="hidden" name="memberId" value="${vo.memberId }"> <!-- 여기에 세션 유저 ID 넣어야함 -->
                                    <div class="row">
                                        <div class="field">
                                            <p>체크인</p>
                                            <input type="text" name="startDate" class="input--text" value="${roomDeVO.startDate}" readonly><!-- 체크인 값이 들어가야함-->
                                        </div>

                                        <div class="field">
                                            <p>체크아웃</p>
                                            <input type="text" name="endDate" class="input--text" value="${roomDeVO.endDate}" readonly><!-- 체크인 값이 들어가야함-->
                                        </div>

                                        <div class="field" id="w100">
                                            <p>객실 수</p>
                                            <input type="text" name="count" class="input--text" value="${roomDeVO.count}" readonly><!-- 체크인 값이 들어가야함-->
                                        </div>

                                        <div class="field" id="w100">
                                            <p>성인</p>
                                            <input type="text" name="area" class="input--text" value="${roomDeVO.rmArea}" readonly><!-- 체크인 값이 들어가야함-->
                                        </div>
                                        
                                        

                                    </div>
                                    <!--#row-->
                                    <div class="reward-info">
                                        <div class="re-title">
                                            <i class="fa fa-info" aria-hidden="true"></i>
                                            <span>Meroom 회원에게는 결제금액 <span>3%</span>적립</span>
                                        </div>
                                        <div class="re-info" style="font-size: 10px; margin-left: 7px;">
                                            회원가입을 통해서 Meroom의 회원이 되실 수 있습니다.
                                        </div>
                                    </div>

                                    <div class="price-info">
                                        <div class="price-title">결제금액</div>
                                        <div class="price1">
                                            <div class="flex">
                                                 <span>₩</span><input type="text" class="result-input" id="priceResult" name="price" value="200,000">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="btn-submit">
                                        <button type="submit" class="btn01">예약하기</button>
                                        <button type="submit" class="btn01 btn02">뒤로가기</button>
                                    </div>
                                </form>
                        </div>
                    </div>
                </div>
                </div>

            </div>
            <!--#body_container-->



            <!-- popup-->
            <div class="popup-wrap">
                <div class="screen"></div>
                <div class="outer">
                    <div class="inner">
                        <div class="container3">
                            <div class="popup-content">
                                <p>환불 규정</p>
                                <p class="popup-detail">
                                    "예약 당일 취소시 100% 환불"
                                    <br>
                                    체크인 3일 전 18:00까지: 위약금 없이 취소 가능
                                    <br>
                                    체크인 3일 전 18:00이후: 취소/ 변경
                                </p>
                                <div class="buttons">
                                    <button class="button reser payment">결제하기</button>
                                    <button class="button reser clear">취  소</button>
                                </div>


                                <button type="button" class="popup-close">

                                </button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>


        <%@include file="../../mainfooter.jsp"%>
</body>
</html>