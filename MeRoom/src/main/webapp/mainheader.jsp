<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main header</title>
</head>
<style>
   *{
        box-sizing: border-box;
        font-family: Arial, Sans-serif;
        margin: 0px;
    }
    a{
        text-decoration: none;
        color: #000;
    }
    .body__container{
         font-family: Arial, Sans-serif;
        font-size: 16px;
        font-weight: 400;
        color: #333;
    }
    
    .section{
        position: relative;
    }
    
    input{
        font-weight: 500;
        max-width: 100%;
        transition: border .2s ease-in-out;
    }
    
    input:not([type="checkbox"]) {
        outline: none;
    }
    
    
    /*헤더 부분 */
    .header{
        max-width: 1180px;
        margin: 0 auto;
        padding: 0 0%;
        position: relative;
        align-items: center;
        display: flex;
        height: 120px;
        justify-content: space-between;
    }
    
    
    
    .header .logo{
        display: flex;
        align-items: center;
    }
    
    .right-nav{
        display: flex;
        align-items: center;
        list-style: none;
    }
    
    
    .header .img__link{
        margin-bottom: 20px;
    }
    
    
    .header .main__link{
        margin-left: 30px;
        padding: 0;
        background: transparent;
        font-weight: 600;
        font-size: 15px;
        line-height: 19px;
        color: #015B28;
       
        
    }
    
    .header .sub__link{
        margin-right: 30px;
        padding: 0;
        background: transparent;
        font-weight: 600;
        font-size: 15px;
        line-height: 19px;
        color: #015B28;
        font-family: Arial, Sans-serif;
      
    }
    
    
    .dropnews{
     position: relative;
      display: inline-block;
    
    
    }
    
    .dropdropbtn{
     background-color: white;
      color: #015B28;
      padding: 16px;
      font-weight: 600;
      font-size: 16px;
      border: none;
    
    
    }
    
    .dropnewslist{
       display: none;
      position: absolute;
      background-color: white;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0);
      z-index: 1;
      font-weight: 600;
    
    }
    
     .dropnewslist a{
      padding: 12px 16px;
      text-decoration: none;
      color: #015B28;
      display: block;
     
     
     }
    
     .dropnewslist a:hover {background-color: white; color : black;}
    
    .dropnews:hover .dropnewslist {display: block;}
    
    .dropnews:hover .dropdropbtn {background-color: white;}
    
    
    
    .dropbtn {
      background-color: white;
      color: #015B28;
      padding: 16px;
      font-weight: 600;
      font-size: 16px;
      border: none;
    }
    
    .dropdown {
      position: relative;
      display: inline-block;
    }
    
    .dropdown-content {
      display: none;
      position: absolute;
      background-color: white;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0);
      z-index: 999;
      font-weight: 600;
    }
    
    .dropdown-content a {
      padding: 12px 16px;
      text-decoration: none;
      color: #015B28;
      display: block;
    }
    
    .dropdown-content a:hover {background-color: white;
    color : black;}
    
    .dropdown:hover .dropdown-content {display: block;}
    
    .dropdown:hover .dropbtn {background-color: white;}
    
    .header .main__link:hover, .sub__link:hover {
        color:  black;
        text-decoration: underline;
    }
    
    
        #reser{       
            border-style: solid;
            color: #015B28;
            margin: auto;
            padding: 10px 10px;
      
        }     
        
        #reser:hover{
            color: black;
        }
        
            
.topnav {
  overflow: hidden;
  background-color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
 padding: 6px;
  margin-top: 6px;
  font-size: 10px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px;
  margin-top: 6px;
  margin-right: 10px;
  background: #ddd;
  font-size: 10px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: white;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid white;  
  }
}

.fa fa-user{
	width: 18px;

}

</style>  

<body>
	   
      	   
    <header class="header">
     
        <div class="logo">
                <a class="img__link" href="main.jsp"><img src="img/MEROOM11.png" alt="logo" width="100" ></a>    
                <a class="main__link" href="introduce.jsp">ABOUT</a> 
                <a class="main__link" href="/mr/views/reservation/room.jsp">ROOMS</a><br>
                <a class="main__link" href="getPlaceList.do" >PLACE</a>
                <a class="main__link" href="enjoy.jsp" >ENJOY</a>
                <a class="main__link" href="onedayMain.jsp" >1DAYCLASS</a>
                <!-- <a class="main__link" href="#">SUPPORT</a>-->
                
                <div class="dropnews">
                <a class="dropdropbtn" href="getNewsList.do">NEWS</a>
                <div class="dropnewslist">
                	<a href="getPromotionList.do">PROMOTION</a>
                	<a href="getEventList.do">EVENT</a>
                </div>
                </div>
                
                
                <div class="dropdown">
				  <button class="dropbtn">SUPPORT</button>
				  <div class="dropdown-content">
				    <a href="question.jsp">1:1문의</a>
				    <a href="getFAList.do">SUPPORT</a>
 					 </div>
					</div>
            </div>  
           
           <ul class="right-nav">
            <li><i class="fa fa-search"><a class="sub__link" href="#"></a></i></li>
            <c:if test="${empty vo}">
               <li><i class="fa fa-user"><a class="sub__link" href="login.jsp">LOGIN</a></i></li>
            </c:if>
            <c:if test="${vo != null}">
               <div class="dropdown">
                  <li><i class="fa fa-user">
                     <button class="sub__link dropbtn" >${vo.nickname }</button>
                        <div class="dropdown-content">
                      <a href="myPage.do">MyPage</a>
                      <a href="roomState.do">숙박예약함</a>
                      <a href="onedayState.do">원데이예약함</a>
                      <a href="reviewWriteList.do">나의 후기</a>
                      <a href="reward.do">나의 적립금</a>
                      <a href="qnaList.do">1:1 문의</a>
                      <a href="userUpdate.jsp">개인정보 수정</a>
                      <a href="userDelete.jsp">회원탈퇴</a>
                      <a href="logout.do">logout</a>
                    </div>
                     </i></li>
                  
                 </div>
                 
             <c:if test="${vo.memberId == 'ADMIN' }">
            	<li><a id="reser" class="sub__link" href="views/management/mgmtMain.jsp">관리자페이지</a></li>
            </c:if>
             <c:if test="${vo.memberId != 'ADMIN' }">
             	 <li><a id="reser" class="sub__link" href="reserIsDelete.do">RESERVATION</a></li>
             </c:if>
                 
                 
            </c:if>

           
        </ul>
                     
        </header>
    


</body>
</html>