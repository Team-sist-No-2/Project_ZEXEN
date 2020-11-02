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

var cate=1;	//카테고리 전역변수
var sort=1; //정렬기준
var search_on=false;

// 카테고리 선택
$(function() {
	$('.pixel-radio').click(function(){	//카테고리 선택시 해당하는 리스트 출력
		cate=$(this).attr("cate_no");
		search_on=false;
		console.log("선택한 카테고리 번호: "+cate+"  , 검색비활성화");
		$.ajax({
					type:'post',
					url:'../computer/list.do',
					data: {cate:cate,sort:sort},
					success:function(result)
					{
						$('#tagin').html(result);
					}
			  })
		})
	$("#popular").trigger("click"); //시작하자마자 인디클릭 
	

/* 	$('.option').click(function(){	//인기순위,낮은가격,높은가격 등등 정렬기준 리스트 출력 (정렬기준은 카테고리 변경시에도 유지)
	// 옵션버튼 누를때마다 페이지는 자동 1으로 리셋
	
		if(search_on) //키워드가 있다면 키워드에대해서 선택한 정렬기준으로 리스트 출력
		{
			sort=$(this).attr("data-value")
			let keyword=$('#gameKewword').val();
			
			$.ajax({
						type:'post',
						url:'../game/search.do',
						data: {key:keyword,sort:sort},
						success:function(result)
						{
		  			        $('#tagin').html(result);
		  				}
				  })
		}
		
		else //키워드가 없다면 선택된 카테고리 번호와 선택한 정렬기준으로 리스트 출력 
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
		}
		
		}) */
	
	
/*    	  $(document).ready(function() {
      $("#gameKewword").keyup(function(key) {	//검색창에 입력시 실시간 타이핑된 단어로 검색하기
    	 search_on=true;
      	 console.log("검색활성화됨");
      	 $('.pixel-radio').prop("checked", false);
         let keyword=$('#gameKewword').val();
      	      
         $.ajax({
					type:'post',
					url:'../game/search.do',
					data: {key:keyword,sort:sort},
					success:function(result)
					{
      			        $('#tagin').html(result);
      				}
      	       });
            });
         });
	
	 */
// 	$('#gameSearch').click(function(){ //서치버튼 클릭시 검색창에 입려된 텍스트로 검색하기
//	    $('.pixel-radio').prop("checked", false);
//     let keyword=$('#gameKewword').val();
//     console.log(keyword);
      
//     $.ajax({
//	          		type:'post',
//	        		url:'../game/search.do',
//	        		data: {key:keyword,sort:sort},
//	         	    success:function(result)
//			        {
//			            $('#tagin').html(result);
//			        }
//	          });
//		})

});

</script>
</head>
<body>

	<!-- ================ category section start ================= -->		  
  	<section style="margin-top: 60px;">
    <div class="container" > 
    <h1 class="cont_tit">컴퓨터</h1>
      <div class="row">
      
      	<!-- 화면사이즈 왼쪽 -->
        <div class="col-xl-3 col-lg-4 col-md-5">
       
          <div class="sidebar-categories">
            <div class="head">Categories</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="popular" name="brand" cate_no="1"><label for="popular">인기 <span> (${cate_cnt[0] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="rpg" name="brand" cate_no="2"><label for="rpg">RPG <span> (${cate_cnt[1] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="strategy" name="brand" cate_no="3"><label for="strategy">전략 <span> (${cate_cnt[2] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="action" name="brand" cate_no="4"><label for="action">액션 <span> (${cate_cnt[3] })</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="sports" name="brand" cate_no="5"><label for="sports">스포츠 <span> (${cate_cnt[4] })</span></label></li>
                    </ul>
                </form>
              </li>
            </ul>
          </div>
           <div class="sidebar-filter">
            <div class="top-filter-head">최근에 본 컴퓨터</div>
            <div class="common-filter" style="background: white;">
            	 <c:forEach var="vo" items="${cList }" begin="0" end="3" >
			      <a href="../game/detail.do?game_no=${vo.com_no }"><img src="${vo.image}" width="100%"></a>
			    </c:forEach>
            </div>
          </div>
        </div>
        
        
        <!-- 화면사이즈 오른쪽 -->
        <div class="col-xl-9 col-lg-8 col-md-7">
        
          <!-- Start Filter Bar -->
          
          <div class="filter-bar d-flex flex-wrap align-items-center">
            
            
            <div class="sorting mr-auto" id="sortTF">
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