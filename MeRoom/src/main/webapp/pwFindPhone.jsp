<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--폰트어섬추가 -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.wrap{min-height: 810px;}

.button-box{   
	text-align : center;
	display:flex;
	justify-content: center;
	
}

.btn01{
    width : 130px;
	margin : 0 0;
	margin-top : 20px;

}
.inputag{
	display : flex;
	justify-content: center;
}

.panel-body {
	min-height : 350px;
}



#idMail {
	width: 43%;
	margin : 0px; 
}
#inputMail {
	width: 43%;
	margin : 0px; 
}

#phone1 {
	width : 26%;
	margin : 0px; 
}
#phone2 {
	width : 26%;
	margin : 0px; 
}
#phone3 {
	width : 26%;
	margin : 0px; 
}


.popup-wrap{display:none; opacity: 0; position: fixed;z-index: 9998;top: 0; right: 0; bottom: 0; left: 0; transition: .4s opacity;}
.popup-wrap .screen{position: fixed; z-index: 0;top: 0;right: 0; bottom: 0;left: 0;background: #000;opacity: .2;}
.popup-wrap .outer{display: table; position: relative; z-index: 2; width: 100%; height: 100%;}
.popup-wrap .outer .inner{display: table-cell; padding-top: 50px; padding-bottom: 50px; vertical-align: middle;}
.popup-wrap .outer .inner .popup-content{
    width: 500px; 
    padding: 20px 30px;
    min-height: 10px;
    background: #fff;
    margin: 0 auto;
    position: relative;
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075), 0 0 5px rgba(000, 102, 000, 0.3);
}
.popup-wrap .outer .inner .popup-content:before{content: ''; display: block; width: 20px; height: 20px; float: right;}
.popup-wrap .outer .inner .popup-content p{
    letter-spacing: 2px;
    font-weight: 300;
    font-size: 22px;
    margin-top: 0;
    margin-bottom: 30px;
}
.popup-wrap .outer .inner .popup-content .popup-detail{font-weight: 300; font-size: 16px;}
.popup-wrap .outer .inner .popup-content .buttons{margin-top: 10px; margin-bottom: -30px; }
.popup-wrap .outer .inner .popup-content .buttons button {margin-right: 20px; margin-top: 10px; 
    background: white; border: 2px solid #015B28;
    color: #015B28;
    cursor: pointer;
    display: inline-block;
    height: 50px;
    line-height: 20px;
    font-weight: 400;
    padding: 0 40px;
    margin-left: 50px;
    margin-bottom: 50px;
}
    
.popup-wrap .outer .inner .popup-content .buttons button.payment:hover{
    background: #015B28; border: 2px solid #015B28; color: white;
    }
.button.reser{border-width: 2px; font-weight: 700; margin-right: 20px; margin-top: 10px; vertical-align: middle;}
.popup-wrap .outer .inner .popup-content .buttons button.clear{width:143px;margin-left: 28px; background: white; border: 1px solid black; color: black;}
.popup-wrap .outer .inner .popup-content .buttons button.clear:hover{color: #015B28; font-weight: 800;}

.popup-wrap .outer .inner .popup-content button.popup-close{
    background-color: #015B28;
    opacity: 1;
    width: 30px;
    height: 30px;
    right: 0px;
    top: 0px;
    border: 2px solid #015B28;
    transition: .3s background-color;
    display: block;
    position: absolute;
    z-index: 1;
}

.popup-wrap .outer .inner .popup-content button.popup-close:hover{
    background-color: transparent;
}
.popup-wrap .outer .inner .popup-content button.popup-close::before,
.popup-wrap .outer .inner .popup-content button.popup-close::after{
    background-color: #fff;
    margin-top: -1px;
    height: 2px;
    width: 33.3333%;
    left: 50%;
    margin-left: -16.66665%;
    content: '';
    display: block;
    position: absolute;
    top: 50%;
    -webkit-transform: rotate(45deg);
}
.popup-wrap .outer .inner .popup-content button.popup-close:hover::before,
.popup-wrap .outer .inner .popup-content button.popup-close:hover::after{
    background-color: #000;
}

.popup-wrap .outer .inner .popup-content button.popup-close::after{
    transform: rotate(-45deg);
}
.subGroup{
	display: flex;
	justify-content: center;
	margin-top: 25px;
}

/* Style tab links */
.tablink {
	float: left;
    outline: none;
    cursor: pointer;
    padding: 7px 16px;
    font-size: 15px;
    width: 50%;
    vertical-align: middle;
}


.tablink:hover {
  background-color: #015B28;
  color: white;
}

#ph {
  background-color: #015B28;
  color: white;
}

