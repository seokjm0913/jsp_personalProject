<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글</title>
<style type="text/css">
	#wrapper{
		margin: 0 auto;
		text-align: center;
		width: 600px;
	}

</style>

<!-- favicon.ico 파비콘-->  
<link rel="shortcut icon" href="/humanwell/favicon.ico" type="image/x-icon">
<link rel="icon" href="/humanwell/favicon.ico" type="image/x-icon"> 
</head>
<body>

<div id="wrapper">
	<c:forEach var="list" items="${list}">
			<form action="#" method="get">
				
				<fieldset>
					<h1 style="text-align: center;">공지글 보기</h1>
					<ul style="list-style: none; text-align: center;">		
									
						<li>
							<label for="viewCnt"><b>조회수: </b></label>
							<input type="text" name="viewCnt" required="required" value="${list.viewCnt+1}">
						</li>			
						<li>
							<label for="title"><b>제목: </b></label>
							<input type="text" name="title" required="required" value="${list.title}">
						</li>			
						<li>
							<label for="username"><b>작성자: </b></label>
							<input type="text" name="username" required="required" value="${list.username}">
						</li>			
						<li>
							<br> <label><b>내용</b></label> <br>
							<textarea name="memo" rows="10" cols="60">${list.memo}</textarea> <br>
						</li>
					</ul>	
				</fieldset>		
	
				<!-- <input type="submit" value="등록">
				<input type="reset" value="다시쓰기"> 	 -->
				<button type="button" onclick="location.href='readController'">공지사항으로 가기</button>
			</form>
	 </c:forEach>  		
</div>		
		
		
</body>
</html>