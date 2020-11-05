<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="../main/main.do"><img src="../assets/img/main/zexen.png" alt="zexen" height="35px">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto" style="margin-left:50px !important;">
              <li class="nav-item"><a class="nav-link" href="../game/main.do">게임</a></li>
              <li class="nav-item"><a class="nav-link" href="../computer/main.do">컴퓨터</a></li>
              <li class="nav-item"><a class="nav-link" href="../board/main.do">커뮤니티</a></li>    
              <li class="nav-item"><a class="nav-link" href="../news/main.do">뉴스</a></li>                    
             
            </ul>

            <ul class="nav-shop">
<!--               <li class="nav-item"><button><i class="ti-search"></i></button></li> -->
			<c:if test="${sessionScope.id!=null }">
              <li class="nav-item"><button><a href="../member/basket.do"><i class="ti-shopping-cart" style="color: #9E01F9"></i></a><span class="nav-shop__circle"></span></button></li>
              <li class="nav-item"><button><a href="../member/wish.do" ><i class="ti-heart" style="font-size: 14px; color: #9E01F9;" ></i></a><span class="nav-shop__circle"></span></button></li>
            </c:if>
            </ul>
              
            <ul class="nav_menu_s">
            
            <c:if test="${sessionScope.id==null }">
              <li class=""><a class="button button-header" href="../member/login.do">로그인</a></li>
            </c:if>
            <c:if test="${sessionScope.id!=null }">
               ${sessionScope.name }(${sessionScope.admin=='y'?'관리자':'일반유저' })
              <li class=""><a class="button button-header" href="../member/logout.do">로그아웃</a></li>                 
            </c:if>
            <c:if test="${sessionScope.id==null }">
               <li class=""><a class="" href="../member/join.do">회원가입</a></li>
            </c:if>
              <c:if test="${ sessionScope.id!=null}">
			      <c:if test="${ sessionScope.admin=='n'}">
		            <li><a href="../member/mypage.do">마이페이지</a></li>
		      </c:if>
		      <c:if test="${ sessionScope.admin=='y'}">
		            <li><a href="#">관리페이지</a></li>	
		      </c:if>
		      </c:if>
              <li class=""><a class="" href="#">고객센터</a></li>
            </ul>  
          </div>
        </div>
      </nav>
    </div>
  </header>
</body>
</html>