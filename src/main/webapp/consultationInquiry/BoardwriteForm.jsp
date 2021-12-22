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
<title>Insert title here</title>
<style type="text/css">
ul li input{
	margin-left: 20px

}

</style>
</head>
<body>

	<h1 id="subject">Consultation Inquiry</h1>
	<!-- <input type="submit" value="상담문의 게시판가기" onclick="location.href='BoardList.jsp'"> -->
	<input type="submit" value="메인으로 가기" onclick="location.href='/humanwell/mainHome.jsp'">
	<hr>
	
	<form action="/humanwell/insert/insertProcess.jsp" method="post">
	
			<ul style="list-style: none;">			
				<li>
					<label for="pwd"><b>비밀번호: </b></label>
					<input type="password" name="pwd" id="pwd" required="required">
				</li>
			
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
					<input type="text" name="buyer_country" required="required">
				</li>			
				<li>
					<label for="buyer_name"><b>바이어명: </b></label>
					<input type="text" name="buyer_name" required="required">
				</li>			
				<li>
					<label for="cmpName"><b>업체명: </b></label>
					<input type="text" name="cmpName" required="required">
				</li>			
				<li>
					<label for="cmpName_website"><b>업체주소: </b></label>
					<input type="text" name="cmpName_website" required="required">
				</li>			
				<li>
					<label for="contact_email"><b>Email: </b></label>
					<input type="text" name="contact_email" required="required">
				</li>			
			</ul>
			<br>
			<label><b>문의내용</b></label> <br>
			<textarea name="content" rows="10" cols="60"></textarea> <br>
										
	
		
		<input type="submit" value="등록">
		<input type="reset" value="다시쓰기"> 	
	</form>


</body>
</html>