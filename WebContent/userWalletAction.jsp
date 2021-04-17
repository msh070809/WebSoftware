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
<title>지갑충전</title>
</head>
<body>
<caption>지갑충전</caption>
<table width="100%" border="1">
    <thead>
        <tr>
            <th>충전이 완료되었습니다.</th>
        </tr>
    </thead>
    <tbody>
    <%	
    String userPassword = null;
	Connection conn = DatabaseUtil.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int check = 0;
    if (request.getParameter("userPassword") != null) { 
    	userPassword = (String) request.getParameter("userPassword");
    	} 
	
    int Charge = Integer.parseInt(request.getParameter("Charge"));
    
        
        try{
            pstmt = conn.prepareStatement("update user set userWallet = userWallet + ? where userPassword = ?");
            pstmt.setInt(1,Charge);
            pstmt.setString(2,userPassword);
            int result = pstmt.executeUpdate();
            
            check++;
  
        }catch(SQLException se){
            se.printStackTrace();
        }finally{
            if(rs != null)rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
        if(check == 1)
        {
         out.println("<script>alert('충전을 성공했습니다');</script>");	
         out.println("<script>location.href='Mypage.jsp'</script>");
        }
        else
        {
        	out.println("<script>alert('잘못된 비밀번호입니다.');</script>");	
            out.println("<script>location.href='Wallet.jsp'</script>");
        }
    %>
    </tbody>
</table>
</body>
</html>
