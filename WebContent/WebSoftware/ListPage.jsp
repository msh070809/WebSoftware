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
					    	ArrayList<Items> itemlist;
					    	ItemDAO itemDao = new ItemDAO();
					    	itemlist = itemDao.GetItemList();
					    	int suit=20;
					    	int shoes=10;
					    	int glass=30;
					    	int shirt=40;
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
                     <li class = "suit">정장</li> 
                     <li class = "shirt">셔츠</li> 
                     <li class = "pants">바지</li>
                     <li class = "shoes">신발</li>
                     <li class = "glass">안경</li>			             
                </ul>
            </div>
            <div class ="order_name"><h3>정장</h3></div>
            <div class ="body">
                <div class = "main">
                		<%
					    	for(int i = suit; i <(suit+10); i++)
					    	{
					    %>
					    	<ul class ="item_boxs" id=<%=i%>>
					    	    <li><img src = <%=itemlist.get(i).getItemImage() %>></li>
					    		<li class ="a"><%= itemlist.get(i).getItemTitle() %></li>
					    		<li class ="b"><%= itemlist.get(i).getItemPrice() %></li>
					    		<li class ="c"><%= itemlist.get(i).getItemContent() %></li>
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
								$('.suit').on('click',function(event){
									$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.suit').css("font-size","28px");
						        	$('.order_name').html("<h3>정장</h3>");
				             		<%
							    	for(int i = suit; i < 10+suit; i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>+'.item_boxs').append('<li><img src = ./image/dill.png></li>');
										$('#'+<%=i%>).append("<li class ='a'>"+<%=itemlist.get(i).getItemTitle()%>+"</li>");
										$('#'+<%=i%>+'.item_boxs').append('<li class ="b">'+<%=itemlist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="c">'+<%=itemlist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var c = <%=itemlist.get(i).getItemImage()%>
											var params = "Title="+a+"&Price="+b+"&Image="+c;
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
							    	for(int i = 0	; i < 10; i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>+'.item_boxs').append('<li><img src = ./image/dill.png></li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="a">'+<%=itemlist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="b">'+<%=itemlist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="c">'+<%=itemlist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var c = <%=itemlist.get(i).getItemImage()%>
											var params = "Title="+a+"&Price="+b+"&Image="+c;
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

							    	for(int i = shoes; i <(shoes+10); i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>+'.item_boxs').append('<li><img src = ./image/dill.png></li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="a">'+<%= itemlist.get(i).getItemTitle() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="b">'+<%= itemlist.get(i).getItemPrice() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="c">'+<%= itemlist.get(i).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var c = <%=itemlist.get(i).getItemImage()%>
											var params = "Title="+a+"&Price="+b+"&Image="+c;
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								$('.glass').on('click',function(event){
						        	$('.item_boxs').remove();
						        	$('.order>li').css("font-size","20px");
						        	$('.glass').css("font-size","28px");
						        	$('.order_name').html("<h3>안경</h3>");
				             		<%

							    	for(int i =0 ; i <10; i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>+'.item_boxs').append('<li><img src = ./image/dill.png></li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="a">'+<%= itemlist.get(i+glass).getItemTitle() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="b">'+<%= itemlist.get(i+glass).getItemPrice() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="c">'+<%= itemlist.get(i+glass).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var c = <%=itemlist.get(i+glass).getItemImage()%>
											var params = "Title="+a+"&Price="+b+"&Image="+c;
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

							    	for(int i = 0; i < 10; i++){
								    %>
										$('.main').append('<ul class ="item_boxs" id = '+ <%=i%> +'></ul>');
										$('#'+<%=i%>+'.item_boxs').append('<li><img src = ./image/dill.png></li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="a">'+<%= itemlist.get(i+shirt).getItemTitle() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="b">'+<%= itemlist.get(i+shirt).getItemPrice() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').append('<li class ="c">'+<%= itemlist.get(i+shirt).getItemContent() %>+'</li>');
										$('#'+<%=i%>+'.item_boxs').on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var c = <%=itemlist.get(i+shirt).getItemImage()%>
											var params = "Title="+a+"&Price="+b+"&Image="+c;
											location.href="Detailpage.jsp?"+params;									
										});
								    <%
								    	}
								    %>
								});
								<%
						    	for(int i = suit; i <suit+10; i++){
								    %>
										$('#'+<%=i%>).on('click',function(event){
											var a = $(this).find('.a').html();
											var b = $(this).find('.b').html();
											var c = "+<%=itemlist.get(i).getItemImage()%>+";
											var params = "Title="+a+"&Price="+b+"&Image="+c;
											location.href="Detailpage.jsp?"+params;								
										});
								    <%
								    	}
								    %>    
					</script>
    </body>
</html>