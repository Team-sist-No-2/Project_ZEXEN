<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
				<li class="nav-item"><a class="nav-link active" id="game-tab"
					data-toggle="tab" href="#game" role="tab" 
					aria-controls="game"
					aria-selected="true">GAME</a>
				</li>
				<li class="nav-item"><a class="nav-link" id="computer-tab"
					data-toggle="tab" href="#computer" role="tab"
					aria-controls="computer" 
					aria-selected="false">COMPUTER</a>
				</li>
				<li class="nav-item"><a class="nav-link" id="news-tab"
					data-toggle="tab" href="#news" role="tab" 
					aria-controls="news"
					aria-selected="false">NEWS</a>
				</li>
			</ul>

			<div class="tab-content" id="myTabContent">

				<div class="tab-pane fade show active" id="game" role="tabpanel" aria-labelledby="game-tab">
					<div class="cart_inner">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<c:forEach items="${gList }" var="gvo">
										<tr>
											<td>
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
												<h5>
													<fmt:formatNumber value="${gvo.price }" pattern="#,###" />
													₩
												</h5>
											</td>
											<td>
												<div class="product_count"></div>
											</td>
											<td>
											<a href="../member/wish_delete.do?wish_no=${gvo.gwish_no }"><input
														type="submit" class="button button--active button-review"
														style="background-color: #FA00A2; margin-bottom: 5px"
														value="삭제하기"></a>
											
											<a href="../member/basket_insert.do?wish_no=${gvo.gwish_no }"><input
														type="submit" class="button button--active button-review"
														style="background-color: #FA00A2; margin-bottom: 5px"
														value="장바구니"></a>
											</td>
										</tr>
									</c:forEach>


									<tr class="bottom_button">
										<td><a class="primary-btn" href="#">삭제하기</a> <a
											class="primary-btn" href="#">장바구니</a></td>
										<td></td>
										<td></td>
										<td>
											<div class="cupon_text d-flex align-items-center">
												<a class="primary-btn" href="#">장바구니</a> <a class="button"
													href="#">삭제하기</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="computer" role="tabpanel" aria-labelledby="computer-tab">
					<div class="cart_inner">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<c:forEach items="${cList }" var="cvo">
										<tr>
											<td>
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
													<fmt:formatNumber value="${cvo.cost }" pattern="#,###" />
													₩
												</h5>
											</td>
											<td>
												<div class="product_count"></div>
											</td>
											<td>
												<h5>체크박스</h5>
											</td>
										</tr>
									</c:forEach>


									<tr class="bottom_button">
										<td><a class="primary-btn" href="#">삭제하기</a> <a
											class="primary-btn" href="#">장바구니</a></td>
										<td></td>
										<td></td>
										<td>
											<div class="cupon_text d-flex align-items-center">
												<a class="primary-btn" href="#">Apply</a> <a class="button"
													href="#">버튼</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="news" role="tabpanel" aria-labelledby="news-tab">
					<div class="cart_inner">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<c:forEach items="${nList }" var="nvo">
										<tr>
											<td>
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
											<td>
												<h5></h5>
											</td>
											<td>
												<div class="product_count"></div>
											</td>
											<td>
												<h5>체크박스</h5>
											</td>
										</tr>
									</c:forEach>


									<tr class="bottom_button">
										<td><a class="primary-btn" href="#">삭제하기</a></td>
										<td></td>
										<td></td>
										<td>
											<div class="cupon_text d-flex align-items-center">
												<a class="primary-btn" href="#">Apply</a> <a class="button"
													href="#">버튼</a>
											</div>
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