<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이어 상당문의 게시판</title>
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
<% 

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");


%>


	<div id="wrapper">	
	   <br>
	   <h1>바이어상담문의 관리</h1> <br>
		   
		
		<nav class="navbar navbar-expand-sm bg-light navbar-light" style="float: right;">
			<form  class="form-inline" action="InquiryBoardSearch" method="get" >									
					<select name='col' style="width:90px;height:40px;">
				        <option  value='buyer_name'>바이어명</option>
				        <option  value='cmpName'>업체명</option>    				
				        <option  value='reg_date'>작성일</option>    				 				
	      			</select> 
	      			<input class="form-control mr-sm-2" type="text"  name='word' placeholder="검색어를 입력하세요." size="30">
	      			<button  class="btn btn-success" type="submit" >검색</button>								
			</form>
		</nav>
		
		
		

	      	
		<form action="#" method="get">  
		   <table class="table table-hover" >
		
		      <tr style="text-align: center;">
		        	<td>문의번호</td>
					<td>세부상담분야</td>
					<td>국가</td>
					<td>바이어명</td>
					<td>업체명</td>
					<td>업체주소</td>
					<td>Email</td>
					<td>문의내용</td>
					<td>작성일</td>			
					<td>삭제</td>	
		      </tr>
		
			<c:forEach var="list" items="${list}">
		       <tr style="text-align: center;">
		            <td>${list.buyer_no}</td>
					<td>${list.detailedConsultationFields}</td>
					<td>${list.buyer_country}</td>
					<td><a href="/humanwell/InquiryBoardListLook?buyer_no=${list.buyer_no}">${list.buyer_name}</a></td>	
					<td><a href="/humanwell/InquiryBoardListLook?buyer_no=${list.buyer_no}">${list.cmpName}</a></td>	
					<td>${list.cmpName_website}</td>
					<td>${list.contact_email}</td>
					<td>${list.content}</td>
					<td>${list.reg_date}</td>
 					<td><button type="button" class="btn btn-danger" formmethod="get" onclick="location.href='InquiryBoardListDeleteProcess?buyer_no=${list.buyer_no}'">삭제</button></td>			
		        </tr>
		    </c:forEach>       

		   </table>
   		
	   		<div style="text-align: center;">
			   	<!-- <button type="button" class="btn btn-success" onclick="location.href='NoticeBoardWrite.jsp'">작성하기</button> -->
				<input type="button" class="btn btn-success" value="메인으로 가기" onclick="location.href='mainHome.jsp'"> 
				<input type="button" class="btn btn-success" value="관리자 페이지가기" onclick="location.href='admin_index.jsp'">
			</div>
   		</form> 
   </div>
   
   
</body>
</html>