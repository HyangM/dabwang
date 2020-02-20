<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form action ="/join/jointype" method="POST" enctype="multipart/form-data">
		<h3>중개사무소 정보</h3>
 <%-- 		<input type="hidden" name="email" value="${email}" /> --%>
		<div class="form-group ">
			<label>중개사무소명</label>
			<input type="text" name="typeName" class="form-control" placeholder="상호명" required="required">
		</div>
		
		<div class="form-group ">
			<label>중개등록번호</label>
			<input type="text" name="typeNum" class="form-control" placeholder="중개등록번호" required="required">
		</div>
		
		<div class="form-group ">
			<label>사업자등록증</label>
			<input type="file" name="typeImage" class="form-control" required="required">
		</div>
		

	<input id="join-btn" type="submit" value="인증하여 가입하기" class="btn btn-outline-warning col-12 py-3 px-5">		
	</form>	
</div>
<br />
<br />

<%@ include file="../include/footer.jsp"%>