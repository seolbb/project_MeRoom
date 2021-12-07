<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!--폰트어섬추가 -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">


<style>
.wrap {
	height: 810px;
}

.button-box {
	text-align: center;
	display: flex;
	justify-content: center;
}

.btn01 {
	width: 130px;
	margin: 0 0;
	margin-top: 20px;
}

.inputag {
	display: flex;
}

.panel-body #email02 {
	margin-top: 30px;
	width: 165px;
}

.panel-body p {
	margin-top: 300px;
}


/* Style tab links */
.tablink {

  border: 1px solid #015B28;
  float: left;
  outline: none;
  cursor: pointer;
  padding: 10px 14px;
  font-size: 14px;
  width: 50%;
}

.tabGroup {
  width: 90%;
  margin: 0px auto;
}

.tablink:hover {
  background-color: #015B28;
  color: white;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  display: none;
  padding: 100px 20px;
  height: 100%;
}


</style>


<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
    tablinks[i].style.color = "black";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = "#015B28";
  elmnt.style.color = "white";
}

</script>

<body>
	<%@ include file="mainheader.jsp"%>

	<form method="post">

		<div class="wrap">

			<div id="cont1">
				<div id="panel" class="panel panel-default">
					<div class="panel-heading">비밀번호 찾기</div>
					<div class="panel-body">
						<button class="tablink"
							onclick="openPage('mail', this, '#f7f7f7')" id="defaultOpen">Email</button>
						<button class="tablink"
							onclick="openPage('phone', this, '#f7f7f7')">Phone</button>


						<div id="mail" class="tabcontent">

							<input type="text" class="input form-control" name="userId" placeholder="ID"> 
							<input type="text" class="input form-control" name="name" placeholder="이름">
							<div class="inputag">
								<input type="text" name="emailId" class="input form-control" placeholder="EMAIL" >
								<div style="margin-top: 45px; margin-left: 10px;">@</div>
								<input type="text" id="inputMail" name="email_domain" class="input form-control">
							</div>
						</div>


						<div id="phone" class="tabcontent">
							<input type="text" id="nameId" class="input form-control"
								name="name" placeholder="이름"> 
							<br>
							<div class="inputag">
								<input type="text" id="phone1" name="phone1"
									class="input form-control phone" maxlength="3" 
									placeholder="000">
								<div style="margin: 7px 10px 10px 10px;">-</div>
								<input type="text" id="phone2" name="phone2"
									class="input form-control phone" maxlength="4" 
									placeholder="0000">
								<div style="margin: 7px 10px 10px 10px;">-</div>
								<input type="text" id="phone3" name="phone3"
									class="input form-control phone" maxlength="4" 
									placeholder="0000"> <input type="hidden" id="phoneNum"
									name="phone">
							</div>

						</div>

						<br> <br>
					</div>
				</div>
				<div class="button-box">

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<button type="button"class="btn btn-default btn01" style="margin-right: 10px;"> 찾기</button>
					<input type="button"class="btn btn-default btn01" value="뒤로가기" style="margin-right: 20px;" onclick="back_go()">
				</div>
				<br>
				<br>

			</div>
		</div>

	</form>






	<%@ include file="mainfooter.jsp"%>
</body>
</html>