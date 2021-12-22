<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String admin_id = (String)session.getAttribute("adminOk");
	
	if(admin_id == null) {
%>
	<script>
		alert("관리자 로그아웃 되었습니다.");
		location.href = "/humanwell/maninHome.jsp";
	</script>
<%
		return;
	}
%>
<table style="width: 80%">
	<tr style="background-color: #ccbbcc; text-align: center;" >
		<td><a href="MemberListReadController">회원관리</a></td>
		<td><a href="/humanwell/noticeBoardInfoRead">공지사항 관리</a></td>
		<td><a href="boardInfoReadController">바이어상담문의 관리</a></td>
	</tr>
</table>
