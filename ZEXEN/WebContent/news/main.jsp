<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	var aleradyClick=false;
	$('#like_btn').click(function(){
		if(!alreadyClick){
			let lcnt=${vo.like_cnt+1};
			
			$('#like_out').html(lcnt);
			
			$.ajax({
				type:'post',
				url:'../news/like.do?news_no=${vo.news_no}',
				success:function(result){
					consol.log("좋아요 누른 결과는 "+result);
				}
			})
			aleadyClick=true;
		}
		else{
			alert('이미 평가한 뉴스 입니다')
		}
	})
	
})


</script>
</head>
<body>

<!-- ================ start banner area ================= -->	
  <section style="margin-top: 60px;">
    <div class="container" > 
    <h1 class="cont_tit">뉴스</h1>
      <div class="row">
  </section>
  <!-- ================ end banner area ================= -->
	

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
                                      	
                                      	<br></br>
                                      	<br></br>
                                      	<br></br>
                                      	<br></br>
                                      	
                                      		${vo.hit}
                                          <%-- <a href="#">${vo.hit } --%>
                                          <img value="${vo.hit }" id="#" src="../assets/img/news/nhit.png" width=20 height=20>
                                              
                                              
                                          </a>
                                      </li>
                                    
                                      <li>
                                      		${vo.like_cnt }
                                      			<img value="${vo.like_cnt }" id="like_btn" src="../assets/img/news/nlike.PNG" width=20 height=20>
                                      		<h1 id="like_out"></h1>
                                             
                                      </li>
                                      <li>
                                      		${vo.hate_cnt }
                                      			<img value="${vo.hate_cnt }" id="hate_btn" src="../assets/img/news/nhate.PNG" width=20 height=20>
                                      		<h1 id="like_out"></h1>
                                             
                                      </li>
                                       <li>
                                      
                                          <%-- <a href="#">${vo.regdate } --%>
                                          <a href="#">${fn:substring(vo.regdate, 0, 10) }
                                          
                                              
                                          </a>
                                      </li>
                                  </ul>
                              </div>
                          </div> 
                          <div class="col-md-9">
                              <div class="blog_post">                             
                               	 <%--  <img src=${vo.poster } alt=""> --%>
                                     <div class="blog_details">
                                      <a href="../news/detail_before.do?news_no=${vo.news_no }">
                                      <img src=${vo.poster } alt="" id="newsposter" width=500 height=250>
                                      
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
                          
                          
                          <c:forEach var="vo" items="${oList }" varStatus="s">
                          <c:if test="${s.index<4 }">
                          <div class="media post_item">
                              
                              <img src="${vo.poster }" alt="post" width=100 height=100>
                             
                              <div class="media-body">
                                  <a href="single-blog.html">
                                  <a href="../news/detail.do?news_no=${vo.news_no }">
                                       <h3>${fn:substring(vo.subject,0,15) }</h3>
                                      </a>
                                      
                                  </a>
                                  <p>${fn:substring(vo.content,0,30) }</p>
                              </div>
                          </div>
                          </c:if>
                          </c:forEach>
                          
                      </aside>
        
                  </div>
              </div>
              <!--요기  -->
          </div> 
      </div>    
  </section>
  <!--================Blog Area =================-->

</body>
</html> 


