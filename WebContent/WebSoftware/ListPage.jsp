<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "itemlist.ItemDAO" %>
<%@ page import = "itemlist.Items" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
 <!doctype html>
<html lang="ko">
    <head>
    	<script src="lib/jquery-3.6.0.min.js"></script>
        <!--구글 폰트가져오기-->
        <link rel="preconnect" href="https://fonts.gstatic.com"> 
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
        <!--css연동-->
        <link rel="stylesheet" type="text/css" href="Listpage.css">
        <meta charset="UTF-8">
    </head>
    <body>
        				<%
					    	ArrayList<Items> caplist = new ArrayList<Items>();
					    	ArrayList<Items> gloveslist = new ArrayList<Items>();
					    	ArrayList<Items> shoeslist = new ArrayList<Items>();
					    	ArrayList<Items> shirtlist = new ArrayList<Items>();
					    	ArrayList<Items> pantslist = new ArrayList<Items>();
					    	ItemDAO itemDao = new ItemDAO();
					    	caplist = itemDao.GetCapList();
					    	shirtlist = itemDao.GetShirtList();
					    	shoeslist = itemDao.GetShoesList();
					    	gloveslist = itemDao.GetGlovesList();
					    	pantslist = itemDao.GetPantsList();
					   	%>
        <div class = "wrap">
            <div class = "intro_bg">
                <div class = "header">
                    <div class = "searchArea">
                        <form class ="search" method="post" action = "SearchItem.jsp">
                            <input class = "SearchWord" type="text"  name="searchItem" maxlength="255" placeholder="상품 품목 검색" onfocus="this.placeholder=''" onblur="this.placeholder='상품 품목 검색'" autocomplete="off" >
                            <button class = "search_button" type="submit" name="click" value="">
                                검색
                                <i class ="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                    <ul class = "nav">
                        <li><a href="./Main.html">HOME</a></li> <!--미구현:페이지 이동 기능-->
                        <li><a href="./Login_Register">SIGN IN</a></li><!--미구현:페이지 이동 기능-->
                        <li><a href="./Mypage">MYPAGE</a></li><!--미구현:페이지 이동 기능-->
                    </ul>
                </div>
                <div class=intro_text>
                    <h1>
                        Cloth Cinema
                    </h1>
                </div>
            </div>
            <div class ="order_bar">
              	<ul class = order>
                     <li class = "cap">모자</li> 
                     <li class = "shirt">셔츠</li> 
                     <li class = "pants">바지</li>
                     <li class = "shoes">신발</li>
                     <li class = "gloves">장갑</li>			             
                </ul>
            </div>
            <div class ="order_name"><h3>모자</h3></div>
            <div class ="body">
                <div class = "main">
                		<%

					    	for(int i = 0; i < caplist.size(); i++){
					    %>
					    	<ul class ="item_boxs" id=<%=i %>>
	                          <li><img src ="image/dill.png"></li>
	                          <li class ="a"><%= caplist.get(i).getItemTitle() %></li>
	                          <li class ="b"><%= caplist.get(i).getItemPrice() %></li>
	                          <li class ="c"><%= caplist.get(i).getItemContent() %></li>
                  			</ul>
					    <%
					    	}
					    %>
                </div>
          </div>
             </div>
                <div class ="footer" >
                    <div class = "footer_context">
                        <h3>
                             쇼핑몰 회사(주)
                        </h3>
                        <ul>
                            <li><a href="https://icons8.com/icon/87261/google-웹-검색">Google 웹 검색 icon by Icons8</a></li>
                            <li>사업자 등록번호 12345</li>
                            <li>대표이사 홍길동 | 경기도 용인시 수지구 정평로 12345</li>
                            <li>전화 1234-1234</li>
                        </ul>
                    </div>
                </div>   
                    <script >
								$('.cap').on('click',function(event){
						        	$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.cap').css("font-size","28px");
						        	$('.order_name').html("<h3>모자</h3>");
				             		<%
							    	for(int i = 0; i < caplist.size(); i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>).append('<li><img src ="image/dill.png"></li>');
										$('#'+<%=i%>).append('<li class ="a">'+<%= caplist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="b">'+<%= caplist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="c">'+<%= caplist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var params = "Title="+a+"&Price="+b+"&Image="+"image/dill.png";
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								$('.pants').on('click',function(event){
						        	$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.pants').css("font-size","28px");
						        	$('.order_name').html("<h3>바지</h3>");
				             		<%
							    	for(int i = 0	; i < pantslist.size(); i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>).append('<li><img src ="image/dill.png"></li>');
										$('#'+<%=i%>).append('<li class ="a">'+<%=pantslist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="b">'+<%=pantslist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="c">'+<%=pantslist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var params = "Title="+a+"&Price="+b+"&Image="+"image/dill.png";
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								$('.shoes').on('click',function(event){
						        	$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.shoes').css("font-size","28px");
						        	$('.order_name').html("<h3>신발</h3>");
				             		<%

							    	for(int i = 0; i < shoeslist.size(); i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>).append('<li><img src ="image/dill.png"></li>');
										$('#'+<%=i%>).append('<li class ="a">'+<%= shoeslist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="b">'+<%= shoeslist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="c">'+<%= shoeslist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var params = "Title="+a+"&Price="+b+"&Image="+"image/dill.png";
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								$('.gloves').on('click',function(event){
						        	$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.gloves').css("font-size","28px");
						        	$('.order_name').html("<h3>장갑</h3>");
				             		<%

							    	for(int i = 0; i < gloveslist.size(); i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>).append('<li><img src ="image/dill.png"></li>');
										$('#'+<%=i%>).append('<li class ="a">'+<%= gloveslist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="b">'+<%= gloveslist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="c">'+<%= gloveslist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var params = "Title="+a+"&Price="+b+"&Image="+"image/dill.png";
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								$('.shirt').on('click',function(event){
						        	$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.shirt').css("font-size","28px");
						        	$('.order_name').html("<h3>셔츠</h3>");
				             		<%

							    	for(int i = 0; i < shirtlist.size(); i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>).append('<li><img src ="image/dill.png"></li>');
										$('#'+<%=i%>).append('<li class ="a">'+<%= shirtlist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="b">'+<%= shirtlist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>).append('<li class ="c">'+<%= shirtlist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var params = "Title="+a+"&Price="+b+"&Image="+"image/dill.png";
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								<%
						    	for(int i = 0; i < caplist.size(); i++){
								    %>
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var params = "Title="+a+"&Price="+b+"&Image="+"image/dill.png";
											location.href="Detailpage.jsp?"+params;								
										});
								    <%
								    	}
								    %>    
					</script>
					
    </body>
</html>