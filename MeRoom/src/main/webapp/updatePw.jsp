<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
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
	margin-top : 200px;
	
}

.btn01{
    width : 130px;
	margin : 0 0;
	margin-top : 20px;

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


</style>
<script>


function wrapclear(){
    $('.popup-wrap').css('opacity','0').css('display','none');
}

$(function(){
	
	var password = RegExp(/(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{6,20}$/);
	
	// 비밀번호 유효성 검사
	 $("#newPw").keyup(function(){
	      if(!password.test($("#newPw").val())){
	         console.log("사용불가능" + $("#newPw").val());
		         $("#pwComm").text("");
		         $("#pwComm").css("color", "red");
		         $("#pwComm").html("특수문자, 영문, 숫자 포함 6자 이상 20자 이내로 입력하세요");
		         
		         
		         $("#findbtn").prop("disabled", true);
		         $("#findbtn").css("color", "gray");
	         } else {
	         console.log("사용가능" + $("#pwd").val());
		         $("#pwComm").text("");
		         $("#pwComm").css("color", "green");
		         $("#pwComm").html("사용가능한 비밀번호입니다.");
		         
		         $("#findbtn").prop("disabled", false);
	         }   
	  });
	  
	// 비밀번호 동일한지 여부
	 $("#newPwCheck").keyup(function(){
	      if($("#newPwCheck").val() != $("#newPw").val()){
		         $("#pwComm2").text("");
		         $("#pwComm2").css("color", "red");
		         $("#pwComm2").html("비밀번호가 동일하지 않습니다.");
		         
		         $("#findbtn").prop("disabled", true);
		         $("#findbtn").css("color", "gray");
	         } else {
		         $("#pwComm2").html("");
		         $("#findbtn").prop("disabled", false);
	         }   
	  });
})



  $(function(){
	$("#findbtn").click(function(){
			var realpw = "${vo.password}";
			var originPw = $("#originPw").val();
			var password = $("#newPw").val();
		if (originPw != realpw) {
			alert("기존 비밀번호가 틀렸습니다.");
		} else {
			    $.ajax({
			    	type : "post",
			        url : "modifyPw.do",
			        data : {"password" : password},
			        success : function(resp){
			        	if(resp == "success") {
			        		$('.popup-wrap').css('opacity','1').css('display','block');
			        		$(".popup-detail").text("");
					        $(".popup-detail").html("비밀번호가 수정되었습니다.");
					        $('.popup-close').click(wrapclear);

			        	} else {
			        		$('.popup-wrap').css('opacity','1').css('display','block');
			        		$(".popup-detail").text("");
					        $(".popup-detail").html("비밀번호 변경에 실패했습니다. <br> 다시 시도해주세요");
					        $('.popup-close').click(wrapclear);
			        	}
			        }, 
			    });
		}
	 });
});
  
 
 

</script>

<body>
<%@ include file="mainheader.jsp" %>
	    <div class="wrap" >
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
                <div class="panel-heading">
                    비밀번호 변경하기
                </div>
                <div class="panel-body">
                	<br><br>
					<input type="password" id="originPw" class="input form-control" name="pw" placeholder="기존비밀번호">
					<br>
					 <input type="password"  id="newPw" class="input form-control" name="newpw" placeholder="새 비밀번호" >	
					 <div id="pwComm"></div>
					 <input type="password"  id="newPwCheck" class="input form-control" name="newpwCk" placeholder="새 비밀번호 확인" >	
					<div id="pwComm2"></div>

					 
					</div>
                  <br>
                  <br>
                </div>
            </div>
                <div class="button-box">
	            <button type="button" id="findbtn" class="btn btn-default btn01">변경하기</button>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-default btn01" value="취소" onclick="history.back()">    
			</div>     
			<br><br>


        </div>
	
	     <div class="popup-wrap">
             <div class="screen"></div>
                <div class="outer">
                    <div class="inner">
                        <div class="container3">
                            <div class="popup-content">
                                <p>아이디찾기</p>
                                <p class="popup-detail">
                                    회원님
                                </p>
                                <div class="buttons">
                                    <button class="button reser payment" onclick="location.href='main.jsp'">메인으로</button>
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