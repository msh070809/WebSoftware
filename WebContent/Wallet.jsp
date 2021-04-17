<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.DatabaseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="Wallet.css">
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
            <div class="intro_bg">
                <div class="header">
                    <ul class ="nav">
                        <li><a href="index.jsp">메인페이지</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                        <li><a href="index.jsp">상품페이지</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                        <li><a href="mmypage.jsp">마이페이지</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                            <%
                            if(userID == null){
                            %>
                        	<li><a href="Login_Register.jsp">로그인</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                            <%
                            } else {
                            %>
                            <li><a href="userLogoutAction.jsp">로그아웃</a></li>
                            <%
                            }
                            %>
                        <li><a href="Find_inform.jsp">아이디&비밀번호 찾기</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                    </ul>
                </div>
                <div>
                    <div class ="intro_text">
                        <h1>지갑 관리</h1>
                    </div>
                </div>
            </div>
            <div class = "main_text0">
             </form>
                <form id="Wallet_charge" action="userWalletAction.jsp" class="input-group">
                    <input type="text" name="Charge" class="input-field" placeholder="충전할 금액을 입력하세요." required>
                    <input type="password" name="userPassword" class="input-field" placeholder="보안을 위해 현재 비밀번호를 입력해 주세요." required>
                    <input type="checkbox" class="checkbox"><span>충전에 동의하십니까?</span>
                    <button class="submit">충전</button>
                </form>           
                <!-- 자바 기능 구현할때 기능 구현 예정 -->
                      <!-- 버튼 눌러 상호작용 -->
                </div>
            </div>
        </div>
</body>
</html>