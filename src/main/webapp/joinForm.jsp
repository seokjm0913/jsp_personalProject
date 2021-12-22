<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
 <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <style>
        .container {
            width: 500px;
            margin: 40px auto;
            line-height: 16px;
        }
        h2 {
            text-align: center;
        }
        h2 span {
            color: teal;
        }
        .n {
            font-size: 13px;
        }
        #signup {
            background-color: rgb(255, 80, 90);
            color: white;
            border: 0;
            border-radius: 5px;
            padding: 10px 224px;
        }
        .bottom input {
            background-color: white;
            border: 0;
            color: teal;
            font-size: 16px;
        }
        i {
            color: lightgray;
        }

        input {
            border: 1px solid lightgray;
            border-radius: 3px;
        }
    </style>
</head>
<body>
	<div class="container">

        <h2><span>회원 가입</span> 하이소~</h2>
        <hr><br>
        <form action="joinInsertController" method="post"  onsubmit="return inputCheckFunc()">
            <input type="text" placeholder="아이디" name="mem_id" required style="height:30px; width: 495px">
            <br><br>
            <input type="password" placeholder="비밀번호" name="mem_password"  required style="height:30px; width: 495px">
            <br><br>
            <input type="email" placeholder="이메일 주소" name="email" required style="height:30px; width: 495px">
            <br><br>
            <input type="text" placeholder="이름" name="name" required style="height:30px; width: 495px">
            <br><br>
            <input type="submit" value="가입하기" id="signup"><br><br>
            </p>
        </form>
        <hr>
    </div>
    
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