<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	
	
	var alreadyClick=false;
	
	$('#like_btn').click(function(){
		
		
		if(!alreadyClick){
		
		let lcnt=${vo.like_cnt+1};
		lcnt=lcnt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#like_out').html(lcnt);

		$.ajax({
				type:'post',
				url:'../news/like.do?news_no=${vo.news_no}',
				success:function(result)
				{
					console.log("좋아요 누른 결과는 "+result);
				}
		})
		alreadyClick=true;
		}
		else{
			alert('이미 평가한 뉴스입니다')
		}
	})
	
	
	
	$('#hate_btn').click(function(){
		
		if(!alreadyClick){
		
		let hcnt=${vo.hate_cnt+1};
// 		alert(hcnt);
		hcnt=hcnt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#hate_out').html(hcnt);

		$.ajax({
				type:'post',
				url:'../news/hate.do?news_no=${vo.news_no}',
				success:function(result)
				{
					console.log("싫어요 누른 결과는 "+result);
				}
		})
		alreadyClick=true;
		}
		else{
			alert('이미 평가한 뉴스입니다')
		}
	})
	
	
	// reply
		$('#reply_btn').click(function(){
		let textarea=$('#textarea').val();
		console.log(textarea);
		
			if(textarea.trim()=="")
			{
				$('#textarea').focus();
				return;
			}
		
			else
			{
				var no = ${vo.news_no};
 				var allData = {"textarea": textarea, "news_no": no};
				$.ajax({
					type: 'post',
					 url: '../news/replyIn.do',
					 data : allData,
					 success: function(result){
						 console.log("댓글작성완료");
						 
					 }
					});
				
				
			}
		
	})
	//reply
	
	
})

</script>

</head>
<body>


	

<!--================Blog Area =================-->

	 <!--================Blog Area =================-->
	<section class="blog_area single-post-area py-80px section-margin--small">
			<div class="container">
					<div class="row">
							<div class="col-lg-8 posts-list">
									<div class="single-post row">
											<div class="col-lg-12">
													<div class="feature-img" style="text-align: center;">
															<img class="img-fluid" src="${vo.poster }" alt="">
															
													</div>
											</div>
											<div class="col-lg-3  col-md-3">
													<div class="blog_info text-right">
															<div class="post_tag">
																	<a href="#">news,</a>
																	<a class="active" href="#">game_news,</a>
																	<a href="#">computer,</a>
																	<a href="#">zexen</a>
															</div>
															<ul class="blog_meta list">
																	<li>
																	
																			<a href="#">
																			</a>
																	</li>
																	<li>
																			<a href="#">${fn:substring(vo.regdate, 0, 10) }
																					<i class="lnr lnr-calendar-full"></i>
																			</a>
																	</li>
																	<li>
																			<a href="#">${vo.hit } Views
																					<i class="lnr lnr-eye"></i>
																			</a>
																	</li>
																	<li>
																			<!-- <a href="#">06 Comments
																					<i class="lnr lnr-bubble"></i>
																			</a> -->
																	</li>
															</ul>
															<ul class="social-links">
																	<li>
																			<a href="#">
																					<!-- <i class="fab fa-facebook-f"></i> -->
																			</a>
																	</li>
																	<li>
																			<a href="#">
																				<!-- <i class="fab fa-twitter"></i>	 -->																			
																			</a>
																	</li>
																	<li>
																			<a href="#">
																				<!-- <i class="fab fa-github"></i> -->																				
																			</a>
																	</li>
																	<li>
																			<a href="#">
																				<!-- <i class="fab fa-behance"></i>	 -->																			
																			</a>
																	</li>
													
																	
								<!-- like / hate -->
								<div class="row total_rate" style="margin-bottom: 10px;">
									<div class="col-6">
										<div class="box_total">
										<button style="background:white; border:0;" value="${vo.like_cnt }" id="like_btn">
											<img src="../assets/img/like.png" width="70" height="70">
											</button>
											<h4 style="color: #9E01F9" id="like_out"><fmt:formatNumber value="${vo.like_cnt }" pattern="#,###"/></h4>
<%-- 											<h4>${vo.like_cnt}</h4> --%>
										</div>
									</div>
									<div class="col-6">
										<div class="box_total">
										<button style="background-color: #f1f6f7; border:0;" value="${vo.like_cnt }" id="hate_btn">
											<img src="../assets/img/hate.png" width="70" height="70" >
											</button>
											<h4 style="color: #fa00a2" id="hate_out"><fmt:formatNumber value="${vo.hate_cnt }" pattern="#,###"/></h4>
<%-- 											<h4>${vo.hate_cnt}</h4> --%>
										</div>

									</div>
								</div>
							<!-- like / hate -->
							
							
							
							
															</ul>
													</div>
											</div>
											<div class="col-lg-9 col-md-9 blog_details">
													<h2>${vo.subject }</h2>
													<p class="excert">
															${vo.content }
													</p>
													
											</div>
											
									</div>
									
									
									
							</div>
									
							<div class="col-lg-4">
                  <div class="blog_right_sidebar">
                      
                      <%-- <aside class="single_sidebar_widget popular_post_widget">
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
                          
                      </aside> --%>
                      
                      
                      
                      
                      
                      <aside class="single_sidebar_widget popular_post_widget">
                          <h3 class="widget_title">REVIEW</h3>
                           <form action="../news/reply_insert.do" class="form-contact form-review mt-3" id="reply_form" method="post">
	                  <div class="form-group">
	                 
	                   <c:if test="${sessionScope.id==null }">
	                    
	                    <textarea disabled class="form-control different-control w-100"  cols="300" rows="5" placeholder="로그인이 필요 합니다"></textarea>
	                  </div>
	                  <div class="form-group text-center text-md-right mt-3">
	                  </div>
	                  </c:if>
	                  
	                  <c:if test="${sessionScope.id!=null }">
	                   <input type=hidden name="news_no" value="${vo.news_no }">
	                   <textarea class="form-control different-control w-100" name="msg" cols="30" rows="5" placeholder="최대  500자 입력가능합니다."></textarea>
	                  </div>
	                  <div class="form-group text-center text-md-right mt-3">
	                    <input type="submit" class="button button--active button-review" id="reply_btn"  value="댓글쓰기"/>
	                  </c:if>
	                </form>  
                          <div class="br"></div>
                      </aside>
                     
                     <aside class="review">
                      
                      <div class="review_list">
									
												
									
								
									
								 <c:forEach items="${nList }" var="nvo">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="../assets/img/icon1/001.png" width="70px" height="70px" alt="">
											</div>
											<div class="media-body">
												<h4>${nvo.id } </h4>
												<h4> <fmt:formatDate value="${nvo.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/> </h4>
											</div>
										</div>
										<p>${nvo.msg }</p>
									</div>
								</c:forEach>
									
								</div>
                      </aside>
                      
                  </div>
							

							
							
					</div>
			</div>
	</section>
	
	
				
	<!--================Blog Area =================-->
</body>
</html>