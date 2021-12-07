<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function signup() {
	}
</script>
<style>
* {
	font-family: "Noto Sans KR" !important;
	box-sizing: border-box !important;
}
.main_container {
	max-width: 1180px;
	height: 700px;
	margin: 0 auto;
	padding: 10px 0 10px 0;
	display: flex;
}

.right_container {
	padding: 15px 40px;
	width: 980px;
	height: 600px;
}
.right_main {
	width: 900px;
	height: 570px;
	position: relative;
}
.member_title {
	width: 900px;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	font-weight: 300;
}
/* 내용 부분 컨테이너 */
/* 내용 부분 헤더 */
.right_header {
	width: 900px;
	height: 35px;
	display: flex;
	position: relative;
}
#underLine1 {
	position: absolute;
	left: 0px;
	top: 27px;
	width: 145px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}
#underLine {
	position: absolute;
	right: 0px;
	top: 27px;
	width: 670px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}
.right_menu > a {
	font-size: 16px;
	font-weight: 300;
	color: lightgray;
	margin-left: 10px;
}
#right_insert > a {
	font-size: 22px;
	font-weight: 500;
	color: #015b28;
}
/* 내용 부분 메인 */
#signup_form {
	width: 900px;
	height: 485px;
	display: flex;
}
.required {
	width: 500px;
	height: 485px;
	border-width: 0 1px 1px 0;
	border-style:none solid solid none;
	border-color: white black black white;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
	padding-right: 20px;
}
.signup_title {
	width: 480px;
	height: 40px;
	line-height: 40px;
	font-size: 18px;
	font-weight: 500;
}
.required_text {
	font-size: 12px;
	width: 480px;
	height: 20px;
	line-height: 20px;
	text-align: right;
}
.required_form {
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	width: 480px;
	height: 400px;
}
.optional_form {
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	width: 365px;
	height: 300px;
	padding-left: 10px;
}
.buttonbox {
	width: 365px;
	height: 100px;
	display: flex;
	justify-content: flex-end;
}
.buttonbox input {
	width: 70px;
	height: 25px;
	line-height: 20px;
	text-align: center;
	margin-left: 10px;
	cursor: pointer;
	background-color: white;
	box-shadow: 1px 1px 1px gray;
	border-radius: 3px;
	border: 2px solid #015b28;
}
.buttonbox input:hover {
	background-color: #F1F1F1;
}
.buttonbox input:active {
	border: 1px solid #015b28;
	box-shadow: none;
	background-color: white;
}
.form_shortbox {
	width: 220px;
	height: 50px;
	margin-bottom: 20px;
}
.form_longbox {
	width: 350px;
	height: 50px;
	margin-bottom: 20px;
	margin-left: 20px;
}
.form_items {
	width: 100px;
	height: 20px;
	margin-bottom: 2px;	
	font-size: 12px;
}
.form_shorttext {
	width: 160px;
	height: 25px;
	border-radius: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px gray;
}
.form_longtext {
	width: 250px;
	height: 25px;
	border-radius: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px gray;
}
.optional {
	width: 385px;
	height: 485px;
	margin-left: 15px;
	border-width: 0 1px 1px 0;
	border-style:none solid solid none;
	border-color: white black black white;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
	padding-right: 20px;
}
.optional_text {
	font-size: 12px;
	width: 365px;
	height: 20px;
	line-height: 20px;
	text-align: right;
	margin-top: 40px;
}

/* 하단 페이징 */
</style>
</head>
<div class="container">
	<%@ include file="/views/adminMainHeader.jsp" %> <!-- 헤더 메뉴 -->
	
	<main>
	<div class="main_container">
	<!-- 사이드 메뉴 -->
		<%@ include file="/views/management/mgmtSide.jsp" %> <!-- 사이드 메뉴 -->
		<div class="right_container">
	<div class="right_main">
	<div class="member_title">회원관리</div>
	<!-- 내용 헤더 -->
	<%@ include file="/views/management/mgmtMember/memberHeader.jsp" %>
		<form id="signup_form" action="/mr/signUpAdmin.do" method="post">
			<div class="required">
				<div class="signup_title">
					회원 신규 등록
				</div>
				<div class="required_text">
				</div>
				<div class="required_form">
					<div class="form_longbox">
						<div class="form_items">아이디</div>
						<input type="text" name="memberId" class="form_longtext" required="required">
					</div>
					<div class="form_longbox">
						<div class="form_items">이름</div>
						<input type="text" name="name" class="form_longtext" required="required">
					</div>
					
					<div class="form_longbox">
						<div class="form_items">이메일</div>
						<input type="email" name="email" class="form_longtext" required="required">
					</div>
					<div class="form_longbox">
						<div class="form_items">비밀번호</div>
						<input type="text" name="password" class="form_longtext" required="required">
					</div>
					<div class="form_longbox">
						<div class="form_items">주소</div>
						<input type="text" name="address" class="form_longtext" required="required">
					</div>
					<!-- <div class="form_longbox">
						<div class="form_items">비밀번호확인</div>
						<input type="password" name="passwordCheck" class="form_longtext" required="required">
					</div> -->
				</div>
			</div>
			<div class="optional">
				<div class="optional_text">
				</div>
				<div class="optional_form">
					<div class="form_longbox">
						<div class="form_items">닉네임</div>
						<input type="text" name="nickname" class="form_longtext" required="required">
					</div>
					<div class="form_longbox">
						<div class="form_items">연락처</div>
						<input type="text" name="phone" class="form_longtext" required="required">
					</div>
					<div class="form_longbox">
						<div class="form_items">생년월일</div>
						<input type="text" name="birth" class="form_longtext" required="required">
					</div>
				</div>
				<div class="buttonbox">
					<input type="submit" value="등록">
					<input type="reset" value="초기화">
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
	</main>
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>
</body>
</html>