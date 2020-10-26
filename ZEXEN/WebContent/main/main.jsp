<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>젝슨게임</title>
  <link rel="icon" href="../assets/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../assets/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="../assets/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../assets/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../assets/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../assets/vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="../assets/css/style.css">
  

 
  
</head>
<body>


  <!--================ Start Header Menu Area =================-->
	<jsp:include page="../main/header.jsp"></jsp:include>
  <!--================ End Header Menu Area =================-->

  <!-- ================ Start Home ================= -->
  	<h1>${msg }</h1>
	<jsp:include page="${main_jsp }"></jsp:include>
  <!--================== End Home =================-->

  <!--================ Start footer Area  =================-->	
	<jsp:include page="../main/footer.jsp"></jsp:include>
  <!--================ End footer Area  =================-->


  <script src="../assets/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../assets/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendors/skrollr.min.js"></script>
  <script src="../assets/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../assets/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../assets/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../assets/vendors/mail-script.js"></script>
  <script src="../assets/js/main.js"></script>
</body>
</html>