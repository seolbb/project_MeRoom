<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력 테스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<style>
   /* 달력 */
   .table-condensed{
       width: 400px;
       height: 400px;
   }

   .datepicker table tr td.active.active {
       color: #fff;
       background-color: #015B28;
   }

   .datepicker table tr td.active.active:hover {
       color: #fff;
       background-color: #015B28;
       /* border-color: #193c5a; */
   }

   .inputdate {
       /* border: none; */
       font-size: 20px;
   }
</style>
</head>
<body>
	<div id="datepicker"></div>
	<input type="text" id="my_hidden_input1">
	<input type="text" id="my_hidden_input2">
	<input type="text" id="my_hidden_input3">
	<input type="text" id="my_hidden_input4">
	<input type="text" id="my_hidden_input5">
	<!-- <input type="text" id="my_hidden_input" class="inputdate"> -->
</body>
<script>
	/* 달력 */
	let i = -1;
	$('#datepicker').on('changeDate', function() {
		++i;
	    $('#my_hidden_input'+i).val(
	        $('#datepicker').datepicker('getFormattedDate')
	        );
	});

	/* 달력에 등록된 날짜로 표시 */
	$("#datepicker").datepicker({format: 'yyyy/mm/dd'}).datepicker("setDate", "${oneday.oDate}");
</script>
</html>