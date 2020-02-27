<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/nav.jsp"%>
<!-- 윤정추가 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">    -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- 윤정추가 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->

<div class="container">
	<br /> <br />
	<table class="table table-borderless">
		<thead>
			<tr class="text-smaller text-secondary">
				<th>${room.roomType}(주방분리형)</th>
				<th>전용면적</th>
				<th>한달생활비</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span>${room.dealType} - ${room.yearRent}만원</span></td>
				<td><span>${room.areaM}㎡</span>
					<button type="button">평</button></td>
				<td>
					<div class="text-primary">(${room.mcost})만 원 + α</div>
				</td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>

	<table class="table pb-0">

		<tbody>
			<tr>
				<td style="background-color: #0649C0; color: white;">
					<span style="font-size: small;">미확인 매물 </span>
				</td>
				<td colspan="9" style="background-color: #3665CE; color: white;"></td>
			</tr>
			<tr style="font-size: small;">
				<td>• 해당층</td>
				<td>${room.floor}층</td>
				<td>• 공급면적</td>
				<td><span>${room.areaM}㎡</span><span>
						<button type="button" class="btn btn-outline-secondary btn-sm">평</button>
				</span></td>
				<td>• 엘리베이터</td>
				<td>${room.elevator}</td>
				<td>• 전세자금대출</td>
				<td>${room.lof}</td>
				<td>• 입주가능일</td>
				<td>${room.moveDay}</td>
			</tr>
		</tbody>
	</table>
	<hr />
</div>
<br />
<br />
<!-- 매물 사진들 -->
<div class="container">
	<table>
		<tbody>
			<tr class="item text-center">

				<c:forEach var="room_pic" items="${room_pics}" varStatus="status">
					<td><img src="/media/${room_pic.picName}" style="width: 270px; height: 180px;" onerror="javascript:this.src ='/images/kwon/unknown.jpg'" /></td>
					<c:if test="${((status.index+1) mod 4) == 0}">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<br /> <br />


	<div class="row">
		<div class="col-md-6">
			<h3>${room.title}</h3>
			<br />
			<h3>방1+큰거실구조(수정)</h3>

		</div>
		<div class="col-md-6">
			<p>★문의전체크II:해당금액은 ㅇㅣ자지원 적용된 금액입니다</p>
			<p>★ 계약시 항상 임차인 선순위 보장</p>
			<p>${room.content}</p>

			<br /> <br />

			<div class="container">
				<div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">상세설명 더보기</button>
					<div class="dropdown-menu">
						<span class="dropdown-item-text"> ★ 계약시 항상 임차인 선순위 보장<br /> <br /> ▣매물종류 : 투룸<br /> ▣실평수 : 15~16평<br /> ▣주차 : 가능<br /> ▣엘레베이터 : 있음<br /> ▣가격대비 많이 큰집<br />
							▣이.자.지.원 적용된 금액입니다 (최대지원)<br /> ▣전세자금은 만기일시상환으로 원금상환을 따로 안하셔도 됩니다<br /> <br /> ◎마음에 드시는 방 나올때까지 보여드립니다<br /> ◎매일 매일 답사를 거쳐 빠르게 매물업데이트하고있습니다<br /> ◎실사진만 올려서
							광고합니다<br /> ◎권리분석,공제증서등기본!!<br />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<hr />

