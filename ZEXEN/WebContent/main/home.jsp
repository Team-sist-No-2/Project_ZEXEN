<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container123 {
  display: flex;
  width: 100%;
/*   padding: 4% 2%; */
  box-sizing: border-box;
  height: 85vh;
}

.box123 {
  flex: 1;
  overflow: hidden;
  transition: .5s;
  margin: 0;
  box-shadow: 0 20px 30px rgba(0,0,0,.1);
  line-height: 0;
}

.box123 > img {
  width: 200%;
  height: calc(100%);
  object-fit: cover; 
  transition: .5s;
}

.box123 > span {
  font-size: 3.8vh;
  display: block;
  text-align: center;
  height: 10vh;
  line-height: 2.6;
}

.box123:hover { flex: 1 1 50%; }
.box123:hover > img {
  width: 100%;
  height: 100%;
}

.gradtext {
    background: #55ffaa;
    background: -webkit-linear-gradient(left, #9E01F9, #55ffff);
    background:    -moz-linear-gradient(right, #9E01F9, #55ffff);
    background:      -o-linear-gradient(right, #9E01F9, #55ffff);
    background:         linear-gradient(to right, #9E01F9, #55ffff);
    -webkit-background-clip: text;
            background-clip: text;
    color: transparent;
    font-size: 48px;
    font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style media="screen">
  *{
  	margin: 0; padding: 0;
  	}
  	.slide{
  		width: 1072px;
        height: 310px;
        overflow: hidden;
        position: relative;
        margin: 0 auto;
    }
    .slide ul{
    	width: 5000px;
        position: absolute;
        top:0;
        left:0;
        font-size: 0;
    }
    .slide ul li{
    	display: inline-block;
    }
    #back{
    	position: absolute;
        top: 150px;
        left: 0;
        cursor: pointer;
        z-index: 1;
    }
    #next{
    	position: absolute;
        top: 150px;
        right: 0;
        cursor: pointer;
        z-index: 1;
    }
</style>
</head>
<body>

<main class="site-main">
    <div class="container123">
 <c:forEach items="${glist }" var="vo" begin="0" end="3">
  <div class="box123">
    <img src="${vo.gimg }">
  </div>
  </c:forEach>
  
</div>
<h4 style="text-align: center;"><span class="gradtext" >Best game Top 10</span></h4>
    <!--================ Hero Carousel start =================-->
    <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
       <c:forEach items="${gglist }" var="vo">
        <div class="hero-carousel__slide">
          <img src="${vo.list_poster }" alt="" class="img-fluid">
          <a href="../game/detail_before.do?game_no=${vo.game_no}" class="hero-carousel__slideOverlay">
            <h3>${vo.name }</h3>
            <p>좋아요 : <fmt:formatNumber value="${vo.like_cnt }" pattern="#,###"/> 개</p>  
          </a>
        </div>
       </c:forEach> 
      </div>
    </section>
    <!--================ Hero Carousel end =================-->



    <!-- ================ offer section start ================= --> 
    <!-- <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px"> -->
	  <div class="container">
	    <div class="slide">
          <img id="back" src="img/next.png" alt="" width="50">
          <ul>
    	    <li><img src="http://img.danawa.com/shop/shop_main/mainDisplay/868/013/13868_42.jpg" alt="" width="1072" height="310"></li>
    	    <li><img src="http://img.danawa.com/shop/shop_main/mainDisplay/979/014/14979_42.jpg" alt="" width="1072" height="310"></li>
    	    <li><img src="http://img.danawa.com/shop/shop_main/mainDisplay/799/013/13799_42.jpg" alt="" width="1072" height="310"></li>
    	    <li><img src="http://img.danawa.com/shop/shop_main/mainDisplay/463/014/14463_42.jpg" alt="" width="1072" height="310"></li>
   		  </ul>
    	  <img id="next" src="img/back.png" alt="" width="50">
    	</div>
   	  </div>
    <!-- </section> -->
    <!-- ================ offer section end ================= --> 

    <!-- ================ Best Selling item  carousel ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-30px">
          <h2>Best <span class="section-intro__style">Sellers</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          
          <c:forEach items="${clist }" var="vo" begin="1" end="10">	
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="${vo.image }" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p>Accessories</p>
              <h6 class="card-product__title"><a href="../computer/detail_before.do?com_no=${vo.com_no}">${vo.product }</a></h6>
              ₩<fmt:formatNumber value="${vo.cost }" pattern="#,###"/> 
            </div>
          </div>
          </c:forEach>
          
        </div>
      </div>
    </section>
    <!-- ================ Best Selling item  carousel end ================= --> 

    <!-- ================ Blog section start ================= -->  
    <section class="blog">
      <div class="container">
        <div class="section-intro pb-30px">
          <h2>Latest <span class="section-intro__style">News</span></h2>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="../assets/img/blog/blog1.png" alt="">
              </div>
              <div class="card-body">
                <h4 class="card-blog__title"><a href="single-blog.html">The Richland Center Shooping News and weekly shooper</a></h4>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="../assets/img/blog/blog2.png" alt="">
              </div>
              <div class="card-body">
                <h4 class="card-blog__title"><a href="single-blog.html">The Shopping News also offers top-quality printing services</a></h4>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="../assets/img/blog/blog3.png" alt="">
              </div>
              <div class="card-body">
                <h4 class="card-blog__title"><a href="single-blog.html">Professional design staff and efficient equipment you’ll find we offer</a></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ Blog section end ================= -->  

  </main>


</body>

<script type="text/javascript">
$(document).ready(function(){
	var imgs;
	var img_count;
	var img_position = 1;

    imgs = $(".slide ul");
    img_count = imgs.children().length;

    //버튼을 클릭했을 때 함수 실행
    $('#back').click(function () {
    	back();
    });
    $('#next').click(function () {
        next();
    });

    function back() {
    	if(1<img_position){
    		imgs.animate({
            left:'+=1072px'
            });
    		img_position--;
    	}
    }
    function next() {
    	if(img_count>img_position){
    		imgs.animate({
    		left:'-=1072px'
    		});
    		img_position++;
    	}
    }
});
  </script>
</html>