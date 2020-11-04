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
/* .button-review { */
/*     padding: 0px 20px; */
/*     border-radius: 30px; */
/* } */
.cart_inner .table tbody tr.bottom_button td .cupon_text {
    margin-left: -248px;
}
.cart_inner .table tbody tr.bottom_button .button {
     padding: 7px 45px; 
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#gAllBtn').click(function(){
		let len=$('.gcb:checked').length;
		if(len==0)
			{
				$("input:checkbox[class='gcb']").prop("checked", true);
				$("input:checkbox[id='gAllBtn']").prop("checked", true);
			}
		else
			{
				$("input:checkbox[class='gcb']").prop("checked", false);
				$("input:checkbox[id='gAllBtn']").prop("checked", false);
			}
	})
	
	$('#basketDelete').click(function(){
		$('#gForm').submit();
	});
	
	$('.increase').click(function(){
		let id=$(this).attr("id_value");
		let count=$('#'+id).val();
		count=Number(count)+1;
		$('#'+id).val(count);
		
		$.ajax({
			type:'post',
			url:'../game/hate.do?game_no=${vo.game_no}',
			success:function(result)
			{
				console.log("싫어요 누른 결과는 "+result);
			}
	})
		
	});
})
</script>
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
			</ul>

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade <c:if test="${cate==1}">show active</c:if>" id="game" role="tabpanel" aria-labelledby="game-tab">
					<div class="cart_inner">
						<div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col"><span style="margin-left: 42px"><input type="checkbox" id="gAllBtn">      Image</span></th>
                              <th scope="col" style="text-align: center"></th>
                              <th scope="col"></th>
                              <th scope="col" style="text-align: center">Total</th>
                          </tr>
                      </thead>
                      <tbody>
                      
                      <form id="gForm" action="../member/basket_delete.do?cate=1" method="post">                     
                      <c:forEach items="${gList }" var="gvo" >
                          <tr>
                              <td colspan=2>
                              <input type="checkbox" class="gcb" name="basket_no" value="${gvo.gbasket_no }">
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${gvo.list_poster }" alt="" width="200px">
                                      </div>
                                      <div class="media-body">
                                          <p>${gvo.name }</p>	
                                      </div>
                                  </div>
                              	</td>
                              <td>
                                 <div class="product_count">
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
                          </tr>
                      </c:forEach>
                      </form>
                           
                          <tr>
                              <td>
                              </td>
                              <td>

                              </td>
                              <td>
                              </td>
                              <td>
                              <c:set var="result" value="0"/>
	                              <c:forEach items="${gList }" var="gvo" >
	                              	  <c:set var="result" value="${result+gvo.price }"/>
	                              </c:forEach>
	                              <c:choose>
									<c:when test="${result== 0}">
										<h5>0₩</h5>
									</c:when>
									<c:when test="${result!= 0}">
											<h5><fmt:formatNumber value="${result }" pattern="#,###" />
											₩</h5>
									</c:when>
								  </c:choose>
                              </td>
                          </tr>
                          
                          
                          <tr class="bottom_button">
                              <td>
                                  
                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="cupon_text d-flex align-items-center">
                        
			<c:if test="${fn:length(gList)!=0}"> <button class="primary-btn" style="background-color: #FA00A2" id="basketDelete">All Delete</button> </c:if> 
                                      
                                      
                                      <button class="primary-btn" onclick="alert('구매완료')">B U Y</button>
                                  </div>
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
                              <th scope="col"><span style="margin-left: 42px"><input type="checkbox" id="cAllBtn">      Image</span></th>
                              <th scope="col" style="text-align: center">price</th>
                              <th scope="col" style="text-align: center">Quantity</th>
                              <th scope="col" style="text-align: center">Total</th>
                          </tr>
                      </thead>
                      <tbody>
                      
                      <form id="cForm" action="../member/basket_delete.do?cate=2" method="post">                     
                      <c:forEach items="${cList }" var="cvo" varStatus="status">
                          <tr>
                              <td colspan>
                              <input type="checkbox" class="ccb" name="basket_no" value="${cvo.cbasket_no }">
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${cvo.image }" alt="" width="100px">
                                      </div>
                                      <div class="media-body">
                                          <p>${cvo.product }</p>	
                                      </div>
                                  </div>
                              	</td>
                              	<td>
                              	 <h5>$360.00</h5>
                              	</td>
                              <td>
                                 <div class="product_count">
                                      <input type="text" name="qty" id="sst${status.index}" maxlength="12" value="${cvo.cbasket_cnt}" title="Quantity:"
                                          class="input-text qty">
                                      <button onclick="var result = document.getElementById('sst${status.index}'); var sst${status.index} = result.value; if( !isNaN( sst${status.index} )) return false;"
                                          class="increase items-count" data_value="${cvo.cbasket_no }" id_value="sst${status.index}" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                      <button onclick="var result = document.getElementById('sst${status.index}'); var sst${status.index} = result.value; if( !isNaN( sst${status.index} ) &amp;&amp; sst${status.index} > 0 ) result.value--;return false;"
                                          class="reduced items-count"  data_value="${cvo.cbasket_no }" id_value="sst${status.index}" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                  </div>
                              </td>
                              <td>
                                  <h5 style="text-align: center">
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
                          </tr>
                      </c:forEach>
                      </form>
                           
                          <tr>
                              <td>
                              </td>
                              <td>

                              </td>
                              <td>
                              </td>
                              <td>
                              <c:set var="result" value="0"/>
	                              <c:forEach items="${cList }" var="cvo" >
	                              	  <c:set var="result" value="${result+cvo.cost }"/>
	                              </c:forEach>
	                              <c:choose>
									<c:when test="${result== 0}">
										<h5>0₩</h5>
									</c:when>
									<c:when test="${result!= 0}">
											<h5><fmt:formatNumber value="${result }" pattern="#,###" />
											₩</h5>
									</c:when>
								  </c:choose>
                              </td>
                          </tr>
                          
                          
                          <tr class="bottom_button">
                              <td>
                                  
                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="cupon_text d-flex align-items-center">
                        
			<c:if test="${fn:length(gList)!=0}"> <button class="primary-btn" style="background-color: #FA00A2" id="basketDelete">All Delete</button> </c:if> 
                                      
                                      
                                      <button class="primary-btn" onclick="alert('구매완료')" id="buyBtn">B U Y</button>
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