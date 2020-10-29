<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('.page-item').click(function(){
		
		let page=$(this).attr("page");

		$.ajax({
				type:'post',
				url:'../news/list.do?page='+page,
				success:function(result)
				{
					$('.blog_left_sidebar').html(result);
				}
		})
	
	
	})
});

// 좋아요

$(function(){
	$('.like_func').click(function(){
		let page=$(this)
	})
});


</script>
</head>
<body>

	

<!--================Blog Area =================-->
  <section class="blog_area">
      <div class="container">
      

          <div class="row">
              <div class="col-lg-8">
              
              
                  <div class="blog_left_sidebar">
                    
                        <c:forEach var="vo" items="${List }"> 
                      <article class="row blog_item">
                          <div class="col-md-3">
                           
                              <div class="blog_info text-right">
                                  <div class="post_tag">
                                      <a href="#"></a>
                                      <a class="active" href="#"></a>
                                      <a href="#"></a>
                                      <a href="#"></a>
                                  </div>
                                  <ul class="blog_meta list">
                                      <li>
                                          <a href="#">${vo.hit }
                                              <i class="lnr lnr-user"></i>
                                          </a>
                                      </li>
                                    
                                      <li>
                                            <a href="#">${vo.like_cnt }
                                            <a href="javascript: like_func"><img src='like.PNG' width=20 height=20 id='like_png'>
                                            
                                              <i class="lnr lnr-bubble"></i>
                                          </a>
                                              
                                          </a>
                                      </li>
                                      <li>
                                          <a href="#">싫어요
                                              <i class="lnr lnr-bubble"></i>
                                          </a>
                                      </li>
                                       <li>
                                      
                                          <%-- <a href="#">${vo.regdate } --%>
                                          <a href="#">${fn:substring(vo.regdate, 0, 10) }
                                          
                                              <i class="lnr lnr-bubble"></i>
                                          </a>
                                      </li>
                                  </ul>
                              </div>
                          </div> 
                          <div class="col-md-9">
                              <div class="blog_post">                             
                               	 <%--  <img src=${vo.poster } alt=""> --%>
                                     <div class="blog_details">
                                      <a href="../news/detail.do?news_no=${vo.news_no }">
                                      <img src="${vo.poster }" alt=""> 
                                      
                                      <h2>
                                      <c:choose>
								        <c:when test="${fn:length(vo.subject) gt 27}">
								        <c:out value="${fn:substring(vo.subject, 0, 26)}">
								        </c:out>...</c:when>
								        <c:otherwise>
								        <c:out value="${vo.subject}">
								        </c:out></c:otherwise>
								      
										</c:choose>
                                     </h2>
                                         
                                       </a>
                                       <p>
                                      <c:choose>
								        <c:when test="${fn:length(vo.content) gt 125}">
								        <c:out value="${fn:substring(vo.content, 0, 124)}">
								        </c:out>...</c:when>
								        <c:otherwise>
								        <c:out value="${vo.content}">
								        </c:out></c:otherwise>
										</c:choose>
                                      </p>
                                        
                                  </div>
                              </div>                              
                          </div>      
                      </article>
                      
                       </c:forEach>
                      
                      
             <!-- ===================== !!!!!!!!! ============================================== -->
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
             <!-- ===================== !!!!!!!!! ============================================== -->           
                              
                                
                       
                  </div>
  
              </div>
              <!-- ===================== 페이지 ============================================== -->
              
              
              <!--요기  -->
                    <div class="col-lg-4">
                  <div class="blog_right_sidebar">
                      
                      
                      <aside class="single_sidebar_widget popular_post_widget">
                          <h3 class="widget_title">최근본 뉴스</h3>
                          <div class="media post_item">
                              <img src="img/blog/popular-post/post1.jpg" alt="post">
                              <div class="media-body">
                                  <a href="single-blog.html">
                                      <h3>Space The Final Frontier</h3>
                                  </a>
                                  <p>02 Hours ago</p>
                              </div>
                          </div>
                          <div class="media post_item">
                              <img src="../assets/img/blog/popular-post/post2.jpg" alt="post">
                              <div class="media-body">
                                  <a href="single-blog.html">
                                      <h3>The Amazing Hubble</h3>
                                  </a>
                                  <p>02 Hours ago</p>
                              </div>
                          </div>
                          <div class="media post_item">
                              <img src="img/blog/popular-post/post3.jpg" alt="post">
                              <div class="media-body">
                                  <a href="single-blog.html">
                                      <h3>Astronomy Or Astrology</h3>
                                  </a>
                                  <p>03 Hours ago</p>
                              </div>
                          </div>
                          <div class="media post_item">
                              <img src="img/blog/popular-post/post4.jpg" alt="post">
                              <div class="media-body">
                                  <a href="single-blog.html">
                                      <h3>Asteroids telescope</h3>
                                  </a>
                                  <p>01 Hours ago</p>
                              </div>
                          </div>
                          
                      </aside>
                     
                     
                  </div>
              </div>
              <!--요기  -->
          </div> 
      </div>    
  </section>
  <!--================Blog Area =================-->





<!-- ================================================================ -->

<%-- <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area">
		<div class="container">
			<h1 class="cont_tit">뉴스</h1>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


  --%>
  
  
</body>
</html> 


<!-- ================================================================ -->
<!-- ================================================================ -->

