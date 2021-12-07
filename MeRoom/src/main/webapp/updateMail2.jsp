<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email 변경하기</title>
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

#nameId {
	width : 100%;
	margin : 0px; 
}

#idMail {
	width: 45%;
	margin : 0px; 
}
#inputMail {
	width: 45%;
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

#mal {
  background-color: #015B28;
  color: white;
}

.panel-body .input {
    width: 100%;
    height: 50px;
    margin-bottom: 20px;
    margin-left: 0px;
}

.adCheck{
	background-color: white;
	border: 2px solid #015B28;
	color: #015B28;
	padding: 6px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 600;
	
}



.ckbox {
display: flex;
}

.adCheckgup {
	justify-content: right;
	
}
#emailCheck {
	text-align: right;
	margin-left: 265px;
    margin-top: 15px;
}
#reKeyCheck {
	text-align: right;
	margin-left: 290px;
	margin-top: 0px;
}
</style>
<script>


function wrapclear(){
    $('.popup-wrap').css('opacity','0').css('display','none');
}

	$(function(){
		let email = '${vo.email}';

		$('input[name="email_id"]').val(email.substr(0,email.indexOf("@")));
		$('input[name="email_domain"]').val(email.substr(email.indexOf("@")+1,email.length));
		
	})

	$(function(){
		var email_id = RegExp(/^[a-zA-Z0-9_-]{4,20}$/); 
		var email_domail = RegExp(/^[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/); 
		
		
		 $("#idMail").keyup(function(){
		      if(!email_id.test($("#idMail").val())){
			         $("#mailComm").text("");
			         $("#mailComm").css("color", "red");
			         $("#mailComm").html("이메일 형식이 맞지 않습니다.");
			         
			         $("#findbtn").prop("disabled", true);
			         $("#findbtn").css("color", "gray");
		         } else {
		        	 $("#mailComm").html("");
		        	 $("#findbtn").prop("disabled", false);
		         }
		  });
		 
		 
        $("#emailBox").change(function() {
            if ($("#emailBox").val() == "directly") {
                $("#inputMail").attr("readonly", false);
                $("#inputMail").val("");
                $("#inputMail").focus();
                 $("#inputMail").keyup(function(){
                     if(!email_domail.test($("#inputMail").val())){
		                    $("#mailComm").text("");
		                    $("#mailComm").css("color", "red");
		                    $("#mailComm").html("이메일 형식이 맞지 않습니다.");
		                    
		                    $("#findbtn").prop("disabled", true);
		                    $("#findbtn").css("color", "gray");
                        } else {
                            $("#mailComm").html("");
                            $("#findbtn").prop("disabled", false);
                        }
                     });
            }  else {
                $('#inputMail').val($('#emailBox').val());
                $("#inputMail").attr("readonly", true);
            }
        });		
		
	    $("#emailCheck").click(function(){
	        console.log("이메일 인증 id : " + $("#idMail").val());
	        console.log("이메일 인증 domain : " + $("#inputMail").val());
	        console.log("이메일 합 : " + $("#idMail").val() + "@" + $("#inputMail").val());
	        sendMail();
	    }); 
	    
        $("#reKey").keyup(function(){
        	$("#findbtn").css("color", "gray");
        	$("#findbtn").prop("disabled", true);
        });
		
     	$("#findbtn").click(function(){
    		let email = $("#idMail").val() + "@" + $("#inputMail").val();
    		

    		$('input[name="email"]').val(email);
    	})
		
    	$("#findbtn").click(function(){
			let email = $("#idMail").val() + "@" + $("#inputMail").val();


			 $.ajax({
			    	type : "post",
			        url : "modifyPw.do",
			        data : {"email" : email},
			        success : function(resp){
			        	if(resp == "success") {
			        		$('.popup-wrap').css('opacity','1').css('display','block');
			        		$(".popup-detail").text("");
					        $(".popup-detail").html("Email이 정상적으로 수정되었습니다.");
					        $('.popup-close').click(wrapclear);

			        	} else {
			        		$('.popup-wrap').css('opacity','1').css('display','block');
			        		$(".popup-detail").text("");
					        $(".popup-detail").html("Email 변경에 실패했습니다. <br> 다시 시도해주세요");
					        $('.popup-close').click(wrapclear);
			        	}
			        }, 
			    });
		
	 });
		
	});

function sendMail() {
	var mailAddr = $("#idMail").val() +"@"+ $("#inputMail").val();

	$.ajax({
    	type : "post",
        url : "sendMail.do",
        data : {"email" : mailAddr},
        success : function(resp){
        	alert("메일이 성공적으로 보내졌습니다.");
        	$("#reKeyCheck").click(function(){
        		if(resp == $("#reKey").val()) {
        			alert("인증이 완료되었습니다.");

            		$("#findbtn").prop("disabled", false);
    		        $("#findbtn").css("color", "green");
            	} else {
            		alert("인증번호가 다릅니다. 다시 인증해주세요");
            		$("#reKey").focus();
            		$("#findbtn").prop("disabled", true);
    		        $("#findbtn").css("color", "gray");
            	}
        	});
        },
		error : function(jqXHR, textStatus, errorThrown){
			alert("메일보내기 실패 다시 시도해주세요");
			
		}
	})
}
  
 
 

</script>

<body>
<%@ include file="mainheader.jsp" %>
	    <div class="wrap" >
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
                <div class="panel-heading">
                     Email 변경하기
                </div>
                <div class="panel-body">                 
                	<br>
                	<input type="text" id="userId" class="input form-control nameId" name="memberId" placeholder="ID"> 
					<input type="text" id="nameId" class="input form-control nameId" name="name" placeholder="이름">
					<br>
					<div class="inputag">
					   <input type="text"  id="idMail" name="email_id" class="input form-control nameId"  placeholder="EMAIL" >
						<div style="margin: 10px 10px 10px 10px;">@</div> 
						<input type="text" id="inputMail" name="email_domain" class="input form-control nameId" placeholder="EMAIL" >
						
						<input type="hidden" name="email" >
                        <div id="mailComm"></div>


					</div>
					<input type="button" id="emailCheck" class="adCheck" value="인증하기">
					<div class="ckbox">					 	
					<input type="text" id="reKey" class="input form-control" maxlength="20" placeholder="인증번호를 입력해주세요" required>
                   	</div>
                   	<input type="button" id="reKeyCheck" class="adCheck" value="확인" height="30%">
                  <br>
                  <br>
                </div>
            </div>
                <div class="button-box">
				<input type="button" class="btn btn-default btn01" value="뒤로가기" onclick="history.back()">   
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<button type="button" id="findbtn" class="btn btn-default btn01">변경하기</button>
			</div>     
			<br><br><br><br><br><br>


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
                                    
                                    <!-- <button class="button reser clear" onclick="location.href='login.jsp'">로그인</button> -->
                                    <button class="button reser payment" onclick="location.href='main.jsp'">확인</button>
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