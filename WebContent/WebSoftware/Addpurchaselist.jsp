<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import= "java.sql.DriverManager"%>
<%@ page import= "java.sql.PreparedStatement"%>
<%@ page import= "java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
	Connection conn;
	PreparedStatement ps;
   	int rs;
	request.setCharacterEncoding("UTF-8");
	String ItemTitle = request.getParameter("ItemTitle");
	String ItemPrice = request.getParameter("ItemPrice");
	String ItemQuan = request.getParameter("ItemQuan");
    try {
		String dbURL = "jdbc:mysql://localhost:3306/websoftware?characterEncoding=UTF-8&severTimezone=UTC&useSSL=false";
		String dbID="root";
		String dbPassword = "rpg153153";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		String SQL = "INSERT INTO buylist VALUES (?, ?, ?)";
		ps = conn.prepareStatement(SQL);
		ps.setString(1, ItemTitle);
		ps.setString(2, ItemPrice);
		ps.setString(3, ItemQuan);
		rs = ps.executeUpdate();
	}catch(SQLException e) {
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>