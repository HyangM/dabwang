<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form>
		<h3>중개사무소 정보</h3>
			<input type="hidden" id="agentId" value="${postAuth.agentId}">
			<img src="/media/${postAuth.typeImage}" width="250px;" height="360px;">
  		<div class="form-group ">
			<label>아이디</label>
			<input type="text" class="form-control" value="${postAuth.email}" readonly="readonly">
		</div>
		<div class="form-group ">
			<label>이름</label>
			<input type="text" class="form-control" value="${postAuth.name}" readonly="readonly">
		</div>
		<div class="form-group ">
			<label>중개사무소 이름</label>
			<input type="text" class="form-control" value="${postAuth.typeName}" readonly="readonly">
		</div>
		<div class="form-group ">
			<label>중개사무소 등록번호</label>
			<input type="number" class="form-control" value="${postAuth.typeNum}" readonly="readonly">
		</div>
		
	</form>	
		<input id="appr_btn" type="submit" value="공인중개사 승인하기" class="btn btn-outline-info col-12 py-3 px-5">
</div>
<br />
<br />
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/jquery.animateNumber.min.js"></script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/jquery.waypoints.min.js"></script>
<script src="/js/jquery.stellar.min.js"></script>
<script>
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
			location.href = '/typeApprList';
			}else if (r.msg == 'fail') {
				alert('권한 승인 실패');
			}
		}).fail(function(r) {
			alert('권한 승인 실패');
		});

	});

</script>
<%@ include file="include/footer.jsp"%>