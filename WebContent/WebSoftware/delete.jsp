<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String send_name = request.getParameter("send_name");
request.setCharacterEncoding("utf-8");
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
try{
	String dbURL = "jdbc:mysql://localhost:3306/websoftware?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
    String dbID = "root";
    String dbPassword = "tmddnr009";
    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
    pstmt = conn.prepareStatement("delete from wkdqkrnsl where name=?");
    pstmt.setString(1, send_name);
    pstmt.executeUpdate();
}finally{
	if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}
response.sendRedirect("Shoppinlist.jsp");
%>
</body>
</html>