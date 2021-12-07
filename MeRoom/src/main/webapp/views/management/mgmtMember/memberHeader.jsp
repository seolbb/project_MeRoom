<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script>
function go(type) {
	if (type == 'list') {
		location.href="/mr/getUserList.do";
	}
	if (type == 'info') {
		location.href="/mr/views/management/mgmtMember/memberInfo/memberInfo.jsp";
	}
	if (type == 'insert') {
		location.href="/mr/views/management/mgmtMember/memberInsert/memberInsert.jsp";
	}
}
</script>
<div class="right_header">
	<div class="right_menu" id="right_list">
		<a href="javascript:go('list')">목록조회</a>
	</div>
	<div class="right_menu" id="right_info">
		<a href="javascript:go('info')">회원상세</a>
	</div>
	<div class="right_menu" id="right_insert">
		<a href="javascript:go('insert')">신규등록</a>
	</div>
	<div id="underLine1"></div>
	<div id="underLine"></div>
</div>
