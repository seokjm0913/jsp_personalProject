<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
/* form {border: 3px solid #f1f1f1;} */

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 0 auto;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}


.imgcontainer {
  text-align: center;
  margin: 0 auto;
  
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 0px;
  width: 40%;
  margin: 0 auto;
  
} 



</style>

<!-- favicon.ico 파비콘-->  
<link rel="shortcut icon" href="/humanwell/favicon.ico" type="image/x-icon">
<link rel="icon" href="/humanwell/favicon.ico" type="image/x-icon">  
</head>
<script type="text/javascript">

	function check() {

		if(frm.admin_id.value == "" || frm.admin_pw.value == "") {

			alert("아이디 및 비밀번호를 입력하시오");

			return;

		} else {

			frm.submit();

		}

	}

</script>
<body>
	
<!-- 	<form action="admin_login_action.jsp" name="frm" method="post">

		<table border="1" style="margin: 0 auto">



			<tr><td>관리자 ID : <input type="text" name="admin_id"></td></tr>

			<tr><td>관리자 PW : <input type="password" name="admin_pw"></td></tr>

			<tr>

				<td>
					<input type="submit" value="로그인" onclick="check()">

				</td>

			</tr>


		</table>		
		
	</form> -->



<form action="admin_login_action.jsp" name="frm" method="post">
	  <div class="imgcontainer">
	    <img src="/humanwell/images/facebook_profile_image.png" alt="Avatar" class="avatar">
	  </div>
	
	  <div class="container">
	    <label for="admin_id"><b>관리자 ID</b></label>
	    <input type="text" placeholder="Enter 관리자ID" name="admin_id" required>
	
	    <label for="admin_pw"><b>관리자 PW</b></label>
	    <input type="password" placeholder="Enter 관리자PW" name="admin_pw" required>
	        
	    <button type="submit" onclick="check()">Login</button>
	  </div>
	
</form> 




	
</body>
</html>