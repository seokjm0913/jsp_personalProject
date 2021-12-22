<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

미완성

<% 

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
			
	//1. JDBC 드라이버 로딩 jdbc api사용하기 위해
	Class.forName("com.mysql.jdbc.Driver");
	
	String buyer_no = request.getParameter("buyer_no");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null; 
		
			
	try{
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
				

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
				
		/* String sql ="delete from membership where mem_no = " + mem_no; */
				
		pstmt = conn.prepareStatement("delete from BoardInfo where buyer_no = ?");
		
		pstmt.setString(1, buyer_no); 		
		pstmt.executeUpdate();
		
		
	}catch(SQLException ex){
		System.out.println("delete 실패");
	}finally{	
		pstmt.close();
		conn.close();
			}
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% response.sendRedirect("../bootStrapMain.jsp"); %>  
	<!-- <h1>상담문의 정보가 삭제되었습니다.</h1> <br>
	<input type="submit" value="상담문의 게시판가기" onclick="location.href='/buyerConsultation/consultationInquiry/BoardList.jsp'"><br> -->

</body>
</html>