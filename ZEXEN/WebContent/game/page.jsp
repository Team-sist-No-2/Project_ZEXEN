<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					$('.category-list').html(result);
				}
		})
	
		$.ajax({
				type:'post',
				url:'../game/page.do?page='+page+'&cate='+cate_no,
				success:function(result)
				{
					$('.blog-pagination').html(result);
				}
		})
	
	
	})
});




</script>
</head>
<body>
<!-- <ul class="pagination"> -->
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link" aria-label="Previous"> -->
<!--                                       <span aria-hidden="true"> -->
<!--                                           <span class="lnr lnr-chevron-left"></span> -->
<!--                                       </span> -->
<!--                                   </a> -->
<!--                               </li> -->
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link">01</a> -->
<!--                               </li> -->
<!--                               <li class="page-item active"> -->
<!--                                   <a href="#" class="page-link">02</a> -->
<!--                               </li> -->
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link">03</a> -->
<!--                               </li> -->
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link">04</a> -->
<!--                               </li> -->
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link">09</a> -->
<!--                               </li> -->
<!--                               <li class="page-item"> -->
<!--                                   <a href="#" class="page-link" aria-label="Next"> -->
<!--                                       <span aria-hidden="true"> -->
<!--                                           <span class="lnr lnr-chevron-right"></span> -->
<!--                                       </span> -->
<!--                                   </a> -->
<!--                               </li> -->
<!--                           </ul> -->
                          
                          
                          
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
              
                          
                          
                          
                          
</body>
</html>