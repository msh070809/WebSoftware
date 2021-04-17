<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="user.UserDTO"%> 
 <%@ page import="user.UserDAO"%> 
 <%@ page import="java.io.PrintWriter"%>

<%
//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
request.setCharacterEncoding("UTF-8");
String userName = null;
String userID = null; 
String userPassword = null; 

		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어 있습니다.')");
			script.println("history.href='index.jsp");
			script.println("<script>");
			
		}

if (request.getParameter("userName") != null) { 
	userName = (String) request.getParameter("userName");
	} 
if (request.getParameter("userID") != null){ 
	userID = (String) request.getParameter("userID"); 
	} 
if (request.getParameter("userPassword") != null) { 
	userPassword = (String) request.getParameter("userPassword");
	} 



if (userName == null || userID == null || userPassword == null){ 
	PrintWriter script = response.getWriter(); 
	script.println("<script>"); 
	script.println("alert('잘못된 입력입니다.')"); 
	script.println("</script>"); 
	script.close(); 
	return; 
	} 

UserDAO userDAO = new UserDAO(); 
int result = userDAO.join(userName, userID, userPassword); 
if (result == 1) { 
	PrintWriter script = response.getWriter(); 
	script.println("<script>"); 
	script.println("alert('회원가입에 성공했습니다.')"); 
	script.println("alert('회원가입 선물로 지갑에 10만원이 충전되었습니다.')"); 
	script.println("location.href='index.jsp'"); 
	script.println("</script>"); 
	script.close(); return; 
	} 
%>