<div class="container">

	
	<hr />
	<br /> <br /> <br />
	<section id="price-section">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h2 class="text-center">가격정보</h2>
				<br />
				<table class="table table-bordered text-center">
					<thead>
						<tr>
							<th>월세</th>
							<th>전세</th>
							<th>관리비</th>
							<th>주차비</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>-</td>
							<td>${room.yearRent}만원</td>
							<td>${room.mcost }만원<br />(기타)
							</td>
							<td>${room.parking }<br />(무료)
							</td>

						</tr>
					</tbody>
				</table>
				<br />
				<div class="card">
					<div class="row">
						<div class="col-sm-3">
							<div class="card-body text-center text-primary">한달 생활비</div>
						</div>
						<div class="col-sm-9">
							<div class="card-body">
								<h5 class="text-primary">${room.mcost}만
									원 + a <span class="text-secondary">(관리비+주차비)</span>
								</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</section>
	<br /> <br /> <br />


	<hr />
	<br /> <br />
	<section id="option-section">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h2 class="text-center">옵션</h2>
				<br />
				<table class="table table-borderless">
					<tbody>
						<tr class="item text-center">
							<c:forEach var="room_option" items="${room_options}" varStatus="status">
								<td><img src="/images/kwon/options/${room_option.optionName}" onerror="javascript:this.src ='/images/kwon/unknown.jpg'" /></td>
								<c:if test="${((status.index+1) mod 6) == 0}">
						</tr>
						<tr class="item text-center">
							</c:if>
							</c:forEach>
						</tr>
					</tbody>
				</table>

				<br />

			</div>
			<div class="col-sm-1"></div>
		</div>
	</section>
	<br /> <br /> <br />


	<hr />
	<br /> <br />

	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<h2 class="text-center">보안/안전시설(데이터 어디서 불러옴??)</h2>
			<br />

			<table class="table table-borderless">
				<tbody>
					<tr class="text-center">
						<td><img src="/images/kwon/safety/sft1.png" /><br /> 비디오폰</td>
						<td><img src="/images/kwon/safety/sft2.png" /><br /> 공동현관</td>
						<td><img src="/images/kwon/safety/sft3.png" /><br /> 경비원</td>
						<td><img src="/images/kwon/safety/sft4.png" /><br /> CCTV</td>
						<td><img src="/images/kwon/safety/sft5.png" /><br /> 방범창</td>
						<td><img src="/images/kwon/safety/sft6.png" /><br /> 인터폰</td>
					</tr>
				</tbody>
			</table>

			<br />

		</div>
		<div class="col-sm-1"></div>
	</div>

	<br /> <br /> <br />


	<hr />
	<br /> <br />
	<section id="location-section">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 text-center">
				<h3 class="text-center">
					위치 및 주변 시설 <a href="#" data-toggle="tooltip" data-placement="right"
						title="다방은 공인중개사무소의 매물정보 기밀 유지를 위해 매물의 정확한 위치를 표기하지 않습니다.
                    단, 매물 주변 지역 및 편의시설 정보를 확인할 수 있도록 반경 30m 안에서 매물이 위치해 있습니다.">⁙</a>
				</h3>
				<br />
				<h5>서울특별시 강서구 화곡동 --->실제위치를 지도에 나타내주는 걸로 변경하기.</h5>
				<br />
				<div class="card" id="map_card" style="width: 400px m-auto">
					<!--  <img class="card-img-top" src="/images/kwon/map1.png" alt=""> -->

					<!-- 실제 지도를 그리는 javascript API 불러오기. -->

					<!-- <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
					<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script> -->


					<!-- 지도 담을 영역 만들기 -->
					<div id="map" style="width: 800px; height: 400px;"></div>

					<div class="card-body" id="map_card_body">

						<table class="table table-borderless">
							<tbody>
								<tr class="text-center">
									<td colspan="2"></td>
									<td>편의시설</td>
									<td>안전시설</td>
									<td>학군정보</td>
									<td colspan="2"></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<br />
				<hr />
				<br />
				<div class="card text-center">
					<div class="card-body">
						<img src="/images/kwon/map2.png" />
					</div>
				</div>
				<br />

			</div>
			<div class="col-sm-1"></div>
		</div>
	</section>
	<br /> <br /> <br />

	<hr />
	
	<form:form action="/roomAppr" method="PUT" enctype="multipart/form-data">
		<div>
			<span><input type="checkbox" />매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없음을 승인합니다.</span>
		</div>
		<input type="hidden" name="agentId" value="${sessionScope.principal.userId}" id="agentId" />
		<input type="hidden" name="roomId" value="${room.roomId}" id="roomId" />
		
		<button type="submit" id="room--Approve" class="btn btn-primary">매물승인</button>	
	</form:form>
	
	
	
	
</div>

<script>
// $('#room--Approve').on('click',function(event){
// 	var data = {
// 		roomId : ${room.roomId},
// 		agentId : ${sessionScope.pricipal.userId}
// 	};

// 	$.ajax({
// 		type: 'PUT',
// 		url: '/room/',
// 		data: JSON.stringify(data),
// 		contentType : 'application/json; charset=utf-8',
// 		dataType : 'json'
// 	}).done(function(r){
// 		alert("로그인 성공");
// 		location.href = '/';
// 	}).fail(function(r){
// 		alert("로그인 실패");
// 	});
// });
//});
</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=services,clusterer,drawing"></script>
<!-- 지도를 띄우는 코드 작성하기 -->
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701,
				126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>



<br />
<br />
<%@ include file="../include/footer.jsp"%>