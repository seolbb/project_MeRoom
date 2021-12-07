<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미룸 - 관리자페이지</title>
<script>
	function go_menu(type) {
		if (type == 'performance') { location.href="/mr/views/information/performance/perfMain.jsp" }
		
		if (type == 'enjoy') { location.href="/mr/getEnjoyListAdmin.do" }
		if (type == 'location') { location.href="/mr/getPlaceListAdmin.do" }
	}
</script>
<style>
/* 사이드 메뉴바  */
.sidenav_container {
	width: 200px;
	height: 600px;
	border-radius: 3px;
 	box-shadow: 1px 1px 1px gray;
}
/* 사이드 메뉴 타이틀 */
.sidenav_title {
	width: 160px;
	height: 65px;
	line-height: 65px;
	font-size: 20px;
	font-weight: 500;
	text-align: center;
	margin: 0 auto;
	border-bottom: 2px solid gray;
}
.sidenav_title > a > img {
	margin-right: 10px;
	width: 30px;
}
/* 사이드 메뉴 메인 */
.sidenav_main {
	width: 200px;
	height: 40px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	margin: 0 auto;
	margin-top: 15px;
}
.small {
	display: block;
	font-size: 17px;
}
.small:hover {
	background-color: #f1f1f1;
	border-radius: 5px;
}
.infomenu {
	width: 160px;
}
.sidenav_main > a > img:nth-child(1) {
	width: 20px;
}
.sidenav_main > a > span {
	margin-left: 10px;
}
/* 사이드 메뉴 호버 */
.innerMenu {
	width: 160px;
	line-height: 30px;
	display: none;
	padding-bottom: 5px;
	font-size: 14px;
	font-weight: 500;
	border-radius: 3px;
	text-align: center;
}
.infomenu:hover {
	background-color: #f1f1f1;
	height: auto;
	border-radius: 5px;
	box-shadow: 1px 1px 1px gray;
}
.infomenu:hover .innerMenu {
	display: block;
}
.innerMenu:hover {
	background-color: #015B28;
}
.innerMenu:hover .innerMenu_text  {
	color: white;
}
/* 관리 기능 메인 */
</style>
</head>
<body>
<!-- 사이드 메뉴 바 -->
<div class="sidenav_container">
	<!-- 타이틀 -->
	<div class="sidenav_title">
		<a style="text-decoration: none;"><img src="/mr/icons/management.png" alt="management">정보관리</a>
	</div>
	<!-- 회원 -->
<!-- 	<div class="sidenav_main"> -->
<!-- 		<a class="menu_button small" href="javascript:go_menu('performance')"><img src="/mr/icons/money-graph-with-up-arrow.png" alt="user"><span>매출조회</span></a> -->
<!-- 	</div> -->
	<!-- 정보 -->
	<div class="sidenav_main infomenu">
		<a class="menu_button small" href="#"><img src="/mr/icons/pin.png" alt="information"><span>지점정보</span></a>
		<div class="innerMenu"><a class="innerMenu_text" href="javascript:go_menu('enjoy')">부대시설</a></div>
		<div class="innerMenu"><a class="innerMenu_text" href="javascript:go_menu('location')">소개정보</a></div>
	</div>
</div>
<!-- 사이드 메뉴바 끝 -->

<!-- 메인 내용 시작 -->
</body>
</html>