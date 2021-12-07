<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
/* 내용 부분 헤더 */
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
.right_header {
	width: 900px;
	height: 35px;
	display: flex;
	position: relative;
}
.right_middle {
	width: 900px;
	height: 100px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}
.right_search {
	margin-left: 320px;
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
#underLine {
	position: absolute;
	right: 0px;
	top: 27px;
	width: 805px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}
.right_menu > a {
	font-size: 16px;
	font-weight: 300;
	color: lightgray;
	margin-left: 10px;
}
#right_list > a {
	font-size: 22px;
	font-weight: 500;
	color: #015b28;
}
/* 내용 부분 중간 */

form > input, select {
	height: 25px;
	margin-bottom: 10px;
	border: 1px solid lightgray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px lightgray;
	font-size: 13px;
}
form > span:first-child {
	margin-right: 10px;
}
form > input:nth-child(-n+3) {
	width: 150px;
}
/* 내용 부분 메인 */
.member_list {
	width: 900px;
	height: 385px;
}
.list_table {
	width: 900px;
	text-align: center;
	border-spacing: 0;
}
th, td {
	border-width: 0 0 2px 0;
	border-style: none none solid none;
	border-color: white white lightgray white;
	min-height: 30px;
	line-height: 30px;
}

th {
	font-size: 17px;
	font-weight: 500;
}

td {
	font-size: 14px;
}
/* 하단 페이징 */
.right_bottom {
	font-size: 16px;
	text-align: center;
	margin-top: 10px;
}
.paging > a{
	margin: 5px;
}
</style>
<script>
function go_detail(id) {
	var form = document.createElement("form");
	var objs;
	objs = document.createElement('input');
	objs.setAttribute('type', 'text');
	objs.setAttribute('name', 'memberId');
	objs.setAttribute('value', id);
	form.appendChild(objs);
	form.setAttribute('method', 'post');
	form.setAttribute('action', '/mr/getUser.do');
	document.body.appendChild(form);
	form.submit();
}
</script>
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
				<div class="right_middle">
					<div class="list_count">
						전체 건수
					</div>
					<div class="right_search">
						<div class="search_regdate">
			 				<form action="/mr/getUserList.do" method="post">
			 					<span>가입일</span>
			 					<input type="date" name="beginDate">
			 					<span>&nbsp; ~ &nbsp;</span>
			 					<input type="date" name="endDate"><br>
			 					<select name="searchCondition">
						 			<option value="MEMBERID">아이디</option>
						 			<option value="NAME">이름</option>
						 			<option value="EMAIL">이메일</option>
						 			<option value="PHONE">연락처</option>
						 			<option value="NICKNAME">닉네임</option>
			 					</select>
						 		<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요">
						 		<input type="submit" value="조회">
						 		<input type="button" value="전체조회">
			 				</form>
						</div>
					</div>
				</div>
				<div class="member_list">
					<table class="list_table">
						<thead>
							<tr>
								<th>이름</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty memberList}">
								<c:forEach var="memberOne" items="${memberList }">
								<tr>
									<td>${memberOne.name}</td>
									<td><a href="javascript:go_detail('${memberOne.memberId}')">${memberOne.memberId}</a></td>
									<td>${memberOne.nickname}</td>
									<td>${memberOne.joinDate}</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${	empty memberList}">
								<tr>
									<td colspan="5">입력된 데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</main>
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>
</body>
</html>