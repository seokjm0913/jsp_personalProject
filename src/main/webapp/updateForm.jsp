<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<form action="updateController" method="get">
	<c:forEach var="list" items="${list}">	
	<table border="1">
	
		<tr>
			<td>번호</td>
			<td><input type="text" name="num" value="${list.num}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="username" value="${list.username}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${list.title}"></td>
		</tr>
		<tr>
			<td>내용</td>			
			<td><textarea name="memo" rows="10" cols="60">${list.memo}</textarea></td>
		</tr>		
		
	</table>
	
	</c:forEach>
		<input type="submit" value="수정하기">
		<input type="reset" value="수정초기화">
</form>


	
</body>
</html>