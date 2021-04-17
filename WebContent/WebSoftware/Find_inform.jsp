
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Find_inform.css">
         <title>아이디 / 비밀번호 찾기</title>
</head>
<body>
 <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">아이디찾기</button>
                    <button type="button" class="togglebtn" onclick="register()">비빌번호 찾기</button>
                </div>
                <div class="social-icons">
                    <img src="myimage/로그인.svg">
                    <img src="myimage/회원가입.svg">
                </div>
                <form id="login" action="userFind_ID_Action.jsp" class="input-group">
                    <input type="text" name="userName" class="input-field" placeholder="이름을 입력하세요." required>
                    <button class="submit">아이디 찾기</button>
              
                </form>
                <form id="register" action="userFind_PW_Action.jsp" class="input-group">
                    <input type="text" name="userName" class="input-field" placeholder="이름을 입력하세요." required>
                    <input type="email" name="userID" class="input-field" placeholder="이메일을 입력하세요." required>
                    <button class="submit">비밀번호 찾기</button>
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
</body>
</html>