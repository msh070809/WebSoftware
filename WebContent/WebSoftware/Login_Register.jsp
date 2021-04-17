<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Login_Register.css">
         <title>로그인 /회원가입</title>
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
                    <img src="myimage/로그인.svg">
                    <img src="myimage/회원가입.svg">
                </div>
                <form id="login" action="userLoginAction.jsp" class="input-group">
                    <input type="text" name="userID" class="input-field" placeholder="이메일 입력" required>
                    <input type="password" name="userPassword" class="input-field" placeholder="비밀번호 입력" required>
                    <input type="checkbox" class="checkbox"><span>로그인 유지</span>
                    <button class="submit">로그인</button>
                    <!-- mysql db를 통해 정보관리 -->
                </form>
                <form id="register" action="userRegisterAction.jsp" class="input-group">
                    <input type="text" name="userName" class="input-field" placeholder="이름을 입력하세요." required>
                    <input type="email" name="userID" class="input-field" placeholder="이메일을 입력하세요." required>
                    <input type="password" name="userPassword" class="input-field" placeholder="비밀번호를 입력하세요." required>
                    <input type="checkbox" class="checkbox"><span>정보 제공에 동의하십니까?</span>
                    <button class="submit">회원가입</button>
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