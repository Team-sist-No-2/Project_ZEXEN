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




#like_btn {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
#like_btn:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
#hate_btn {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
#hate_btn:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}


  </style>

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
				url:'../game/like.do?game_no=${vo.game_no}',
				success:function(result)
				{
					console.log("좋아요 누른 결과는 "+result);
				}
		})
		alreadyClick=true;
		}
		else{
			alert('이미 평가한 게임입니다')
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
				url:'../game/hate.do?game_no=${vo.game_no}',
				success:function(result)
				{
					console.log("싫어요 누른 결과는 "+result);
				}
		})
		alreadyClick=true;
		}
		else{
			alert('이미 평가한 게임입니다')
		}
	})
	
	
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
				var no = ${vo.game_no};
 				var allData = {"textarea": textarea, "game_no": no};
//  				console.log(allData);
				$.ajax({
					type: 'post',
					 url: '../game/replyIn.do',
					 data : allData,
					 success: function(result){
						 console.log("댓글작성완료");
// 						  댓글 append
						 
					 }
					});
				
				
			}
		
	})
	
	
})

</script>


</head>
<body>
		 <!--================Single Product Area =================-->
		<div class="product_image_area" style="padding-top: 0px">
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
							<h2 style="color: #000000; font-size: 23pt">${vo.name }</h2>
							
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
								<li><span>개발사</span> : ${vo.developer }</a></li>
								<li><span>발매일</span> : ${vo.rel_day }</a></li>
							</ul>
							<p><span style="font-weight: 800">태그모음</span><br>${vo.tag }</p>
							<div class="product_count">
							
							
<!-- 								<a class="button primary-btn" href="#" style="margin-top: 20px">Add to Cart</a>    -->
								
								
								<div class="btnxx"><a href="#" style="color: white">b u y</a>
								  <div class="btnxx2"></div>
								</div>
								
								
								
								            
							</div>
							<div class="card_area d-flex align-items-center">
								<a class="icon_btn" href="#"><i class="ti-shopping-cart" style="color: #9E01F9;"></i></a>
								<a class="icon_btn" href="../game_wish.do?game_no=${vo.game_no }"><i class="ti-heart" style="color: #9E01F9;"></i></a>
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
							         	<h2>사양</h2>
							         </td></tr>
										<c:forTokens var="spec" items="${vo.min_spec}" delims=",">
											<tr>
												<td>
													${spec }
												</td>
											</tr>
										</c:forTokens>
	
							         </c:when>
							         <c:when test = "${vo.recom_spec != null}">
							         
							         <tr><td>
							         	<h2>최소사양</h2>
							         </td></tr>
								            <c:forTokens var="spec" items="${vo.min_spec}" delims=",">
											<tr>
												<td>
													${spec }
												</td>
											</tr>
											</c:forTokens>
									<tr><td>
							         	<h2>권장사양</h2>
							         </td></tr>
											<c:forTokens var="spec" items="${vo.recom_spec}" delims=",">
											<tr>
												<td>
													${spec }
												</td>
											</tr>
										</c:forTokens>
							         </c:when>
					        </c:choose>
							</tbody>
						</table>
						</div>
					</div>
					
					<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="row total_rate" style="margin-bottom: 10px;">
									<div class="col-6">
										<div class="box_total">
										<button style="background-color: #f1f6f7; border:0;" value="${vo.like_cnt }" id="like_btn">
											<img src="../assets/img/like.png" width="100px">
											</button>
											<h4 style="color: #9E01F9" id="like_out"><fmt:formatNumber value="${vo.like_cnt }" pattern="#,###"/></h4>
<%-- 											<h4>${vo.like_cnt}</h4> --%>
										</div>
									</div>
									<div class="col-6">
										<div class="box_total">
										<button style="background-color: #f1f6f7; border:0;" value="${vo.like_cnt }" id="hate_btn">
											<img src="../assets/img/hate.png" width="100px" >
											</button>
											<h4 style="color: #fa00a2" id="hate_out"><fmt:formatNumber value="${vo.hate_cnt }" pattern="#,###"/></h4>
<%-- 											<h4>${vo.hate_cnt}</h4> --%>
										</div>

									</div>
								</div>
								
								
								<div class="review_list">
									
									
								<c:forEach items="${rList }" var="rvo">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="${rvo.pimg }" width="70px" height="70px" alt="">
											</div>
											<div class="media-body">
												<h4>${rvo.id } </h4>
												<h4> <fmt:formatDate value="${rvo.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/> </h4>
											</div>
										</div>
										<p>${rvo.msg }</p>
									</div>
								</c:forEach>
									
								</div>
								
								
								
							</div>
							
							<div class="col-lg-6">
								<div class="review_box">
									<h4>Add a Review</h4>
									
									
	                <form action="../game/reply_insert.do" class="form-contact form-review mt-3" id="reply_form" method="post">
	                  <div class="form-group">
	                 
	                   <c:if test="${sessionScope.id==null }">
	                    <textarea disabled class="form-control different-control w-100"  cols="30" rows="5" placeholder="로그인이 필요 합니다"></textarea>
	                  </div>
	                  <div class="form-group text-center text-md-right mt-3">
	                  </div>
	                  </c:if>
	                  
	                  <c:if test="${sessionScope.id!=null }">
	                   <input type=hidden name="game_no" value="${vo.game_no }">
	                   <textarea class="form-control different-control w-100" name="msg" cols="30" rows="5" placeholder="최대  500자 입력가능합니다."></textarea>
	                  </div>
	                  <div class="form-group text-center text-md-right mt-3">
	                    <input type="submit" class="button button--active button-review" id="reply_btn"  value="댓글쓰기"/>
	                  </c:if>
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
<!-- 		<section class="related-product-area section-margin--small mt-0"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="section-intro pb-60px"> -->
<!-- 	        <p>Popular Item in the market</p> -->
<!-- 	        <h2>Top <span class="section-intro__style">Product</span></h2> -->
<!-- 	      </div> -->
<!-- 				<div class="row mt-30"> -->
<!-- 	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!-- 	          <div class="single-search-product-wrapper"> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                  <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                  <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
	
<!-- 	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!-- 	          <div class="single-search-product-wrapper"> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-4.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                  <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                  <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-5.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-6.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
	
<!-- 	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!-- 	          <div class="single-search-product-wrapper"> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-7.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                  <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                  <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-8.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-9.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
	
<!-- 	        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0"> -->
<!-- 	          <div class="single-search-product-wrapper"> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                  <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                  <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="single-search-product d-flex"> -->
<!-- 	              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a> -->
<!-- 	              <div class="desc"> -->
<!-- 	                <a href="#" class="title">Gray Coffee Cup</a> -->
<!-- 	                <div class="price">$170.00</div> -->
<!-- 	              </div> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
<!-- 	      </div> -->
<!-- 			</div> -->
<!-- 		</section> -->
		<!--================ end related Product area =================-->  	
</body>
</html>