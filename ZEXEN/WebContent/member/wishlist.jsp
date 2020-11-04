<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
a {
    color: #9E01F9;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
.button-review {
    padding: 0px 20px;
    border-radius: 30px;
}
</style>
</head>
<body>

  <!--================Cart Area =================-->
  	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
			
				<li class="nav-item"><a class="nav-link <c:if test="${cate==1}">active</c:if>" id="game-tab"
					data-toggle="tab" href="#game" role="tab" 
					aria-controls="game"
					aria-selected="true">GAME</a>
				</li>
				<li class="nav-item"><a class="nav-link <c:if test="${cate==2}">active</c:if>" id="computer-tab"
					data-toggle="tab" href="#computer" role="tab"
					aria-controls="computer" 
					aria-selected="false">COMPUTER</a>
				</li>
				<li class="nav-item"><a class="nav-link <c:if test="${cate==3}">active</c:if>" id="news-tab"
					data-toggle="tab" href="#news" role="tab" 
					aria-controls="news"
					aria-selected="false">NEWS</a>
				</li>
			</ul>

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade <c:if test="${cate==1}">show active</c:if>" id="game" role="tabpanel" aria-labelledby="game-tab">
					<div class="cart_inner">
						<div class="table-responsive">
							<table class="table">
							<thead>
                          <tr>
                              <th scope="col" colspan=2><span style="margin-left: 42px">Image</span></th>
                              <th scope="col"  style="text-align: center;">Price</th>
                              <th scope="col" style="text-align: center;">Action</th>
                          </tr>
                      		</thead>
								<tbody>
									<c:forEach items="${gList }" var="gvo">
										<tr>
											<td colspan=2>
												<div class="media">
													<div class="d-flex">
														<img src="${gvo.list_poster }" alt="" width="200px"
															height="100px">
													</div>
													<div class="media-body">
														<p>${gvo.name }</p>
													</div>
												</div>
											</td>
											<td>
												<h5 style="text-align: center">
													<c:choose>
														<c:when test="${gvo.price== 0}">
															무료
														</c:when>
														<c:when test="${gvo.price!= 0}">
																<fmt:formatNumber value="${gvo.price }" pattern="#,###" />
																₩
														</c:when>
													</c:choose>
												</h5>
											</td>
											<td>
											<a href="../member/wish_delete.do?wish_no=${gvo.gwish_no }&cate=1" onclick="alert('삭제되었습니다.');" ><input
														type="submit" class="button button--active button-review"
														style="background-color: #FA00A2; margin-bottom: 5px"
														value="삭제하기"></a>
														
											<c:if test="${gvo.gbasket_cnt==0 }">
											<a href="../member/basket_insert.do?game_no=${gvo.game_no }&cate=1"><input
														type="submit" class="button button--active button-review"
														 margin-bottom: 5px" value="장바구니"></a>
											</c:if>
											<c:if test="${gvo.gbasket_cnt!=0 }">
											
											<input type="submit" class="button button--active button-review" onclick="alert('이미 장바구니에 추가되었습니다');"
														 margin-bottom: 5px" value="장바구니">
											</c:if>
											
											
											</td>
										</tr>
									</c:forEach>
									<tr class="bottom_button">
										<td colspan=3></td>
										<td>
										<c:if test="${fn:length(gList)!=0}"> <a class="primary-btn" href="../member/wish_alldelete.do?cate=1" style="margin-left: 8px">전체삭제하기</a> </c:if>
										</td>	
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="tab-pane fade <c:if test="${cate==2}">show active</c:if>" id="computer" role="tabpanel" aria-labelledby="computer-tab">
					<div class="cart_inner">
						<div class="table-responsive">
							<table class="table">
							<thead>
                          <tr>
                              <th scope="col" colspan=2><span style="margin-left: 42px">Image</span></th>
                              <th scope="col"  style="text-align: center;">Price</th>
                              <th scope="col" style="text-align: center;">Action</th>
                          </tr>
                      		</thead>
								<tbody>
									<c:forEach items="${cList }" var="cvo">
										<tr>
											<td colspan=2>
												<div class="media">
													<div class="d-flex">
														<img src="${cvo.image }" alt="" width="100px"
															height="100px">
													</div>
													<div class="media-body">
														<p>${cvo.product }</p>
													</div>
												</div>
											</td>
											<td>
												<h5>
													<c:choose>
														<c:when test="${cvo.cost== 0}">
															무료
														</c:when>
														<c:when test="${cvo.cost!= 0}">
																<fmt:formatNumber value="${cvo.cost }" pattern="#,###" />
																₩
														</c:when>
													</c:choose>
												</h5>
											</td>
											<td>
												<a href="../member/wish_delete.do?wish_no=${cvo.cwish_no }&cate=2" onclick="alert('삭제되었습니다.');" ><input
														type="submit" class="button button--active button-review"
														style="background-color: #FA00A2; margin-bottom: 5px"
														value="삭제하기"></a>
											
												<a href="../member/basket_insert.do?com_no=${cvo.com_no }&cate=2"><input
														type="submit" class="button button--active button-review"
														 margin-bottom: 5px" value="장바구니"></a>
											</td>

										</tr>
									</c:forEach>
									<tr class="bottom_button">
										<td colspan=3></td>
										<td>
										<c:if test="${fn:length(cList)!=0}"> <a class="primary-btn" href="../member/wish_alldelete.do?cate=2" style="margin-left: 8px">전체삭제하기</a> </c:if>
										</td>	
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="tab-pane fade <c:if test="${cate==3}">show active</c:if>" id="news" role="tabpanel" aria-labelledby="news-tab">
					<div class="cart_inner">
						<div class="table-responsive">
							<table class="table">
							<thead>
                          <tr>
                              <th scope="col" colspan=3><span style="margin-left: 42px">Image</span></th>
                              <th scope="col" style="text-align: center;">Action</th>
                          </tr>
                      		</thead>
								<tbody>
									<c:forEach items="${nList }" var="nvo">
										<tr>
											<td colspan="3">
												<div class="media">
													<div class="d-flex">
														<img src="${nvo.poster }" alt="" width="200px"
															height="100px">
													</div>
													<div class="media-body">
														<p>${nvo.subject }</p>
													</div>
												</div>
											</td>
<!-- 											<td> -->
<!-- 												<h5></h5> -->
<!-- 											</td> -->
<!-- 											<td> -->
<!-- 												<div class="product_count"></div> -->
<!-- 											</td> -->
											
											<td>
												<a href="../member/wish_delete.do?wish_no=${cvo.cwish_no }&cate=3" onclick="alert('삭제되었습니다.');" ><input
														type="submit" class="button button--active button-review"
														style="background-color: #FA00A2; margin-bottom: 5px"
														value="삭제하기"></a>
											</td>
										</tr>
									</c:forEach>
									<tr class="bottom_button">
										<td colspan=3></td>
										<td>
										<c:if test="${fn:length(nList)!=0}"> <a class="primary-btn" href="../member/wish_alldelete.do?cate=3" style="margin-left: 8px">전체삭제하기</a> </c:if>
										</td>	
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
  <!--================End Cart Area =================-->



</body>
</html>