<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<% 
		session.invalidate();
	
	%>
	 <script type="text/javascript">
	 	alert("로그아웃 되었습니다.");
	 	location.href = 'mainHome.jsp'
	 </script>

</body>
</html>