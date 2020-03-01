
	function enterkey() {
	    if (window.event.keyCode == 13) {
	         login();
	    }
	}

	function login(){
		if($('input:checkbox[id="rememberMe"]').is(":checked") == true){
			rememberMe=true;
		}else{
			rememberMe=false;
		}
		var data = {
				email : $('#email').val(),
				password : $('#password').val(),
				rememberMe : rememberMe
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
	}
