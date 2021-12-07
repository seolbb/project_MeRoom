<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>예약하기</title>
   <link rel="stylesheet" type="text/css" href="header.css">
   <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
   .mainphoto {
/* width : 100%; */
   padding-left: 30px;
   padding-right: 30px;
   }

   .mainphoto img {
       /* display: inline-block; */
       width: 100%;
       height: 500px;
       margin-bottom: 60px;
   }    

   .main {
       max-width: 1180px; 
       margin-left: 100px;
       margin-right: 100px;
   }

   .info {
       height: 100%;
       display: inline-block;
       max-width: 750px;
       min-width: 320px;
       margin-right: 20px;
       align-items: center;
       justify-content: center;
   }
   
   .infotext {
         max-width: 750px;
   }
   .panel_inner img {
         max-width: 750px;
   }
   
    .in_tit_sub{
         max-width: 750px;
    }
    
    .panel_details{
         max-width: 750px;
    }
   
    .infotext img {
      max-width: 750px;
   }

   .imgpart {
       /* width: 700px; */
       margin-bottom: 50px;
   }
   
   .imgpart img {
       width: 50%;
       height: auto;
   }


   .inputdate {
       border: none;
       font-size: 20px;
   }
   
   /* 달력 */
   .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 
   
   .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 
   
   .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 
   
   .ui-state-default,
   .ui-widget-content .ui-state-default,
   .ui-widget-header .ui-state-default,
   .ui-button,
   html .ui-button.ui-state-disabled:hover,
   html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 
   
   .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 15px; padding: 0px; font-weight: bold; } 
   
   .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-bottom: 20px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 400px;} 
   
   .ui-widget.ui-widget-content { border: 1px solid #eee; } 
   
   #datepicker:focus>.ui-datepicker { display: block; } 
   
   .ui-datepicker-prev,
   .ui-datepicker-next { cursor: pointer; } 
   
   .ui-datepicker-next { float: right; } 
   
   .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 
   
   .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 
   
   .ui-datepicker-calendar { width: 100%; } 
   
   .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 
   
   .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}
   
   .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 
   
   .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 
   
   .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 
   
   .ui-state-hover,
   .ui-widget-content .ui-state-hover,
   .ui-widget-header .ui-state-hover,
   .ui-state-focus,
   .ui-widget-content .ui-state-focus,
   .ui-widget-header .ui-state-focus,
   .ui-button:hover,
   .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 
   
   .ui-widget-header .ui-icon { background-image: url('img/btns.png'); } 
   
   .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 
   
   .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 
   
   .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 
   
   .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 
   
   .ui-state-highlight,
   .ui-widget-content .ui-state-highlight,
   .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 
   
   .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 
   
   .inp:focus { outline: none; background-color: #eee; } 
   
/* ------------------------- */

   .button {
   width: 300px;
   margin-right: 20px;
   margin-top: 20px;
   background: #015B28;
   border: 2px solid #015B28;
   color: white;
   cursor: pointer;
   display: inline-block;
   height: 50px;
   line-height: 20px;
   font-weight: 400;
   padding: 0 40px;
   margin-left: 50px;
   margin-bottom: 50px;
   }

   .button:hover {
       background-color: white;
       color: #015B28;
   }

   .rvinfo{
       display: block;
       width: 400px;
       border-top: 1px solid #eee;
       border-bottom: 1px solid #eee;
       padding: 15px;
       font-size: 15px;
   }
   
   .rvpart {top: 70px; width: 320px; float: right; padding-left: 10px;  padding-right: 10px; position: sticky;}

   .numBox {
       width: 40px;
       text-align: center;
   }

   .bar {
       width: 500px;
       margin: 0 auto
   }
   .time {
         padding: 1px 2px;
       display: flex;
       font-size: 15px;
   }

   .plus {
        width: 24px;
        height: 28px;
    }
    
    .minus {
        width: 24px;
        height: 28px;
    }

    .pricebar{
        width: 500px;
        display: flex;
        margin-top: 10px;
        font-weight: bold;
        color: #015B28;

    }

    .pricetext {
        font-size: 20px;
    }

    .price {
       margin-left: 180px;
        font-size: 20px;
        float: right;
    }
    
    .maxCnt {
       padding: 1px 2px;
       float:left;
        margin-right: 180px;
        font-size: 15px;
    }
    
    #my_hidden_input{
       border:none;
       font-size: 20px;
       font-weight: 600;
       }
    
