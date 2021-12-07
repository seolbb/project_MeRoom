<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로모션 전체목록</title>
<style>

.mainphoto {
    padding-left: 30px;
    padding-right: 30px;
    /* overflow:hidden  */
  }

  .mainphoto img {
    /* display: inline-block; */
     width: 100%;
    height: 500px;
    
}


.main-title {
	position: absolute;
	top : 29%;
	left: 0.1px;
	z-index: 1;
	color : white;
	width : 100%;
	text-align : center;
	font-size : 35px;
	font-family: Arial, Sans-serif;
	padding: 30px;

}


.main-content{
	bottom: 70%;
	font-size : 17px;
	color : white;
	font-family: 'Noto Sans KR', sans-serif;
	
}

.li-img:hover{

   cursor: pointer;
   transform: scale(1.05); /* 마우스 오버시 이미지 크기를 1.1 배만큼 확대시킨다. */
   -o-transform: scale(1.05);
   -moz-transform: scale(1.05);
   -webkit-transform: scale(1.05);
   transition: transform .35s;
   -o-transition: transform .35s;
   -moz-transition: transform .35s;
   -webkit-transition: transform .35s;

}

.top_bar {

 	width: 1180px;
  	margin: 0 auto;
    padding: 10px;

}



.top_bar h4{

	border-bottom: 1px solid #bcbcbc;
	width: 1180px;
	margin: 0 auto;
    padding: 15px;
	text-align: left;
 	letter-spacing: 5px;
    display: flex;
    float: left;
    margin:12px auto;
    font-size: 16px;
    font-weight: 500;
  

}
.pattern{
   margin-bottom : 100px;
   text-align: center;
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
  
  }
  .list li {
    padding: 0.5em;
    display: block;
    width: 50%;
    float: left;
    background: none;
    border: 0;
  }
  
    .img-list::after {
    	content: '';
    	display: table;
    	clear: both;
    	
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

</head>
<body>

<%@include file="mainheader.jsp" %>

<div class="mainphoto">
    <img src="img/christmas2.jpg"/><span class="main-title">Promotion<br>
				<span class="main-content">제주기업과 함께하는 프로모션</span></span>
</div>

<br>
<br>
<div class="top_bar"> 
	<h4>PROMOTION LIST</h4>
 </div>  
 
 
 
 <br>
<div id="pattern" class="pattern">
    <ul class="list img-list">
    <c:if test="${not empty promotionList }">
      <c:forEach var="promotion" items="${promotionList }">
           <li>
               <a href= "getPromotion.do?prIdx=${promotion.prIdx }" class="inner">
                   <div class="li-img">
                       <img src="/promotionupload/${promotion.prThumbnail }" alt="promotion"  style="width:330px; height:325px;"/>
                   </div>
                   <div class="li-text">
                       <h5 class="li-head">${promotion.prTitle}</h5>
                       <p class="li-sub">${promotion.prSubtitle}</p>
                   </div>
               </a>
           </li>
        </c:forEach>
   </c:if>
    </ul>
</div>
<br>

   <%@include file="mainfooter.jsp" %>
   
   
</body>
</html>