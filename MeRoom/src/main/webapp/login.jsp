<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 구글 로그인 -->
<meta name ="google-signin-client_id" content="592134177031-hjhk243f769qa8dlo0md5gn7jk7o7lt3.apps.googleusercontent.com">
 <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 네이버 로그인  -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--폰트어섬추가 -->
<!--  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
 <link rel="stylesheet" href="css/login.css">
<style>


#llogin {
	display:block;
    height: 50px;
    margin: 0 auto;
    margin-top: 20px;
    width: 350px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 1px solid #ccc;
    background-color: #fff;
    border-radius:4px;
}

.out {
	display:flex;
	justify-content: center;
	margin: 15px;
}

.logo {
	margin: 0px 10px;
}

.wrap {
	min-height: 810px;
}



</style>

</head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<script>

	window.name = "loginPage";


//카카오로그인


/* 구글 로그인 */

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
	

function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    		var id_token = googleUser.getAuthResponse().id_token;
    		
    		var xhr = new XMLHttpRequest();
    		xhr.open('POST', 'googleLogin.do');
    		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    		xhr.onload = function() {
    		  console.log('Signed in as: ' + xhr.responseText);
    		  console.log('idtoken=' + id_token);
    		};
    		xhr.send('idtoken=' + id_token);
    		
        }, function(error) {
          console.log(JSON.stringify(error, undefined, 2));
        });
  }
	



</script>






<body>
<%@ include file="mainheader.jsp" %>
   
    <form action="login.do" method="post" id="frm">
       
       <div class="wrap" >
 
            <div id="cont1">
                <div id = "panel" class="panel panel-default">
	                <div class="panel-heading">
	                    로그인
	                </div>
	                <div class="panel-body">
	                    <input type="text" id="id" class="input form-control" name="memberId" placeholder="ID" required>
	                    <br>
	                      <input type="password" id="pwd" class="input form-control" name="password" placeholder="비밀번호" required>
	                    <br>
	                    <br>
	                </div>
				</div>
            <button type="submit" id="llogin" class="bbtn" value="Login">로그인</button>
            <br>
            <div class="out">


	           <div><a href="https://kauth.kakao.com/oauth/authorize?client_id=c80f9b0fbece8c66d7feef895ade32f0&redirect_uri=http://localhost:8080/mr/kakaologin.do&response_type=code">
		            <img class="logo kakao" alt="kakao" src="img/kakaobtn.png" width="40" height="40"></a></div>
			  <!-- 네이버 로그인 버튼 노출 영역 -->
			  <div id="naver_id_login" class="logo naver"></div>
			  <!-- //네이버 로그인 버튼 노출 영역 -->
				<script type="text/javascript">
				var naver_id_login = new naver_id_login("3AtrdTBaF5yq3VjOQAEe", "http://localhost:8080/mr/loginNaver.jsp");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("green", 1,40);
				naver_id_login.setDomain(".service.com");
				naver_id_login.setState(state);
				//naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			  </script>
				<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				<div class="logo"><a href="loginGoogle.jsp"><img alt="logo" src="img/google.png" width="40px"></a></div>
            </div>
         <br><br>
            <div class="bottom-menu">
                <a href="signUp.jsp">회원가입</a>
                <a href="idFindMail.jsp">아이디 찾기</a>
                <a href="pwFindMail.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </div>
        <div id="naver_id_login"></div>
   </form>
   
   
<%@ include file="mainfooter.jsp" %>
</body>
</html>