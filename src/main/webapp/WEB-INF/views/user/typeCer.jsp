<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<div class="container bg-light col-md-4 p-5">
	<form action ="/mypage/typeCer" method="POST" enctype="multipart/form-data">
		<h3>중개사무소 정보</h3>
		<c:choose>
			<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer eq 'Y'}">
		  		<input type="hidden"  value="${sessionScope.principal.userId}" />
					<div class="form-group ">
						<label>중개사무소명</label>
						<input type="text" class="form-control"value="${sessionScope.principal.typeName}"readonly="readonly">
					</div>
				
					<div class="form-group ">
						<label>사업자등록번호</label>
						<input type="text"class="form-control" value="${sessionScope.principal.typeNum}" readonly="readonly">
					</div>
						<label class="text-primary">인증된 공인중개사입니다. </label>
						<a href="/mypage" class="btn btn-primary col-12">마이페이지</a>
					
				</c:when>
			
			<c:otherwise>
				<input type="hidden" name="userId" value="${sessionScope.principal.userId}" />
					<div class="form-group ">
						<label>중개사무소명</label>
						<input type="text" name="typeName" class="form-control" placeholder="상호명" required="required" maxlength="20" >
					</div>
				
					<div class="form-group ">
						<label>사업자등록번호</label>
						<input id="typeNum" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" name="typeNum" class="form-control" placeholder="중개등록번호 -제외하여 입력하세요." required="required" maxlength="10" >
					</div>
					<div class="form-group ">
						<label>사업자등록증</label>
						<input type="file" name="typeImage" class="form-control" required="required">
					</div>
						<input id="join-btn" type="submit" value="공인중개사 인증하기" class="btn btn-outline-info col-12 py-3 px-5">		
			</c:otherwise>
		</c:choose>
	</form>	
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

<script src="/js/typeCer.js"> </script>

<%@ include file="../include/footer.jsp"%>