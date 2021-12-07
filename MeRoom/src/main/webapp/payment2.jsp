<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script>
	$(function(){
		$('#check2').click(function(){
			alert('asdsadasdsad');
			location.href="test.do";
		});
		
		$('#check1').click(function(){
			let IMP = window.IMP;
			IMP.init("imp58969486");
			IMP.request_pay({
				pg : "inisis",   // kakaopay  이니시스 웹표준 결제창  : 현재 카카오
				pay_method : "card",
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : "숙박 1박2일",
				amount:"100",  //상품 금액
				buyer_email : "sangm@naver.com",
				buyer_name : "박상민",
				buyer_tel : "010-2222-2222"
			}, function(rsp){
				if(rsp.success){ //결제 성공시
					alert('결제가 완료되었습니다.');
				
				let result = {
					"r_idx" : 1, //예약번호
					"price" : rsp.paid_amount,//가격
					"pay_date" :  new Date().getTime(), //결제일
					"pay_mns" : rsp.pay_method //지불수단
				}
				
				$.ajax({
					url : "/payment.do",
					type : "POST",
					data : JSON.stringify(result),
					contentType:'application/json;charset=utf-8',
					dataType: 'json',
					success: function(res){
						if(res == 1){ //db 성공시 반환값 res
						alert("추가성공");	
					}
				},
					error : function(){
						alert("통신실패");	
					}
				})
				}
			});
		
	
		})
		
	});

</script>
<body>
<div class="btns">
	<input type="button" id="check1" value="구매">
	<input type="button" id="check2" value="환불">
	<a href="test.do">saasd</a>
</div>
</body>
</html>