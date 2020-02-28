<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>
<section class="ftco-section contact-section" id="contact-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-12 heading-section ftco-animate p-4 p-lg-5">
				<h2 class="mb-4 text-center">관심목록</h2>
					<p class="text-center">총 ${likeRoomCount}개의 찜한 방이 있습니다.</p>
					<p class="text-center">찜한 방은 50개까지 저장됩니다.</p>
			</div>
			
			<c:forEach var="likeRoom" items="${likeRooms}">
				<div class="card m-2" style="width: 300px; height: 330px;">
					<a href="#" onclick="roomDetail(${likeRoom.roomId})"><img class="card-img-top" src="/media/${likeRoom.picName}" style="width:300px; height:160px; "></a>
						<div class="card-body">
							<p class="card-title text-Strong" style="font-size: 20px">${likeRoom.dealType} <c:choose>
								<c:when test="${0 ne likeRoom.yearRent}">${likeRoom.yearRent}</c:when>
								<c:when test="${0 ne likeRoom.monthRent}">${likeRoom.deposit}/${likeRoom.monthRent}</c:when>
								<c:otherwise>${likeRoom.dealRent}</c:otherwise>
							</c:choose>
							</p>
							<p style="font-size: 12px">${likeRoom.floor}층,${likeRoom.areaP}m²,관리비
								${likeRoom.MCost} 만</p>
							<p style="font-size: 15px">${likeRoom.title}</p>
						</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-migrate-3.0.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/jquery.animateNumber.min.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.stellar.min.js"></script>
<script>
	function roomDetail(roomId){
		location.href='/detail/'+roomId;
	}
</script>
<%@ include file="../include/footer.jsp"%>