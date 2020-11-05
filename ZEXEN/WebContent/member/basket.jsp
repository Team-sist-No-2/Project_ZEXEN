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
	$("input:checkbox[id='gAllBtn']").prop("checked", true);
	$("input:checkbox[class='gcb']").prop("checked", true);
	$("input:checkbox[id='cAllBtn']").prop("checked", true);
	$("input:checkbox[class='ccb']").prop("checked", true);
});


$(function(){ //페이지 로딩되자마자 게임페이지에서, 체크되어진 게임들의 가격을 총 가격 출력하는 gtotal.text()에 뿌린다
	var sum = 0;
 	var count = $('.gcb').length;
 	for(var i=0; i < count; i++ ){
 	       if( gForm.basket_no[i].checked == true ){
 		    sum += parseInt(gForm.hprice[i].value);
 	       }
 	   }
 			let gtotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	
				$.ajax({
					type:'post',
					url:'../member/basket.do',
				 	success: function(result){
					 	$('#gtotal').text(gtotal+' '+'₩');
				 	}
				})
});

$(function(){
	$('.gcb').click(function(){ //게임 체크박스 누를때마다, 체크되어진 게임들의 가격을 총 가격 출력하는 gtotal.text()에 뿌린다
	console.log("게임체크박스");
	var sum = 0;
 	var count = $('.gcb').length;
 	for(var i=0; i < count; i++ ){
 	       if( gForm.basket_no[i].checked == true ){
 		    sum += parseInt(gForm.hprice[i].value);
 	       }
 	   }
 			let gtotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	
				$.ajax({
					type:'post',
					url:'../member/basket.do',
				 	success: function(result){
					 	$('#gtotal').text(gtotal+' '+'₩');
				 	}
				})
				
	});
				
});

// $(function(){ //페이지 로딩되자마자 컴퓨터페이지에서, 체크되어진 컴퓨터들의 가격을 총 가격 출력하는 cctotal.text()에 뿌린다
// 	var sum = 0;
//  	var count = $('.ccb').length;
//  	console.log(count);
//  	console.log(cFom.cbasket_no[1]);
//  	for(var i=0; i < count; i++ ){
//  	       if( cForm.cbasket_no[i].checked == true ){
 	    	  
//  		    sum += parseInt(gForm.hcost[i].value);
//  	       }
//  	   }
//  			let ctotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	
// 				$.ajax({
// 					type:'post',
// 					url:'../member/basket.do',
// 				 	success: function(result){
// 					 	$('#cctotal').text(ctotal+' '+'₩');
// 				 	}
// 				})
// });

// $(function(){
// 	$('.ccb').click(function(){ //컴퓨터 체크박스 누를때마다, 체크되어진 컴퓨터들의 가격을 총 가격 출력하는 cctotal.text()에 뿌린다
// 	console.log("컴퓨터체크박스");
// 	var sum = 0;
//  	var count = $('.ccb').length;
//  	for(var i=0; i < count; i++ ){
//  	       if( cForm.cbasket_no[i].checked == true ){
//  		    sum += parseInt(cForm.hcost[i].value);
//  	       }
//  	   }
//  			let ctotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	
// 				$.ajax({
// 					type:'post',
// 					url:'../member/basket.do',
// 				 	success: function(result){
// 					 	$('#cctotal').text(ctotal+' '+'₩');
// 				 	}
// 				})
				
// 	});
				
// });


