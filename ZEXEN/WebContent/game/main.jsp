<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang>
<head>
  <title>Aroma Shop - Category</title>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area">
		<div class="container">
			<h1 class="cont_tit">게임</h1>
		</div>
	</section>
	<!-- ================ end banner area ================= -->
	
	
	<!-- ================ category section start ================= -->		  
  	<section class="section-margin--small mb-5" >
    <div class="container">
      <div class="row">
      
      	<!-- 화면사이즈 왼쪽 -->
        <div class="col-xl-3 col-lg-4 col-md-5">
       
          <div class="sidebar-categories">
            <div class="head">Browse Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="all" name="brand"><label for="all"><a href="../game/main.do?cateno=3">전체</a><span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="inde" name="brand"><label for="inde">인디<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="action" name="brand"><label for="action">액션 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="adventure" name="brand"><label for="adventure">어드벤처 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="casual" name="brand"><label for="casual">캐주얼 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="simul" name="brand"><label for="simul">시뮬레이션 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="strategy" name="brand"><label for="strategy">전략 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="role" name="brand"><label for="role">롤플레잉<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="single" name="brand"><label for="single">싱글 플레이어<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="free" name="brand"><label for="free">무료<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="sports" name="brand"><label for="sports">스포츠<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="multi" name="brand"><label for="multi">멀티플레이어<span> (3600)</span></label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
        </div>
        
        
        <!-- 화면사이즈 오른쪽 -->
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
            <div class="row">
              
              
              <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-3">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../assets/img/product/product2.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Beauty</p>
                    <h4 class="card-product__title"><a href="#">${vo.name }</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              </c:forEach>
              

          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  



</body>
</html>