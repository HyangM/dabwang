<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form>
		<h3>회원가입</h3>
		<div class="form-group ">
			<input type="email" class="form-control" placeholder="이메일 입력"
				id="email" required="required" maxlength="30" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'')">
		</div>

		<div class="form-group">
			<input type="password" class="form-control" id="password"
				placeholder="비밀번호" maxlength="20" required="required">
		</div>

		<div class="form-group">
			<input type="password" class="form-control" id="password2"
				placeholder="비밀번호 확인" maxlength="20" required="required">
		</div>

		<div class="form-group">
			<input type="text" class="form-control" id="name" placeholder="이름" onKeyup="this.value=this.value.replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'')"
				maxlength="20" required="required">
		</div>

		<div class="form-group">
			<input type="text" class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
				placeholder="핸드폰번호 - 제외하여 입력하세요." id="phone" required="required" maxlength="11">
		</div>


		<div class="form-group">
			<label for="type">구분</label> <select id="type" size="1"
				class="form-control">
				<option selected="selected" id="1">세입자</option>
				<option id="2">방주인</option>
				<option id="3">공인중개사</option>
			</select>
		</div>
		<br />
	</form>
	<input id="join-btn" type="submit" value="회원가입" class="btn btn-outline-warning col-12 py-3 px-5">	
</div>
<br />
<br />

<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>

<script>

	/* 서하 이메일 중복확인, 이메일 유효성 검사*/
	$('#email').focusout(function(e) {
		var email = $('#email').val();
		if(email.search("@")== -1 || email.indexOf(".")<3){
			$('#overlap').remove();
			var message = "<p id='overlap' class='text-danger' value='overlap'>이메일 형식이 잘못되었습니다.</p>"
			$('#email').after(message);
		}else {
			var data = {
				email : email
			};
	
			$.ajax({type : 'POST',
					url : '/join/overlap',
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8',
					dataType : 'json'})
			.done(function(r) {
				if (r.msg == "dul") {
					$('#overlap').remove();
					var message = "<p id='overlap' class='text-danger' value='overlap'>중복된 아이디입니다.</p>"
					$('#email').after(message);
				} else if (r.msg == "ok") {
					$('#overlap').remove();
					var message = "<p id='overlap'>사용가능한 아이디입니다.</p>"
					$('#email').after(message);
					}
				}).fail(function(r) {
			});
		}
	});

	/* 서하 비밀번호가 일치하는지 여부, 길이가 4자리 이상인지 여부*/
	$('#password2').focusout(function() {
		let password1 = $('#password').val();
		let password2 = $('#password2').val();
		
		if (password1 == password2) {
			$('#passwordSame').remove();
			if(password1.length<=4){
				$('#passwordSame').remove();
				var message = "<p id='passwordSame' class='text-danger'>비밀번호 길이를 확인해주세요.</p>"
				$('#password2').after(message);
				}
			} else {
				$('#passwordSame').remove();
				var message = "<p id='passwordSame' class='text-danger'>비밀번호가 일치하지 않습니다.</p>"
				$('#password2').after(message);
			}
	});

	$('#password').focusout(function() {
		var password1 = $('#password').val();
		var password2 = $('#password2').val();
		
		if (password1 == password2) {
			$('#passwordSame').remove();
			if(password1.length<=4){
				$('#passwordSame').remove();
				var message = "<p id='passwordSame' class='text-danger'>비밀번호 길이를 확인해주세요.</p>"
				$('#password2').after(message);
				}
			} else {
				$('#passwordSame').remove();
				var message = "<p id='passwordSame' class='text-danger'>비밀번호가 일치하지 않습니다.</p>"
				$('#password2').after(message);
			}
	});


	$('#phone').focusout(function() {
		var phone = $('#phone').val();
		if (phone.length == 10 || phone.length == 11) {
			$('#phoneLimit').remove();
		} else {
			$('#phoneLimit').remove();
			var message = "<p id='phoneLimit' class='text-danger'>010을 포함하여 11자리 이내로 입력하여주세요.</p>"
			$('#phone').after(message);
		}
	});
	
	/* 서하 회원가입*/
	$('#join-btn').on('click', function() {
		var overlap = $('#overlap').attr('value');
		if (overlap == 'overlap') {
			alert('중복된 아이디입니다.');
		} else {
			var password1 = $('#password').val();
			var password2 = $('#password2').val();
			
			if (password1 != password2) {
				alert('비밀번호가 일치하지 않습니다.');
			} if(password1.length<=4){
				alert('비밀번호 길이를 확인해주세요.');
				}
			else {
				var phone = $('#phone').val();
				if (!(phone.length <= 11 && phone.length >= 10)) {
					alert('전화번호 자리수를 확인하세요.')
				} else{
					var data = {
						email : $('#email').val(),
						password : $('#password').val(),
						name : $('#name').val(),
						phone : $('#phone').val(),
						type : $('#type').val()
					}
					$.ajax({
						type : 'POST',
						url : '/join',
						data : JSON.stringify(data),
						contentType : 'application/json; charset=utf-8',
						dataType : 'json'
					}).done(function(r) {
						console.log(r);
						if (r.msg == 'typeImage') {
							alert('마이페이지에서 공인중개사 인증을 해주세요!');
							location.href = '/mypage';
						} else if (r.msg == 'ok') {
							alert('회원가입완료');
							location.href = '/';
						} else if (r.msg == 'fail') {
							alert('회원입정보를 확인하여주세요.');
						}
					}).fail(function(r) {
						alert('회원가입정보를 확인하여 주세요.');
					});
			}
			}
		}
	});

	
</script>



<%@ include file="../include/footer.jsp"%>