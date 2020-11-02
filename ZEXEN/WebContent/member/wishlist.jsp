<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--           <input type="button" class="btn btn-sm btn-primary" id="allBtn" -->
<!--           value="게임 목록"/>&nbsp;&nbsp; -->
<!--           <input type="button" class="btn btn-sm btn-primary" id="allBtn" -->
<!--           value="컴퓨터 목록"/> -->


  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">Product</th>
                              <th scope="col"></th>
                              <th scope="col"></th>
                              <th scope="col"></th>
                          </tr>
                      </thead>
                      <tbody>
                          
                          
                          <c:forEach items="${gList }" var="gvo">
                          <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${gvo.list_poster }" alt="" width="200px" height="100px">
                                      </div>
                                      <div class="media-body">
                                          <p>${gvo.name }</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5><fmt:formatNumber value="${gvo.price }" pattern="#,###"/> ₩</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                  </div>
                              </td>
                              <td>
                                  <h5>체크박스</h5>
                              </td>
                          </tr>
                         </c:forEach>
                         
                          
                          <tr class="bottom_button">
                              <td>
                                  <a class="primary-btn" href="#">삭제하기</a>
                                  <a class="primary-btn" href="#">장바구니</a>
                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="cupon_text d-flex align-items-center">
<!--                                       <input type="text" placeholder="Coupon Code"> -->
                                      <a class="primary-btn" href="#">Apply</a>
                                      <a class="button" href="#">버튼</a>
                                  </div>
                              </td>
                          </tr>
<!--                           <tr> -->
<!--                               <td> -->

<!--                               </td> -->
<!--                               <td> -->

<!--                               </td> -->
<!--                               <td> -->
<!--                                   <h5>Subtotal</h5> -->
<!--                               </td> -->
<!--                               <td> -->
<!--                                   <h5>$2160.00</h5> -->
<!--                               </td> -->
<!--                           </tr> -->
<!--                           <tr class="shipping_area"> -->
<!--                               <td class="d-none d-md-block"> -->

<!--                               </td> -->
<!--                               <td> -->

<!--                               </td> -->
<!--                               <td> -->
<!--                                   <h5>Shipping</h5> -->
<!--                               </td> -->
<!--                               <td> -->
<!--                                   <div class="shipping_box"> -->
<!--                                       <ul class="list"> -->
<!--                                           <li><a href="#">Flat Rate: $5.00</a></li> -->
<!--                                           <li><a href="#">Free Shipping</a></li> -->
<!--                                           <li><a href="#">Flat Rate: $10.00</a></li> -->
<!--                                           <li class="active"><a href="#">Local Delivery: $2.00</a></li> -->
<!--                                       </ul> -->
<!--                                       <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6> -->
<!--                                       <select class="shipping_select"> -->
<!--                                           <option value="1">Bangladesh</option> -->
<!--                                           <option value="2">India</option> -->
<!--                                           <option value="4">Pakistan</option> -->
<!--                                       </select> -->
<!--                                       <select class="shipping_select"> -->
<!--                                           <option value="1">Select a State</option> -->
<!--                                           <option value="2">Select a State</option> -->
<!--                                           <option value="4">Select a State</option> -->
<!--                                       </select> -->
<!--                                       <input type="text" placeholder="Postcode/Zipcode"> -->
<!--                                       <a class="gray_btn" href="#">Update Details</a> -->
<!--                                   </div> -->
<!--                               </td> -->
<!--                           </tr> -->
<!--                           <tr class="out_button_area"> -->
<!--                               <td class="d-none-l"> -->

<!--                               </td> -->
<!--                               <td class=""> -->

<!--                               </td> -->
<!--                               <td> -->

<!--                               </td> -->
<!--                               <td> -->
<!--                                   <div class="checkout_btn_inner d-flex align-items-center"> -->
<!--                                       <a class="gray_btn" href="#">Continue Shopping</a> -->
<!--                                       <a class="primary-btn ml-2" href="#">Proceed to checkout</a> -->
<!--                                   </div> -->
<!--                               </td> -->
<!--                           </tr> -->
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->



</body>
</html>