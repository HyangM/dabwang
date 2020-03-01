
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

	function passwordSame(){
		let password1 = $('#password').val();
		let password2 = $('#password2').val();
		if (password1 == password2) {
			$('#passwordSame').remove();
			if(password1.length<=4){
				$('#passwordSame').remove();
				var message = "<p id='passwordSame' class='text-danger text-left'>비밀번호 길이를 확인해주세요.</p>"
				$('#password2').after(message);
				}
		} else {
			$('#passwordSame').remove();
			var message = "<p id='passwordSame' class='text-danger text-left'>비밀번호가 일치하지 않습니다.</p>"
			$('#password2').after(message);
		}
	}
	
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
			if (r.msg == 'ok') {
				alert('새로운 비밀번호를 입력해주세요.');
				var password1 = "<div class='form-group'><input type='password' onblur ='passwordSame()' id='password' class='form-control' placeholder='비밀번호' maxlength='20' required='required'></div>"
				$('#new_password').append(password1);
				var password2 = "<div class='form-group'><input type='password' onblur ='passwordSame()' id='password2' class='form-control'  placeholder='비밀번호' maxlength='20' required='required'></div>"
				$('#new_password').append(password2);
				$('#identify').remove();
				var passwordReset = "<input id='passwordReset' onclick='passwordReset()' type='submit' value='비밀번호 변경하기' class='btn btn-outline-warning col-10 py-3 px-5'>"
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
		var password1 = $('#password').val();
		var password2 = $('#password2').val();
		if (password1 != password2) {
			alert('비밀번호가 일치하지 않습니다.');
		} if(password1.length<=4 || password2.length<=4){
			alert('비밀번호 길이를 확인해주세요.');
		} else {
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
	}	