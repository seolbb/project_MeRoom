<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>원데이클래스 메인화면</title>
<style>

* {
font-family: 'Nanum Gothic', sans-serif;
}

.mainphoto {
	/* width : 100%; */
    padding-left: 30px;
    padding-right: 30px;
}

.mainphoto img {
    /* display: inline-block; */
	width: 100%;
    height: 500px;
}

.explain {
	text-align: center;
	margin: 100px auto;
}

.main {
    /* display: inline-block; */
    flex-wrap:wrap;
    align-items:flex-start;
    padding-right: 120px;
    padding-left: 120px;
    margin-top: 100px;
    margin-bottom: 100px;
}

.img {
    width: 50%;
    height: 350px;
    margin: 0;
    overflow:hidden;
}

.main img{
    width: 100%;
    height: 100%;
}

.category :hover img{
    transform: scale3d(1.08, 1.08, 1.08) rotate(0deg);
    /* display: block; */
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: #f7f7f7;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    transition: 1s transform;
    will-change: transform;
    transform-origin: 50% 50% ;
}

.category a{
    margin-left: 100px;
    margin-right: 100px;
    width: inherit;
    display: flex;
    /* margin: 0; */
    text-decoration: none;
    color: black;
}

.text {
    /* float: right; */
    width: 50%;
    height: 350px;
    /* margin: 0; */
}

.textalign{
    height: 400px;
    padding-top: 120px;
    text-align: center;
}

</style>    
</head>
<body>

	<%@include file="mainheader.jsp" %>

	<div class="mainphoto">
	    <img src="img/jejudomain.jpg"/>
	</div>
	
	<div class="explain">
		<h2>CONNECT JOURNEY</h2>
		<h4>마음을 깨우는 아침 요가, 온전한 창작의 경험, 아름다움을 고요히 바라보는 계기,</h4>
		<h4>내 몸이 건네는 소리를 들을 수 있는 다양한 액티비티를 제안합니다.</h4>
	</div>
	
	<div class="main">
	    <div class="category">
	        <a href="healingMain.do">
	            <div class="img">
	                <img src="img/healing.jpg"/>
	            </div>
	            <div class="text">
	                <div class="textalign">
	                    <h1>Healing</h1>
	                    <h4>모든걸 잠시 잊고</h4>
	                    <h4>미룸과 함께 하는 제주도에서의 힐링</h4>
	                </div>
	            </div>
	        </a>
	    </div>
	    <div class="category">
	        <a href="activityMain.do">
	            <div class="text">
	                <div class="textalign">
	                    <h1>Activity</h1>
	                    <h4>일상을 벗나고 싶은 당신을 위해</h4>
	                    <h4>다이나믹한 제주의 열정을 준비했습니다</h4>
	                </div>
	            </div>
	            <div class="img">
	                <img src="img/activity.jpg" />
	            </div>
	        </a>
	    </div>
	    <div class="category">
	        <a href="diyMain.do">
	            <div class="img">
	                <img src="img/diy (3).jpg" />
	            </div>
	            <div class="text">
	                <div class="textalign">
	                    <h1>Do it yourself</h1>
	                    <h4>소중한 사람들과 함께</h4>
	                    <h4>제주도의 추억을 간직하세요</h4>
	                </div>
	            </div>
	        </a>
	    </div>
	</div>

	<%@include file="mainfooter.jsp" %>
</body>
</html>