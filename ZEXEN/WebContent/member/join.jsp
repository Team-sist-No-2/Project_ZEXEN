<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.login_form .form-group
{
	margin-bottom: 0;
}


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
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function postfind() 
{
	new daum.Postcode({
		oncomplete:function(data)
		{
			$('#post').val(data.zonecode);
			// document.getElementById("post").value=data.zonecode
			// [일반 JScipit] document.getElementById("post").
			//					 ↓
			//          [Jquery] $('#post').
			$('#addr1').val(data.address);
			
		}
	}).open();
}

$(function(){
	$('#joinBtn').click(function(){
		//alert("aaa");
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		// 비밀번호
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		let pwd1=$('#pwd1').val();
		if(pwd1.trim()=="")
		{
			$('#pwd1').focus();
			return;
		}
		
		if(pwd!==pwd1)
		{
			alert("비밀번호를 다시 입력하세요!!");
			$('#pwd1').val("");
			$('#pwd1').focus();
			return;
		}
		
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
		let birthday=$('#birthday').val();
		if(birthday.trim()=="")
		{
			$('#birthday').focus();
			return;
		}
		
		let post=$('#post').val();
		if(post.trim()=="")
		{
			$('#post').focus();
			return;
		}
		
		let addr1=$('#addr1').val();
		if(addr1.trim()=="")
		{
			$('#addr1').focus();
			return;
		}
		
		// 데이어 전송 
		$('#joinFrm').submit();
	});
});

</script>
</head>
<body>
<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img" style="height: 700px;">
						<div class="hover">
							<h4>Already have an account?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="../member/login.do">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						
						
						<form class="row login_form" method="post" action="../member/join_ok.do" id="joinFrm" >
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="ID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'">
							</div>
							
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="pwd" name="pwd" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="pwd1" name="pwd1" placeholder="Confirm Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Confirm Password'">
							</div>
							
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Username" style="display: inline-block; width: 70%; float: left;" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
								<label style="font-size: 10pt; margin-top: 12pt; margin-right: 3pt;"><input type="radio" style="height: 10pt" class="form-control" id="sex" name="sex" value="man">남자</label>
								<label style="font-size: 10pt; margin-top: 12pt; margin-right: 3pt;"><input type="radio" style="height: 10pt" class="form-control" id="sex" name="sex" value="woman">여자</label>
							</div>
							
							
							
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address'">
             				</div>
						            
				            <div class="col-md-12 form-group">         				
								<div class="nice-select form-control" tabindex="0" style="margin-top: 6pt; height: 32px; line-height: 22px;">
								<span class="current">010</span><ul class="list">
								<li data-value="010" class="option selected focus">010</li>
								<li data-value="017" class="option">017</li>
								<li data-value="018" class="option">018</li></ul></div>
								<input type="text" class="form-control" id="tel2" name="tel2" style="display: inline-block; width: 33%; float: left; margin-left: 10px; text-align: center;">
								<input type="text" class="form-control" id="tel3" name="tel3" style="display: inline-block; width: 33%; float: left; margin-left: 10px; text-align: center;">
             				</div>

             				 	
            				<div class="col-md-12 form-group">
								<input type="date" class="form-control" id="birthday">
             				</div>
             				
              
              				<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="post" name="post" style="width: 35%; display: inline-block; text-align: center; margin-right: 10pt; font-weight: 600; float: left;">
								<button type="button" class="button button--active button-review" id="post_btn" onclick="postfind()" style="font-size: 10px; width: 120px; padding-right: 0px; padding-top: 5px; padding-left: 0px; padding-bottom: 5px; float: left; margin-top: 10pt;">
								우편번호 찾기
								</button>
							</div>
							
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'">
							</div>
							
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세 주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '상세 주소'">
							</div>
							
							<div class="col-md-12 form-group">
							
							<div class="btnxx" style="width: 100%" id="joinBtn"><a style="color: white">회원가입</a>
								  <div class="btnxx2"></div>
							</div>	
							
							
							</div>
						</form>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>