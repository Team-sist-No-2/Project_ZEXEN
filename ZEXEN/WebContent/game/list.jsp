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
		console.log("페이지 선택할 때 가져온 전역 변수cate_no= "+cate_no+" 에대한 페이지 번호: "+page);
		
		$.ajax({
				type:'post',
				url:'../game/list.do?page='+page+'&cate='+cate_no,
				success:function(result)
				{
					$('#tagin').html(result);
				}
		})
	
// 		$.ajax({
// 				type:'post',
// 				url:'../game/page.do?page='+page+'&cate='+cate_no,
// 				success:function(result)
// 				{
// 					$('.blog-pagination').html(result);
// 				}
// 		})
	
	
	})
});
</script>
</head>
<body>

<section class="lattest-product-area pb-40 category-list">
<div class="row">
<c:forEach var="vo" items="${list }"> 
        <div class="col-sm-6 col-lg-6 mb-4 mb-lg-0" style="margin-bottom: 10px !important; display: flex;" >
            <div class="categories_post" style="display: flex; align-items: center;">
            
                   	<img class="card-img rounded-0" style="align-items: center;"  src="${vo.list_poster }" alt="">
                
                <div class="categories_details" style="background: rgba(34, 34, 34, 0.3);">
                    <div class="categories_text">
                        <a href="../game/detail_before.do?game_no=${vo.game_no}">
                            <h5 style="font-weight: 800" >

						     <c:choose>
					           <c:when test="${fn:length(vo.name) > 30}">
					            <c:out value="${fn:substring(vo.name,0,29)}"/>....
					           </c:when>
					           <c:otherwise>
					            <c:out value="${vo.name}"/>

					           </c:otherwise> 
					          </c:choose>

							</h5>
                        </a>
                        <div class="border_line"></div>
                        <c:forTokens var="tag" items="${vo.tag }" delims="," begin="0" end="2">
               							${tag } 
         				</c:forTokens>
										
						<c:choose>
					         <c:when test = "${vo.price== 0}">
					            	<h6 style="color: white">
       								무료
									</h6>
					         </c:when>
					         <c:when test = "${vo.price != 0}">
						            <h6 style="color: white">
       								<fmt:formatNumber value="${vo.price }" pattern="#,###"/> ₩
									</h6>
					         </c:when>
					    </c:choose>
								    
                    </div>
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