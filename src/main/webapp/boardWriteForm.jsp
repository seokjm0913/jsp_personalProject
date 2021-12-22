<%@page import="java.io.FileInputStream"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 상담문의</title>
<style type="text/css">
ul li input{
	margin-left: 20px

}

h1{
	text-align: center;

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



	<h1 id="subject">1:1 상담문의</h1>
	
	
	<form action="BoardInfoInsertController" method="post" style="text-align: center;">
	
			<ul style="list-style: none; margin: 0; padding: 0">			
			
				<li>
					
					<b>세부상담분야: </b>						
					<input type="text" name="detailedConsultationFields" list="choices">
					<datalist id="choices">
						<option value="수출문의" label="Export"></option>
						<option value="수입문의" label="Import"></option>
						<option value="견적" label="quotation"></option>
						<option value="상품문의" label="product Inquiry"></option>
						<option value="서류요청" label="Request documents"></option>									
					</datalist>
				</li>
				
							
				<li>
					<label for="buyer_country"><b>국가: </b></label>
					<input type="text" name="buyer_country" required="required" style="margin-right: -64px">
				</li>			
				<li>
					<label for="buyer_name"><b>바이어명: </b></label>
					<input type="text" name="buyer_name" required="required" style="margin-right: -32px">
				</li>			
				<li>
					<label for="cmpName"><b>업체명: </b></label>
					<input type="text" name="cmpName" required="required" style="margin-right: -48px">
				</li>			
				<li>
					<label for="cmpName_website"><b>업체주소: </b></label>
					<input type="text" name="cmpName_website" required="required" style="margin-right: -32px">
				</li>			
				<li>
					<label for="contact_email"><b>Email: </b></label>
					<input type="text" name="contact_email" required="required" style="margin-right: -54px">
				</li>			
			</ul>
			<br>
			<label style="padding: 0; margin: 0;"><b>문의내용</b></label> <br>
			<textarea name="content" rows="10" cols="60"></textarea> <br>
										
	
		
		<input type="submit" value="등록">
		<input type="reset" value="다시쓰기">
		<input type="submit" value="메인으로 가기" onclick="location.href='/humanwell/mainHome.jsp'"> 	
	</form>


</body>
</html>