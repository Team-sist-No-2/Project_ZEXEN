<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#log_id').val();
		if(id.trim()=="")
		{
			$('#log_id').focus();
			return;
		}
		
		let pwd=$('#log_pwd').val();
		if(pwd.trim()=="")
		{
			$('#log_pwd').focus();
			return;
		}
		
		$('#logFrm').submit(); //<form => action="파일명">
	});
	
});
</script>
</head>
<body>
<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4><b>WELCOMEb</b></h4>
							<p><b>Welcome to ZEXEN!</b></p>
							<a class="button button-account" href="../member/join.do">회원가입</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						
						
						<form class="row login_form" action="../member/login_ok.do" id="logFrm" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="log_id" name="id" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="log_pwd" name="pwd" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<button type="button" value="submit" id="logBtn" class="button button-login w-100">Log In</button>
								<a href="#">Forgot Password?</a>
							</div>
						</form>
						
						<c:choose>
						  <c:when test="${msg=='NOID' }">
						    <script>
						    alert("ID가 존재하지 않습니다!!");
						    history.back();
						    </script>
						  </c:when>
						  <c:when test="${msg=='NOPWD' }">
						    <script>
						    alert("비밀번호가 틀립니다!");
						    history.back();
						    </script>
						  </c:when>
						   <c:when test="${msg=='OK' }">
						    <script>
						    <c:redirect url="../main/main.do"/>
						    </script>
						  </c:when>
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>