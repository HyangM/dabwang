<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="../include/nav.jsp"%>
<!-- 윤정추가  -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">    -->
<!--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<div class="container">
	<br /> <br />
	<table class="table table-borderless">
		<thead>
			<tr class="text-secondary">
				<th>${room.roomType}</th>
				<th>공급면적</th>
				<th>한달생활비</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span>${room.dealType}
						<c:choose>
							<c:when test="${0 ne room.yearRent}">${room.yearRent} 만원</c:when>
							<c:when test="${0 ne room.monthRent}">${room.deposit}/${room.monthRent} 만원</c:when>
							<c:otherwise>${room.dealRent} 만원</c:otherwise>
						</c:choose>
				</span></td>
				<td><span> 
					<fmt:formatNumber value="${room.areaM}" pattern=".00"></fmt:formatNumber>㎡</span>				
					<a href="#" data-toggle="tooltip" title="${room.areaP}평">
					<button type="button" class="btn btn-outline-info" id="areaP--button">평수</button>
					</a>
				</td>
				<td><div class="text-primary">
					<c:choose>
						<c:when test="${0 ne room.mcost}">${room.mcost} 만 원 + α</c:when>
						<c:otherwise>없음</c:otherwise>
					</c:choose></div>
				</td>
				<td class="text-right"><span>(주)${room.typeName}</span><br />
					<span>${room.name}</span></td>
				<td><span>
					<a href="#" data-toggle="popover" title="연락처 :<fmt:formatNumber var="phone" value="82${room.phone}" pattern="#####,####,####"></fmt:formatNumber><c:out value="${fn:replace(phone, ',', '-')}"/>" data-content="">
  					<button type="button" class="btn btn-outline-primary ml-auto">연락처보기</button></a></span>
  				</td>
			</tr>
		</tbody>
	</table>
	<span>❤10</span> <span>•</span> <span>📧 🔗</span> <span>•</span><span>🚨	허위매물신고</span>


	<table class="table">
		<tbody>
			<tr>
				<td colspan="3" style="background-color: #0649C0; color: white;">
					<span style="font-size: small;">확인매물 [<fmt:formatDate value="${room.createDate}" pattern="yy.MM.dd"></fmt:formatDate>]</span></td>
				<td colspan="6" style="background-color: #3665CE; color: white;">
					<span style="font-size: small;">방주인과 공인중개사가 거래정보를 확인한 매물입니다.</span></td>
				
			</tr>
			<tr>
				<td colspan="1" style="font-size: small;">• 해당층</td>
				<td colspan="2" style="font-size: small;">${room.floor}층</td>
				<td colspan="1" style="font-size: small;">• 공급면적</td> 
				<td colspan="2" style="font-size: small;">${room.areaM}㎡
					<span><button type="button" class="btn btn-outline-secondary btn-sm">평</button></span></td>
				<td colspan="1" style="font-size: small;">• 입주가능일</td>
				<td colspan="2" style="font-size: small;">${room.moveDay}</td>
			</tr>
			<tr>
				<td colspan="1" style="font-size: small;">• 전세자금대출</td>
				<td colspan="2" style="font-size: small;">
					<c:choose>
						<c:when test="${room.lof eq 'P'}">가능</c:when>
						<c:otherwise>불가능</c:otherwise>
					</c:choose>
				</td>
				<td colspan="1" style="font-size: small;">• 엘리베이터</td>
				<td colspan="2" style="font-size: small;">
					<c:choose>
						<c:when test="${room.elevator eq 'P'}">있음</c:when>
						<c:otherwise>없음</c:otherwise>
					</c:choose>
				</td>	
				<td colspan="1" style="font-size: small;">• 주차여부</td>
				<td colspan="2" style="font-size: small;">
					<c:choose>
						<c:when test="${room.parking eq 'P'}">가능</c:when>
						<c:otherwise>불가능</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
	
</div>
<br />
<br />
<!-- 매물 사진들 -->
<div class="container">
	<table class="text-center">
		<tbody class="text-center">
			<tr class="item text-center">

				<c:forEach var="room_pic" items="${room_pics}" varStatus="status">
				
 					<td><img src="/media/${room_pic.picName}" style="width: 275px; height: 180px;"
						onerror="javascript:this.src ='/images/kwon/unknown.jpg'" /></td>
					<c:if test="${((status.index+1) mod 4) == 0}">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<br /> <br />
	
	
	<div class="container">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        
        
      </div>
    </div>
  </div>
  