$(function(){
	$('#gAllBtn').click(function(){ //올버튼 클릭시 모든 체크박스 체크, 해제
		let len=$('.gcb:checked').length; //체크된 박스의 개수
		console.log("len");
		if(len==0) //올버튼 눌렀는데 체크된게 없으면
			{
				$("input:checkbox[class='gcb']").prop("checked", true);
				$("input:checkbox[id='gAllBtn']").prop("checked", true);
				
				
				//체크된 모든 게임의 가격
				var sum = 0;
			 	var count = $('.gcb').length;
			 	for(var i=0; i < count; i++ ){
			 	       if( gForm.basket_no[i].checked == true ){
			 		    sum += parseInt(gForm.hprice[i].value);
			 	       }
			 	   }
			 			let gtotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			 	
							$.ajax({
								type:'post',
								url:'../member/basket.do',
							 	success: function(result){
								 	$('#gtotal').text(gtotal+' '+'₩');
							 	}
							})
			}
		else //올버튼 눌렀는데 체크된게 있을때
			{
				$("input:checkbox[class='gcb']").prop("checked", false);
				$("input:checkbox[id='gAllBtn']").prop("checked", false);
				
				//체크해체된 모든 게임의 가격(0원)
				var sum = 0;
			 	var count = $('.gcb').length;
			 	for(var i=0; i < count; i++ ){
			 	       if( gForm.basket_no[i].checked == true ){
			 		    sum += parseInt(gForm.hprice[i].value);
			 	       }
			 	   }
			 			let gtotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			 	
							$.ajax({
								type:'post',
								url:'../member/basket.do',
							 	success: function(result){
								 	$('#gtotal').text(gtotal+' '+'₩');
							 	}
							})
			}
	})
	
	$('.gcb').click(function(){
		let len=$('.gcb:checked').length;
		if(len==$('#gcnt').val())
			{
				$("input:checkbox[id='gAllBtn']").prop("checked", true);
			}
		else
			{
				$("input:checkbox[id='gAllBtn']").prop("checked", false);
			}
	})
	
	$('#cAllBtn').click(function(){
		let len=$('.ccb:checked').length;
		if(len==0)
			{
				$("input:checkbox[class='ccb']").prop("checked", true);
				$("input:checkbox[id='cAllBtn']").prop("checked", true);
				
				var sum = 0;
			 	var count = $('.ccb').length;  //컴퓨터 대수
			 	
			 	for(var i=0; i < count; i++ ){ //컴퓨터 대수 만큼 for문 돌리는데
			 	       if( cForm.cbasket_no[i].checked == true ){  //for문 돌아가면서 체크되어진! 컴퓨터만
			 		    sum += parseInt(cForm.hcost[i].value);
			 	       }
			 	   }
			 			let ctotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							$.ajax({
								type:'post',
								url:'../member/basket.do',
							 	success: function(result){
								 	$('#cctotal').text(ctotal+' '+'₩');
							 	}	
							})
			}
		else
			{
				$("input:checkbox[class='ccb']").prop("checked", false);
				$("input:checkbox[id='cAllBtn']").prop("checked", false);
				
				var sum = 0;
			 	var count = $('.ccb').length;  //컴퓨터 대수
			 	
			 	for(var i=0; i < count; i++ ){ //컴퓨터 대수 만큼 for문 돌리는데
			 	       if( cForm.cbasket_no[i].checked == true ){  //for문 돌아가면서 체크되어진! 컴퓨터만
			 		    sum += parseInt(cForm.hcost[i].value);
			 	       }
			 	   }
			 			let ctotal=sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							$.ajax({
								type:'post',
								url:'../member/basket.do',
							 	success: function(result){
								 	$('#cctotal').text(ctotal+' '+'₩');
							 	}	
							})
			}
	})
	
	$('.ccb').click(function(){
		let len=$('.ccb:checked').length;
		if(len==$('#ccnt').val())
			{
				$("input:checkbox[id='cAllBtn']").prop("checked", true);
			}
		else
			{
				$("input:checkbox[id='cAllBtn']").prop("checked", false);
			}
	})
	
	
	$('#gbasketDelete').click(function(){ //체크된 게임 모두 지우기
		$('#gForm').submit();
	});

	$('#cbasketDelete').click(function(){ //체크된 컴퓨터 모두 지우기
		$('#cForm').submit();
	});
	
	
	$('.increase').on('click', function () { //컴퓨터 대수 올리기
// 		let test=$(this).attr(cost);
// 		console.log(test);	
	
		let id=$(this).attr("id_value");     // 컴퓨터 대수(테이블에 저장된) 출력되는 텍스트박스의 id
		let basket_no=$(this).attr("data_value"); //테이블에서 UPDATE 할 때 넣을 basket_no값
		
		let count=$('#'+id).val(); //컴퓨터 대수(테이블에 저장된) 출력되는 텍스트박스의 대수를 읽어옴
		count=Number(count)+1;     //업버튼을 눌렀으니 출력되는 텍스트 박스에 +1
		$('#'+id).val(count);      // 컴퓨터 대수 출력되는 텍스트박스 출력값을 +1한 값으로 바꿈
		
		let costid=$(this).attr("costid");   //해당 행의 컴퓨터 가격을 출력할 맨오른쪽 열의 id
		let comcost=$(this).attr("cost");	 //해당 행의 컴퓨터 한 대당 가격
		ctotal=Number(comcost)*Number(count) //컴퓨터대수 X 가격
		ctotal=ctotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); //3자리 마다 자르기
		$('#'+costid).text(ctotal); //한 컴퓨터당 대수X가격 보여주는 로직
		
		$.ajax({
			type:'post',
			url:'../member/basket_cnt_update.do',
			data:{basket_no:basket_no,count:count},
		 	success: function(result){
			 console.log("업버튼완료");
		 	}
		})
	});
	
	$('.reduced').on('click', function () { //컴퓨터 대수 내리기
		let id=$(this).attr("id_value");    // 컴퓨터 대수(테이블에 저장된) 출력되는 텍스트박스의 id
		let basket_no=$(this).attr("data_value"); //테이블에서 UPDATE 할 때 넣을 basket_no값
		 
		let count=$('#'+id).val(); //컴퓨터 대수(테이블에 저장된) 출력되는 텍스트박스의 대수를 읽어옴
		count=Number(count)-1;     //다운버튼을 눌렀으니 출력되는 텍스트 박스에 -1
		$('#'+id).val(count);      // 컴퓨터 대수 출력되는 텍스트박스 출력값을 -1한 값으로 바꿈
		
		let costid=$(this).attr("costid");   //해당 행의 컴퓨터 가격을 출력할 맨오른쪽 열의 id
		let comcost=$(this).attr("cost");	 //해당 행의 컴퓨터 한 대당 가격
		ctotal=Number(comcost)*Number(count) //컴퓨터대수 X 가격
		ctotal=ctotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); //3자리 마다 자르기
		$('#'+costid).text(ctotal); //한 컴퓨터당 대수X가격 보여주는 로직
		
		$.ajax({
			type:'post',
			url:'../member/basket_cnt_update.do',
			data:{basket_no:basket_no,count:count},
		 	success: function(result){
			 console.log("다운버튼완료");
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
                              <input type="hidden" value="${gvo.price }" name="hprice"> <!-- 게임의 토탈가격용 -->
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
										<h5 id="gtotal"></h5>
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
                        
			<c:if test="${fn:length(gList)!=0}"> <button class="primary-btn" style="background-color: #FA00A2" id="gbasketDelete">선택 삭제</button> </c:if> 
                                      <input type="hidden" value="${fn:length(gList)}" id="gcnt">
                                      
                                      <c:if test="${fn:length(gList)!=0}"><button class="primary-btn" onclick="alert('구매완료')">구매</button></c:if>
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
                              <input type="checkbox" class="ccb" name="cbasket_no" value="${cvo.cbasket_no }">
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
                              	 <h5 style="text-align: center">
                              	 
                              	 <input type="hidden" value="${cvo.cost* cvo.cbasket_cnt}" id="comCost" name="hcost">
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
                                 <div class="product_count">
                                      <input type="text" name="qty" id="sst${status.index}" maxlength="12" value="${cvo.cbasket_cnt}" title="Quantity:"
                                          class="input-text qty">
                                      <button onclick="var result = document.getElementById('sst${status.index}'); var sst${status.index} = result.value; if( !isNaN( sst${status.index} )) return false;"
                                          class="increase items-count" data_value="${cvo.cbasket_no }" id_value="sst${status.index}" costid="costid${status.index}" cost="${cvo.cost}" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                      <button onclick="var result = document.getElementById('sst${status.index}'); var sst${status.index} = result.value; if( !isNaN( sst${status.index} ) &amp;&amp; sst${status.index} > 0 ) return false;"
                                          class="reduced items-count"  data_value="${cvo.cbasket_no }" id_value="sst${status.index}" costid="costid${status.index}" cost="${cvo.cost}" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                  </div>
                              </td>
                              <td>
                                  <h5 style="text-align: center; width: 50px" id="costid${status.index}">
                                  <fmt:formatNumber value="${cvo.cost* cvo.cbasket_cnt}" pattern="#,###" />
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
										<h5 id="cctotal" style="width: 50px"></h5>
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
                        
			<c:if test="${fn:length(cList)!=0}"> <button class="primary-btn" style="background-color: #FA00A2" id="cbasketDelete">선택 삭제</button> </c:if> 
                                      <input type="hidden" value="${fn:length(cList)}" id="ccnt"> 
                                      
                                      <c:if test="${fn:length(cList)!=0}"><button class="primary-btn" onclick="alert('구매완료')" id="buyBtn">구매</button></c:if> 
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