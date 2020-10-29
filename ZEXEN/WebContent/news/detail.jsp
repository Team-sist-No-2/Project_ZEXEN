<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area py-80px section-margin--small">
			<div class="container">
					<div class="row">
							<div class="col-lg-8 posts-list">
									<div class="single-post row">
											<div class="col-lg-12">
													<div class="feature-img">
															
															<img class="img-fluid" src="${vo.poster }" alt="">
															<br><br><br><br>
															
													</div>
											</div>
											
											<%-- <div class="col-lg-9 col-md-9 blog_details">
											
											<img src="../assets/img/blog/post-img1.jpg" alt="">
													<h2>${vo.subject }</h2>
													<p class="excert">
															${vo.content }
													</p>
													
											</div> --%>
											
											<div class="poster">
												<h2>${vo.subject }</h2>
												<p class="content">
												${vo.content }
												</p>
											</div>
											
											
											
									</div>
									
									
									
							</div>
							 <div class="col-lg-4">
									<div class="blog_right_sidebar">
											
										
											<aside class="single_sidebar_widget popular_post_widget">
													<h3 class="widget_title">최근본 뉴스</h3>
													<div class="media post_item">
															<img src="img/blog/popular-post/post1.jpg" alt="post">
															<div class="media-body">
																	<a href="blog-details.html">
																			<h3>Space The Final Frontier</h3>
																	</a>
																	<p>02 Hours ago</p>
															</div>
													</div>
													<div class="media post_item">
															<img src="img/blog/popular-post/post2.jpg" alt="post">
															<div class="media-body">
																	<a href="blog-details.html">
																			<h3>The Amazing Hubble</h3>
																	</a>
																	<p>02 Hours ago</p>
															</div>
													</div>
													
													<div class="media post_item">
															<img src="img/blog/popular-post/post4.jpg" alt="post">
															<div class="media-body">
																	<a href="blog-details.html">
																			<h3>Asteroids telescope</h3>
																	</a>
																	<p>01 Hours ago</p>
															</div>
													</div>
													
											</aside>
											<aside class="single_sidebar_widget ads_widget">
													<a href="#">
															<img class="img-fluid" src="img/blog/add.jpg" alt="">
													</a>
													
											</aside>
											
											
									</div>
							</div> 
					</div>
			</div>
	</section>
	<!--================Blog Area =================-->
</body>
</html>