</style>
<script>


function wrapclear(){
    $('.popup-wrap').css('opacity','0').css('display','none');
}

  $(function(){
	$("#findbtn").click(function(){

			var user = $("#userId").val();
			var name = $("#nameId").val();
			var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();

			    $.ajax({
			    	type : "post",
			        url : "pwfindPhone.do",
			        data : {"memberId" : user, "name" : name, "phone" : phone},
			        success : function(resp){

			        	if(resp == "success") {
			        		$('.popup-wrap').css('opacity','1').css('display','block');
			        		$(".popup-detail").text("");
					        $(".popup-detail").html("임시비밀번호가 전송되었습니다.");
					        $(".payment").hide();
					        $('.popup-close').click(wrapclear);
	
			        	} else {
			        		$('.popup-wrap').css('opacity','1').css('display','block');
			        		$(".popup-detail").text("");
					        $(".popup-detail").html("비밀번호 재설정이 실패했습니다.");
					        $(".clear").hide();
					        $('.popup-close').click(wrapclear);
			        	}
			        }, 
			    });

	 });
});
  
 
 

</script>

<script>

</script>
   

<body>
<%@ include file="mainheader.jsp" %>
	    <div class="wrap" >
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
                <div class="panel-heading">
                    비밀번호 찾기
                </div>
                <div class="panel-body">   
                	<div class="subGroup">
                	<button id="mal" class="tablink" onclick="location.href='pwFindMail.jsp'" id="defaultOpen">Email</button>
					<button id="ph" class="tablink" onclick="location.href='pwFindPhone.jsp'" id="phoneOpen">Phone</button>  
                	</div>
                
                	<br>
                	<input type="text" id="userId" class="input form-control nameId" name="memberId" placeholder="ID"> 
					<input type="text" id="nameId" class="input form-control nameId" name="name" placeholder="이름">
					<br>
					<div class="inputag">
					    <input type="text" id="phone1" name="phone1"  class="input form-control phone" maxlength="3" placeholder="000"> 
				        <div style="margin: 7px 10px 10px 10px;">-</div>
				        <input type="text" id="phone2" name="phone2" class="input form-control phone" maxlength="4"  placeholder="0000"> 
				        <div style="margin: 7px 10px 10px 10px;">-</div>
				        <input type="text" id="phone3" name="phone3" class="input form-control phone" maxlength="4" placeholder="0000">	
					    <input type="hidden" id="phoneNum" name="phone">
					</div>
                  <br>
                  <br>
                </div>
            </div>
                <div class="button-box">
				<input type="button" class="btn btn-default btn01" value="뒤로가기" onclick="history.back()">   
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<button type="button" id="findbtn" class="btn btn-default btn01">재설정하기</button>
	           
			</div>     
			<br><br>


        </div>

    </div>
	
	     <div class="popup-wrap">
             <div class="screen"></div>
                <div class="outer">
                    <div class="inner">
                        <div class="container3">
                            <div class="popup-content">
                                <p></p>
                                <p class="popup-detail">
                                   
                                </p>
                                <div class="buttons">
                                    <button class="button reser payment" onclick="location.href='pwFindPhone.jsp'">다시찾기</button>
                                    <button class="button reser clear" onclick="location.href='login.jsp'">로그인</button>
                                </div>


                                <button type="button" class="popup-close">

                                </button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	
	

<%@ include file="mainfooter.jsp" %>
</body>



</html>