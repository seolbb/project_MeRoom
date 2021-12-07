<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name ="google-signin-client_id" content="592134177031-hjhk243f769qa8dlo0md5gn7jk7o7lt3.apps.googleusercontent.com">
 <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 네이버 콜백 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 </head>
<style>

.container {
	border: 2px solid #015B28;
    margin: 15px 10px;
}
.title {
	font-size : 20px;
	margin: 0px;
	padding: 5px 5px 15px 13px ;
}

.head {
	margin: 10px;
    padding-top: 9px;
    padding-right: 9px;
    border-bottom: 1px solid #ddd;
    font-weight: 600;
}
.star {
	display: flex;
	justify-content: center;
	font-size: 18px;
	padding-bottom: 15px;
}



.content {
	 margin: 10px 10px;
    padding: 10px 10px;
}

.btngroups{
	padding: 20px 0px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.btn {
	display:block;
	width: 140px;
    height: 40px;
    margin: 10px 10px;
    padding: 10px 10px;
    text-align: center;
    font-weight: 600;
	font-family: Arial, Sans-serif;
	color: #015B28;
    border: 2px solid #015B28;
    background-color: white;
    cursor: pointer;
    
}
/* #in {
	background-color: #015B28;
	color: white;
}  */

placeholder {
	color: gray;
}

</style>





<script type="text/javascript">
/* 구글 로그인 */

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
		var gid = profile.getId() + "@g";
		var nickname = profile.getName();
		var email = profile.getEmail();
		console.log("gid : " + gid);
		console.log("nickname : " + nickname);
		console.log("email : " + email);
		
		$('input[name="memberId"]').val(gid);
		$('input[name="nickname"]').val(nickname);
		$('input[name="email"]').val(email);
		
		$("#naverLogin").submit();
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
	/* 
	console.log(id);
	console.log(name);
	console.log(email);
	console.log(nickname);
	
	
	var nid = id + "@n";
	console.log("nid : " + nid);
	
	$('input[name="memberId"]').val(nid);
	$('input[name="name"]').val(name);
	$('input[name="nickname"]').val(nickname);
	$('input[name="email"]').val(email);
	
	$("#naverLogin").submit();
	
  } */
        
  
</script>

<script>
	
	$().ready(function(){
		
		$("#go").hide();
		$("#go").trigger('click');

	})


</script>

<body>

<%@ include file="mainheader.jsp" %>

<div class="container">
<form id="naverLogin" method="post" action="social.do" >
	<div class="head">
	<p class="title"></p>
	</div>
	
	<div class="content">
		<p class="star">처리중이니 잠시만 기다려주세요</p>
	
	</div>
		<div class="btngroups">
<!-- 		<button id="ok" class="btn cancel" >확인</button>
		<button type="submit" id="in" class="btn input" >가입하러 가기</button> -->
		<div id="go" class="g-signin2" data-onsuccess="onSignIn"></div>
		<input type="hidden" name="memberId">
		<input type="hidden" name="name" >
		<input type="hidden" name="nickname" >
		<input type="hidden" name="email">
	</div>
</form>
</div>
<%@ include file="mainfooter.jsp" %>

</body>
</html>