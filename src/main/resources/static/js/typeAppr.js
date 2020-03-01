$('#appr_btn').on('click', function() {
	var data = {
		agentId : $('#agentId').val()
	};
	$.ajax({type : 'PUT',
		url : '/typeAppr',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json'})
	.done(function(r) {
		if (r.msg == 'ok') {
		alert('권한 승인 완료');
		location.href = '/typeApprList/1';
		}else if (r.msg == 'fail') {
			alert('권한 승인 실패');
		}
	}).fail(function(r) {
		alert('권한 승인 실패');
	});
});