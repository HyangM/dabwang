<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>
<div class="container col-md-4 bg-light p-5 contact-form">
	<form>
		<h3>로그인</h3>
		<div class="form-group">
			<input id="email" type="text" class="form-control" placeholder="이메일">
		</div>
		<div class="form-group">
			<input id="password" type="password" class="form-control" placeholder="비밀번호">
		</div>
		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox"> 아이디 기억하기
			</label> 
			
			<a class="float-right" href="/">비밀번호 찾기</a>
		</div>

	</form>
	<input id="login-btn" type="submit" value="로그인" class="btn btn-outline-primary col-12 py-3 px-5">
	<br/>
	<br/>
	<a href="/join" class="btn btn-outline-warning col-12 py-3 px-5">회원가입</a>
</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>

<script>
	$('#login-btn').on('click', function() {
		var data = {
			email : $('#email').val(),
			password : $('#password').val()
		}
		
		$.ajax({
			type : 'POST',
			url : '/login',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r) {
			if(r.msg  == 'ok'){
			alert('로그인 성공');
			location.href = "/"
			}else if(r.msg  == 'fail'){
				alert('아이디와 비밀번호를 확인하세요.');
			}
		}).fail(function(r) {
			console.log(r);
			alert('로그인 실패');

		});
	});
</script>

<%@ include file="include/footer.jsp"%>