<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form>
		<h3>마이페이지</h3>
		<div class="form-group ">
			<input type="email" class="form-control" value="${principal.email }"
				id="email" readonly="readonly">
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
			<input type="text" class="form-control" id="name"
				value="${principal.name}" readonly="readonly">
		</div>

		<div class="form-group">
			<input type="number" class="form-control" id="phone"
				value="${principal.phone}" readonly="readonly">
		</div>


		<div class="form-group">
			<label for="type">구분</label>
			<div class="input-group">
				<input type="text" class="form-control" value="${principal.type}"
					id="type" readonly="readonly">
				<div class="input-group-append">
					<a href="/mypage/typeCer" class="btn btn-info">인증하기</a>
				</div>
			</div>
			<c:choose>
					<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer == 0}">
						<label class="text-danger">인증되지 않은 공인중개사입니다. </label>
					</c:when>
					<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer == 1}">
						<label class="text-danger">인증받은 공인중개사입니다. </label>
					</c:when>
			</c:choose>
		</div>
		<br /> 
	</form>
	<input id="join-btn" type="submit" value="수정하기" class="btn btn-outline-warning col-12 py-3 px-5">
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

	$('#join-btn').on('click',function() {
		var data = {
				email : $('#email').val(),
				password : $('#password').val()
					}
		$.ajax({
			type : 'PUT',
			url : '/mypage/update',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r) {
			console.log(r);
			if (r.msg == 'ok') {
				alert('회원정보가 수정되었습니다.');
				location.href = '/';
			} else if (r.msg == 'fail') {
				alert('회원정보 수정에 실패하였습니다.');
			}
		}).fail(function(r) {
			console.log(r);
			alert('회원정보 수정에 실패하였습니다.');
		})
	});
	
</script>



<%@ include file="include/footer.jsp"%>