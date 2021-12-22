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
<title>login</title>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
    
  #wrapper{
  	margin: 0 auto;
  	max-width: 1500px;
  }
  

  

  </style>
</head>
<body>
<div id="wrapper">	
	<%@ include file="header.jsp"%>
	

	  <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        	if(session.getAttribute("mem_id") == null) {
      %>
	            
	            <form action="loginCheck.jsp" method="post">
	         		<fieldset>
	         			<legend><b>로그인</b></legend>
			            아이디 : <input name="mem_id" type="text"> <br>		            
			            비밀번호 : <input name="mem_password" type="password"> <br> 
			            
			            <input type="submit" value="로그인"> 
	            		
	            	</fieldset>
	            </form>
	            <br>
	            <button onClick="location.href='join.jsp'"> 회원가입 </button>
       <%
       		} 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
       	 	else {
            	  out.print(session.getAttribute("mem_id") + " 님 로그인 중");
       %>
	        	
	           	<form action="logout.jsp" method="post">	                 
	            	<input type="submit" value="로그아웃">
	            </form>
	            <!-- <button onClick="location.href='CHANGEPROFILE.jsp'"> 개인정보 변경</button> -->
       
       <%
        	}
       
       %>

	<%@ include file="footer.jsp"%>	
</div> 
</body>
</html>