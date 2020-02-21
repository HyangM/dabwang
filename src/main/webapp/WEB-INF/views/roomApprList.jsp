<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<%@ include file="include/nav.jsp"%>
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
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">요청자</th>
					<th class="text-center">날짜</th>
					<th class="text-center">승인여부</th>
				</tr>
			</thead>
			<tbody>
			   <c:forEach var="typeCer" items="">
					<tr>
						<td class="text-center"></td>
						<td class="text-center"><a href="/roomAppr/${typeCer.postId}">${typeCer.title}</a></td>
						<td class="text-center">${typeCer.name}</td>
						<td class="text-center">${fn:substring({typeCer.createDate},1,17)}</td>
						<td class="text-center">${typeCer.confirmYN}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<br/>
	

<%@ include file="include/footer.jsp"%>