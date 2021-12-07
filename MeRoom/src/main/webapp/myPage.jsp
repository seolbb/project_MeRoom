<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#wrap {
	min-height: 810px;
}
.container {
	margin: 0 auto;
    max-width: 1279px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    padding-left: 40px;
    padding-right: 40px;
}

.Bbox {
	display: flex;
	justify-content: center;
	margin: 40px 0px;
	padding: 40px 0px;
}

.box {
	width: 50%;
	margin: 10px;
}

.list {
	display: flex;
	justify-content: center;
	border-top: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4;
}

.list2 {
/* 	display: flex;
	justify-content: center; */
	padding-bottom: 100px;
}
.sbox {
	width: 100%;
	margin: 10px;
	text-align: center;
}

.middle {
	border-right: 1px solid #e4e4e4;
	border-left: 1px solid #e4e4e4;
	padding: 0 20px;
} 

.title {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 32px;
	font-weight: 600;
	letter-spacing: -0.05em;
	padding-bottom: 30px;
	border-bottom: 2px solid black;
	margin-bottom: 50px;
	color: #015b28;
}

.subT {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 20px;
	font-weight: 500;
	letter-spacing: -0.05em;
	padding-bottom: 10px;
}
.nick {
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 22px;
	letter-spacing: -0.05em;
	padding-bottom: 15px;
}

.my {
	margin: 10px;
}

.reward{
	font-family: 'Nanum Square', 'Apple SD Gothic Neo', 'Malgun Gothic',
		sans-serif;
	font-size: 20px;
	letter-spacing: -0.05em;
	padding-top: 15px;
	margin-top: 10px;
}

.btn {
	border:none;
	font-size: 14px;
	background-color: white;
	cursor: pointer;
}
.group {
	display: flex;
	justify-content: right;
	margin: 10px;
}

.back {
	width: 100%;
	background-color: #ECEEED;
	border: none;
	border-radius: 7px;
	margin-bottom: 7px
}

.tet{
	word-break: break-all;
	padding: 15px;
}

p {
	margin : 15px 0px;
}

</style>

</head>
<body>
	<%@ include file="mainheader.jsp"%>
	<div id="wrap">
		<div class="container">
		<div class="my">
			<p class="title">My Page</p>
		</div>
<!-- 		<div class="my">
			<p class="nick">닉네임 님.</p>
		</div> -->
		<div class="my">
			<ul><li class="reward">나의 적립금 &nbsp;&nbsp;:&nbsp;&nbsp; ${total } p</li></ul>
		</div>
		<div class="Bbox">
			<div class="box">
				
				<ul><li class="subT">나의 숙박 예약현황</li></ul>
				<div class="btn group">
				<a class="btn" href="roomState.do">더보기</a>
				</div>
				<div class="book list">
					<div class="sbox">
						<p>다가올 예약</p>
						<p>${roomstates }</p>
					</div>
					<div class="sbox middle">
						<p>지난 예약</p>
						<p>${lastroom }</p>
					</div>
					<div class="sbox">
						<p>취소된 예약</p>
						<p>${roomcancel }</p>
					</div>
				</div>
			</div>

			<div class="box">
				<ul><li class="subT">나의 원데이 예약현황</li></ul>
				<div class="btn group">
				<a class="btn" href="onedayState.do">더보기</a>
				</div>
				<div class="oneday list">
					<div class="sbox">
						<p>다가올 예약</p>
						<p>${daystates }</p>
					</div>
					<div class="sbox middle">
						<p>지난 예약</p>
						<p>${daylast }</p>
					</div>
					<div class="sbox">
						<p>취소된 예약</p>
						<p>${daycancel }</p>
					</div>
				</div>
			</div>
		</div>
		<div class="Bbox">

				<div class="box">
					<ul><li class="subT">나의 후기함</li></ul>
					<div class="btn group">
						<a class="btn" href="getReviewList.do">더보기</a>
					</div>
					<c:if test="${empty rvList }">
						<div class="back">
							<div class="tet">
							작성된 후기가 없습니다.
							
							</div>
						</div>
					</c:if>
					<div class="list2">
					<c:if test="${not empty rvList }">
					<c:forEach var="rvList" items="${rvList }">
						<div class="back">
							<div class="tet">
							${rvList.rv_content }
							
							</div>
						</div>
					</c:forEach>
					</c:if>
						
					</div>
				</div>

				<div class="box">
					<ul><li class="subT">문의내역</li></ul>
					<div class="btn group">
						<a class="btn" href="qnaList.do">더보기</a>
					</div>
					<div class="list2">
					<c:if test="${empty qnaList }">
						<div class="back">
							<div class="tet">
							작성된 문의내역이 없습니다.
							
							</div>
						</div>
					</c:if>
					<c:if test="${not empty qnaList }">
					<c:forEach var="qnaList" items="${qnaList }">
						<div class="back">
							<div class="tet">
							${qnaList.qTitle }
							
							</div>
						</div>
					</c:forEach>
					</c:if>
					</div>
				</div>

		</div>
		</div>
	</div>
	<%@ include file="mainfooter.jsp"%>
</body>
</html>