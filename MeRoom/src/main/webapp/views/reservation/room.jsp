<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>룸</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/main.css">
</head>


<body>
	   
    	<%@include file="mainheader.jsp"%>


        
        <main>
            <div class="body__container">
                <div class="container-full">
                    <div class="main-image">
                        <div class="main-bg"></div>
                        <div class="title main-title">
                            <span class="single">
                                <span class="single-two">MAIN ROOM</span>
                            </span>
                        </div>
                        <div class="title2 title ">
                            <span class="single-one">편안한 휴식을 즐길 수 있습니다.</span>
                        </div>
                    </div>
                </div>


                <div class="sub-container">
                    <div class="positionR">
                        <div class="items">
                            <ul>
                                <li class="first">
                                    <div class="rest-item">
                                        <div class="image-wrap">
                                            <a href="/mr/getRoom.do?rmNumber=401" class="link zoom">
                                                <span class="zoom-one"></span>
                                                <span class="title2 title3">SUITE</span>
                                            </a>
                                        </div>
                                        <div class="info">
                                            <div class="subject"><span>스위트</span></div>
                                            <div class="content">여행자의 지친 피로를 해소할 수 있는 편안한 방</div>
                                        </div>
                                    </div>
                                </li>

                                <li class="double">
                                    <div class="rest-item">
                                        <div class="image-wrap image-wrap2">
                                            <a href="/mr/getRoom.do?rmNumber=301" class="link zoom">
                                                <span class="zoom-one" style="background:url(../../img/romm.jpg);background-repeat: no-repeat;
                                                background-size: cover;"></span>    
                                                <span class="title2 title3">DELUX</span>
                                            </a>
                                    </div>
                                    <div class="info">
                                        <div class="subject"><span>디럭스</span></div>
                                        <div class="content">제주 밤의 야경을 즐길 수 있는 감성있는 방</div>
                                    </div>
                                    </div>
                                </li>

                                <li class="double">
                                    <div class="rest-item">
                                        <div class="image-wrap image-wrap2">
                                            <a href="/mr/getRoom.do?rmNumber=201" class="link zoom">
                                                <span class="zoom-one image0" style="background:url(../../img/image2.jpg);background-repeat: no-repeat;
                                                background-size: cover;"></span>
                                                <span class="title2 title3">STANDARD</span>
                                            </a>
                                    </div>
                                    <div class="info">
                                        <div class="subject"><span>스탠다드</span></div>
                                        <div class="content">신혼여행 및 비즈니스를 원하시는 분들께 소개해 주고 싶은 방</div>
                                    </div>
                                    </div>
                                </li>

                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </main>


         <%@include file="../../mainfooter.jsp"%>
</body>
</html>