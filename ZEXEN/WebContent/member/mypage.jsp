<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<section class="order_details section-margin--small">
    <div class="container" > 
    <h1 class="cont_tit" style="">마이페이지</h1>

<p class="text-center billing-alert">나의 주문처리 현황</p>




<div class="order_details_table" style="margin-bottom:30px">
<h2>Order Details</h2>
<div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <th scope="col">Product</th>
        <th scope="col">Quantity</th>
        <th scope="col">Total</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <p><b>PHASMOPHOBIA</b>
          <br>공포 온라인 협동 멀티플레이어</br>
          </p>
        </td>
        <td>
          <h5>x 01</h5>
        </td>
        <td>
          <p>14,500 ₩</p>
        </td>
      </tr>
      <tr>
        <td>

          <h4>Subtotal</h4>
        </td>
        <td>
          <h5></h5>
        </td>
        <td>
          <p>14,500 ₩</p>
        </td>
      </tr>
      <tr>
        <td>
          <h4>Shipping</h4>
        </td>
        <td>
          <h5></h5>
        </td>
        <td>
          <p>Flat rate: 0 ₩ </p>
        </td>
      </tr>
      <tr>
        <td>
          <h4>Total</h4>
        </td>
        <td>
          <h5></h5>
        </td>
        <td>
          <h4>14,500 ₩</h4>
        </td>
      </tr>
    </tbody>
  </table>
</div>
</div>
</div>

<div class="container">
<div class="row mb-5">
<div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
<div class="confirmation-card" style="margin-bottom:20px">
<p style="text-align: center;">
 <img src="https://img.icons8.com/pastel-glyph/50/000000/regular-file.png" align="center"/>
 </p>
  <h3 class="text-center billing-title"><b>ORDER</b></h3>
  <table class="order-rable">
    <tr>
      <td>고객님께서 주문하신 상품의  주문내역을 확인하실 수 있습니다</td>
      </tr>
  </table>
</div>
</div>

<div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
<a href="../member/memberinfo.do">
<div class="confirmation-card">
<p style="text-align: center;">
<img src="https://img.icons8.com/pastel-glyph/50/000000/search-account.png"/>
</p>
  <h3 class="text-center billing-title"><b>PROFILE</b></h3>
  <table class="order-rable">
    <tr>
      <td>회원이신 고객님의 개인정보를 관리하는 공간입니다.</td>
      </tr>
  </table>
</div>
</a>
</div>


<div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
<a href="../member/wish.do">
<div class="confirmation-card">
<p style="text-align: center;">
<img src="https://img.icons8.com/pastel-glyph/50/000000/hearts.png"/>
</p>
  <h3 class="text-center billing-title"><b>WISHLIST</b></h3>
  <table class="order-rable">
    <tr>
      <td>관심상품으로 등록하신 상품의 목록을 보여드립니다.</td>
      </tr>
  </table>
</div>
</a>
</div>


<div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
<a href="../member/basket.do">
<div class="confirmation-card">
<p style="text-align: center;">
<img src="https://img.icons8.com/pastel-glyph/50/000000/shopping-cart--v1.png"/>
</p>
  <h4 class="text-center billing-title"><b>CART</b></h4>
  <table class="order-rable">
    <tr>
      <td>고객님의 장바구니의 목록을 보여드립니다.</td>
      </tr>
  </table>
</div>
</a>
</div>

<div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
<a href="../board/main.do">
<div class="confirmation-card">
<p style="text-align: center;">
<img src="https://img.icons8.com/pastel-glyph/50/000000/comments.png"/>
</p>
  <h4 class="text-center billing-title"><b>CONSURT</b></h4>
  <table class="order-rable">
    <tr>
      <td>고객님의 문의사항에 대하여 상담내용을 확인하실수 있습니다.</td>
      </tr>
  </table>
</div>
</a>
</div>

<div class="col-md-6 col-xl-4 mb-4 mb-xl-0">
<a href="../board/main.do">
<div class="confirmation-card">
<p style="text-align: center;">
<img src="https://img.icons8.com/pastel-glyph/50/000000/edit.png"/>
</p>
  <h4 class="text-center billing-title"><b>BOARD</b></h4>
  <table class="order-rable">
    <tr>
      <td>고객님께서 작성하신 게시물을 관리하는 공간입니다.</td>
      </tr>
  </table>
</div>
</a>
</div>

</div>
</section>
</body>
</html>