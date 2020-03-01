<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container col-5 bg-light p-5 contact-form">
	<form>
		<h3>로그인</h3>
		<div class="form-group">
			<input onkeyup="enterkey();" id="email" type="text" class="form-control" placeholder="이메일" value="${cookie.emailCookie.value}">
		</div>
		<div class="form-group">
			<input onkeyup="enterkey();" id="password" type="password" class="form-control" placeholder="비밀번호">
		</div>
		</form>
		<div class="form-group form-check">
			<label class="form-check-label"> 
			<c:choose>
				<c:when test="${empty cookie.emailCookie.value}">
					<input id="rememberMe" class="form-check-input float-left" type="checkbox"> 아이디 기억하기
				</c:when>
				<c:otherwise>
					<input id="rememberMe" class="form-check-input" type="checkbox" checked="checked"> 아이디 기억하기
				</c:otherwise>
			</c:choose>
			
			</label> 
			<a href="/identifyVer" class="text-primary float-right">비밀번호 찾기</a>
		</div>
		
		
	
	<div class="container text-center">
		<input id="login-btn" type="submit" onclick="login()"value="로그인" class="btn btn-outline-primary col-10 py-3 px-5">
		<br/>
		<br/>
		<a href="/join" class="btn btn-outline-warning col-10 py-3 px-5">회원가입</a>
	</div>
</div>
	<br/>
	<br/>
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>

<script src="../js/login.js"></script>

<%@ include file="../include/footer.jsp"%>