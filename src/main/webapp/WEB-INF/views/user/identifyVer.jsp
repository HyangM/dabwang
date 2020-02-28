<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container col-4 bg-light p-5 contact-form">
	<form class="text-center">
		<h3>비밀번호 변경하기</h3>
		<div class="form-group">
			<input type="email" class="form-control" placeholder="이메일 입력"
				id="email" required="required" maxlength="30" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'')">
		</div>
		<div class="form-group">
			<input type="text" class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
				placeholder="핸드폰번호 - 제외하여 입력하세요." id="phone" required="required" maxlength="11">
		</div>
			<div id="new_password"></div>
		<br/>
	</form>
	<div class="container text-center">
		<div id = "new_identify"></div>
		<input id="identify" type="submit" onclick="identify()"value="본인확인하기" class="btn btn-outline-primary col-10 py-3 px-5">
	</div>
</div>
<br/>
<br/>
<!-- 제이쿼리 -->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/jquery.animateNumber.min.js"></script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/jquery.waypoints.min.js"></script>
<script src="/js/jquery.stellar.min.js"></script>
<!-- 제이쿼리 끝-->
<script>

	$('#email').focusout(function(e) {
	var email = $('#email').val();
		if(email.search("@")== -1 || email.indexOf(".")<3){
			$('#overlap').remove();
			var message = "<p id='overlap' class='text-danger text-left' value='overlap' >이메일 형식이 잘못되었습니다.</p>"
			$('#email').after(message);
		}else{
			$('#overlap').remove();
		}
	});

	
	function identify(){
		var data = {
				email : $('#email').val(),
				phone : $('#phone').val()
			}
			$.ajax({
				type : 'POST',
				url : '/identifyVer',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json'
			}).done(function(r) {
				console.log(r);
				 if (r.msg == 'ok') {
					alert('새로운 비밀번호를 입력해주세요.');
					var password1 = "<div class='form-group'><input type='password' id='password' class='form-control' placeholder='비밀번호' maxlength='20' required='required'></div>"
					$('#new_password').after(password1);
					var password2 = "<div class='form-group'><input type='password' id='password2' class='form-control'  placeholder='비밀번호' maxlength='20' required='required'></div>"
						$('#new_password').after(password2);
					$('#identify').remove();
					var passwordReset = "<input id='passwordReset' onclick='passwordReset()' type='submit' value='본인확인하기' class='btn btn-outline-warning col-10 py-3 px-5'>"
						$('#new_identify').after(passwordReset);
					$('#email').attr("readonly","readonly");
					$('#phone').attr("readonly","readonly");
					
				} else if (r.msg == 'fail') {
					alert('회원정보를 확인하여주세요.');
				} 
			}).fail(function(r) {
				alert('회원가입정보를 확인하여 주세요.');
			});
	}

	function passwordReset(){
		var data = {
				email : $('#email').val(),
				password : $('#password').val()
			}

		$.ajax({
			type : 'POST',
			url : '/resetPassword',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r) {
			console.log(r);
			 if (r.msg == 'ok') {
				alert('비밀번호가 변경되었습니다.');
				location.href = '/';
			} else if (r.msg == 'fail') {
				alert('회원정보를 확인하여주세요.');
			} 
		}).fail(function(r) {
			alert('회원가입정보를 확인하여 주세요.');
		});
		
	}
	

	
</script>
<%@ include file="../include/footer.jsp"%>