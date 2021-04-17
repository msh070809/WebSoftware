<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Login_Register.css">
         <title>비밀번호 수정</title>
</head>
<body>
<%
	//로그인 한 사람은 회원가입 페이지에 접근할 수 없도록 만듬.
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 기능입니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}
%>
    
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                   <h1>비밀번호 수정</h1>
                </div>
                <div class="social-icons">
                </div>
                <form id="login" action="userEditAction.jsp" class="input-group">
                	<input type="text" name="userName" class="input-field" placeholder="확인을 위해 현재 이름을 입력하세요." required>
                    <input type="email" name="userID" class="input-field" placeholder="확인을 위해 현재 이메일을 입력하세요." required>
                    <input type="password" name="userPassword" class="input-field" placeholder="수정할 비밀번호를 입력하세요." required>
                    <input type="checkbox" class="checkbox"><span>확실하십니까?</span>
                    <button class="submit">정보 수정</button>
                </form>
            </div>
        </div>
</body>
</html>