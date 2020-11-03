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
<script type="text/javascript">
$(function() {
	$('.page-item').click(function(){
		let cate_no=cate;
		let page=$(this).attr("page");
		
		if(search_on)
		{
			console.log("검색활성화 : 검색어에대한 페이지 번호:"+page)
			let keyword=$('#CompKeyword').val();
			$.ajax({
				type:'post',
				url:'../computer/search.do',
				data: {key:keyword,page:page,sort:sort}, //페이지 넘길 때  검색단어, 선언된 정렬 기준으로 페이지 넘기기
				success:function(result)
				{
  			        $('#tagin').html(result);
  				}
  	       });
		}
		
		else
		{
			console.log("검색 비활성화 : 카테고리 "+cate_no+" 에대한 페이지 번호: "+page);
			$.ajax({
					type:'post',
					url:'../computer/list.do',
					data: {cate_no:cate_no,page:page,sort:sort}, //페이지 넘길 때 카테고리, 선언된 정렬 기준으로 페이지 넘기기
					success:function(result)
					{
						$('#tagin').html(result);
					}
			})
		}
	})
});
</script>
</head>
<body>

          <section class="lattest-product-area pb-40 category-list">
            <div class="row">
              
              
              <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="${vo.image }">
         
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
            
                  </div>
                  <div class="card-body">
                    <h6 class="card-product__title"><a href="../computer/detail_before.do?com_no=${vo.com_no}">${vo.product }</a></h6>
                    ₩<fmt:formatNumber value="${vo.cost }" pattern="#,###"/> 
                  </div>
                </div>
              </div>
              </c:forEach>
              </div>
          </section>

 <nav class="blog-pagination justify-content-center d-flex">
		  
		   <ul class="pagination">
                          
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item" page="${startPage-1 }">
                                  <a class="page-link" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                          </c:if>
                              
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
	                              <c:if test="${i==curpage }">
	                              <li class="page-item active" page="${i }">
	                                  <a class="page-link">${i }</a>
	                              </li>
	                              </c:if>
	                              <c:if test="${i!=curpage }">
	                                 <li class="page-item" page="${i }">
	                                  <a class="page-link">${i }</a>
	                              </li>
	                              </c:if>
                              </c:forEach>
                              
                           <c:if test="${endPage<totalpage }">
                              <li class="page-item" page="${endPage+1 }">
                                  <a class="page-link" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                           </c:if>
                            
                          </ul>
		  
</nav>





          
</body>
</html>