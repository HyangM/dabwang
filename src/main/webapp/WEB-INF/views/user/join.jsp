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

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>


<script src="../js/join.js"></script>
<%@ include file="../include/footer.jsp"%>