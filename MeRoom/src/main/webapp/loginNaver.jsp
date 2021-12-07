<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
  var naver_id_login = new naver_id_login("3AtrdTBaF5yq3VjOQAEe", "http://localhost:8080/mr/loginNaver.jsp");
  // 접근 토큰 값 출력

  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
/*     alert(naver_id_login.getProfileData('id'));
    alert(naver_id_login.getProfileData('name'));
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname')); */

	var id = naver_id_login.getProfileData('id');
	var name = naver_id_login.getProfileData('name');
	var email = naver_id_login.getProfileData('email');
	var nickname = naver_id_login.getProfileData('nickname');
/* 	console.log(id);
	console.log(name);
	console.log(email);
	console.log(nickname); */
	
	
	var nid = id + "@n";
/* 	console.log("nid : " + nid); */
	
	$('input[name="memberId"]').val(nid);
	$('input[name="name"]').val(name);
	$('input[name="nickname"]').val(nickname);
	$('input[name="email"]').val(email);
	
	$("#naverLogin").submit();
	
  }
        
  
</script>

<script>
	
	$().ready(function(){
		
		$("#in").hide();
		$("#ok").hide();

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
		<button id="ok" class="btn cancel" >확인</button>
		<button type="submit" id="in" class="btn input" >가입하러 가기</button>
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