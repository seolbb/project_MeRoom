<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DIY 메인화면</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

.mainphoto {
    padding-left: 30px;
    padding-right: 30px;
    /* overflow:hidden  */
  }

  .mainphoto img {
    display: inline-block;
	width: 100%;
    height: 500px;
    
}

.explain {
    width: 700px;
	text-align: center;
	margin: 100px auto;
	padding: 10px 10px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

.pattern{
	margin-bottom : 100px;
}


/* * { 
	-moz-box-sizing: border-box; 
	-webkit-box-sizing: border-box; 
	box-sizing: border-box; 
}

/* CSS Animations */
@-webkit-keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}
@-moz-keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}
@-o-keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}
@keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}


.list li {
  border-bottom: 1px solid #ccc;
  display: table;
  border-collapse: collapse;
  width: 100%;
}

.inner {
  display: table-row;
  overflow: hidden;
}

.li-img {
  display: table-cell;
  vertical-align: middle;
  width: 40%;
  padding-right: 1em;
}

.li-img img {
  display: block;
  width: 100%;
  height: auto;
}

.li-text {
  display: table-cell;
  vertical-align: middle;
  width: 60%;
}

.li-head {
  margin: 0;
}

.li-sub {
  margin: 0;
}

@media all and (min-width: 40em) {
  .list {
    padding: 0.5em;
    max-width: 70em;
    margin: 0 auto;
    overflow: hidden;
  }
  .list li {
    padding: 0.5em;
    display: block;
    width: 50%;
    float: left;
    background: none;
    border: 0;
  }
  .inner {
    display: block;
  }
  .li-img, .li-text, .inner {
    display: block;
    width: auto;
    padding: 0;
  }
  .li-text {
    padding: 0.5em 0;
  }
}

@media all and (min-width: 60em) {
  .list li {
    width: 33.33333333%;
  }
}


</style>   
<script>
$(function(){
	$('.li-sub').each(function(){
		$(this).html($(this).text().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});
});

</script> 
</head>
<body>

<%@include file="mainheader.jsp" %>

<div class="mainphoto">
    <img src="img/diymain.jpg"/>
</div>

<div class="explain">
	<h2>D.I.Y</h2>
	<h4>손으로 직접 만들어 내는 재미</h4>
</div>
	
<div id="pattern" class="pattern">
    <ul class="list img-list">
    <c:if test="${not empty diyList }">
		<c:forEach var="vo" items="${diyList }">
			<c:if test="${vo.oCategory == 'DIY' }">
	        <li>
	            <a href="classInfo.do?oIdx=${vo.oIdx }" class="inner">
	                <div class="li-img">
	                    <img src="/upload/${vo.oImg }" style="width: 317px; height:317px;"/>
	                </div>
	                <div class="li-text">
	                    <h5 class="li-head">${vo.oName }</h5>
	                    <p class="li-sub">￦${vo.oPrice }</p>
	                </div>
	            </a>
	        </li>
			</c:if>
        </c:forEach>
	</c:if>
    </ul>
</div>

	<%@include file="mainfooter.jsp" %>
</body>
</html>