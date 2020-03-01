<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%@ include file="../include/nav.jsp"%>
<style>
.container > h4 {
	text-align: center;
}	
</style>
	<br/>
	<div class="container">
		<h4 class="mx-auto">매물 승인페이지</h4>
		<br/>
		<table class="table">
			<thead class="thead-dark">
				<tr class="text-center">
					<th>No.</th>
					<th>제목</th>
					<th>매물번호</th>
					<th>매물 위치</th>
					<th>요청날짜</th>
					<th>승인여부</th>
				</tr>
			</thead>
			<tbody>
			   <c:forEach var="roomApprOne" items="${roomApprBoard}">
					<tr>
						<td class="text-center">${roomApprOne.postId}</td>
						<td class="text-center"><a href="/roomAppr/${roomApprOne.roomId}">${roomApprOne.title}</a></td>
						<td class="text-center">${roomApprOne.roomId}</td>
						<td class="text-left">${roomApprOne.jibunAddr}</td>
						<td class="text-center">${fn:substring({roomApprOne.createDate},1,11)}</td>
						<c:choose>
							<c:when test="${roomApprOne.confirmYN eq 'N'}">
								<td class="text-center">미승인</td></c:when>
							<c:otherwise>
								<td class="text-center">승인</td></c:otherwise>
						</c:choose>
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${pageNo-1 == 0 }">
				<a href="#" onclick="prev()" class="btn btn-info col-2 float-left">이전페이지</a>
			</c:when>
			<c:otherwise>
				<a href="/typeApprList/${pageNo-1}"  class="btn btn-info col-2 float-left">이전페이지</a>
			</c:otherwise>	
		</c:choose>

<%-- 		<c:forTokens var="item" items="1,2,3,4,5" delims=",">
			<a href="/"class="btn btn-ingo btn-sm">${item}</a>
		</c:forTokens>
 --%>

		<c:choose>
			<c:when test="${pageNo>=lastPageNo}">
					<a href="#" onclick="next()" class="btn btn-info col-2 float-right">다음페이지</a>	
			</c:when>
			<c:otherwise>
				<a href="/typeApprList/${pageNo+1}" class="btn btn-info col-2 float-right">다음페이지</a>
			</c:otherwise>	
		</c:choose>	
		
	
	
	
	</div>
	<br/>
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

<script src="../js/apprList.js"></script>


<%@ include file="../include/footer.jsp"%>