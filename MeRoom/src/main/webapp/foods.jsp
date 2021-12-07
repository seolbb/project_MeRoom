<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="mainheader.jsp"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<html>
<meta charset="UTF-8">
<title>FOODS</title>
<style>
.mainphoto {
	padding-left: 30px;
	padding-right: 30px;
}

.mainphoto img {
	width: 100%;
	height: 500px;
}

.main {
	/*max-width: 1180px;*/
	flex-wrap: wrap;
	align-items: flex-start;
	margin: 100px auto;
}

.box_img img {
	/* padding-left: 30px;
	padding-right: 30px; */
	width: 100%;
	height: 300px;
}

.box_img {
	width: 50%;
	height: 350px;
	margin: 0;
}

.box_text {
	width: 50%;
	height: 350px;
	margin: 0;
	padding-left: 30px;
}

.section_box1 {
	width: 1180px;
	height: 350px;
	padding-top: 75px;
	margin: 0 auto;
	display: flex; /* 사진 + 문구 처리해주는역할 */
	background-color: #f8f8f8;
	/* border: 1px solid lightgray; */
}

.section_box2 {
	width: 1180px;
	height: 350px;
	padding-top: 75px;
	margin: 0 auto;
	display: flex; /* 사진 + 문구 처리해주는역할 */
	background-color: white;
}

/* .main img {
	width: 100%;
	height: 100%;
} */
.box_text_align {
	/* padding-top: 100px; */
	text-align: center;
	/* color: #015B28; */
}

.box_text_align p {
	text-align: left;
}

.section1 {
	position: relative;
	height: 500px;
	background-color: #f8f8f8;
}

.section2 {
	position: relative;
	height: 500px;
	background-color: white;
}

.sliders {
	overflow: hidden;
	width: 100%;
	padding-bottom: 100px;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 300px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: #555;
}

.center {
	width: 700px;
   	text-align: center;
	margin: 100px auto;
	padding: 10px 10px;
	border-top: 3px solid #ccc;
	border-bottom: 3px solid #ccc;

}
</style>
<script>
	$(function() {
		$(".bxslider").bxSlider({
			auto : true,
			speed : 500, // 애니메이션 속도
			pause : 10000, // 애니메이션 유지시간 5초
			mode : 'horizontal', // 슬라이드모드 = fade, horizontal, vertical 있다.
			pager : false,
		});
	});
	
	
	$(function(){
		
	});
</script>
</head>
<body>
	<div class="mainphoto">
		<img alt="enjoy" src="img/FOODS1.jpg">
	</div>
	<div class="center">
		<h2>FOODS</h2>
		<p>
			세상의 하나뿐인 다이닝룸과 세상 맛있는 커피와 맥주, 그리고 디저트까지<br> 피해갈 수 없는 인생맛집을
			경험하세요.
		</p>
	</div>
	

	
	<div class="main">
		<div id="section" class="section_list">

			<c:if test="${not empty foods }">
				<c:forEach var="enjoy" items="${foods }" varStatus="status">
					<c:if test="${enjoy.eid % 2 == 0}">
						<div class="section1">
							<div class="section_box1">
								<div class="box_img">
									<img src="/upload/${enjoy.efilepath }" alt="이미지">
									
								</div>
								<div class="box_text">
									<div class="box_text_align">
										<h1>${enjoy.etitle }</h1>
										<h4 style="text-align: left;">${enjoy.etext }</h4>
										<p>${enjoy.ephone }</p>
										<p>${enjoy.elocation }</p>
										<p>${enjoy.eprice }</p>
										<p>${enjoy.einfo }</p>
									</div>
								</div>
							</div>
						</div>
					</c:if>

					<c:if test="${enjoy.eid % 2 == 1 }">
						<div class="section2">
							<div class="section_box2">
								<div class="box_text">
									<div class="box_text_align">
										<h1>${enjoy.etitle }</h1>
										<h4 style="text-align: left;">${enjoy.etext }</h4>
										<p>${enjoy.ephone }</p>
										<p>${enjoy.elocation }</p>
										<p>${enjoy.eprice }</p>
										<p>${enjoy.einfo }</p>
									</div>
								</div>
								<div class="box_img">
									<img src="/upload/${enjoy.efilepath }" alt="이미지">
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${empty foods }">
				<li>
					<p>비어있음</p>
				</li>
			</c:if>
		</div>
	</div>
	
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<script>
	//Get the button
	var mybutton = document.getElementById("myBtn");
	
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};
	
	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    mybutton.style.display = "block";
	  } else {
	    mybutton.style.display = "none";
	  }
	}
	
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0;
	}
	
	//var images = "${enjoy.efilepath}"
	
</script>
	<%@ include file="mainfooter.jsp"%>
</body>
</html>
