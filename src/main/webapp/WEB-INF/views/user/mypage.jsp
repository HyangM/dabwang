<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form>
		<h3>마이페이지</h3>
		<div class="form-group ">
			<input type="email" class="form-control" value="${principal.email }"
				id="email" readonly="readonly">
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
			<input type="text" class="form-control" id="name"
				value="${principal.name}" readonly="readonly">
		</div>

		<div class="form-group">
			<input type="number" class="form-control" id="phone"
				value="${principal.phone}" readonly="readonly">
		</div>


		<div class="form-group">
			<label for="type">구분</label>
				<c:choose>
					<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer eq 'N'}">
						<div class="input-group">
							<input type="text" class="form-control" value="${principal.type}"
								id="type" readonly="readonly">
							<div class="input-group-append">
								<a href="/mypage/typeCer" class="btn btn-primary">인증하기</a>
							</div>
						</div>
						<label class="text-danger">인증되지 않은 공인중개사입니다. </label>
					</c:when>
					
					
					<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer eq 'Y'}">
					<div class="input-group">
							<input type="text" class="form-control" value="${principal.type}"
								id="type" readonly="readonly">
							<div class="input-group-append">
								<a href="/mypage/typeCer" class="btn btn-primary">인증정보</a>
							</div>
						</div>
						<label class="text-primary">인증된 공인중개사입니다. </label>
					</c:when>
					
					
				<c:otherwise>
					<input type="text" class="form-control" value="${principal.type}" id="type" readonly="readonly">
				</c:otherwise>
				</c:choose>
				
		</div>
		<br /> 
	</form>
	<input id="update-btn" type="submit" value="수정하기" class="btn btn-outline-warning col-12 py-3 px-5">
</div>
<br />
<br />

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>

<script src="../js/mypage.js"></script>
<%@ include file="../include/footer.jsp"%>