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
int result = userDAO.Edit(userName, userID, userPassword); 

if (result == 1)
{
	   out.println("<script>alert('비밀번호 변경이 완료되었습니다.');</script>");	
       out.println("<script>location.href='Mypage.jsp'</script>");
}

%>
