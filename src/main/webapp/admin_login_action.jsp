<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="membermanager" class="member.MemberManager"/>



<%

	String admin_id = request.getParameter("admin_id");

	String admin_pw = request.getParameter("admin_pw");

	boolean b = membermanager.admin_login(admin_id, admin_pw);

	

	if(b){

		session.setAttribute("adminOk", admin_id);

%>

	<script>

		alert("관리자님 로그인 되셨습니다");

		location.href="/humanwell/admin_index.jsp";


	</script>

<% } else { %>

	<script>

		alert("아이디 및 비밀번호가 올바르지 않습니다.");

		location.href=history.back();

	</script>



<% } %>

