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
	console.log("선택한 카테고리 번호: "+cate+"  , 검색비활성화");
// 	function reload(){
		
// 	      $("#newsposter").load(window.location.href + "#newsposter");
// 	}
});

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


</script>
</head>
<body>
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
                                          <a href="#">좋아요
                                              <i class="lnr lnr-eye"></i>
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
                               	  <img src=${vo.poster } alt="" id="newsposter">
                                     <div class="blog_details">
                                      <a href="../news/detail.do?news_no=${vo.news_no }">
                                      <%-- <img src="${vo.poster }" alt=""> --%> 
                                      
                                      <h2>
                                      <c:choose>
								        <c:when test="${fn:length(vo.subject) gt 28}">
								        <c:out value="${fn:substring(vo.subject, 0, 27)}">
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