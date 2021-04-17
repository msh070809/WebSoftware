<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="Mypage.css">
        <script src="lib/jquery-3.6.0.min.js"></script>
</head>
<body>

<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
%>

<div class="wrap">
            <div class="intro_bg">
                <div class="header">
                    <ul class ="nav">
                        <li><a href="./Main.html">메인페이지</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                        <li><a href="./ListPage.jsp">상품페이지</a></li>
                            <!-- 클릭시 해당 페이지로 이동 -->
                        <li><a href="index.jsp">마이페이지</a></li>
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
                        <h1>마이페이지</h1>
                    </div>
                </div>
            </div>
     
            <div class = "main_text0">
                <ul class = "icons">
                    <li class = "Purchaselist">
                        <div class ="icon_img">
                            <a href="Purchaselist.jsp"><img src ="myimage/구매.svg"></a>
                            <div class = "contents1_bold">구매내역</div>
                            <!-- 클릭시 구매내역 페이지로 이동 -->
                        </div>
                    </li>
                    <li class="cartlist">
                        <div class ="icon_img">
                            <a href="ShoppingCartList.jsp"><img src ="myimage/장바구니.svg"></a>
                            <div class = "contents1_bold">장바구니</div>
                            <!-- 클릭시 장바구니 페이지로 이동 -->
                        </div>
                    </li>
                    <li class = "wallet">
                        <div class ="icon_img">
                            <a href="Wallet.jsp"><img src ="myimage/지갑.svg"></a>
                            <div class = "contents1_bold">지갑관리</div>
                            <!-- 클릭시 지갑 관리 페이지로 이동 -->
                        </div>
                    </li>
                    <li class= "info">
                        <div class ="icon_img">
                            <a href="Edit_Inform.jsp"><img src ="myimage/회원정보.svg"></a>
                            <div class = "contents1_bold">회원정보 수정</div> 
                                <!-- 클릭시 회원 정보 페이지로 이동 -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</body>
</html>