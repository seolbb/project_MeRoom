let selectBox = null;
let booli = false; 

$(function(){   
  
    let today = new Date();
    let year = today.getFullYear();
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);

    let dateString = day + '/' + month  + '/' + year;
    

    //달력 날짜 최소값 처리 
    
    // $('#jsCal1-text').blur(function(){
    //     let year2 = $('#jsCal1-text').val().substring(0,4);
    //     let month2 = $('#jsCal1-text').val().substring(5,7);
    //     let day2 = $('#jsCal1-text').val().substring(8,10);
    //     let dateString2 = day2 + '/' + month2  + '/' + year2;
    //     $('#jsCal2-text').attr('data-datapicker','')
    //     $('#jsCal2-text').attr('data-min',dateString2);
    // });


    $('#jsCal1-text').attr('data-min',dateString);
    
    $('#jsCal2-text').attr('data-min',dateString);

    $('#selectBox').on('mouseenter',function(){
        booli = true;
    }).on('mouseleave',function(){
        booli = false;
    })

    $('#selectBox2').on('mouseenter',function(){
        booli = true;
    }).on('mouseleave',function(){
        booli = false;
    })

    $('#btn-select').focusout(function(){
        if(!booli){
            selectBox.css('visibility','hidden');
            $('.total').removeClass('active1')
        }
    });
    $('#btn-select2').focusout(function(){
        if(!booli){
            selectBox.css('visibility','hidden');
            $('.total2').removeClass('active1')
        }
    });

    $('.item').click(function(){
        $('.item').removeClass('active2')
        //객실 data.value 이용해서 값 넣기
        if(selectBox.prop("id") === 'selectBox'){
            $('.value').text($(this).data('value'));
        } else{
            $('.value2').text($(this).data('value'));
        }  
        //해당 클릭에 클래스 색 추가
        $(this).addClass('active2')

        selectBox.css('visibility','hidden');
        $('.total').removeClass('active1')
        $('.total2').removeClass('active1')
    })
});

function btn_select(){
    selectBox = $('#selectBox');
    result()   
}
function btn_select2(){
    selectBox = $('#selectBox2');
    result()
}
function result(){
    if(selectBox.css('visibility') == 'hidden'){
        selectBox.css('visibility','visible');
        if(selectBox.prop("id") === 'selectBox'){
            $('.total').addClass('active1')
        }else{
            $('.total2').addClass('active1')
        }
    }else{
        selectBox.css('visibility','hidden');
        if(selectBox.prop("id") === 'selectBox'){
            $('.total').removeClass('active1')
        }else{
            $('.total2').removeClass('active1')
        }
    }
}
