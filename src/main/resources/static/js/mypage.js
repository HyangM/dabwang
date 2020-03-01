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

$('#update-btn').on('click',function() {
	var password1 = $('#password').val();
	var password2 = $('#password2').val();
	
	if (password1 != password2) {
		alert('비밀번호가 일치하지 않습니다.');
	} if(password1.length<=4 || password2.length<=4){
		alert('비밀번호 길이를 확인해주세요.');
		} else{
		
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
	}
});