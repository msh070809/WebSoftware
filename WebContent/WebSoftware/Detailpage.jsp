<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "itemlist.ItemDAO" %>
<%@ page import = "itemlist.Items" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<jsp:useBean id="Items" class="itemlist.Items" scope="session"/>
<jsp:setProperty name="Items" property="itemTitle"/>
<jsp:setProperty name="Items" property="itemPrice"/>


<!doctype html>
<html lang="ko">
    <head>
        <!--구글 폰트가져오기-->
         <script src="lib/jquery-3.6.0.min.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com"> 
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans+Condensed:wght@300&display=swap" rel="stylesheet">
        <!--css연동-->
        <link rel="stylesheet" type="text/css" href="Detailpage.css">
        <meta charset="UTF-8">
        <%
        	request.setCharacterEncoding("UTF-8");
        	response.setContentType("text/html; charset=UTF-8");
        	String Title = request.getParameter("Title");
        	String Price = request.getParameter("Price");
        	String Image = request.getParameter("Image");
        %>
    </head>
    <body>
        <div class = "wrap">
            <div class = "intro_bg">
                <div class = "header">
                    <div class = "searchArea">
                        <form class ="search"><!--form 구현해야됨-->
                            <input class = "SearchWord" type="text"  name="search" maxlength="255" placeholder="상품 품목 검색" onfocus="this.placeholder=''" onblur="this.placeholder='상품 품목 검색'" autocomplete="off" >
                            <button class = "search_button" type="submit" name="click" value="">
                                검색 <!-- 마우스 텍스트 위에 올라가면 색상변경 누르면 해당 내용 이동 -->
                                <i class ="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                    <!-- 마우스 텍스트 위에 올라가면 색상변경 누르면 해당 내용 이동 -->
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
                    <li><a href="http://localhost:8081/WebSoftware/WebSoftware/ListPage.jsp" >전체상품</a></li>
                    <li><a href="#">장바구니</a></li>
                </ul>
            </div>
            <div class ="body">
                <div class="main">
                    <div class = "picture_box">
                    </div>
                    <div class ="detail_box">
                        <div class = "item_name"><h2></h2></div>
                        <div class = "item_price"><h6>단일가</h6>원</div><!--수량에 따라 가격변동-->
                        <ul class = "item_composition">
                            <li class = "list">
                                <div class = "dd">판매단위</div>
                                <div class = "dl1">1벌</div>
                            </li>
                            <li class = "list">
                                <div class = "dd">중량/용량</div>
                                <div class = "dl2">1.5kg</div>
                            </li>
                            <li class = "list">
                                <div class = "dd">배송수단</div>
                                <div class = "dl3">택배배송</div>
                            </li>
                            <li class = "list">
                                <div class = "dd">안내사항</div>
                                <div class = "dl4">반품,환불시 영수증을 지참하셔야 합니다.</div>
                            </li>
                            <li class = "list">
                                <div class = "dd">구매수량</div>
                                <div class = "dl">
                                    <div class ="num">
                                        <button class ="minor">-</button>
                                        <!-- 버튼에 이미지+ - 넣고 스크립트로 버튼 누르면 숫자 변경되게 가운데 수정하고 숫자에 따라 총 금액 변동 -->
                                        <div class = "count">1</div>
                                        <button class ="plus">+</button>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class = "price">
                                    <div class = "p">총금액:</div>
                                    <div class="total_price">9900</div>
                                    <div class = "t">원</div>
                                </div>
                            </li>
                        </ul>
                        <div class = "decision">
                            <div class ="cover">
                                <button class = "shopping_cart">장바구니</button>
                                <button class = "last_purchase">구매하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ItemNav">
                    <ul class ="ItemView_nav"> 
                        <li>상품영상</li>   <!--상품영상 크롤링해서 db에서 꺼내올건지 -->
                    </ul>
                </div>
                <!-- 버튼에 따라 내용 출력 -->
                <div class = "ItemView">

                </div>
            </div>            
            <div class ="footer" >
                <div class = "footer_context">
                    <h3>
                         쇼핑몰 회사(주)
                    </h3>
                    <ul>
                        <li><a href="https://icons8.com/icon/87261/google-웹-검색">Google 웹 검색 icon by Icons8</a></li><!--무료 아이콘 사이트-->
                        <li>사업자 등록번호 12345</li>
                        <li>대표이사 홍길동 | 경기도 용인시 수지구 정평로 12345</li>
                        <li>전화 1234-1234</li>
                    </ul>
                </div>
            </div>   
        </div>
     <script>
     function getParam(sname) {
    	    var params = location.search.substr(location.search.indexOf("?") + 1);
    	    var sval = "";
    	    params = params.split("&");
    	    for (var i = 0; i < params.length; i++) {
    	        temp = params[i].split("=");
    	        if ([temp[0]] == sname) { sval = temp[1]; }
    	    }
    	    return sval;
    	}
     var Title=getParam("Title");
     var Price=getParam("Price");
     Price*=1;
     var Image=getParam("Image");
    $(".item_name").find('h2').html(Title);
    $(".item_price").html("<h6>단일가</h6>"+Price+"원");
    $(".total_price").html("<h6>단일가</h6>"+Price+"원");
   	$(".picture_box").append('<img src ='+Image+'>');
    $(".shopping_cart").on('click',function(event){
    });
    $(".plus").on('click',function(event){
    	var i = $('.count').html();
    	var TotalPrice=Price;
    	i++;
    	$('.count').html(i);
    	TotalPrice=i*Price;
    	$(".total_price").html(TotalPrice);
    });
    $(".minor").on('click',function(event){
    	var i = $('.count').html();
    	var TotalPrice=Price;
    	if(i>1)
    	{
    		i--;
    		TotalPrice=i*Price;
    	}
    	$('.count').html(i);
    	$(".total_price").html(TotalPrice);
    });

    $(".shopping_cart").on('click',function(event){
    	var quantity=$('.count').html();
    	var ItemTitle=$(".item_name").find('h2').html();
    	var TotalPrice=Price*quantity;
    	location.href="insert.jsp?name="+ItemTitle+"&price="+TotalPrice+"&quantity="+quantity;
    });
    $(".last_purchase").on('click',function(event){
    	var quantity=$('.count').html();
    	var ItemTitle=$(".item_name").find('h2').html();
    	var TotalPrice=Price*quantity;
    	var params=ItemTitle+"&ItemPrice="+TotalPrice+"&ItemQuan="+quantity;
    	location.href="AddPurchase.jsp?ItemTitle="+ItemTitle+"&ItemPrice="+TotalPrice+"&ItemQuan="+quantity;
    });
    </script>
    </body>
</html>