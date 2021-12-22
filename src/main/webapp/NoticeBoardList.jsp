<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String admin = (String)session.getAttribute("adminOk");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	
	<%@ include file="header.jsp"%>
	
		
		
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
			
		<br>
		<h1>공지사항</h1>
		<br>

		<nav class="navbar navbar-expand-sm " style="float: right;">
			<form  class="form-inline" action="NoticeBoardReadController" method="get" >									
					<select name='col' style="width:80px;height:40px;">
				        <!-- <option value='none'>전체</option> -->
				        <option  value='username'>작성자</option>
				        <option  value='title'>제목</option>    				
				       <!--  <option  value='memo'>내용</option> -->    				
	      			</select> 
	      			<input class="form-control mr-sm-2" type="text"  name='word' placeholder="검색어를 입력하세요." size="30">
	      			<button  class="btn btn-success" type="submit" >검색</button>								
			</form>
		</nav>
	
		
	
	<form action="#"  method="post">
	
		<table class="table table-hover" style="table-layout: fixed;">
			
	      <tr style="text-align: center;" >
		        <td>번호</td>
				<td>작성자</td>
				<td>제목</td>
				<!-- <td>내용</td>	 -->										
				<td>작성일</td>					
				<td>조회수</td>					
				<!-- <td>삭제</td>	
				<td>수정</td>	 -->
	      </tr>
	   
	  <c:forEach var="list" items="${list}">
	     <tr style="text-align: center;">
	            <td>${list.num}</td>
	            <td>${list.username}</td>
	            <td><a href="/humanwell/noticeBoardCnt?num=${list.num}">${list.title}</a></td>				
				<%-- <td>${list.memo}</td> --%>
				<td>${list.reg_date}</td>
				<td>${list.viewCnt}</td>				
				<%-- <td><button type="button" class="btn btn-danger" formmethod="get" onclick="location.href='deleteController?num=${list.num}'">삭제</button></td>			
				<td><button type="button" class="btn btn-success" formmethod="get" onclick="location.href='updateReadController?num=${list.num}'">수정</button></td>		 --%>			
	     </tr>
	  </c:forEach>             
	   
	   </table>
	   
	 <%-- <div>	
			<span onclick="alert('이전 페이지가 없습니다.');">이전</span>			
		<c:set var = "page" value = "${(param.p==null)? 1: param.p}"/>
		<c:set var ="startNum" value = "${page-(page-1)%5}"/>
		<span>
			<c:forEach var = "i" begin= "0" end = "4">
				<a href="?p=${startNum+i}&t=&q=" >${startNum+i}</a>
			</c:forEach>
		</span>		
			<span onclick="alert('다음 페이지가 없습니다.');">다음</span>			
		</div>  --%>
	   
		<div style="text-align: center;">
		   	<!-- <button type="button" class="btn btn-success" onclick="location.href='NoticeBoardWrite.jsp'">작성하기</button> -->
			<input type="button" class="btn btn-success" value="메인으로 가기" onclick="location.href='mainHome.jsp'">
		</div>
	</form>
	
	<%@ include file="footer.jsp"%>
	
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
</body>
</html>