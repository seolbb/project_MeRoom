$(function(){
	
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