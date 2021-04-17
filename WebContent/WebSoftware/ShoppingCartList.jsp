<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	/* 헤더 부분과 겹쳐 나오게 않도록 바디부분을 띄우고 시작*/
	body{
	}
	
	/* 헤더부분이 배경이미지, 텍스트 사이즈 설정*/
	header{
		float: left;
		font-size: 150%;
		width: 100%;
		height: 300px;
		text-align: center;
		line-height: 250px;
		/* 헤더 배경이미지 관련. 이미지가 반복되지 않고 꽉차게 나오도록 설정 */
		background-image:url('./mainimage/wallpaper.jpg');
		background-repeat : no-repeat;
		background-size : cover ;
	}
	
	/* 하이퍼링크 텍스트의 밑줄, 색상 등등을 모두 제거. 일반 텍스트처럼 보이게한다 */
	a{ 
		text-decoration:none
	}
	
	a:link{
  		color : linear-gradient(-135deg, #E4A972, #9941D8) fixed;
	}
	
	a:visited{
  		color : linear-gradient(-135deg, #E4A972, #9941D8) fixed;
  	}
  	
  	nav{
  	height: 50px;
  	line-height: 55px;
	text-align: center;
	margin: auto;
	margin-bottom: 50px;
	background: linear-gradient(-135deg, #E4A972, #9941D8) fixed;
	width: 1100px;
  	border-radius: 10px;
	}
	
	nav ul li {
		display:inline;
		font:bold 24px Dotum;
		padding:0 10px;
	}

	/* 양옆에 마진값 줘서 가운데서 보이도록설정 */
	article{
		margin-left: 100px;
		margin-right: 100px;
	}
	
	table{
		background-color:white;
		border: 1px solid #444444;
		height: 50px;
		width: 80%;
		text-align: center;
		margin: auto;
	}
	
	tr, th {
    	border: 1px solid #444444;
    }
		
	section{
		text-align: center;
	}
	
	#footer{
		border-top: 1px solid #444;
   		text-align: center;
   		position: relative;
   		background: linear-gradient(-135deg, #E4A972, #9941D8) fixed;
	}
	
	#footer_context>h3{
    	margin: 10px;
    	color: white;
	}
	#footer_context>ul>li{
	    margin: 10px;
	    list-style:none;
	    color: white;
	}
	
	#blank{
			color: rgba(0,0,0,0);
	}
	</style>
</head>

<body bgcolor = "#fdfbfb">	

	<header>
		<a href="Main.html"><h1>CLOTHES CINEMA</h1></a>	<!-- 해당문고 클릭시 메인페이지로 이동-->
	</header>
	
	<section id="blank">
		<h1>이 공간은 공백입니다</h1>
	</section>

	<nav>
		<ul>
			<li><a href="Main.html">|&nbsp;HOME&nbsp;|</a></li>
			<li><a href="로그인&회원가입.html">|&nbsp;SIGN IN&nbsp;|</a></li>
			<li><a href="마이페이지.html">|&nbsp;MYPAGE&nbsp;|</a></li>
			<li><a href="Shoppinlist.jsp">|&nbsp;SHOPPING LIST&nbsp;|</a></li>
		</ul>
	</nav>
	
	<section>
		<h2>Your Shopping cart</h2>
	</section>
	
	<section>
		<table width = "100%" border = "1">
 		<tr>
            <td>상품이름</td>
            <td>가격</td>
            <td>수량</td>
            <td>삭제</td>
            <td>구매</td>
            </tr>
	</section>
            
      <%		
      Class.forName("com.mysql.jdbc.Driver");
	   
      String dbURL = "jdbc:mysql://localhost:3306/websoftware?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
      String dbID = "root";
      String dbPassword = "moon5130$";
		
      Connection conn = null;
      ResultSet rs = null;
      Statement stmt = null;
      PreparedStatement pstmt = null;
      
      try
      {
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
  
            stmt = conn.createStatement();
   
            String query = "select * from wkdqkrnsl";
            
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
   
            while(rs.next())
            {
 		%>  
 	 		<tr>
	            <td><%= rs.getString("name") %></td>
	            <td><%= rs.getString("price") %></td>
	            <td><%= rs.getString("quantity") %></td>
	            <td><input type="button" value="X" onClick="location.href='delete.jsp?send_name=<%=rs.getString("name")%>'"></input></td>
	            <td><input type = "button" value= "구매" onClick="location.href='Addpurchaselist.jsp?ItemTitle='+<%=rs.getString("name")%>+'&ItemPrice='+<%=rs.getString("price")%>+'&ItemQuan='+<%=rs.getString("quantity")%>"></input></td>
      	 	</tr>
      <%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
	%>
      </table>

	<section id="blank">
		<h1>이 공간은 공백입니다</h1>
	</section>
</body>

<footer>
 	<section id = "footer">
 		<section id = "footer_context">
 			<h3>쇼핑몰 회사(주)</h3>
                        <ul>
                            <li>사업자 등록번호 12345</li>
                            <li>대표이사 홍길동 | 경기도 용인시 수지구 정평로 12345</li>
                            <li>전화 1234-1234</li>
                        </ul>
 		</section>
 	</section>
</footer>
</html>