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
		let a=$('#aaa').attr("value");

		$.ajax({
				type:'post',
				url:'../computer/like.do',
				data:{"com_no":a},
				success:function(result)
				{
					console.log("좋아요 누른 결과는 "+result);
				}
		})
		alreadyClick=true;
		}
		else{
			alert('이미 평가하셨습니다.')
		}
	})
	
	
	
	$('#hate_btn').click(function(){
		
		if(!alreadyClick){
		
		let hcnt=${vo.hate_cnt+1};
		hcnt=hcnt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$('#hate_out').html(hcnt);
		let a=$('#aaa').attr("value");

		$.ajax({
				type:'post',
				url:'../computer/hate.do?com_no',
				data:{"com_no":a},
				success:function(result)
				{
					console.log("싫어요 누른 결과는 "+result);
				}
		})
		alreadyClick=true;
		}
		else{
			alert('이미 평가하셨습니다.')
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
				var no = ${vo.com_no};
 				var allData = {"textarea": textarea, "com_no": no};
				$.ajax({
					type: 'post',
					 url: '../computer/replyIn.do',
					 data : allData,
					 success: function(result){
						 console.log("댓글 작성완료");
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
	<div class="product_image_area" style="padding-top: 50px">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6" style="display: flex;">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img src="${vo.image }" alt="" style="width:410px;height:420px">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3 id="aaa" value="${vo.com_no }">${vo.product}</h3>
						<h5>${vo.spec}</h5>
						<h2>₩<fmt:formatNumber value="${vo.cost }" pattern="#,###"/> </h2>
						<ul class="list">
				
							<li><span>사은품</span> : ${vo.gift }</li>
							<li><span>배송방법</span> : 무료배송 | 퀵서비스 | 직접수령 | 안전배송</li>
						</ul>
						
						<div class="product_count" id="count" value="${vo.cost }">
                                      수량 : <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                          class="input-text qty">
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                          class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                          class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                  </div>
					
						


						
						<div class="card_area d-flex align-items-center">
						  <!-- 구매버튼 -->	
						    <a class="button button-hero" href="#" onclick="alert('구매 완료!');">바로구매</a> &nbsp;&nbsp;	
						  
						  <!-- 장바구니 버튼 -->  
							<c:if test="${sessionScope.id!=null }">
								<c:if test="${bcount==0 }">
								<a class="icon_btn" href="../computer/basket_insert.do?com_no=${vo.com_no }" style="background: white;"><i class="ti-shopping-cart" style="color: #9E01F9;"></i></a>
								</c:if>
								<c:if test="${bcount==1 }">
								<a class="icon_btn" href="../computer/basket_delete.do?com_no=${vo.com_no }" style="background: white;"><i class="ti-shopping-cart-full" style="color: #9E01F9;"></i></a>
								</c:if>
							</c:if>
							<c:if test="${sessionScope.id==null }">
								<a class="icon_btn" onclick="alert('로그인이 필요합니다.');" style="background: white;"><i class="ti-shopping-cart" style="color: #9E01F9;"></i></a>
							</c:if>	
								
						  <!-- 찜 버튼 -->  
							<c:if test="${sessionScope.id!=null }">
								<c:if test="${wcount==0 }">
								<a class="icon_btn" href="../computer/wish_insert.do?com_no=${vo.com_no }" style="background: white;"><i class="ti-heart" style="color: #9E01F9;"></i></a>
								</c:if>
								<c:if test="${wcount==1 }">
								<a class="icon_btn" href="../computer/wish_delete.do?com_no=${vo.com_no }" style="background: white;"><i class="ti-heart-broken" style="color: #9E01F9;"></i></a>
								</c:if>
							</c:if>
							
							<c:if test="${sessionScope.id==null }">
								<a class="icon_btn" onclick="alert('로그인이 필요합니다.');" style="background: white;"><i class="ti-heart" style="color: #9E01F9;"></i></a>
							</c:if>
								
						 <!-- 목록버튼 -->		
							<a class="icon_btn" href="../computer/main.do" style="background: white"><i class="ti-search" style="color: #9E01F9;"></i></a>
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
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">취소/반품/교환정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false">상세스펙</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">구매후기</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p><b>쇼핑몰명</b><br>
					㈜피씨블로그<br><br>
<b>A/S 정보안내</b><br>
1. 구입 후 7일 이내의 제품불량시 불량 제품 1:1 교체<br>
2. 프린터,LG,삼성 모니터의 경우 불량 판정서 동봉시 1:1 교환 반품 가능<br>
3. 7일 이내의 불량은 배송비 왕복 부담 7일 이후는 고객 부담<br><br>
<b>반품일</b><br>
상품을 수령한 날부터 7일 이내<br><br>
<b>교환 반품 정보</b><br>
1. 조립PC의 경우 단순변심 반품 불가<br>
2. CPU,SSD,프린터,LG 삼성 모니터 개봉시 반품불가<br>
3. 제품이 물리적으로 파손시 AS 불가<br>
4. 불법 소프트웨어를 취급/설치 해드리지 않습니다.<br>
5. 환불 및 교환시에는 CJ택배를 이용하여 보내주셔야 합니다.</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>CPU</h5>
									</td>
									<td>
										<h5>라이젠 R5-3500</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>메인보드</h5>
									</td>
									<td>
										<h5>A320</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>메모리</h5>
									</td>
									<td>
										<h5>16G</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>그래픽카드</h5>
									</td>
									<td>
										<h5> GTX1650</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>SSD</h5>
									</td>
									<td>
										<h5>240GB</h5>
									</td>
								</tr>
								
			
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
									
									
	                <form action="../computer/reply_insert.do" class="form-contact form-review mt-3" id="reply_form" method="post">
	                  <div class="form-group">
	                 
	                   <c:if test="${sessionScope.id==null }">
	                    <textarea disabled class="form-control different-control w-100"  cols="30" rows="5" placeholder="로그인이 필요합니다."></textarea>
	                  </div>
	                  <div class="form-group text-center text-md-right mt-3">
	                  </div>
	                  </c:if>
	                  
	                  <c:if test="${sessionScope.id!=null }">
	                   <input type=hidden name="com_no" value="${vo.com_no }">
	                   <textarea class="form-control different-control w-100" name="msg" cols="30" rows="5" placeholder="최대  500자까지 입력가능합니다."></textarea>
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
	
	</body>
</html>