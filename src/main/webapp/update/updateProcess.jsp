<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
			
	//1. JDBC 드라이버 로딩 jdbc api사용하기 위해
	Class.forName("com.mysql.jdbc.Driver");
	
	String buyer_no = request.getParameter("buyer_no");	
	String detailedConsultationFields = request.getParameter("detailedConsultationFields");
	String buyer_country = request.getParameter("buyer_country");
	String buyer_name = request.getParameter("buyer_name");
	String cmpName = request.getParameter("cmpName");
	String cmpName_website = request.getParameter("cmpName_website");
	String contact_email = request.getParameter("contact_email");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
		 
	 log("==================================" + buyer_no); 
	 log("==================================" + detailedConsultationFields);
	 log("==================================" + buyer_country);
	 log("==================================" + buyer_name);
	 log("==================================" + cmpName);
	 log("==================================" + cmpName_website);
	 log("==================================" + contact_email);
	 log("==================================" + pwd);
	 log("==================================" + content);
	
	
	Connection conn = null;
	PreparedStatement pstmt = null; //sql문 넣는 객체 만들어줌
	ResultSet rs = null; 
	
	
			
	try{
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
		

				
	//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(url, dbUser, dbPassword);
				
		String sql ="update BoardInfo set detailedConsultationFields = ?, buyer_country = ?, buyer_name = ?, cmpName = ?, cmpName_website = ?, contact_email = ?, pwd = ?, content = ? where buyer_no = ?";
												//인덱스 1, 2, 3
		pstmt = conn.prepareStatement(sql);
		

		
		pstmt.setString(1, detailedConsultationFields);
		pstmt.setString(2, buyer_country);
		pstmt.setString(3, buyer_name);
		pstmt.setString(4, cmpName);
		pstmt.setString(5, cmpName_website);
		pstmt.setString(6, contact_email);
		pstmt.setString(7, pwd);
		pstmt.setString(8, content);
		pstmt.setString(9, buyer_no);
			
		pstmt.executeUpdate();

	}catch(SQLException ex){
		System.out.println("update 실패");
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
	<!-- <h1>상담정보가 수정되었습니다</h1> <br>
	<input type="submit" value="상담문의 게시판가기" onclick="location.href='/buyerConsultation/consultationInquiry/BoardList.jsp'"><br> -->
</body>
</html>