</div>
	
	
	
	
	
	
	
	
	
	
	


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
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">상세설명 더보기</button>
					<div class="dropdown-menu">
						<span class="dropdown-item-text"> ★ 계약시 항상 임차인 선순위 보장<br />
							<br /> ▣매물종류 : 투룸<br /> ▣실평수 : 15~16평<br /> ▣주차 : 가능<br />
							▣엘레베이터 : 있음<br /> ▣가격대비 많이 큰집<br /> ▣이.자.지.원 적용된 금액입니다 (최대지원)<br />
							▣전세자금은 만기일시상환으로 원금상환을 따로 안하셔도 됩니다<br /> <br /> ◎마음에 드시는 방 나올때까지
							보여드립니다<br /> ◎매일 매일 답사를 거쳐 빠르게 매물업데이트하고있습니다<br /> ◎실사진만 올려서
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

	<table class="table table-borderless">
		<tbody>
			<!--   <tr class="text-center" id="detail_menu" style="position: fixed; top: 100; width:100%;"> -->
			<tr class="text-center" id="detail_menu">
				""
				<td><a href="#option-section">옵션</a></td>
				<td><a href="#location-section">위치 및 주변시설</a></td>
				<td><a href="#score-section">다방면 스코어</a></td>
				<td><a href="#other-section">이 공인중개사의 다른 방</a></td>
			</tr>


		</tbody>
	</table>

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

							<c:forEach var="room_option" items="${room_options}"
								varStatus="status">

								<c:choose>
									<c:when test="${room_option.optionType eq 1}">
										<td><img
											src="/images/kwon/options/${room_option.optionName}"
											style="width: 70px; height: 80px;"
											onerror="javascript:this.src ='/images/kwon/unknown.jpg'" /></td>
										<c:if test="${((status.index+1) mod 6) == 0}">
						</tr>
						<tr class="item text-center">
							</c:if>
							</c:when>
							<c:otherwise></c:otherwise>
							</c:choose>
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
			<h2 class="text-center">보안/안전시설</h2>
			<br />
			<table class="table table-borderless">
				<tbody>
					<tr class="item text-center">


						<c:forEach var="room_option" items="${room_options}"
							varStatus="status">

							<c:choose>
								<c:when test="${room_option.optionType eq 2}">
									<td><img
										src="/images/kwon/options/${room_option.optionName}"
										style="width: 70px; height: 80px;"
										onerror="javascript:this.src ='/images/kwon/unknown.jpg'" /></td>
									<c:if test="${((status.index) mod 6) == 0}">
					</tr>
					<tr class="item text-center">
						</c:if>
						</c:when>
						<c:otherwise></c:otherwise>
						</c:choose>
						</c:forEach>
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
						title="다방은 공인중개사무소의 매물정보 기밀 유지를 위해 매물의 정확한 위치를 표기하지 않습니다. 단, 매물 주변 지역 및 편의시설 정보를 확인할 수 있도록 반경 30m 안에서 매물이 위치해 있습니다.">⁙</a>
				</h3>
				<br />
				<h5>서울특별시 강서구 화곡동</h5>
				<br />
				<div class="card" id="map_card">
					<!-- 지도 담을 영역 만들기 -->
					<div id="map" style="width: 100%; height: 400px;"></div>






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
	<br /> <br />
	<section id="score-section">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 text-center">
				<h3 class="text-center">다방면스코어</h3>
				<br /></br>
				<div>
					<img src="/images/kwon/kwon9.png" />
				</div>
				<br />


			</div>
			<div class="col-sm-1"></div>
		</div>
	</section>
	<br /> <br /> <br />


</div>
	<hr />
	<br /> <br />

<<<<<<< HEAD
	<section id="other-section">
		<div class="row">
			<div class="col-sm-1"></div>

			<div class="col-sm-10">
				<h3 class="text-center">이 공인중개사의 다른 방</h3>
				<br />
				<div class="card-deck">
					<div class="card">
						<img class="card-img-top" src="/images/kwon/room/room1.png" alt="">
						<div class="card-body">
							<p class="card-title">
								원룸<br />전세9000
							</p>
							<p class="card-text">5층, 23.14m², 관리비 6만 🇰🇷🍀💞9호선초역세권전세!!</p>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="/images/kwon/room/room2.png" alt="">
						<div class="card-body">
							<p class="card-title">
								원룸<br />전세5000
							</p>
							<p class="card-text">4층, 19.83m², 관리비 5만 ✨☘✅중기청 100%나오는 한번은
								봐야하는 꿀방</p>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="/images/kwon/room/room3.png" alt="">
=======
	<section class="ftco-section contact-section" id="contact-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-12 heading-section ftco-animate p-4 p-lg-5">
					<h3 class="text-center">이 공인중개사의 다른 방</h3><br/><br/>
				</div>
					<c:forEach var="otherRoom" items="${otherRooms}">
						<div class="card m-2" style="width: 300px; height: 330px;">
						<a href="#" onclick="roomDetail(${otherRoom.roomId})"><img class="card-img-top" src="/media/${otherRoom.picName}" style="width:300px; height:160px; "></a>
>>>>>>> 96f76bf0af31df60acbd836410267f781125896a
						<div class="card-body">
							<p class="card-title text-Strong" style="font-size: 20px">${otherRoom.dealType} <c:choose>
												<c:when test="${0 ne otherRoom.yearRent}">${otherRoom.yearRent}</c:when>
												<c:when test="${0 ne otherRoom.monthRent}">${otherRoom.deposit}/${otherRoom.monthRent}</c:when>
												<c:otherwise>${otherRoom.dealRent}</c:otherwise>
											</c:choose>
							</p>
<<<<<<< HEAD
							<p class="card-text">4층, 56.19m², 관리비 7만 ✨☘✅탁트인 투룸 화곡역 5분거리
								역세권까지!!</p>

=======
							<p style="font-size: 12px">${otherRoom.floor}층,${otherRoom.areaP}m²,관리비
										${otherRoom.MCost} 만</p>
							<p style="font-size: 15px">${otherRoom.title}</p>
							</div>
>>>>>>> 96f76bf0af31df60acbd836410267f781125896a
						</div>
					</c:forEach>
			</div>
		</div>
	</section>
	<br /> <br /> <br />



<!-- <script src="/js/detail.js" type="text/javascript"></script> -->

<script>






	function goSection() {
		document.location.href = "#option-section";
	}

	
</script>




<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=services,clusterer,drawing"></script>
<!-- 지도를 띄우는 코드 작성하기 -->
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


	function roomDetail(roomId){
		location.href='/detail/'+roomId;
	}



	
</script>



<br />
<br />
<%@ include file="../include/footer.jsp"%>