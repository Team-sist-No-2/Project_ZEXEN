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
			<h1 class="cont_tit">조립PC</h1>
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
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="popular" name="brand"><label for="popular"><a href="../computer/main.do?cateno=1">인기</a><span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="rpg" name="brand"><label for="rpg">RPG <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="strategic" name="brand"><label for="strategic">전략 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="action" name="brand"><label for="action">액션 <span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="sports" name="brand"><label for="casual">스포츠 <span> (3600)</span></label></li>
            
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
                    <img class="card-img" src="${vo.image }" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <h4 class="card-product__title"><a href="#">${vo.product }</a></h4>
                    <p class="card-product__price">${vo.cost }</p>
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