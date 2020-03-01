<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container col-5 bg-light p-5 contact-form">
	<form>
		<h3>비밀번호 변경하기</h3>
		<div class="form-group">
			<input type="email" class="form-control" placeholder="이메일 입력" id="email" 
				required="required" maxlength="30" onKeyup="this.value=this.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'')">
		</div>
		<div class="form-group">
			<input type="text" class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
				placeholder="핸드폰번호 - 제외하여 입력하세요." id="phone" required="required" maxlength="11">
		</div>
			<div id="new_password"></div>
		<br/>
	</form>
	<div class="container text-center">
		<div id = "new_identify"></div>
		<input id="identify" type="submit" onclick="identify()"value="본인확인하기" class="btn btn-outline-primary col-10 py-3 px-5">
	</div>
</div>
<br/>
<br/>

<!-- 제이쿼리 -->
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>
<!-- 제이쿼리 끝-->
<script src="../js/identifyVer.js"></script>
<%@ include file="../include/footer.jsp"%>