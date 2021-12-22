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
<title>joinCheck</title>
</head>
<body>
	
	<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
			

	Class.forName("com.mysql.jdbc.Driver");
	
	String mem_id = request.getParameter("mem_id");
	String mem_password = request.getParameter("mem_password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	
	 log("==================================" + mem_id);
	 log("==================================" + mem_password);
	 log("==================================" + name);
	 log("==================================" + gender);
	 log("==================================" + phone);
	 log("==================================" + email);

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
				

		conn = DriverManager.getConnection(url, dbUser, dbPassword);			
		String sql ="insert into boardMember(mem_id, mem_password, name, gender, phone, email)" +
				" values(?, ?, ?, ?, ?, ?)";

						
			
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, mem_id);
		pstmt.setString(2, mem_password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, phone);
		pstmt.setString(6, email);

		pstmt.executeUpdate();

		response.sendRedirect("mainHome.jsp");
	}catch(SQLException e){
		System.out.println("DB연동 실패");
	}finally{	
		pstmt.close();
		conn.close();
			}
	%>


</body>
</html>