<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style type="text/css">
h1{
	text-align: center;

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


	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>


	
	
<div id="wrapper">
		
		<br>
		<h1>회원관리</h1>
		<br>

		<nav class="navbar navbar-expand-sm " style="float: right;">
			<form  class="form-inline" action="MemberListSearch" method="get" >									
					<select name='col' style="width:110px;height:40px;">
				        <!-- <option value='none'>전체</option> -->
				        <option  value='mem_id'>회원아이디</option>
				        <option  value='name'>이름</option>    				
				        <option  value='email'>이메일</option>    				  				
	      			</select> 
	      			<input class="form-control mr-sm-2" type="text"  name='word' placeholder="검색어를 입력하세요." size="30">
	      			<button  class="btn btn-success" type="submit" >검색</button>								
			</form>
		</nav>
	
		
	
	<form action="#"  method="post">
	
		<table class="table table-hover" style="table-layout: fixed;">
			
	      <tr style="text-align: center;" >
		        <td>회원아이디</td>
				<td>회원비번</td>
				<td>이름</td>
				<td>이메일</td>									
				<td>가입일</td>									
				<td>삭제</td>	
				<!-- <td>수정</td>	 -->
	      </tr>
	   
	  <c:forEach var="list" items="${list}">
	     <tr style="text-align: center;">
	            <td>${list.mem_id}</td>
	            <td>${list.mem_password}</td>
	            <td>${list.name}</td>				
				<td>${list.email}</td> 
				<td>${list.reg_date}</td>				
				<td><button type="button" class="btn btn-danger" formmethod="get" onclick="location.href='MemberDeleteController?mem_id=${list.mem_id}'">삭제</button></td>			
				<%-- <td><button type="button" class="btn btn-success" formmethod="get" onclick="location.href='updateReadController?num=${list.num}'">수정</button></td>	 --%>	 		
	     </tr>
	  </c:forEach>             
	   
	   </table>
	   

		<div style="text-align: center;">
		   	<input type="button" class="btn btn-success" value="메인으로 가기" onclick="location.href='mainHome.jsp'"> 
			<input type="button" class="btn btn-success" value="관리자 페이지가기" onclick="location.href='admin_index.jsp'">
		</div>
	</form>
	
</div>


</body>
</html>