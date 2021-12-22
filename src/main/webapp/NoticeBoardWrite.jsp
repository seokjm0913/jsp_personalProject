<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 쓰기</title>
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
		<form action="InsertController" method="get">
			
			<fieldset>
			<h1 style="text-align: center;">공지글 쓰기</h1>
				<ul style="list-style: none; text-align: center;">		
								
					<li>
						<label for="title"><b>제목: </b></label>
						<input type="text" name="title" required="required">
					</li>			
					<li>
						<label for="username"><b>작성자: </b></label>
						<input type="text" name="username" required="required">
					</li>			
					<li>
						<label><b>내용</b></label> <br>
						<textarea name="memo" rows="10" cols="60"></textarea> <br>
					</li>
				</ul>	
			</fieldset>		

			<input type="submit" value="등록">
			<input type="reset" value="다시쓰기">
			<button type="button" onclick="location.href='noticeBoardInfoRead'">공지사항 관리가기</button> 	
		</form>
	</div>	

</body>
</html>