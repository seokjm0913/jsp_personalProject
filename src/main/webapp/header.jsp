<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  
    
  #wrapper{
  	margin: 0 auto;
  	max-width: 1500px
  }
  

  </style>
  
<!-- favicon.ico 파비콘-->  
<link rel="shortcut icon" href="/humanwell/favicon.ico" type="image/x-icon">
<link rel="icon" href="/humanwell/favicon.ico" type="image/x-icon"> 
</head>
<body>


	<!-- 회사로고	 -->
	<div class="jumbotron text-center" style="margin-bottom:0">
	  	<img src="/humanwell/images/logo.png" width="900" height="350"> 
	</div>
	
	<!-- nav -->
	<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
	  <!-- Brand -->
	    <a class="navbar-brand" href="mainHome.jsp">Humanwell</a>
	
	  <!-- Links -->
	  <ul class="navbar-nav">	    
		  	
		  	<li class="nav-item">
		    	<a class="nav-link" href="http://www.humanwell.co.kr/page/index?tpl=company%2Fgreetimg.html">About Company</a>
		    </li>	
		  	<li class="nav-item">
		      	<a class="nav-link" href="readController">공지사항</a>
		    </li>	    
		 <!--    <li class="nav-item">
		    	<a class="nav-link" href="#">회원전용게시판</a>
		    </li> --> 			    
		           			           	
		   	<li class="nav-item">
		       <a class="nav-link" href="/humanwell/boardWriteForm.jsp">1:1 상담문의</a>
		    </li> 
		    <!-- <li>
				<a class="nav-link" href="login.jsp">Login</a>
			</li> -->
			
			<li class="nav-item dropdown">
      			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        		Membership 
      			</a>
      			<div class="dropdown-menu">
        			<a class="dropdown-item" href="loginJoinForm.jsp">Login</a>
        			<a class="dropdown-item" href="admin_login.jsp">관리자 Only</a>
      			</div>
    		</li>	  
	  </ul>
	</nav>
	

</body>
</html>