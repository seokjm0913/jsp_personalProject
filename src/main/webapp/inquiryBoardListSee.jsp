<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이어상담문의 관리</title>
<style type="text/css">
	h2{
		text-align: center;
	}
	
	#wrap{
		margin-left: 40%;
    	     
	}

</style>
</head>
<body>


<h2 id="subject">바이어 상담문의내용 보기</h2>
<div id="wrap">
	<c:forEach var="list" items="${list}">	
			<form action="" method="get">
					<ul style="list-style: none;">							
						<li>						
							<b>세부상담분야: </b>						
							<input type="text" name="detailedConsultationFields" list="choices" value="${list.detailedConsultationFields}">
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
							<input type="text" name="buyer_country" required="required" value="${list.buyer_country}">
						</li>			
						<li>
							<label for="buyer_name"><b>바이어명: </b></label>
							<input type="text" name="buyer_name" required="required" value="${list.buyer_name}">
						</li>			
						<li>
							<label for="cmpName"><b>업체명: </b></label>
							<input type="text" name="cmpName" required="required" value="${list.cmpName}">
						</li>			
						<li>
							<label for="cmpName_website"><b>업체주소: </b></label>
							<input type="text" name="cmpName_website" required="required" value="${list.cmpName_website}">
						</li>			
						<li>
							<label for="contact_email"><b>Email: </b></label>
							<input type="text" name="contact_email" required="required" value="${list.contact_email}">
						</li>			
					</ul>
					<br>
					<label><b>문의내용</b></label> <br>
					<textarea name="content" rows="10" cols="60">${list.content}</textarea> <br>
				<!-- <button type="button" onclick="location.href='boardInfoReadController'">되돌리기</button> -->
				<input type="button" value="관리자 페이지로 가기" onclick="location.href='admin_index.jsp'"> 	
			</form>
	 </c:forEach>
</div> 	
</body>
</html>