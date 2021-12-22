<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/회원가입</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<style type="text/css">
	* {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.wrap {
    height: 100%;
    width: 100%;
    background-image: url(img/background.jpg);
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 380px;
    height: 480px;
    position: relative;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
}
.button-wrap {
    width: 230px;
    margin: 35px auto;
    position: relative;
    box-shadow: 0 0 600px 9px #fcae8f;
    border-radius: 30px;
}
.togglebtn {
    padding: 10px 30px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    top: 0;
    left: 0;
    position: absolute;
    width: 110px;
    height: 100%;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border-radius: 30px;
    transition: .5s;
}
.social-icons {
    margin: 30px auto;
    text-align: center;
    font-size: 50px;
    color: #F44336;
}

.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.submit {
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border: 0;
    outline: none;
    border-radius: 30px;
}

#login {
    left: 50px;
}
#register {
    left: 450px;
} 
</style>

<!-- favicon.ico 파비콘-->  
<link rel="shortcut icon" href="/humanwell/favicon.ico" type="image/x-icon">
<link rel="icon" href="/humanwell/favicon.ico" type="image/x-icon"> 
</head>
<body>

		
		
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">로그인</button>
                    <button type="button" class="togglebtn" onclick="register()">회원가입</button>
                </div>
                <div class="social-icons">
                    <i class="fab fa-facebook-square"></i>
                    <a href="https://www.instagram.com/?hl=ko"><i class="fab fa-instagram"></i></a>
                    <i class="fab fa-google"></i>
                </div>
                
                
               <!--  로그인 -->
                <form id="login" action="loginCheckController" method="post" class="input-group">
                    <input type="text" name="mem_id" class="input-field" placeholder="아이디" required>
                    <input type="password" name="mem_password" class="input-field" placeholder="비밀번호" required>
               
                    <input type="submit" value="LOGIN" class="submit">
                </form>
                
                <!-- 회원가입 Ajax + script처리 -->
                <form name="fr" id="register" action="joinInsertController" method="post" class="input-group">                    
                    	<input type="text" class="input-field" placeholder="아이디" name="mem_id" id="mem_id" required >
                    	<input type="button" value="ID 중복확인" id="idCheck" class="dup">                    
                        <div id="idch"></div>	
                    <input type="password" class="input-field" placeholder="비밀번호" name="mem_password"  required >     
                    <input type="text" class="input-field" placeholder="이름" name="name" required>
                    <input type="email" class="input-field" placeholder="이메일 주소" name="email" required >
        			<button class="submit">SIGN UP</button>
                </form>
            </div>
        </div>
        
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");

            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
                
             
            }
            
     
        </script>
	
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">
   $(function(){
      
      $("#idCheck").click(function(){

    /* .val()은 양식(form)의 값을 가져오거나 값을 설정하는 메소드입니다. */
   /*  ajax 객체를 이용하여 비동기통신을 진행하는데 url과 data를 결합하여 querystring 형식의 post 방식으로 데이터를 해당 URL로 매핑된 Controller 메소드에 전달해서 통신이 성공적으로 이루어졌을때 success에는 함수를 동작하면서 출력  */
         var mem_id = $("#mem_id").val();
         
         $.ajax({
            url : "IdCheckController",     /* 요청할 서버 */
            type : "POST",                 /* 타입 */
            data : {mem_id:mem_id},		  
            success : function (data) {     // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
               
               if(data == 1){
                  $("#idch").text("중복된 아이디 입니다.")
                  .css({"color":"red"});
               }else if(data == 2){
                  $("#idch").text("아이디를 입력해 주세요.")
                  .css({"color":"red"});
               }else if(data == 0){
                  $("#idch").text("입력 가능한 아이디 입니다.")
                        .css({"color":"blue"});
               }
            },
            error : function(request, status, error){
               alert("에러");
               alert("code:"+request.status);
            }
            
         })
         
      })
      
   });
</script>



</body>
</html>