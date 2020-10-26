<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
 <style type="text/css">

.btnxx,
.btnxx2 {
  margin-top:30px;
  width: 200px;
  height: 50px;
  font-size: 20px;
  font-weight: 400;
  text-align: center;
  line-height: 50px;
  color: rgba(255,255,255,0.9);
  border-radius: 50px;
  background: linear-gradient(-45deg, #ffa63d, #ff3d77, #338aff, #3cf0c5, #9E01F9, #9E01F9);
  background-size: 600%;
  -webkit-animation: anime 16s linear infinite;
          animation: anime 16s linear infinite;
}
.btnxx2 {
  position: absolute;
  margin-top: -50px;
  z-index: -1;
  -webkit-filter: blur(30px);
          filter: blur(20px);
  opacity: 0.4;
}

.btnxx:hover{color:black;}
.btnxx2:hover{color:black;}

@-webkit-keyframes anime {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
@keyframes anime {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
  </style>




</head>
<body>
		 <!--================Single Product Area =================-->
		<div class="product_image_area">
			<div class="container">
				<div class="row s_product_inner">
					<div class="col-lg-6" style="display: flex;">
						<div class="owl-carousel owl-theme s_Product_carousel" style="display: flex; align-items: center;" >
						
						<c:if test="${vo.movie != null}">
							<div class="single-prd-item"> 
							<video src="${vo.movie }" style="width: 100%; height: auto;" controls="controls" autoplay="autoplay"></video>
							</div>
						</c:if>
						
						<c:forTokens var="poster" items="${vo.poster }" delims=",">
							
							<div class="single-prd-item">
								<img class="img-fluid" src=${poster } alt="">
							</div>
							
							
						</c:forTokens>
						</div>
						
					</div>
					<div class="col-lg-5 offset-lg-1">
						<div class="s_product_text">
							<h1>${vo.name }</h1>
							
							<c:choose>
						         <c:when test = "${vo.price== 0}">
						            	<h2 style="color: #9E01F9">
	       								무료
										</h2>
						         </c:when>
						         <c:when test = "${vo.price != 0}">
							            <h2 style="color: #9E01F9">
	       								<fmt:formatNumber value="${vo.price }" pattern="#,###"/> ₩
										</h2>
						         </c:when>
					    	</c:choose>
							
							<ul class="list">
								<li><a class="active" href="#"><span>개발사</span> : ${vo.developer }</a></li>
								<li><a href="#"><span>발매일</span> : ${vo.rel_day }</a></li>
							</ul>
							<p><span style="font-weight: 800">태그모음</span><br>${vo.tag }</p>
							<div class="product_count">
							
							
<!-- 								<a class="button primary-btn" href="#" style="margin-top: 20px">Add to Cart</a>    -->
								
								
								<div class="btnxx"><a href="#" style="color: white">Add to Cart</a>
								  <div class="btnxx2"></div>
								</div>
								
								
								
								            
							</div>
							<div class="card_area d-flex align-items-center">
								<a class="icon_btn" href="#"><i class="ti-shopping-cart" style="color: #9E01F9;"></i></a>
								<a class="icon_btn" href="#"><i class="ti-heart" style="color: #9E01F9;"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--================End Single Product Area =================-->
	
		<!--================Product Description Area =================-->
		<section class="product_description_area">
			<div class="container">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
						 aria-selected="false">Specification</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
						 aria-selected="false">Comments</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
						 aria-selected="false">Reviews</a>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
						${vo.content }
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						<div class="table-responsive">
						<table class="table">
							<tbody>
										<c:choose>
										         <c:when test = "${vo.recom_spec == null}">
										         <tr><td>
										         	<h1>스펙</h1>
										         </td></tr>
													<c:forTokens var="spec" items="${vo.min_spec}" delims=",">
														<tr>
															<td>
																${spec } 1번째 only_one
															</td>
														</tr>
													</c:forTokens>
				
										         </c:when>
										         <c:when test = "${vo.recom_spec != null}">
										         
										         <tr><td>
										         	<h1>최소스펙</h1>
										         </td></tr>
											            <c:forTokens var="spec" items="${vo.min_spec}" delims=",">
														<tr>
															<td>
																${spec } 2번째 min
															</td>
														</tr>
														</c:forTokens>
														
														
												<tr><td>
										         	<h1>권장스펙</h1>
										         </td></tr>
														<c:forTokens var="spec" items="${vo.recom_spec}" delims=",">
														<tr>
															<td>
																${spec } 2번째 recom
															</td>
														</tr>
													</c:forTokens>
										         </c:when>
								        </c:choose>
							</tbody>
						</table>
						</div>
					    	
					    	
						
						
						
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="comment_list">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="img/product/review-1.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<h5>12th Feb, 2018 at 05:56 pm</h5>
												<a class="reply_btn" href="#">Reply</a>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
											commodo</p>
									</div>
									<div class="review_item reply">
										<div class="media">
											<div class="d-flex">
												<img src="img/product/review-2.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<h5>12th Feb, 2018 at 05:56 pm</h5>
												<a class="reply_btn" href="#">Reply</a>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
											commodo</p>
									</div>
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="img/product/review-3.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<h5>12th Feb, 2018 at 05:56 pm</h5>
												<a class="reply_btn" href="#">Reply</a>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
											commodo</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="review_box">
									<h4>Post a comment</h4>
									<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" id="name" name="name" placeholder="Your Full name">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="email" class="form-control" id="email" name="email" placeholder="Email Address">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" id="number" name="number" placeholder="Phone Number">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<textarea class="form-control" name="message" id="message" rows="1" placeholder="Message"></textarea>
											</div>
										</div>
										<div class="col-md-12 text-right">
											<button type="submit" value="submit" class="btn primary-btn">Submit Now</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="row total_rate">
									<div class="col-6">
										<div class="box_total">
											<h5>Overall</h5>
											<h4>4.0</h4>
											<h6>(03 Reviews)</h6>
										</div>
									</div>
									<div class="col-6">
										<div class="rating_list">
											<h3>Based on 3 Reviews</h3>
											<ul class="list">
												<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
												<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
														 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="review_list">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="img/product/review-1.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
											commodo</p>
									</div>
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="img/product/review-2.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
											commodo</p>
									</div>
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="img/product/review-3.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
											dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
											commodo</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="review_box">
									<h4>Add a Review</h4>
									<p>Your Rating:</p>
									<ul class="list">
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
									</ul>
									<p>Outstanding</p>
	                <form action="#/" class="form-contact form-review mt-3">
	                  <div class="form-group">
	                    <input class="form-control" name="name" type="text" placeholder="Enter your name" required>
	                  </div>
	                  <div class="form-group">
	                    <input class="form-control" name="email" type="email" placeholder="Enter email address" required>
	                  </div>
	                  <div class="form-group">
	                    <input class="form-control" name="subject" type="text" placeholder="Enter Subject">
	                  </div>
	                  <div class="form-group">
	                    <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
	                  </div>
	                  <div class="form-group text-center text-md-right mt-3">
	                    <button type="submit" class="button button--active button-review">Submit Now</button>
	                  </div>
	                </form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--================End Product Description Area =================-->
	
		<!--================ Start related Product area =================-->  
		<section class="related-product-area section-margin--small mt-0">
			<div class="container">
				<div class="section-intro pb-60px">
	        <p>Popular Item in the market</p>
	        <h2>Top <span class="section-intro__style">Product</span></h2>
	      </div>
				<div class="row mt-30">
	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
	          <div class="single-search-product-wrapper">
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
	              <div class="desc">
	                  <a href="#" class="title">Gray Coffee Cup</a>
	                  <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
	          <div class="single-search-product-wrapper">
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
	              <div class="desc">
	                  <a href="#" class="title">Gray Coffee Cup</a>
	                  <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
	          <div class="single-search-product-wrapper">
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
	              <div class="desc">
	                  <a href="#" class="title">Gray Coffee Cup</a>
	                  <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
	          <div class="single-search-product-wrapper">
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
	              <div class="desc">
	                  <a href="#" class="title">Gray Coffee Cup</a>
	                  <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	            <div class="single-search-product d-flex">
	              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
	              <div class="desc">
	                <a href="#" class="title">Gray Coffee Cup</a>
	                <div class="price">$170.00</div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
			</div>
		</section>
		<!--================ end related Product area =================-->  	
</body>
</html>