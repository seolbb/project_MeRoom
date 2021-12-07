<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/mr/css/payment.css">
    <meta charset="UTF-8">
    <title>예약 결제페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="/mr/js/payment.js"></script>   
</head>

<script>
$(function(){
	//1. 포인트 불러오기 => 보유 금액에 넣기
	
	//2. 사용금액을 결제하기 클릭시 넘겨주기 
	
	//이미지 부분
	 
	let images = '${roomDeVO.fileName}'.split(",");
	 console.log(images);
	 let imagesItem ='';
	 
	 $(images).each(function(index, obj){ 
		 if(obj.indexOf('Thumb') != -1){
			
			 imagesItem += "/mr/images/uploadFiles/"+obj; 
		 }
	 });
	 
	 $('.img img').attr('src',imagesItem);
	 
	
	//결제부분
	var sdt = new Date('${roomDeVO.startDate}');
	var edt = new Date('${roomDeVO.endDate}');
	var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
	
	console.log();
	
	let result = 0;
	if("${roomDeVO.rmKind}" === "STANDARD"){
		result = 150000 * dateDiff;
	}else if("${roomDeVO.rmKind}" === "SUITE"){
		result = 350000 * dateDiff;
	}else if("${roomDeVO.rmKind}" === "DELUX"){
		result = 250000 * dateDiff;
	}
	$('#item-total').html(result);
	$('.sale-price').html(result);
	
	
	  let itemCount = Number($('#item-count').text());
	    let itemTotal = Number($('#item-total').text());

	 
	    
	   $('.sale-count').html(itemCount);

	   $('#sale-total').html(String(itemCount*itemTotal).replace(/\B(?=(\d{3})+(?!\d))/g, ","));


	    let toTal = totalSum();
	    change(toTal);

	   /*3자리씩 끊어주는 식 db로부터 숫자로 받고 숫자에 대한 식은 다 적용해야함 */
	   let point = $('.point span');
	   let inputPoint = $('.input-point');

	   inputPoint.bind("propertychange change keyup paste input",function(){
	    let toTal = totalSum();
	    change(toTal);
	    numberCheck();
	    if(Number(point.text().replace(/,/g , ''))<Number(inputPoint.val())){
	        alert('포인트 사용금액이 보유금액보다 클 수가 없습니다.')
	        inputPoint.val(0);
	        $('#lastPoint').html(0);

	        let toTal = totalSum();
	        change(toTal);

	    }else{
	        $('#lastPoint').html(inputPoint.val().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	    }
	   });
	   
	   change(point);   
	   change($('#item-total'))
	   change($('.sale-price'))
	
	$('#submit-btn').click(function(){
		let IMP = window.IMP;
		IMP.init("imp58969486");
		IMP.request_pay({
			pg : "inisis",   // kakaopay   inisis이니시스 웹표준 결제창  : 현재 카카오
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : "숙박결제",
			amount:"100",  //상품 금액
			buyer_email : "${vo.email}", //유저 이메일
			buyer_name : "${vo.name}",          //유저 정보 이름
			buyer_tel : "${vo.phone}"  // 유저 전화번호
		}, function(rsp){
			if(rsp.success){ //결제 성공시
				alert("결제가 완료 되었습니다.");  //고유 아이디 : rsp.imp_uid
			
				
			let date = new Date()
			let year = date.getFullYear()
			let month = date.getMonth() + 1
			month = month >= 10 ? month : '0' + month
			let day = date.getDate()
			day = day >= 10 ? day : '0' + day
			let hour = date.getHours()
			hour = hour >= 10 ? hour : '0' + hour
			let min = date.getMinutes()
			let sec = date.getSeconds()
			sec = sec >= 10 ? sec : '0' + sec
				  
			let reserDay = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + sec	

			let result = {
				"payIdx" : rsp.merchant_uid.substring(15,22),
				"rIdx" : String(${reserVO.rIdx }), //예약번호
				"price" : Number($('#lastTotal').text().replace(/,/g , '')),//가격
				"payDate" :  reserDay, //결제일
				"payMns" : rsp.pay_method, //지불수단
				"category" : '숙박 예약', //카테고리
				"point" :  $('.input-point').val()
			}
			
			$.ajax({
				url : "/mr/payment.do",
				type : "POST",
				data : JSON.stringify(result),
				contentType:'application/json;charset=utf-8',
				dataType: 'json',
				success: function(res){
					if(res == 1){ //db 성공시 반환값 res
					alert("예약함으로 이동하겠습니다.");	
					
					location.href = '/mr/roomState.do';
				}
			},
				error : function(request,status,error){
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
					}

				})
			}
		});
	})
});

</script>

<body>


<!-- ------------------------------------------------------------------------------------------------- -->
<%@include file="mainheader.jsp"%>
<div id="wrap">
    <form action="#" method="post" >
        <div class="con">
                <div class="title2" style='margin-bottom:40px'>예약상품 결제</div>
                <!-- <div class="subT"><li>다가올 예약</li></div> -->
        <table class="list">

<!--             <input type="hidden" name="name">
            <input type="hidden" name="phone">
            <input type="hidden" name="email"> -->

            <thead>
            <tr class="tb">
                <th width="15%">상품이미지</th>
                <th width="10%">상품명</th>
                <th width="10%">체크인</th>
                <th width="10%">체크아웃</th>
                <th width="10%">수량</th>
                <th width="10%">금액</th>
            </tr>
            </thead>
            <tbody>
                <tr class="item content">
                    <td class="item img"><img src="/mr/img/romm.jpg" width="100" height="100"></td>
                    <td class="item one">${roomDeVO.rmKind }</td>
                    <td id="info" class="item">${reserVO.startDate }</td>
                    <td class="item end">${reserVO.endDate }</td>
                    <td class="item count"><span id="item-count">${reserVO.count }</span>개</td>
                    <td class="item total"><span id="item-total">160000</span>원</td>
                </tr>
    
            </tbody>
        </table>


        <hr>


        <div class="relative">
            <div class="order">
                <div class="order-left">
                    <div class="form-header">
                        <div class="title1">결제정보</div>
                    </div>

                    <div class="form-body">
                        <label>구매자 정보</label>
                        <div class="data">
                            <div class="name">
                                <!--DB에서 이름 불러와야함 -->${vo.name}
                                <a href="/mr/userUpdate.jsp" class="btn01">정보수정</a>
                            </div>
                            <div class="phone"><!--DB에서 핸드폰 번호 갖고와야함 -->${vo.phone }</div>
                            <div class="email"><!--사용자 db에서 이메일 갖고 와야함 --> ${vo.email }</div>
                        </div>
                    </div>

                    <div class="form-body">
                        <label>필수 조건</label>
                        <div class="data">미성년자는 신청이 불가능합니다.<span>(미성년자 : 만 18세 이하)</span></div>
                    </div>

<!--                     <div class="form-body">
                        <label for="memo">요청 정보</label>
                        <input type="text" name="memo" class="input--text w100">
                    </div> -->
                    
                    <!-- 포인트 사용 -->
                    <div class="form-body">
                        <label for="memo">포인트 사용</label>
                        <div class="data">
                            <div class="point">보유 금액 : <span><!--DB에서 금액 갖고와야함 --> ${point }</span>원</div>
                            사용 금액 : <input type="text" class="input--text input-point" name="point" value="0">    
                            <button class="btn2" type="button" onclick="payAll()">전액 사용</button> 
                        </div>
                    </div>

                    
                    <div class="form-body payment-mthd">
                        <label for="memo">결제방법</label>
                        <div class="data">
                            <input type="radio" name="payment_method" value="신용카드" checked> 신용카드    
                        </div>
                    </div>
                  
            </div>


            <div class="order-right">
                <div class="form-header">
                    <div class="title1">&nbsp;</div>
                </div>

                <div class="pay-item">
                    <div class="title1">상품 금액</div>
                    <div class="box">
                        <div class="box-item">
                            <div class="box-title">${roomDeVO.rmKind }</div>
                            <div class="box-info">
                                <div class="detail">
                                    ₩<span class="sale-price"><!--DB에서 가격정보 불러와야함 --></span>원 &#10005 <span class="sale-count"></span>개
                                </div>
                                <div class="detail2">₩ <span id="sale-total"><!--DB에서 가격이랑 * 개수랑 곱한값-->65,000</span>원 </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pay-item pay-point">
                    <div class="title1">포인트 금액</div>
                    <div class="box">
                        <div class="box-item">
                            <div class="box-title">${roomDeVO.rmKind }</div>
                            <div class="box-info">
                                <div class="detail">
                                    포인트 금액:
                                </div>
                                <div class="detail2">(-)₩ <span id="lastPoint">0</span> </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="pay-item pay-point">
                    <div class="title1"></div>
                    <div class="box">
                        <div class="box-item">
                            <div class="box-title"></div>
                            <div class="box-info">
                                <div class="detail-pay">
                                    결제금액
                                </div>
                                <div class="detail2-pay">₩ <span id="lastTotal"><!--가격  -  point한 값-->60000</span> </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pay-submit">
                    <button type="button" class="btn" id="submit-btn">결제하기</button>
                </div>
            </div>
        </div>
            </div>
            <!-- 결제 정보  세션에서 유저정보 갖고 와야함-->
     




    </form>
    
    </div>

	<%@include file="../../mainfooter.jsp"%>


</body>
</html>