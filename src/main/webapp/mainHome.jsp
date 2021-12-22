<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
	String admin = (String)session.getAttribute("adminOk");
%>
<!DOCTYPE html>
<html>
<head>
<title>(주)Humanwell</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
    
  #wrapper{
  	margin: 0 auto; 
  	max-width: 1500px
  }
  
  
   .carousel-inner img {
    width: 60%;
    height: 60%;
    margin: 0 auto;
    display: block;
    
  }
  
  .carousel-indicators li {  
  	background-color: grey; 
  
  }
  

  </style>
  
<!-- favicon.ico 파비콘-->  
<link rel="shortcut icon" href="/humanwell/favicon.ico" type="image/x-icon">
<link rel="icon" href="/humanwell/favicon.ico" type="image/x-icon">  
</head>
<body>

<div id="wrapper">


<!--  header	 -->
	<%@ include file="header.jsp"%>
	
<!-- main -->	
	
	
	  <table class="table table-dark table-hover">
	  	<tr>
	  		
	  			<%
	  			
	  			
	  	      	if(session.getAttribute("mem_id")!=null){
	  				%>
	  				<td>
	  				<b><%=session.getAttribute("mem_id") %>님이 접속중</b>	  				
		  			<button class="btn btn-success" type="submit" onclick="location.href='logout.jsp'">로그아웃</button>
		  			</td>  	
		  			<%
	  			}else if(admin !=null){
	  				%>
	  				<td>
	  				<b><%=session.getAttribute("adminOk") %>관리자님이 접속중입니다.</b>	  				
		  			<!-- <button class="btn btn-success" type="submit" onclick="location.href='admin_login_out.jsp'">로그아웃</button> -->
		  			<input type="button" class="btn btn-success" value="관리자 페이지가기" onclick="location.href='admin_index.jsp'">
	  			</td> 
	  			<% 	
	  			}
	  				
	  			%>
	  		
	  		
	  	</tr>
	  </table>	  				
	<%-- <jsp:useBean id="counter" class="count.CounterBean" scope="application"></jsp:useBean>
	<jsp:setProperty property="newVisit" name="counter" value="1" /> <h1>현재 웹사이트에 <jsp:getProperty property="visitCount" name="counter"/>번째로 방문하셨습니다.</h1> --%>
	
	<br>
 
 	
 	<div id="demo" class="carousel slide" data-ride="carousel" >
		  <ul class="carousel-indicators" >
		    <li data-target="#demo" data-slide-to="0" class="active" style="background-color: grey"></li>
		    <li data-target="#demo" data-slide-to="1" style="background-color: grey"></li>
		    <li data-target="#demo" data-slide-to="2" style="background-color: grey"></li>
		  </ul>
		  <div class="carousel-inner" style="height: 600px;">
		    <div class="carousel-item active">
		      <img src="/humanwell/images/seaweeditems.png" alt="seaweed" width="1100" height="500">
		      <div class="carousel-caption">
		       
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img src="/humanwell/images/laver.jpg" alt="seaweedSnack" width="1100" height="500">
		      <div class="carousel-caption">
		        <h4 style="color: grey">Healthy Food</h4>
		      </div>   
		    </div>
		    <div class="carousel-item">
		      <img src="/humanwell/images/seaweedExport.png" alt="export" width="1100" height="500">
		      <div class="carousel-caption">
		        <h4 style="color: grey">Humanwell Worldwide</h4>
		        <p style="color: grey">Beyond the world</p>
		      </div>   
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#demo" data-slide="prev" >
		    <span class="carousel-control-prev-icon" style="background-color: grey" ></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next" >
		    <span class="carousel-control-next-icon" style="background-color: grey"></span>
		  </a>
	</div>
	<%-- <jsp:include page="/consultationInquiry/BoardList1.jsp" flush="true"></jsp:include>  --%>
	
<!-- footer -->	
	<%@ include file="footer.jsp"%>	

</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>