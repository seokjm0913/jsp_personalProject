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
			

	Class.forName("com.mysql.jdbc.Driver");
	
	String pwd = request.getParameter("pwd");
	String detailedConsultationFields = request.getParameter("detailedConsultationFields");
	String buyer_country = request.getParameter("buyer_country");
	String buyer_name = request.getParameter("buyer_name");
	String cmpName = request.getParameter("cmpName");
	String cmpName_website = request.getParameter("cmpName_website");
	String contact_email = request.getParameter("contact_email");
	String content = request.getParameter("content");
	
	 log("==================================" + pwd);
	 log("==================================" + detailedConsultationFields);
	 log("==================================" + buyer_country);
	 log("==================================" + buyer_name);
	 log("==================================" + cmpName);
	 log("==================================" + cmpName_website);
	 log("==================================" + contact_email);
	 log("==================================" + content);
	
	Connection conn = null;
	PreparedStatement pstmt = null; 
		
			
	try{
		String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
		String dbUser = "root";
		String dbPassword = "rootroot";
				

		conn = DriverManager.getConnection(url, dbUser, dbPassword);
				
		String sql ="insert into BoardInfo(detailedConsultationFields, buyer_country, buyer_name, cmpName, cmpName_website, contact_email, pwd, content)" +
							"values(?, ?, ?, ?, ?, ?, ?, ?)";
							//인덱스 1 , 2, 3, 4, 5			
						
			
		pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1, detailedConsultationFields);
		pstmt.setString(2, buyer_country);
		pstmt.setString(3, buyer_name);
		pstmt.setString(4, cmpName);
		pstmt.setString(5, cmpName_website);
		pstmt.setString(6, contact_email);
		pstmt.setString(7, pwd);
		pstmt.setString(8, content);
			
		
		pstmt.executeUpdate();
	}catch(SQLException ex){
		System.out.println("insert 실패");
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

	<% response.sendRedirect("../mainHome.jsp"); %>  
	<!-- <h1>상담문의 등록이 완료되었습니다</h1> <br>
	<input type="submit" value="메인 홈으로 가기" onclick="location.href='/buyerConsultation/main.jsp'"> -->
	<!-- <input type="submit" value="상담문의 게시판가기" onclick="location.href='/buyerConsultation/consultationInquiry/BoardList.jsp'"><br> -->
	<!-- <a href="/membership/viewList/view.jsp">회원관리게시판 가기</a>  -->
	 

</body>
</html>