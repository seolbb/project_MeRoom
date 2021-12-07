<%-- <%@page import="com.spring.mr.vo.oneday.OnedayClassVO"%>
<%@page import="com.spring.mr.service.oneday.OnedayClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<script>
	
	
	$('html').click(function(e) {
		if(!($(e.target).parents().hasClass("odc_outer") || $(e.target).hasClass("odc_outer") || $(e.target).hasClass("new_odc_button"))) {
			$(".odc_outer").hide();
		}
	})
	
	function odc_search() {

	}
	
	function new_odc(type) {
		$(".odc_outer").hide();
		if (type == 'new') {
			$(".infobox_title").html("원데이클래스 등록");
			$(".odc_outer").css("top", "150px");
			$(".odc_outer").css("left", "150px");
			$("#new_odc_o, #new_odc_o *").show();
			$("#new_odc_o").draggable({
				containment: "html",
				cancel: "#new_odc_i"
			});
		}
		if (type == 'update') {
			$(".infobox_title").html("원데이클래스 수정");
			$(".odc_outer").css("top", "150px");
			$(".odc_outer").css("left", "150px");
			$("#new_odc_o, #new_odc_o *").show();
			$("#new_odc_o").draggable({
				containment: "html",
				cancel: "#new_odc_i"
			});
		}
	}
	
	function go_detail(type) {
		alert("aaa : " + type);
		$(".odc_outer").hide();
		$(".infobox_title").html("원데이클래스 상세 정보");
		$(".odc_outer").css("top", "150px");
		$(".odc_outer").css("left", "150px");
		$.ajax({
			data : { oIdx : type }, 
			type : "POST",
			dataType: "json",
			url : "getClass.do",    //따로 컨트롤러 안에 추가해야됨
			success : function(data) {
				console.log("data : " + JSON.stringify(data));
				console.log("data : " + JSON.stringify(this));
				let html = "";
				html += "<div class=" + 'class_basic' + "><p>클래스 번호</p><div>" + data.oIdx + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>카테고리</p><div>" + data.oCategory + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>클래스명</p><div>" + data.oName + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>수강날짜</p><div>" + data.oDate + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>수강시간</p><div>" + data.oTime + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>수강장소</p><div>" + data.oLocation + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>비용</p><div>" + data.oPrice + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>최대인원</p><div>" + data.oCnt + "</div></div>";
				html += "<div class=" + 'class_info' + "><p>추가정보</p><div>" + data.oInfo + "</div></div>";
				html += "<div class=" + 'class_basic' + "><p>썸네일이미지</p><div>" + data.oImg + "</div></div>";
				$(".infobox_content").html(html);
				$("#odc_info_o, #odc_info_o *").show();
				$("#odc_info_o").draggable({
					containment: "html",
					cancel: "#odc_info_i"
				});
			},
			error: function(){
				alert("실패~~");
			}
		});
	}
