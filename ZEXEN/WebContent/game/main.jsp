<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
  <title>Aroma Shop - Category</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

// $(function() {
// 	$('#all').click(function(){
// 		$.ajax({
// 				type:'post',
// 				url:'../game/total.do',
// 				success:function(result)
// 				{
// 					$('.category-list').html(result);
// 				}
// 		})
// 	})
// 	$("#all").trigger("click");
// })



var cate;

// 카테고리 선택
$(function() {
	$('.pixel-radio').click(function(){
		let cate_no=$(this).attr("cate_no");
		console.log("내가 선택한 cate_no= "+cate_no);
		cate=$(this).attr("cate_no");
		console.log("전역변수 cate= "+cate);
		$.ajax({
				type:'post',
				url:'../game/list.do?cate='+cate_no,
				success:function(result)
				{
					$('.category-list').html(result);
				}
		})
		
		$.ajax({
				type:'post',
				url:'../game/page.do?cate='+cate_no,
				success:function(result)
				{
					$('.blog-pagination').html(result);
				}
		})
	})
	$("#inde").trigger("click"); //시작하자마자 인디클릭 
})


$(function() {
	$('.option').click(function(){
		let sort=$(this).attr("data-value")
		console.log("정렬기준 "+sort);
	
// 		$.ajax({
// 				type:'post',
// 				url:'../game/list.do?page='+page+'&cate='+cate_no,
// 				success:function(result)
// 				{
// 					$('.category-list').html(result);
// 				}
// 		})
	})
});









</script>
</head>
<body>

	<!-- ================ category section start ================= -->		  
  	<section style="margin-top: 60px;">
    <div class="container" > <h1 class="cont_tit">게임</h1>
      <div class="row">
      
      	<!-- 화면사이즈 왼쪽 -->
        <div class="col-xl-3 col-lg-4 col-md-5">
       
          <div class="sidebar-categories">
            <div class="head">Browse Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="inde" name="brand" cate_no="1"><label for="inde">인디<span> (${cate_cnt[0] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="action" name="brand" cate_no="2"><label for="action">액션 <span> (${cate_cnt[1] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="adventure" name="brand" cate_no="3"><label for="adventure">어드벤처 <span> (${cate_cnt[2] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="casual" name="brand" cate_no="4"><label for="casual">캐주얼 <span> (${cate_cnt[3] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="simul" name="brand" cate_no="5"><label for="simul">시뮬레이션 <span> (${cate_cnt[4] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="strategy" name="brand" cate_no="6"><label for="strategy">전략 <span> (${cate_cnt[5] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="role" name="brand" cate_no="7"><label for="role">롤플레잉<span> (${cate_cnt[6] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="single" name="brand" cate_no="8"><label for="single">싱글 플레이어<span> (${cate_cnt[7] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="free" name="brand" cate_no="9"><label for="free">무료<span> (${cate_cnt[8] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="sports" name="brand" cate_no="10"><label for="sports">스포츠<span> (${cate_cnt[9] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="multi" name="brand" cate_no="11"><label for="multi">멀티플레이어<span> (${cate_cnt[10] })</span></label></li>
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
            
<!--             <div class="sorting mr-auto"> -->
<!--               <select> -->
<!--                 <option value="1">인기순위</option> -->
<!--                 <option value="1">높은 가격순</option> -->
<!--                 <option value="1">낮은 가격순</option> -->
<!--                 <option value="1">무료</option> -->
<!--               </select> -->
<!--             </div> -->
            
            
            
            
            <div class="sorting mr-auto">
              <select style="display: none;">
                <option value="1">인기순위</option>
                <option value="1">높은 가격순</option>
                <option value="1">낮은 가격순</option>
                <option value="1">무료</option>
              </select>
              <div class="nice-select" tabindex="0">
              <span class="current">인기순위</span>
              <ul class="list">
              	<li data-value="1" class="option focus selected">인기순위</li>
              	<li data-value="2" class="option">높은 가격순</li>
              	<li data-value="3" class="option">낮은 가격순</li>
              	<li data-value="4" class="option">무료</li></ul></div>
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
            
          <!-- 리스트 들어오는 곳 -->
          
          </section>
          
           <nav class="blog-pagination justify-content-center d-flex">
		  
		  <!-- 페이지 들어오는 곳 -->
		  
		</nav>
          


        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	

</body>
</html>