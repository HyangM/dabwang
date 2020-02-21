<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form>
		<h3>회원가입</h3>
		<div class="form-group ">
			<input type="email" class="form-control" placeholder="이메일 입력"
				id="email" required="required">
		</div>

		<div class="form-group">
			<input type="password" class="form-control" id="password"
				placeholder="비밀번호" required="required">
		</div>

		<div class="form-group">
			<input type="password" class="form-control" id="password2"
				placeholder="비밀번호 확인" required="required">
		</div>

		<div class="form-group">
			<input type="text" class="form-control" id="name" placeholder="이름"
				required="required">
		</div>

		<div class="form-group">
			<input type="number" class="form-control"
				placeholder="핸드폰번호 - 제외하여 입력하세요." id="phone" required="required">
		</div>


		<div class="form-group">
			<label for="type">구분</label> <select id="type" size="1"
				class="form-control">
				<option selected="selected" id="1">세입자</option>
				<option id="2">방 주인</option>
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
	/* 	서하 구분에 공인중개사를 클릭하면 공인중개사 파일을 업로드할수잇는 파일창이 켜지는 스크립트 
	 $('select#type').change(function(e) {
	 var type = e.target.value;

	 if (type == '공인중개사') {
	 alert('공인중개사 자격증을 업로드 해주세요.');
	 var item = "<input type='file' class='form-control' id='typeImage'>";
	 $('#new').after(item);
	 } else {
	 $('#typeImage').remove();
	 }
	 });
	 */

	/* 서하 이메일 중복확인 ajax*/
	$('#email').focusout(function(e) {
		var email = e.target.value;
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
	});

	/* 서하 비밀번호가 일치하는지 여부*/
	$('#password2').focusout(function() {
		let password1 = $('#password').val();
		let password2 = $('#password2').val();
		
		if (password1 == password2) {
			$('#passwordSame').remove();
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
		} else {
			$('#passwordSame').remove();
			var message = "<p id='passwordSame'>비밀번호가 일치하지 않습니다.</p>"
			$('#password2').after(message);
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
			} else {
				
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
						location.href = '/login';
					} else if (r.msg == 'ok') {
						alert('회원가입완료');
						location.href = '/login';
					} else if (r.msg == 'fail') {
						alert('회원입정보를 확인하여주세요.');
					}
				}).fail(function(r) {
					alert('회원가입정보를 확인하여 주세요.');
				});
			}
		}
	});

	
</script>



<%@ include file="include/footer.jsp"%>