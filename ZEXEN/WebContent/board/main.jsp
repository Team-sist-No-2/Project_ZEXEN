<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
<style type="text/css">
.product_description_area .nav.nav-tabs li a{cursor:pointer;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var cate_no=0;

$(function(){
	$.ajax({
		type:'post',
		url:'../board/count.do?cate='+cate_no,
		success:function(result)
		{
			console.log(result);
			$('#bcnt').text(result);
		}
  })
	
	
	console.log("gd");
	 $.ajax({
		 type:'post',
		 url:'../board/list.do',
		 success:function(result)
		 {
			 $('#tagin').html(result);
		 }
	 });
});


$(function() {
	$('.nav-item').click(function(){	//카테고리 선택시 해당하는 리스트 출력
		cate_no=$(this).attr("value_data");
	
		$.ajax({
			type:'post',
			url:'../board/count.do?cate='+cate_no,
			success:function(result)
			{
				$('#bcnt').text(result);
			}
	  })
	
	
		if(cate_no!=0)
		{
		console.log("선택한 카테고리 번호: "+cate_no);
		$.ajax({
					type:'post',
					url:'../board/catelist.do?cate_no='+cate_no,
					success:function(result)
					{
						$('#tagin').html(result);
					}
			  })
	    
		}
		
		if(cate_no==0)
		{
		console.log("전체페이지출력");
		$.ajax({
					type:'post',
					url:'../board/list.do',
					success:function(result)
					{
						$('#tagin').html(result);
					}
			  })
			  
// 		$.ajax({
// 					type:'post',
// 					url:'../board/main.do',
// 					success:function(result)
// 					{
// 						$('#tagin').html(result);
// 					}
// 			  })
		}
		
		})
});
</script>
</head>
<body>
	<!--================게시판=================-->
    <section class="product_description_area">
        <div class="container">
            <h1 class="cont_tit">게시판</h1>
            <!--탭-->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" value_data="0">
                    <a class="nav-link active" id="home-tab" data-toggle="tab"  role="tab" aria-controls="home" aria-selected="true">전체</a>
                </li>
                <li class="nav-item" value_data="1">
                    <a class="nav-link"  id="profile-tab" data-toggle="tab"  role="tab" aria-controls="profile" aria-selected="false">자유</a>
                </li>
                <li class="nav-item" value_data="2" >
                    <a class="nav-link" id="contact-tab" data-toggle="tab" role="tab" aria-controls="contact" aria-selected="false">게임</a>
                </li>
                <li class="nav-item" value_data="3">
                    <a class="nav-link"  id="review-tab" data-toggle="tab"  role="tab" aria-controls="review" aria-selected="false">컴퓨터</a>
                </li>
                <li style="float:right"><span class="info_count">총 <em id="bcnt">${count }</em>개의 글이 있습니다.</span></li>
            </ul>
            <!--//탭-->
            <!--탭 컨텐츠-->
            <div class="tab-content" id="myTabContent">
                <!--탭1 전체게시판-->
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div id=tagin>
                 
                    </div>
                    <!--//pagination-->
                    <div class="form-group text-center text-md-right mt-3">
                        <!--검색-->
                        <form name="searchForm" method="get" action="list" class="frm_search">
                            <input type="hidden" id="searchKey" name="searchKey" value="subjectNcontent">
                            <input type="hidden" id="bbsId" name="bbsId" value="PC002">
                            <input type="hidden" id="objCate1" name="objCate1" value="215">
                            <div class="filter-bar" style="float:left; background: transparent">
                                <div class="sorting mr-auto" style="display:inline-block; float:left">
                                    <select style="display: none;">
                                        <option value="1">제목</option>
                                        <option value="1">제목+내용</option>
                                        <option value="1">작성자</option>
                                    </select>
                                    <div class="nice-select" tabindex="0" style="width:120px;">
                                        <span class="current">제목</span>
                                        <ul class="list">
                                            <li data-value="1" class="option selected">제목</li>
                                            <li data-value="1" class="option">제목+내용</li>
                                            <li data-value="1" class="option">작성자</li>
                                        </ul>
                                    </div>
                                </div>
                                <div style="display: inline-block; float:left">
                                    <div class="input-group filter-bar-search">
                                        <input type="text" placeholder="Search">
                                        <div class="input-group-append">
                                            <button type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!--//검색-->
                        <c:if test="${sessionScope.id!=null }">
                        <button type="submit" onclick="location.href='../board/insert.do'" class="button button--active button-contactForm">글쓰기</button>
                        </c:if>
                        <c:if test="${sessionScope.id==null }">
                        <button type="submit" onclick="alert('로그인이 필요합니다.');" class="button button--active button-contactForm">글쓰기</button>
                        
                        </c:if>
                       
                    </div>
                </div>
                <!--//탭1 전체게시판-->
			</div>
		</div>
	</section>                
</body>
</html>