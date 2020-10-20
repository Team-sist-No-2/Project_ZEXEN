<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <jsp:include page="../game/list.jsp"></jsp:include>
          <!-- End Best Seller -->
        </div>
        
        
      </div>
    </div>
  	</section>
	<!-- ================ category section end ================= -->		  

	

</body>
</html>