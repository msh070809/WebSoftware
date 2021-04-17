<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.DatabaseUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<caption>아이디 찾기</caption>
<table width="100%" border="1">
    <thead>
        <tr>
            <th>아이디</th>
        </tr>
    </thead>
    <tbody>
    <%	
   		String userName = null;
    	Connection conn = DatabaseUtil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        if (request.getParameter("userName") != null) { 
        	userName = (String) request.getParameter("userName");
        	} 
        
        try{
            pstmt = conn.prepareStatement("SELECT userID from user WHERE userName=?");
            pstmt.setString(1, userName);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
    %>
        <tr>
            <td><%= rs.getString("userID") %></td>     
        </tr>
    <%
            }
        }catch(SQLException se){
            se.printStackTrace();
        }finally{
            if(rs != null)rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    %>
    </tbody>
</table>
</body>
</html>
