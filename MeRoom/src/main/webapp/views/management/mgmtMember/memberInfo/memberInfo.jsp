<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function() {
	if (!'${member.memberId}'.length > 0) {
		$(".content_title").html("  ");
		$(".content_info").html("선택된 회원이 없습니다.");
	} else {
		go_detail('${member.memberId}', 'list');
	}
	
})
	function go_update() {
		
	}
	
	function go_detail(idx, type) {
		//alert(idx + " : " + type);
		if (type != 'reward') {
			$.ajax({
				url : "/mr/getUserReser.do",
				type : "post", 
				data : {'memberId' : idx},
				dataType : "json",
				success : function(data) {
					if (data.length > 0) {
						let html = "";
						$.each(data, function(index, element){
							html += "<tr>";
							html += "<td>" + element.rIdx + "</td>";
							html += "<td>" + element.startDate + " ~ " + element.endDate + "</td>";
							html += "<td>" + element.rmNumber + "호</td>";
							html += "<td>" + element.area + "명</td>";
							html += "</tr>";
						})
						$(".detail_list_table > tbody").html(html);
					}
					if (data.length == 0) {
						$(".detail_list_table > tbody").html("<tr><td colspan='4'>예약 내역이 존재하지 않습니다.</td></tr>");
					}
					$("#detail_content_reward").hide();
					$("#detail_content_list").show();
				},
				error : function(e) {
					//alert("에러발생 : " + e);
				}
			})
		}
		if (type == 'reward') {
			$.ajax({
				url : "/mr/getRewardList.do",
				type : "post", 
				data : {'memberId' : idx},
				dataType : "json",
				success : function(data) {
					console.log(data);
					if (data.length > 0) {
						let html = "";
						let current = 0;
						let total = 0;
						let used = 0;
						$.each(data, function(index, element){
							current += element.point;
							
							if (element.point < 0) { used += element.point }
							if (element.point > 0) { total += element.point }
						})
						used = Math.abs(used);
						html += "<p>" + data[0].memberId + " 님의 적립금 </p>";
						$(".reward_title").html(html);
						html = "<div class='status_name'>현재 적립금</div>";
						html += "<div class='status_content'>" + current.toLocaleString(); + "</div>";
						$(".reward_now").html(html);
						html = "<div class='status_name'>누적 적립금</div>";
						html += "<div class='status_content'>" + total.toLocaleString(); + "</div>";
						$(".reward_total").html(html);
						html = "<div class='status_name'>사용 적립금</div>";
						html += "<div class='status_content'>" + used.toLocaleString(); + "</div>";
						$(".reward_used").html(html);
						
						html = "";
						$.each(data, function(index, element){
							html += "<tr>";
							html += "<td>" + element.re_category + "</td>";
							html += "<td>" + element.point + "</td>";
							html += "<td>" + element.reward_date + "</td>";
							html += "</tr>";
						})
						$(".reward_history_table > tbody").html(html);
					}
					if (!data.length > 0) {
						html = "<p>" + '${member.memberId}' + " 님의 적립금 </p>";
						$(".reward_title").html(html);
						html = "<div class='status_name'>현재 적립금</div>";
						html += "<div class='status_content'>0</div>";
						$(".reward_now").html(html);
						html = "<div class='status_name'>누적 적립금</div>";
						html += "<div class='status_content'>0</div>";
						$(".reward_total").html(html);
						html = "<div class='status_name'>사용 적립금</div>";
						html += "<div class='status_content'>0</div>";
						$(".reward_used").html(html);
						$(".reward_history_table > tbody").html("<tr><td colspan='4'>적립금 내역이 존재하지 않습니다.</td></tr>");
					}
					$("#detail_content_list").hide();
					$("#detail_content_reward").show();
				},
				error : function(request,status,error) {
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
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
.box_container {
	width: 900px;
	height: 485px;
	display: flex;
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
	width: 75px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}
#underLine {
	position: absolute;
	right: 0px;
	top: 27px;
	width: 737px;
	height: 2px;
	border-bottom: 2px solid #015b28;
}
.right_menu > a {
	font-size: 16px;
	font-weight: 300;
	color: lightgray;
	margin-left: 10px;
}
#right_info > a {
	font-size: 22px;
	font-weight: 500;
	color: #015b28;
}
/* 회원 정보 창 */
.main_box {
	width: 354px;
	height: 485px;
	padding: 20px;
	border-width: 0 1px 1px 0;
	border-style:none solid solid none;
	border-color: white black black white;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
.content_box {
	border: none;
	width: 310px;
	height: 440px;
	display: flex;
	flex-direction: column;
	justify-content: space-around; 
}
.content_title {
	font-size: 18px;
	font-weight: 500;
}
.content_info {
	height: 350px;
	line-height: 40px;
	padding: 10px 0 0 100px;
}
.update > input {
	width: 60px;
	height: 30px;
	color: #015b28;
	font-weight: 500;
	background-color: white;
	box-shadow: 1px 1px 1px gray;
	border-radius: 3px;
	border: 2px solid #015b28;
	cursor: pointer;
	vertical-align: top;
}
.update > input:hover {
	background-color: #F1F1F1;
}
.update > input:active {
	border: 1px solid #015b28;
	box-shadow: none;
	background-color: white;
}
/* 회원 상세 내역 창 */
.sub_box {
	width: 540px;
	height: 485px;
	padding: 10px;
}
.detail_box	{
	width: 520px;
	height: 440px;
}
/* 상세 내역 메뉴 */
.detail_menu {
	width: 520px;
	height: 35px;
	position: relative;
}
.detail_menu > label {
	text-align: center;
	width: 80px;
	height: 35px;
	cursor: pointer;
	border: 2px solid gray;
	border-radius: 3px 3px 0 0;
	position: absolute;
	padding-top: 2px;
	top: 2px;
	left: 30px;
	box-sizing: border-box;
}
#detail_reward_button {
	left: 125px;
}
.detail_menu > label:hover {
	border-width: 2px 2px 0px 2px;
	border-color: #015b28 #015b28 #fff #015b28;
	border-style: solid;
	background-color: #F1F1F1;
}
 .detail_menu > input:checked + .detail_menu_label {
	border-width: 2px 2px 1px 2px;
	border-color: #015b28 #015b28 #fff #015b28;
	border-style: solid;
	background-color: white;
	z-index: 2;
	opacity: 1;
}
.detail_menu >  input {
	display: none;
}
.detail_content_box {
	width: 520px;
	height: 400px;
	position: relative;
	border-top: 2px solid #015b28;
	background-color: white;
	opacity: 1;
}
.detail_content {
	width: 520px;
	height: 100%;
	padding: 10px;
	position: absolute;
}
.detail_list_box {
	width: 500px;
	height: 420px;
	overflow-y: auto;
	overflow-x: hidden;
}
.detail_list_table {
	width: 500px;
	text-align: center;
	border-spacing: 0;
}
th, td {
	border-width: 0 0 2px 0;
	border-style: none none solid none;
	border-color: white white lightgray white;
	line-height: 30px;
}
td {
	font-size: 14px;
}
.detail_reward_box {
	width: 520px;
	height: 390px;
	padding: 10px;
}
.reward_title {
	width: 500px;
	height: 10%;
	font-size: 18px;
	font-weight: 500;
}
.reward_management {
	width: 500px;
	height: 140px;
	display: flex;
}
.reward_status {
	width: 250px;
	height: 120px;
	margin-top: 15px;
}
.reward_status > div {
	height: 25px;
	margin-bottom: 15px;
	font-size: 16px;
	text-align: center;
	display: flex;
}
.status_name {
	width: 100px;
	height: 25px;
	font-weight: 100;
	font-size: 15px;
}
.status_content {
	margin-left: 20px;
	width: 100px;
	border: 1px solid gray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
	height: 23px;
	line-height: 20px;
	font-size: 13px;
}
.reward_setting {
	width: 250px;
	height: 120px;
	margin-top: 15px;
}
.reward_setting > div {
	height: 25px;
	margin-bottom: 10px;
	font-size: 16px;
	text-align: center;
	display: flex;
}
.reward_setting input {
	height: 25px;
	line-height: 15px;
	margin-left: 15px;
	font-size: 13px;
	border: 1px solid gray;
	border-radius: 3px;
	box-shadow: 1px 1px 1px gray;
}
.reward_setting > div > input:nth-child(1) {
	width: 130px;
}

.reward_setting > div > input:nth-child(1)::-webkit-outer-spin-button,
.reward_setting > div > input:nth-child(1)::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

.reward_setting > div > input:nth-child(2) {
	cursor: pointer;
	background-color: white;
	border: 2px solid #015b28;
}
.reward_setting > div > input:nth-child(2):active {
	border-width: 1px 1px 1px 1px;
	border-style: solid solid solid solid;
	boeder-color: gray gray gray gray;
	box-shadow: 0px 0px 0px white;
}
.reward_history {
	width: 500px;
	height: 230px;
	padding-bottom: 5px;
	overflow-y: auto;
	overflow-x: hidden;
}
.reward_history_table {
	width: 500px;
	height: 100%;
	border-spacing: 0;
	text-align: center;
}
.reward_history_table th, td {
	border-bottom: 2px solid lightgray;
}
/* 상세 내용 본문 */
/* 내용 부분 하단 */
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
	<%@ include file="/views/management/mgmtMember/memberHeader.jsp" %>
		<div class="box_container">
		<div class="main_box">
			<div class="content_box">
				<div class="content_title">
					${member.name } 님의 회원 정보
				</div>
				<div class="content_info">
					아이디 : ${member.memberId }<br>
					이름 : ${member.name }<br>
					별명 : ${member.nickname }<br>
					연락처 : ${member.phone }<br>
					이메일 : ${member.email }<br>
					주소 : ${member.address }<br>
					연락처 : ${member.phone }<br>
					생년월일 : ${member.birth }<br>
					가입일 : ${member.joinDate }<br>
				</div>
				<div class="update">
					<input type="button" value="수정" onclick="go_update();">
				</div>
			</div>
		</div>
		<div class="sub_box">
			<div class="detail_box">
				<div class="detail_menu">
					<input type="radio" id="detail_list" name="tabs" onclick="go_detail('${member.memberId}', 'list');" checked="checked">
					<label class="detail_menu_label" id="detail_list_button" for="detail_list">예약내역</label>
					<input type="radio" id="detail_reward" name="tabs" onclick="go_detail('${member.memberId}', 'reward');">
					<label class="detail_menu_label" id="detail_reward_button" for="detail_reward">적립금</label>
				</div>
				<div class="detail_content_box">
					<!-- 예약내역 메뉴 선택 시  ajax를 통한 show 처리-->
					<div class="detail_content" id="detail_content_list" style="display: none;">
						<div class="detail_list_box">
							<table class="detail_list_table">
								<thead>
									<tr>
										<th>예약번호</th>
										<th>숙박일시</th>
										<th>객실</th>
										<th>인원</th>
									</tr>
								</thead>
								<tbody>
								<!-- ajax를 통한 데이터 출력 -->
								</tbody>
							</table>
						</div>
					</div>
					<!-- 적립금 메뉴 선택 시  ajax를 통한 show 처리-->
					<div class="detail_content" id="detail_content_reward" style="display: none;">
						<div class="detail_reward_box">
							<div class="reward_title">
								<!-- ajax 처리 -->
							</div>
							<div class="reward_management">
								<div class="reward_status">
									<div class="reward_now">
										<!-- ajax 처리 -->
									</div>
									<div class="reward_total">
										<!-- ajax 처리 -->
									</div>
									<div class="reward_used">
										<!-- ajax 처리 -->
									</div>				
								</div>
								<div class="reward_setting">
									<div class="add_price">
										<input type="number" name="add" placeholder="적립금 부여">
										<input type="button" value="적립" onclick="reward_set('add')">
									</div>
									<div class="remove_price">
										<input type="number" name="remove" placeholder="적립금 차감">
										<input type="button" value="차감" onclick="reward_set('remove')">
									</div>
								</div>
							</div>
							<div class="reward_history">
								<table class="reward_history_table">
								<thead>
									<tr>
										<th>적용항목</th>
										<th>금액</th>
										<th>적용일시</th>
									</tr>
								</thead>
								<tbody>
									<!-- ajax 처리 -->
								</tbody>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	</div>
	</div>
	</main>
	<%@ include file="/views/adminMainFooter.jsp" %> <!-- 풋터 메뉴 -->
</div>
</body>
</html>