</style>
</head>
<body>
   <%@include file="mainheader.jsp" %>

   <div class="mainphoto">
       <img src="img/healingmain.jpg"/>
   </div>
   
   <div class="main">
      <form action="insertRsv.do" method="post" id="form">
         <div class="info">
            <div class="imgpart">
                  <img src="/upload/${oneday.oImg }" style="width: 750px; height:auto;" />
            </div>
         </div>
         <div class="rvpart">
             <div id="datepicker"></div>
             <div class="rvinfo">
                 <input type="text" id="my_hidden_input" class="inputdate" name="orDate">
                 <div class="bar">
                  <div class="time">${oneday.oTime }</div><input type="hidden" name="orTime" value="${oneday.oTime }">
                  <div class="maxCnt">남은 인원 : <span id="spanMaxCnt"></span>명</div>
                  <div class="cnt">
                      <button type="button" class="minus">-</button>
                      <input type="number" class="numBox" max="" name="orCount" value="1" readonly="readonly"/>
                     <button type="button"class="plus">+</button>
                  </div>
               </div>
                <div class="pricebar">
                    <div class="pricetext">총 결제금액</div>
                    <div class="price">₩ <span id="totalPrice"></span></div>
                </div>
            </div>
            <button type="button" class="button">예약하기</button>
         </div>
         <div class="infotext">${oneday.oInfo }</div>
         <input type="hidden" name="oIdx" value="${oneday.oIdx }">
         <input type="hidden" class="orIdx" name="orIdx">
         <input type="hidden" name="memberid" value=${vo.memberId }>
      </form>
   </div>
      
   <%@include file="mainfooter.jsp" %>   
   
   </body>
   <script>
   
   /* 예약번호 랜덤 생성 */
    $(function(){
       
       $(".rvinfo").css('display','none');
       
      var date = new Date();
      var components = [
          date.getYear(),
          date.getMonth(),
          date.getDate(),
          date.getHours(),
          date.getMinutes(),
          date.getSeconds(),
          date.getMilliseconds()
      ];

      var id = components.join("");
      $(".orIdx").val(id);
      
   });
   
   let cnt = 0;
   /* 달력 */
   var oDate = "${oneday.oDate}";
   var arr = oDate.split(",");

   var availableDates = arr;
   function available(date) {
      var thismonth = date.getMonth()+1;
      var thisday = date.getDate();
      if(thismonth<10){
         thismonth = "0"+thismonth;
      }
      if(thisday<10){
         thisday = "0"+thisday;
      }
       ymd = date.getFullYear() + "/" + thismonth + "/" + thisday;
       if ($.inArray(ymd, availableDates) >= 0) {
           return [true,"",""];
       } else {
           return [false,"",""];
       }
   }
   
   $('#datepicker').datepicker({ 
      dateFormat: "yy/mm/dd",
      regional: "ko",
      beforeShowDay: available,
       onSelect: function(selected,evnt) {
            updateAb(selected);
            show();
       }
   });
   
   function updateAb(value){     
       $('#my_hidden_input').val(value);
       $('.numBox').val(1);
       $('#totalPrice').html(String(oPrice * 1).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
       restCnt();
   }
   
   /* 예약된 수량 가져오는 ajax */
      function restCnt(){
         let oIdx = ${oneday.oIdx };
         let input = $('#my_hidden_input').val();
         console.log(oIdx);
         console.log(input);
         let result = {
               "oIdx" : oIdx,
               "orDate" : input
         }
       $.ajax("restCnt.do", {
         type : "post",
         data : JSON.stringify(result),
         contentType:'application/json',
         dataType: 'json',
         success : function(data){
            console.log("data 예약된 수량 : " + data); // 예약된 수량
            cnt = ${oneday.oCnt} - data;
            console.log("cnt 예약 가능한 수량 : " + cnt); // 예약 가능한 수량
            $("#spanMaxCnt").html(cnt);
         },
         error : function(request,status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
         }
      });
      }
   
   /* 날짜 필수 선택 */
   $(".button").click(function(){
      if($(".inputdate").val() == ""){
         alert("날짜를 선택해주세요.");
      } else {
         $("#form").submit();
      }
   });
   
   /* 수량, 금액   */
   let oPrice = ${oneday.oPrice}; 
   $('#totalPrice').html(String(oPrice).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
   
   $(".plus").click(function(){
      var num = $(".numBox").val();
      var plusNum = Number(num) + 1;
      let oCnt = ${oneday.oCnt};
      if($(".inputdate").val() == ""){
         alert("날짜를 선택해주세요.");
      } else {
         if(plusNum > cnt) {
            $('.numBox').attr('max',cnt);
            alert("인원/수량은 최대 " + cnt + "개까지 선택 가능합니다");
         } else {
            $(".numBox").val(plusNum);          
            $('#totalPrice').html(String(oPrice * plusNum).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
         }
      }
   });
   
   $(".minus").click(function(){
      var num = $(".numBox").val();
      var minusNum = Number(num) - 1;
      
      if(minusNum <= 0) {
         $(".numBox").val(num);
      } else {
         $(".numBox").val(minusNum);          
         $('#totalPrice').html(String(oPrice * minusNum).replace(/\B(?=(\d{3})+(?!\d))/g, ","));
      }
   });
   
   /* 클래스 옵션 보여지기 */
   function show(){
      $(".rvinfo").show();
   }
   

   
   
   
   </script>

</html>