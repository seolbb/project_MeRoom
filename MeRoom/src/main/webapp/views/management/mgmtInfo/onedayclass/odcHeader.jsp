<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script>
function go(type) {
	if (type == 'resv') {
		location.href="/mr/getRsvList.do"
	}
	if (type == 'info') {
		location.href="/mr/getClassList.do"
	}
}
</script>
<div class="right_header">
	<div class="right_menu" id="right_list">
		<a href="javascript:go('resv')">진행현황</a>
	</div>
	<div class="right_menu" id="right_info">
		<a href="javascript:go('info')">클래스현황</a>
	</div>
	<div id="underLine1"></div>
	<div id="underLine"></div>
</div>
