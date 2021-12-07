<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main footer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
/*공통 부분 */
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: #000;
}

footer {
	background-color: lightgray;
	color: gray;
	
}

.footer {
	padding: 50px;
	margin: 0 auto;
	max-width: 1180px;
}
.icon {
	text-align: right;
	letter-spacing: 2px;
	display: flex;
	justify-content: flex-end;
	color: white;
	
}

#first {
	font: geogia;
	font-size: 13px;
	color: white;
	font-weight: bold;
}

.top {
	text-align: left;
	display: flex;
	justify-content: space-between;
 	flex-wrap: wrap; 
	
}

</style>

<body>
	<footer>
		<div class ="footer">
            <div class="icon">
           <i class="fa fa-twitter-square" style="font-size:24px"></i>
           <i class="fa fa-instagram" style="font-size:24px"></i>
            <i class="fa fa-facebook-square" style="font-size:24px"></i>
            </div><br>
		
		
            <div id="first">
            <div class="top">
            
            HELLO@MEROOMCOMPANY.COM<br>
            +82(0)64-766-3000<br><br><br>
            
			</div>            
            
            <a class="img_logo" href="main.jsp"><img src="img/MEROOM10.png" alt="logo" width="100"></a><br>    
                
            미룸(MEROOM)<br>
            제주특별자치도 서귀포시 성산읍 섭지코지로 107<br>
            대표자 : 미룸컴퍼니<br>
            사업자등록번호 : 498-85-00107
            </div>
				
		</div>
	</footer>
	


</body>
</html>