</script>
<style>
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
	width: 720px;
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
/* 내용 부분 중간 */
/* 내용 부분 메인 */
.right_main {
	width: 900px;
	height: 570px;
	position: relative;
}
/* .right_main * {
	border: 1px dotted red;
} */
.odc_title {
	width: 900px;
	height: 50px;
	line-height: 50px;
}
.title_text {
	width: 900px;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	font-weight: 300;
}
.odc_searchbox {
	width: 900px;
	height: 100px;
	display: flex;
	border-width: 0 0 3px 0;
	border-style: none none double none;
	border-color: white white lightgray white;
}
.odc_searchbox input {
	width: 75px;
	height: 25px;
	text-align: center;
	font-size: 14px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid gray;
	box-shadow: 1px 1px 1px gray;
	margin: 60px 0 0 800px;
}
.odc_searchbox input:active {
	box-shadow: 0px 0px 0px white;
}
.form_items {
	width: auto;
	height: 25px;
	font-size: 16px;
	text-align: right;
	margin-right: 5px;
}
.form_shortbox {
	width: 230px;
	height: 30px;
	display: flex;
	margin: 5px 10px 15px 0;
}
.form_shorttext {
	width: 150px;
	height: 25px;
	border-radius: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px gray;
}
.buttonbox {
	width: 270px;
	height: 30px;
}
.buttonbox input {
	width: 75px;
	text-align: center;
	font-size: 14px;
	margin-right: 10px;
	cursor: pointer;
	border-radius: 3px;
	border: 1px solid gray;
	box-shadow: 1px 1px 1px gray;
}
.buttonbox input:active {
	box-shadow: 0px 0px 0px white;
}
.odc_list {
	width: 900px;
	height: 385px;
}
.list_table {
	width: 900px;
	text-align: center;
	border-spacing: 0;
	margin-top: 10px;
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
.odc_number:hover {
	text-decoration: underline;
}
/* 예약 상세 내역 팝업 창 (hidden) */
.odc_outer {
	display: none;
	width: 800px;
	height: 570px;
	border: 1px solid gray;
	border-radius: 4px;
	box-shadow: 1px 2px 1px gray;
	background-color: #f5f5f5;
	position: absolute;
	top: 150px;
	left: 150px;
}
.odc_inner {
	display: none;
	width: 798px;
	height: 549px;
	margin-top: 20px;
	padding: 14px;
	border-top: 1px solid gray;
	border-radius: 0 0 4px 4px;
	background-color: white;
}
/* .odc_inner * {
	border: 1px dotted red;
} */
.odc_infobox {
	width: 770px;
	height: 550px;
}
.infobox_title {
	width: 770px;
	height: 60px;
	line-height: 50px;
	font-size: 17px;
	font-weight: 600;
	border-bottom: 2px solid lightgray;
}
.infobox_content {
	width: 770px;
	height: 400px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.class_basic {
	width: 330px;
	height: 30px;
	margin-top: 20px;
	display: flex;
}
.infobox_content div p {
	width: 100px;
	margin: 0;
	text-align: right;
}
.class_basic div {
	width: 130px;
	margin-left: 20px;
}
.class_info {
	width: 660px;
	height: 100px;
	margin-top: 20px;
}
.class_info > div {
	margin: 0;
	width: 660px;
	height: 75px;
	margin-left: 40px;
	margin-top: 10px;
	
}
.infobox_buttonbox {
	width: 770px;
	height: 70px;
	line-height: 70px;
	border-top: 2px solid lightgray;
}
.infobox_buttonbox > input {
	width: 60px;
	height: 30px;
	text-align: center;
	line-height: 20px;
	margin-left: 10px;
	border: 2px solid #015b28;
	box-shadow: 1px 1px 1px gray;
	border-radius: 3px;
	background-color: white;
}
.infobox_buttonbox > input:hover {
	background-color: #f1f1f1;
}
.infobox_buttonbox > input:active {
	background-color: white;
	border: 1px solid #015b28;
	box-shadow: none;
}
/* 신규 예약 등록 (hidden) */
.content_table {
	width: 770px;
	height: 400px;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
}
.class_basic input {
	width: 150px;
}
</style>
</head>
<div class="right_main">
	<div class="odc_title">
		<div class="title_text">
			원데이 클래스
		</div>
	</div>
	<div class="odc_searchbox">
		<input type="button" value="클래스등록" onclick="new_odc('new');" class="new_odc_button">
	</div>
	<div class="odc_list">
		<table class="list_table">
			<thead>
				<tr>
					<th>클래스번호</th>
					<th>카테고리</th>
					<th>클래스이름</th>
					<th>수강날짜</th>
					<th>장소</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${not empty classList }">
			<c:forEach var="oneday" items="${classList }">
				<tr>
					<td>${oneday.oIdx }</td>
					<td>${oneday.oCategory }</td>
					<td><a href="javascript:go_detail(${oneday.oIdx})">${oneday.oName }</a></td>
					<td>${oneday.oDate }</td>
					<td>${oneday.oLocation }</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty classList }">
				<tr>
					<td colspan="5" class="center">데이터가 없습니다</td>
				</tr>
			</c:if>	
			</tbody>
		</table>
	</div>
	<!-- 예약 상세 내역 (hidden) -->
	<div class="odc_outer" id="odc_info_o">
		<div class="odc_inner" id="odc_info_i">
			<div class="odc_infobox">
				<div class="infobox_title">
				</div>
				<div class="infobox_content">
					<!-- <div class="class_basic">
						<p>클래스 번호</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>카테고리</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>클래스명</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>수강날짜</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>수강시간</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>수강장소</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>비용</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>최대인원</p>
						<div>##</div>
					</div>
					<div class="class_info">
						<p>추가정보</p>
						<div>##</div>
					</div>
					<div class="class_basic">
						<p>썸네일이미지</p>
						<div>##</div>
					</div> -->
				</div>
				<div class="infobox_buttonbox">
					<input type="button" value="수정" onclick="new_odc('update');">
					<input type="button" value="삭제">
					<input type="submit" value="설빈수정" onclick="location.href='updateClass.jsp'">
					<a href="deleteClass.do?oIdx=${oneday.oIdx }">설빈삭제</a>
					<input type="hidden" name="oIdx" value="${oneday.oIdx }">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 예약 등록 팝업 -->
	<div class="odc_outer" id="new_odc_o">
		<div class="odc_inner" id="new_odc_i">
			<div class="odc_infobox">
				<div class="infobox_title">
				</div>
				<div class="infobox_content">
					<form action="insertClass.do" class="content_table">
						<div class="class_basic">
							<p>클래스 번호</p>
							<div><input type="text" name="number"></div>
						</div>
						<div class="class_basic">
							<p>카테고리</p>
							<div><input type="text" name="category"></div>
						</div>
						<div class="class_basic">
							<p>클래스명</p>
							<div><input type="text" name="name"></div>
						</div>
						<div class="class_basic">
							<p>수강날짜</p>
							<div><input type="date" name="date"></div>
						</div>
						<div class="class_basic">
							<p>수강시간</p>
							<div><input type="datetime" name="time"></div>
						</div>
						<div class="class_basic">
							<p>수강장소</p>
							<div><input type="text" name="place"></div>
						</div>
						<div class="class_basic">
							<p>비용</p>
							<div><input type="text" name="price"></div>
						</div>
						<div class="class_basic">
							<p>최대인원</p>
							<div><input type="text" name="max"></div>
						</div>
						<div class="class_info">
							<p>추가정보</p>
							<div><textarea rows="3" cols="80" name="info"></textarea></div>
						</div>
						<div class="class_basic">
							<p>썸네일이미지</p>
							<div><input type="file" name="file"></div>
						</div>
					<div class="infobox_buttonbox">
						<input type="submit" value="수정" onclick="new_odc('update');">
						<input type="button" value="삭제">
					
					</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
</html> --%>