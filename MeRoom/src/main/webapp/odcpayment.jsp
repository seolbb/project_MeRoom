<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/payment.css">
    <meta charset="UTF-8">
    <title>예약 결제페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="js/payment.js"></script>
	
</head>

<script>
/* payment.js */
$(function(){

    let itemCount = Number($('#item-count').text());
    let itemTotal = Number($('#item-total').text());

   $('.sale-count').html(itemCount);
   $('.sale-price').html(itemTotal);
   $('#sale-total').html(String(itemCount*itemTotal).replace(/\B(?=(\d{3})+(?!\d))/g, ","));

    let toTal = totalSum();
    change(toTal);

   /*3자리씩 끊어주는 식 db로부터 숫자로 받고 숫자에 대한 식은 다 적용해야함 */
   let point = $('.point span');
   let inputPoint = $('.input-point');
   let salePrice = $('.sale-price');

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
   change(salePrice);

  
    // point.html(point.text().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
});

/* 3자리 (,)삽입 */
function change(variable){
variable.html(variable.text().replace(/\B(?=(\d{3})+(?!\d))/g, ","))
}

/* 전액 사용 버튼 이벤트 */
function payAll(){
$('.input-point').val($('.point span').text().replace(/,/g , ''));
$('#lastPoint').html($('.point span').text());
let toTal = totalSum();
change(toTal);
}

/*결제금액 바꾸는 함수 */
function totalSum(){
let total =  $('#lastTotal').html(Number($('#sale-total').text().replace(/,/g , '')) - Number($('#lastPoint').text().replace(/,/g , '')));
return total;
}

function numberCheck(){
let inputPoint = Number($('.input-point').val());
let num_check = /^[0-9]*$/;
if(!num_check.test(inputPoint)){
    alert('숫자만 입력해주세요');
    
    $('.input-point').val(0);
    $('#lastPoint').html(0);

    let toTal = totalSum();
    change(toTal);
}

}

$(function(){
	/* alert("${rsv.orIdx}"); */
	$('#submit-btn').click(function(){
		let IMP = window.IMP;
		IMP.init("imp58969486");
		IMP.request_pay({
			pg : "inisis",   // kakaopay   inisis이니시스 웹표준 결제창  : 현재 카카오
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : "${oneday.oName}",
			amount:"100",  //상품 금액
			buyer_email : "sangm@naver.com",
			buyer_name : "박상민",
			buyer_tel : "010-2222-2222"
		}, function(rsp){
			if(rsp.success){ //결제 성공시
				alert("결제가 완료 되었습니다.");  //고유 아이디 : rsp.imp_uid
			let result = {
				"opIdx" : rsp.merchant_uid.substring(15,22),
				"orIdx" : ${rsv.orIdx},
				"opMoney" : Number($('#lastTotal').text().replace(/,/g , '')),
				"opDate" : new Date().getTime(), 
				"opMethod" : rsp.pay_method,
				"opPoint" : $('.input-point').val()
			}
			
			$.ajax({
				url : "insertPayment.do",
				type : "POST",
				data : JSON.stringify(result),
				contentType:'application/json;charset=utf-8',
				dataType: 'json',
				success: function(res){
					if(res == 1){ //db 성공시 반환값 res
					location.href = "onedayState.do";
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

<%@include file="mainheader.jsp"%>
<div id="wrap">
    <form action="insertPayment.do" method="post" >
        <div class="con">
                <div class="title2" style='margin-bottom:40px'>예약상품 결제</div>
        <table class="list">
            <!-- <input type="hidden" name="name">
            <input type="hidden" name="phone">
            <input type="hidden" name="email"> -->

            <thead>
            <tr class="tb">
                <th>클래스이미지</th>
                <th>클래스명</th>
                <th>옵션정보</th>
                <th>인원</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody>
                <tr class="item content">
                    <td class="item img"><img src="/upload/${oneday.oImg }" width="100" height="100"></td>
                    <td class="item one">${oneday.oName}</td>
                    <td id="info" class="item">
                    ${rsv.orDate}<br>
                    ${rsv.orTime}<br>
                    </td>
                    <td class="item count"><span id="item-count">${rsv.orCount}</span></td>
                    <td class="item total"><span id="item-total">${oneday.oPrice}</span>원</td>
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
                                <!--DB에서 이름 불러와야함 -->${vo.name }
                                <a href="userUpdate.jsp" class="btn01">정보수정</a>
                            </div>
                            <div class="phone"><!--DB에서 핸드폰 번호 갖고와야함 -->${vo.phone }</div>
                            <div class="email"><!--사용자 db에서 이메일 갖고 와야함 --> ${vo.email }</div>
                        </div>
                    </div>
                    
                    <!-- 포인트 사용 -->
                    <div class="form-body">
                        <label for="memo">포인트 사용</label>
                        <div class="data">
                            <div class="point">보유 금액 : <span><!--DB에서 금액 갖고와야함 --> 5000</span>원</div>
                            사용 금액 : <input type="text" class="input--text input-point" name="opPoint" value="0">    
                            <button class="btn2" type="button" onclick="payAll()">전액 사용</button> 
                        </div>
                    </div>
                    
                    <div class="form-body payment-mthd">
                        <label for="memo">결제방법</label>
                        <div class="data">
                            <input type="radio" name="pay_method" value="신용카드" checked> 신용카드    
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
                            <div class="box-title">${oneday.oName}</div>
                            <div class="box-info">
                                <div class="detail">
                                    ₩<span class="sale-price"><!--DB에서 가격정보 불러와야함 --></span>원 &#10005 <span class="sale-count"></span>개
                                </div>
                                <div class="detail2">₩ <span id="sale-total"></span>원 </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pay-item pay-point">
                    <div class="title1">포인트 금액</div>
                    <div class="box">
                        <div class="box-item">
                            <div class="box-title">${oneday.oName}</div>
                            <div class="box-info">
                                <div class="detail">포인트 금액:</div>
                                <div class="detail2">(-)₩ <span id="lastPoint">0</span></div>
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
                                <div class="detail-pay">결제금액</div>
                                <div class="detail2-pay">₩ <span id="lastTotal"></span></div>
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

	<%@include file="mainfooter.jsp"%>


</body>
</html>