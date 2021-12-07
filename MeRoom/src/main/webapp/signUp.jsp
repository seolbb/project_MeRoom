<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- 카카오 지도  -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 </head>
<style>
/*공통 부분 */
*{
    box-sizing: border-box;
}
a{
    text-decoration: none;
    color: #000;
}


input{
    font-weight: 500;
    max-width: 100%;
    transition: border .2s ease-in-out;
}

.input:not([type="checkbox"]) {
    outline: none;
}
.w500{
    width: 500px !important;
}

.w15{
    width: 15% !important;

}

.w25{
    width: 25% !important;
}


  /* INPUT */
  .input--text {
    height: 40px;
    width: 400px;
    padding: 0 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px;
    outline: none;
    box-sizing: border-box;
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075); /* .75 아니고 .075 주의 */
  }
  .input--text:focus {
    border-color: #51a7e8 !important; /* header #search 선택자를 덮어쓰기 위해서 사용 */
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .075), 0 0 5px rgba(81, 167, 232, .5);
  }
  /* Vendor prefix(브라우저 업체별 접두어) */
  .input--text::-webkit-input-placeholder { color: #cacaca; }
  .input--text:-ms-input-placeholder      { color: #cacaca; }
  .input--text::-moz-placeholder          { color: #cacaca; }

    .name{
        width: 200px;
    }
    .address{
        width: 600px;
    }
	.phone {
		width: 80px;
	}


#wrap{
    min-height: 610px;
    padding: 30px 0 60px;
    max-width: 1180px;
    margin: 0 auto;

    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 400;
    color: #333;
   
}

.btngroups{
    display: flex;
	justify-content: center;
    padding-top: 20px;
  
}


.h2-Text{
    font-size: 14px;
    color: #999;
    padding-bottom: 17px;
    position: relative;
}

.h2-Text strong{
    display: inline-block;
    font-size: 20px;
    color: #333;
    vertical-align: middle;
}
.tb_main{
    width: 100%;
    color: #333;
    line-height: 1.3em;
}

table{
    table-layout: fixed;
    width: 100%;
    border-collapse: collapse;
}

.tb_main th{
    padding: 10px 10px 6px 20px;
    border-bottom: 1px solid #f1f1f1;
    background-color: #f9f9f9;
    text-align: left;
    vertical-align: middle;
    font-weight: bold;
    height: 50px;
}


.id-check{
    border-top: 2px solid black;
}
.tb_main th strong{
    font-size: 13px;
    font-weight: bold;
}

.tb_main th strong em{
    font-size: 14px;
    color: red;
}
p{
    margin:  0 0px;
}

.tb_main td{
    border-bottom: 1px solid #f1f1f1;
    padding: 10px;
    color: #333;
    vertical-align: middle;
    word-wrap: break-word;
}


.adCheck {
  background-color: white;
  border: 2px solid #015B28;
  color: #015B28;
  padding: 8px 18px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 500;
}



.btn {
	display:block;
	float: left; 
	width: 150px;
    height: 50px;
    margin: 10px 10px;
    padding: 10px 10px;
    text-align: center;
    font-weight: 600;
    cursor: pointer;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 2px solid #015B28;
    background-color: white;
    
    
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
   
   .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-bottom: 20px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px;} 
   
   .ui-widget.ui-widget-content {
    border: 1px solid #015B28;
    box-shadow: 1px 1px 3px #c5c5c5;
    border-radius: 0px;
    }
   
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
   
/*    .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 
   
   .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; }  */
   
   .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 
   
   .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 
   
   .ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year { width: 35%; }
   .ui-state-highlight,
   .ui-widget-content .ui-state-highlight,
   .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 
   
   .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 
   
   .inp:focus { outline: none; background-color: #eee; } 
/* ------------------------- */

</style>
<script>
$(function(){
	var emp = RegExp(/\s/g) // 공백
    var userId = RegExp(/(?=.*\d{1,20})(?=.*[a-zA-Z]{1,20}).{4,16}$/) // 아이디 소문자, 숫자
    var password = RegExp(/(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{6,20}$/);
	var ph = RegExp(/^[0-9]*$/); // 숫자만
	var email_id = RegExp(/^[a-zA-Z0-9_-]{4,20}$/); 
	var email_domail = RegExp(/^[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/); 
	
	
	// 아이디 유효성 검사
  $("#userId").keyup(function(){
      if(!userId.test($("#userId").val())){
         console.log("사용불가능" + $("#userId").val());
	         $("#idCheck").text("");
	         $("#idCheck").css("color", "red");
	         $("#idCheck").html("아이디는 영문, 숫자 4~16자리만 가능합니다.");
          	
	         $("#btnclick").prop("disabled", true);
	         $("#btnclick").css("color", "gray");
         } else {
        	 console.log("사용가능" + $("#userId").val());
	         $("#idCheck").text("");
	         $("#idCheck").css("color", "green");
	         $("#idCheck").html("사용가능한 아이디입니다.");
	         idOverlap();
	         $("#btnclick").prop("disabled", false);
         }
  }); 
	
	// 비밀번호 유효성 검사
	 $("#pwd").keyup(function(){
	      if(!password.test($("#pwd").val())){
	         console.log("사용불가능" + $("#pwd").val());
		         $("#pwComm").text("");
		         $("#pwComm").css("color", "red");
		         $("#pwComm").html("특수문자, 영문, 숫자 포함 6자 이상 20자 이내로 입력하세요");
		         
		         
		         $("#btnclick").prop("disabled", true);
		         $("#btnclick").css("color", "gray");
	         } else {
	         console.log("사용가능" + $("#pwd").val());
		         $("#pwComm").text("");
		         $("#pwComm").css("color", "green");
		         $("#pwComm").html("사용가능한 비밀번호입니다.");
		         
		         $("#btnclick").prop("disabled", false);
	         }   
	  });
	  
	// 비밀번호 동일한지 여부
	 $("#pwdCh").keyup(function(){
	      if($("#pwdCh").val() != $("#pwd").val()){
		         $("#pwComm2").text("");
		         $("#pwComm2").css("color", "red");
		         $("#pwComm2").html("비밀번호가 동일하지 않습니다.");
		         
		         $("#btnclick").prop("disabled", true);
		         $("#btnclick").css("color", "gray");
	         } else {
		         $("#pwComm2").html("");
		         $("#btnclick").prop("disabled", false);
	         }   
	  });
	 
	// 폰번호 유효성 검사
	 $(".phone").keyup(function(){
	      if(!ph.test($(this).val())){
		         $("#phComm").text("");
		         $("#phComm").css("color", "red");
		         $("#phComm").html("숫자만 입력해주세요");
		         
		         $("#btnclick").prop("disabled", true);
		         $("#btnclick").css("color", "gray");
	         } else {
	        	 $("#phComm").html("");
	        	 $("#btnclick").prop("disabled", false);
	         }
	  });
	
	// 이메일아이디 유효성 검사
	 $("#idMail").keyup(function(){
	      if(!email_id.test($("#idMail").val())){
		         $("#mailComm").text("");
		         $("#mailComm").css("color", "red");
		         $("#mailComm").html("이메일 형식이 맞지 않습니다.");
		         
		         $("#btnclick").prop("disabled", true);
		         $("#btnclick").css("color", "gray");
	         } else {
	        	 $("#mailComm").html("");
	        	 $("#btnclick").prop("disabled", false);
	         }
	  });


	// 이메일아이디 유효성 검사
	
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
		                    
		                    $("#btnclick").prop("disabled", true);
		                    $("#btnclick").css("color", "gray");
                        } else {
                            $("#mailComm").html("");
                            $("#btnclick").prop("disabled", false);
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
       
       

        $("#address_k").focusout(function() {
            if($(this).val() != ''){
            	$("#addressDetail").attr("readonly", false);
            }
        });
        
    

         $("#reKey").keyup(function(){
        	$("#btnclick").css("color", "gray");
        	$("#btnclick").prop("disabled", true);
        });
         
         
         $("#btnclick").click(function(){
      		idOverlap();
         });
         
        // 폰, 주소, 이메일 문자열 붙여서 전송하기
        
     	$("#btnclick").click(function(){
     		
    		let phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
    		$('input[name="phone"]').val(phone);

    		let address = $("#address_k").val() + ", " + $("#addressDetail").val();
    		$('input[name="address"]').val(address);
    		
    		let email = $("#idMail").val() + "@" + $("#inputMail").val();
    		$('input[name="email"]').val(email);
    	})
         

});



function idOverlap() {
    var memberId = $("#userId").val();
    var sendData = {"memberId" : memberId};
    console.log("memberId : " + memberId);
    $.ajax({
    	type : "post",
        url : "idOverlap.do",
        data : sendData,
        success : function(resp){
        	console.log("resp : " + resp);
        	if(resp == "fail") {
	        	$("#idCheck").text("");
		        $("#idCheck").css("color", "red");
		        $("#idCheck").html("중복된 아이디입니다.");
		   
		        $("#btnclick").prop("disabled", true);
		        $("#btnclick").css("color", "red");
        	} else {
        		$("#idCheck").text("");
    	        $("#idCheck").css("color", "green");
    	        $("#idCheck").html("중복 x 사용가능한 아이디입니다.");
    	        
    	        $("#btnclick").prop("disabled", false);
        	}
        }
    })
    
}


function sendMail() {
	var mailAddr = $("#idMail").val() +"@"+ $("#inputMail").val();

	$.ajax({
    	type : "post",
        url : "sendMail.do",
        data : {"email" : mailAddr},
        success : function(resp){
        	alert("메일이 성공적으로 보내졌습니다.  " + resp);
        	$("#reKeyCheck").click(function(){
        		if(resp == $("#reKey").val()) {
        		
        			alert("인증이 완료되었습니다.");

            		$("#btnclick").prop("disabled", false);
    		        $("#btnclick").css("color", "green");
            	} else {
            		alert("인증번호가 다릅니다. 다시 인증해주세요");
            		$("#reKey").focus();
            		$("#btnclick").prop("disabled", true);
    		        $("#btnclick").css("color", "gray");
            	}
        	});
        },
		error : function(jqXHR, textStatus, errorThrown){
			alert("이메일 보내기 실패 다시 시도해주세요");
			
		}
	})
}





</script>




<script>
$(function() {
    $( "#datepicker" ).datepicker({    	
    	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
        minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
        dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
        yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
        showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.	 
 
    });

  });
</script>

<script>
	function kakaoAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("address_k").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("address_k").focus();
	        }
	    }).open();
	}

</script>



<body>
<%@ include file="mainheader.jsp" %>

 <div id="wrap">

	<form id="form1" action="signUp.do" method="post" >
		<div class="h2-Text">
			<strong>회원가입</strong>
		</div>
		<table class="tb_main">
			<colgroup>
				<col style="width: 200px">
				<col>
			</colgroup>
			<tr class="id-check">
			<tbody>
				<tr>
					<th><strong>아이디<em>*</em></strong></th>
					<td>
						<input type="text" name="memberId" id="userId" class="input--text" 
						placeholder="4~12자의 영문소문자, 숫자로만 입력해주세요" required>
						<div id="idCheck"></div>
					</td>
				</tr>
			
	
				<tr>
					<th><strong>비밀번호<em>*</em></strong></th>
					<td>
						<input type="password" name="password" id="pwd" class="input--text"
							placeholder="특수문자, 영문, 숫자 포함 6자 이상 20자 이내로 입력하세요" required>
						<div id="pwComm"></div>
					</td>
				</tr>
				
				  <tr>

                    <th>
                        <strong>비밀번호 재확인<em>*</em></strong>
                    </th>
                    <td>
                        <input type="password" name="password2" id="pwdCh" class="input--text" 
                        placeholder="특수문자, 영문, 숫자 포함 6자 이상 20자 이내로 입력하세요"  required>
                  		<div id="pwComm2"></div>
                    </td>
                 </tr>
				
				 <tr>
                    <th>
                        <strong>이름<em>*</em></strong>
                    </th> 
                    <td>
                        <input type="text" name="name" class="input--text name" maxlength="20" 
                        placeholder="이름을 입력해 주세요" required>
                    </td>
                 </tr>
                  <tr>
                    <th>
                        <strong>닉네임<em>*</em></strong>
                    </th>
                    <td>
                        <input type="text" name="nickname" class="input--text name" maxlength="20" 
                        placeholder="이름을 입력해 주세요" required>
                    </td>
                 </tr>



				<tr>
					<th><strong>휴대폰 번호<em>*</em></strong></th>
					<td>
						<input type="text" id="phone1" name="phone1" 
							class="input--text phone" maxlength="3" required
							placeholder="000"> -
						<input type="text" id="phone2" name="phone2" 
							class="input--text phone" maxlength="4" required
							placeholder="0000"> -
						<input type="text" id="phone3" name="phone3" 
							class="input--text phone" maxlength="4" required
							placeholder="0000">	
						<input type="hidden" id="phoneNum" name="phone">
						<div id="phComm"></div>
					</td>
				</tr>
				
				
				
				<tr>
					<th><strong>생년월일<em>*</em></strong></th>
					<td><input type="text" id="datepicker" name="birth" class="input--text name" maxlength="8"
						placeholder="달력에서 선택해주세요" required></td>
				</tr>

		
				 <tr>

                    <th>
                        <strong>주소<em>*</em></strong>
                    </th>
                    <td>
                        <input type="text" id="address_k" name="address_k" class="input--text address" maxlength="30" 
                        placeholder="주소를 검색해주세요" required readonly>
                        <input type="button" id="kakao_Address" class="adCheck" onclick="kakaoAddress()" value="주소찾기">
                    </td>
                 </tr>
                 <tr>

                    <th>
                        <strong>상세주소<em>*</em></strong>
                    </th>
                    <td>
                        <input type="text" id="addressDetail" name="addressDetail" class="input--text address" maxlength="30" 
                        placeholder="상세 주소를 입력해주세요" required readonly>
                    	<input type="hidden" name="address" >
                    </td>
                 </tr>
				
		
				 <tr>

                    <th>
                        <strong>이메일<em>*</em></strong>
                    </th>
                    <td>
                        <input type="text" id="idMail" name="email_id" class="input--text name" required> @
                        <input type="text" id="inputMail" name="email_domain" class="input--text name" required readonly>
                        <select id="emailBox" name="emailBox" class="input--text name" required>
                            <option value="" class="pickMail">이메일 선택</option>
                            <option value="directly">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                        </select>
                        <input type="button" id="emailCheck" class="adCheck" value="인증하기">
                        <input type="hidden" name="email" >
                        <div id="mailComm"></div>
                    </td>
                 </tr>
				<tr>
                    <th>
                        <strong></strong>
                    </th>
                    <td>
                        <input type="text" id="reKey" class="input--text name" maxlength="20" placeholder="인증번호를 입력해주세요" required>
                   		<input type="button" id="reKeyCheck" class="adCheck" value="확인">
                    </td>
                 </tr>
				<br> 
		          </tbody>
            </table>
     
			<div class="btngroups">
				 <button type="submit" class="btn btn-success" id="btnclick" >가입하기</button>
				 <button type="submit" class="btn btn-default" id="back01" onclick="location.href='main.jsp'">취소하기</button>
           	 </div>
        </form>    
	 </div>
	<br> 
<%@ include file="mainfooter.jsp" %>

</body>
</html>