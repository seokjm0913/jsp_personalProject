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
<title>loginCheck</title>
</head>
<body>
	
   <%
   
	  request.setCharacterEncoding("utf-8");
	  response.setCharacterEncoding("utf-8");
      
	  Class.forName("com.mysql.jdbc.Driver");
   
	  String mem_id = request.getParameter("mem_id");
	  String mem_password = request.getParameter("mem_password");
         
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
         
      try{
         /* Context init = new InitialContext();
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
         conn = ds.getConnection(); */
         
         String url = "jdbc:mysql://localhost:3306/buyerConsultation?useSSL=false";
 		 String dbUser = "root";
 		 String dbPassword = "rootroot";
 		 
 		 conn = DriverManager.getConnection(url, dbUser, dbPassword);
         
 		 String sql = "select mem_id, mem_password from boardMember;";
         
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
              
         while(rs.next()) {
  
   		
         	if(mem_password.equals(rs.getString("mem_password"))){
         		session.setAttribute("mem_id", mem_id);
         		response.sendRedirect("mainHome.jsp");
         	}else{
         		
         		%>
	         		<script>
	         			alert("비밀번호 틀림");
	         			location.href='login.jsp'
	         		</script>
         		<%
         		
         	}
            
   			
         }
      }catch(SQLException e){
  		System.out.println("DB연동 실패");
  	}finally{	
  		pstmt.close();
  		conn.close();
  			}
      
   %>

</body>
</html>