<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	
	<h1>회원가입</h1>
	<form action="joinCheck.jsp" method="post" onsubmit="return inputCheckFunc()">
		<fieldset>
				<legend>회원정보</legend>
				
				<label for="mem_id">아이디 : </label>
				<input type="text" id="mem_id" name="mem_id"> <br>
			
				<label for="mem_password">비밀번호 : </label>
				<input type="password" id="mem_password" name="mem_password"> <br>
				
				<label for="name">이름 : </label>
				<input type="text" id="name" name="name"> <br>
				
				<label for="gender">성별 : </label> <br>
				
		  		M<input type="radio"  name="gender" value="M">
		  		F<input type="radio" name="gender" value="F"><br>
				
				<label for="phone">연락처 : </label>
				<input type="text" id="phone" name="phone"> <br>
				
				<label for="email">Email : </label>
				<input type="text" id="email" name="email">	<br>			
		</fieldset>
		
		<input type="submit" value="가입하기">
	</form>

<script type="text/javascript">
	
	function inputCheckFunc() {
		 
		var mem_id = document.getElementById('mem_id').value;
	    var mem_password = document.getElementById('mem_password').value;
		
	    if(mem_id == null || mem_password == null || mem_id = "" || mem_password = ""){
	    	alert("전부다 기입해주세요!");
	    	return false;
	    }else {
	    	return true;
	    }


	}

</script>

</body>
</html>