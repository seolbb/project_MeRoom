<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 후기함</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* 후기 작성 가능한 숙박 리스트 보여줄지 말지 고민해보기 */

#wrap {
	min-height: 810px;
}

.con {
	margin: 0 auto;
	max-width: 1280px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 40px;
	padding-right: 40px;
}

table {
	width: 100%;
	border-top: 2px solid black;
	border-spacing: 2px;
	border-collapse: collapse
}

table>thead>tr {
	padding: 12px 0;
	line-height: 20px;
	font-size: 14px;
	font-weight: 500;
}

tbody {
	vertical-align: middle;
}

td, th {
	padding: 15px 5px;
	vertical-align: middle;
	text-align: center;
}

.tb {
	border-bottom: 1px solid #e4e4e4;
	background-color: #f3f3f3;
}

#info {
	text-align: left;
	padding: 15px 20px;
	width: 60%;
}

.star{
	width: 20%;
}
.content {
	border-bottom: 1px solid #e4e4e4;
}
.btnG {
	width: 20%;
}
.btn {
	background-color: white;
	border: 2px solid #015B28;
	color: #015B28;
	padding: 6px 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 600;
}

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 32px;
	font-weight: 500;
	letter-spacing: -0.05em;
	margin-bottom: 40px;
}
.date {
	text-align: left;
	padding-left: 20px;
}

.category { display: flex; }

.subLink {
	display: flex;
	
}
.subT {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: -0.05em;
    margin-bottom: 25px;
}

.checked {
  color: orange;
  padding: 1px;
}

</style>
</head>
<script>

function reviewWrite() {
	window.name = "parentPage2";
	
}

$(function() {
	
	$(".cancel").click(function(){
	    if(confirm("정말 삭제하시겠습니까 ?") == true){
	    }
	    else{
	        return false;
	    }
	});

	
	
})


</script>

<body>
	<%@ include file="mainheader.jsp"%>

	<div id="wrap">
		<div class="con">
			<div class="my">
				<p class="title">나의 후기함</p>
			</div>
	   	<div class="subLink">
	   		<a class="subT" href="reviewWriteList.do">후기 작성</a>
	   		<div class="subT">&nbsp;&nbsp; / &nbsp;&nbsp;</div>
	   		<a class="subT" href="getReviewList.do">후기 내역</a>
		</div>   
			<table class="list">
			<c:if test="${empty reviewList}">
				<thead>
					<tr class="tb">
						<th>룸타입</th>
						<th class="date" >머문 날짜</th>
						<th class="date">등록 날짜<th>
					</tr>
				</thead>
								<tbody>
					<tr class="item content">
						<td class="item-star" colspan="3">
						등록된 후기글이 없습니다.
						</td>
					</tr>

				</tbody>
			</c:if>
			<c:if test="${not empty reviewList}">
				<c:forEach var="reviewList" items="${reviewList }">
				<thead>
					<tr class="tb">
						<th>룸타입 - ${reviewList.rm_kind } </th>
						<th class="date" >머문 날짜 - ${reviewList.r_start_date } ~ ${reviewList.r_end_date }</th>
						<th class="date">등록 날짜 - ${reviewList.rv_date }</th>
					</tr>
					
				</thead>
				<tbody>
					<tr class="item content">
						<td class="item-star">
						<c:choose>
						<c:when test="${reviewList.score ==1}"><span class="fa fa-star checked"></span></c:when>
						<c:when test="${reviewList.score ==2}"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span></c:when>
						<c:when test="${reviewList.score ==3}"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span></c:when>
						<c:when test="${reviewList.score ==4}"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span></c:when>
						<c:when test="${reviewList.score ==5}"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span></c:when>
						
								
								
						</c:choose>
						</td>
						<td id="info" class="item-info">
						${reviewList.rv_content }
						</td>
						<td class="item btnG">
						<button class="btn" onclick="window.open('getReview.do?rv_idx=${reviewList.rv_idx }','후기작성','width=600, height=600, scrollbars=yes')">수정</button>
						<button class="btn cancel" onclick="location.href='deleteReview.do?rv_idx=${reviewList.rv_idx }'">삭제</button>
						</td>
					</tr>

				</tbody>
				</c:forEach>
			</c:if>
				
			</table>

		</div>
	</div>


	<br>
	<br>
	<br>

	<%@ include file="mainfooter.jsp"%>
</body>
</html>