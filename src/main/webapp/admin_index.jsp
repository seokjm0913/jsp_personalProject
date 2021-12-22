<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>휴먼웰 관리자 페이지</title>


<!-- favicon.ico 파비콘-->  
<link rel="shortcut icon" href="/humanwell/favicon.ico" type="image/x-icon">
<link rel="icon" href="/humanwell/favicon.ico" type="image/x-icon">   
</head>
<body>
	
	
	
	<table class="table table-dark table-hover" style="width: 80%">

			<tr style="text-align: center; width=100%;">
	  		
	  			<%
	  			
	  			String admin = (String)session.getAttribute("adminOk");
	  			if(admin !=null){
	  				%>
	  				<td>
		  				<b><%=session.getAttribute("adminOk") %>관리자님이 접속중입니다.</b>	  				
			  			<button class="btn btn-success" type="submit" onclick="location.href='admin_login_out.jsp'">로그아웃</button>
			  			<input type="button" class="btn btn-success" value="메인으로 가기" onclick="location.href='mainHome.jsp'">
		  			</td>  	
		  			<%
	  			}
	  					
	  			%>
	  	
	  	</tr>	

	</table>
	

	

<!-- include header page -->

	<%@ include file="admin_header.jsp" %>

	<table style="text-align: center; width: 80%">

		<tr>
			<img title="관리자" width="80%" src="/humanwell/images/humanwellAdmin.jpg" >
		</tr>

	</table>


	
</body>
</html>