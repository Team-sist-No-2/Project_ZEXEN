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

var cate;
var sort=1;
console.log("처음 정렬기준= "+sort);

// 카테고리 선택
$(function() {
	$('.pixel-radio').click(function()
	{
		cate=$(this).attr("cate_no");
		console.log("전역변수 cate= "+cate);
		$.ajax({
					type:'post',
					url:'../game/list.do',
					data: {cate:cate,sort:sort},
					success:function(result)
					{
						$('#tagin').html(result);
					}
				})
	})
	$("#inde").trigger("click"); //시작하자마자 인디클릭 
	

	$('.option').click(function()
	{
		console.log("전역변수 cate= "+cate);
		sort=$(this).attr("data-value")
		console.log("선택된 정렬기준 "+sort);
		$.ajax({
			type:'post',
			url:'../game/list.do',
			data: {cate:cate,sort:sort},
			success:function(result)
			{
				$('#tagin').html(result);
			}
		})
	})
	
	   $('#gameSearch').click(function(){
	  	 $('.pixel-radio').prop("checked", false);
       	 let keyword=$('#gameKewword').val();
       	console.log(keyword);
	      
//        $.ajax({
// 	          type:'post',

// 	          url:'../ex/search.do',
// 	          data: {key:keyword},
// 	          success:function(result)
// 	          {
// 	             $('#tagin').html(result);
// 	          }
// 	       });
      
//       let temp=$('#test11 .card-body>a>p:contains("'+k+'")');
//       $(temp).parent().parent.show();
   })
});

</script>
</head>
<body>

	<!-- ================ category section start ================= -->		  
  	<section style="margin-top: 60px;">
    <div class="container" > 
    <h1 class="cont_tit">게임</h1>
      <div class="row">
      
      	<!-- 화면사이즈 왼쪽 -->
        <div class="col-xl-3 col-lg-4 col-md-5">
       
          <div class="sidebar-categories">
            <div class="head">Categories</div>
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
           <div class="sidebar-filter">
            <div class="top-filter-head">최근에 본 게임</div>
            <div class="common-filter" style="background: white;">
            	 <c:forEach var="vo" items="${cList }" begin="0" end="3" >
			      <a href="../game/detail.do?game_no=${vo.game_no }"><img src="${vo.list_poster}" width="100%"></a>
			    </c:forEach>
            </div>
          </div>
        </div>
        
        
        <!-- 화면사이즈 오른쪽 -->
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- Start Filter Bar -->
          
          <div class="filter-bar d-flex flex-wrap align-items-center">
            
            <div class="sorting mr-auto">
              <select style="display: none;">
                <option value="1">연관성</option>
                <option value="2">인기순위</option>
                <option value="3">높은 가격순</option>
                <option value="4">낮은 가격순</option>
              </select>
              <div class="nice-select" tabindex="0">
              <span class="current">인기순위</span>
              <ul class="list">
              	<li data-value="1" class="option focus selected">연관성</li>
              	<li data-value="2" class="option">인기순위</li>
              	<li data-value="3" class="option">높은 가격순</li>
              	<li data-value="4" class="option">낮은 가격순</li>
              	</ul></div>
            </div>
            
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search" id="gameKewword">
                <div class="input-group-append">
                  <button type="button" id="gameSearch"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          
          <!-- End Filter Bar -->
          
          <div id="tagin">
          <!-- 리스트들어가는곳 -->
        </div>


        </div>
      </div>
    </div>
  </section>

	

</body>
</html>