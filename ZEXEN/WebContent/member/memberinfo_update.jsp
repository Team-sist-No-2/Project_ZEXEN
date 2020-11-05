<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/*    #wrap { text-align:center; } */


   .box { margin:0 auto; width:500px;/*   width:1200px; height:100px; *//*  background-color: rgb(255,153,0); */ }

   .row1 { margin:0 auto;}
   .login_box_area section-margin{margin:0 auto;}

   </style>
</head>

<body>
<section style="margin-top: 60px;">

    <div class="container" > 

    <h1 class="cont_tit">회원정보</h1>

      <div class="row">

      </div></div>

  </section>
  
  <div class="container" >

   <div class="box" >
      <section class="login_box_area section-margin">

            <div class="col-md-12">
               <div class="login_form_inner register_form_inner">
       
                  <h3>회원정보</h3>
                  <form class="row login_form" action="#/" id="register_form" >

                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.id }" class="" id="id" name="id" >

                     </div>

                    <div class="col-md-12 form-group">

                        <input type="text" value="${vo.name }" class="" id="name" name="name"  >
             	 	</div>
             
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.email }" class="" id="email" name="email"  >

                     </div>
                     
                     
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.tel }" class="" id="tel" name="tel"  >

                     </div>
                     
                      <div class="col-md-12 form-group">

                        <input type="text" value="${vo.sex }" class="" id="sex" name="sex"  >

                     </div>
                     
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.birthday }" class="" id="birthday" name="birthday"  >

                     </div>
                     
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.addr1 }" class="" id="addr1" name="addr1"  >

                     </div>
                     
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.addr2 }" class="" id="addr2" name="addr2"  >

                     </div>
                     
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.post }" class="" id="post" name="post"  >

                     </div>
                     
                     <div class="col-md-12 form-group">

                        <input type="text" value="${vo.pimg }" class="" id="pimg" name="pimg"  >

                     </div>
                     
                     
                     
                      <!-- 회원정보변경버튼 -->

                     <div class="col-md-12 form-group">

                       
                      
                        <a href="../member/memberinfo.do">  
                        <button type="button" value="submit" id="logBtn" class="button button-login w-100">수정하기</button>
                        </a>

                     </div>

                  </form>

               </div>

            </div>

         </div>

         

</div>


   </section>
   <script src="vendors/jquery/jquery-3.2.1.min.js"></script>

  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>

  <script src="vendors/skrollr.min.js"></script>

  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>

  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>

  <script src="vendors/jquery.ajaxchimp.min.js"></script>

  <script src="vendors/mail-script.js"></script>

  <script src="js/main.js"></script>
   
</body>
</html>

