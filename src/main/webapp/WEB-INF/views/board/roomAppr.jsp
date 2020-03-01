<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@ include file="../include/nav.jsp"%>
<!-- 윤정추가  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<div class="container">
	<br /> <br />
	<table class="table table-borderless">
		<thead>
			<tr class="text-secondary">
				<th class="text-center">${room.roomType}</th>
				<th class="text-center">공급면적</th>
				<th class="text-center">한달생활비</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text-center"><span>${room.dealType} <c:choose>
							<c:when test="${0 ne room.yearRent}">${room.yearRent} 만원</c:when>
							<c:when test="${0 ne room.monthRent}">${room.deposit}/${room.monthRent} 만원</c:when>
							<c:otherwise>${room.dealRent} 만원</c:otherwise>
						</c:choose>
				</span></td>
				<td class="text-center"><span> <fmt:formatNumber value="${room.areaM}" pattern=".00"></fmt:formatNumber>㎡
				</span> <a href="#" data-toggle="tooltip" title="${room.areaP}평">
						<button type="button" class="btn btn-outline-info" id="areaP--button">평수</button>
				</a></td>
				<td class="text-center"><div class="text-primary">
						<c:choose>
							<c:when test="${0 ne room.mcost}">${room.mcost} 만 원 + α</c:when>
							<c:otherwise>없음</c:otherwise>
						</c:choose>
					</div></td>
				<td class="text-right"></td>
				<td class="text-center"></td>
			</tr>
		</tbody>
	</table>


	<table class="table">
		<tbody>
			<tr>
				<td colspan="9" style="background-color: #0649C0; color: white;">
				<span style="font-size: small;">미승인 매물</span></td>
			</tr>
			<tr>
				<td colspan="1" style="font-size: small;">• 해당층</td>
				<td colspan="2" style="font-size: small;">${room.floor}층</td>
				<td colspan="1" style="font-size: small;">• 공급면적</td>
				<td colspan="2" style="font-size: small;">${room.areaM}㎡    <span><button type="button"
							class="btn btn-outline-secondary btn-sm">평</button></span></td>
				<td colspan="1" style="font-size: small;">• 입주가능일</td>
				<td colspan="2" style="font-size: small;">${room.moveDay}</td>
			</tr>
			<tr>
				<td colspan="1" style="font-size: small;">• 전세자금대출</td>
				<td colspan="2" style="font-size: small;"><c:choose>
						<c:when test="${room.lof eq 'P'}">가능</c:when>
						<c:otherwise>불가능</c:otherwise>
					</c:choose></td>
				<td colspan="1" style="font-size: small;">• 엘리베이터</td>
				<td colspan="2" style="font-size: small;"><c:choose>
						<c:when test="${room.elevator eq 'P'}">있음</c:when>
						<c:otherwise>없음</c:otherwise>
					</c:choose></td>
				<td colspan="1" style="font-size: small;">• 주차여부</td>
				<td colspan="2" style="font-size: small;"><c:choose>
						<c:when test="${room.parking eq 'P'}">가능</c:when>
						<c:otherwise>불가능</c:otherwise>
					</c:choose></td>
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
					<td><a href="" data-toggle="modal" data-target="#myModal"> <img src="/media/${room_pic.picName}"
							style="width: 275px; height: 180px;" onerror="javascript:this.src ='/images/kwon/unknown.jpg'"
							onclick="picModal();" />
					</a> <!-- The Modal -->
						<div class="modal" id="myModal">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<!-- Modal Header -->
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<!-- Modal body -->
									<div class="modal-body">
										<img id="picNameModal" src="/media/${room_pic.picName}" style="width: 750px; height: 500px;" />
									</div>
								</div>
							</div>
						</div></td>

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
<%-- 			<h3>${room.title}</h3> --%>
			<h3>오늘 준공난! 평수깡패 투룸!! 입니다*^^*</h3>
			<br />
			<!-- <h3>방1+큰거실구조(추가)</h3> -->

		</div>
		<div class="col-md-6">
<%-- 			<p>글내용 : ${room.content}</p> --%>

			<details>
				<summary class="text-primary"><span class="text-primary">상세 설명 더보기</span></summary>
				<ul>
<!-- 				<li>접기/펼치기 목록은 deatails 요소를 사용합니다.</li> -->
<!-- 				<li>접기/펼치기 목록의 제목은 summary 요소를 사용합니다.</li> -->
					<br/>
					<li>계약시 항상 임차인 선순위 보장<br /> <br /> 
						▣ 매물종류 : 투룸<br /> 
						▣ 실평수 : 15~16평<br /> 
						▣ 주차 : 가능<br />
						▣ 엘리베이터 : 있음<br />
						▣ 가격대비 많이 큰 집<br /> 
						▣ 이.자.지.원 적용된 금액입니다. (최대지원)<br /> 
						▣ 전세자금은 만기일시상환으로 원금상환을 따로 안하셔도 됩니다.<br /><br /> 
						◎ 마음에 드시는 방 나올 때까지 보여드립니다.<br /> 
						◎ 매일 매일 답사를 거쳐 빠르게 매물을 업데이트하고 있습니다.<br /> 
						◎ 실사진만 올려서 광고합니다.<br /> 
						◎ 권리분석, 공제증서등기본!!!<br />
					</li>
				</ul>
			</details>
			<br />
		</div>
	</div>
</div>


<hr />

<div class="container">

	<table class="table table-borderless">
		<tbody>
			<!--   <tr class="text-center" id="detail_menu" style="position: fixed; top: 100; width:100%;"> -->
			<tr class="text-center" id="detail_menu">
				<td class="text-center"><a style="text-decoration: none; color: gray;" href="#price-section">가격정보</a></td>
				<td class="text-center"><a style="text-decoration: none; color: gray;" href="#option-section">옵션</a></td>
				<td class="text-center"><a style="text-decoration: none; color: gray;" href="#location-section">위치 및 주변시설</a></td>
				
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
						<tr>
							<th>월세</th>
							<th>전세</th>
							<th>관리비</th>
							<th>주차비</th>
							<th>단기임대</th>
					</thead>
					<c:choose>
						<c:when test="${room.dealType eq '전세'}">

							<tbody>
								<tr>
									<td>-</td>
									<td>${room.yearRent}만원</td>
									<td><c:choose>

											<c:when test="${0 ne room.mcost}">${room.mcost} 만 원<br />(기타)</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${room.parking eq 'P'}">가능<br />(무료)</c:when>
											<c:otherwise>불가능</c:otherwise>
										</c:choose></td>
									<td>불가능</td>
								</tr>
							</tbody>
						</c:when>
						<c:when test="${room.dealType eq '월세'}">
							<tbody>
								<tr>
									<td>${room.deposit}/${room.monthRent}만원</td>
									<td>-</td>
									<td><c:choose>
											<c:when test="${0 ne room.mcost}">${room.mcost} 만 원 </c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose><br />(기타)</td>
									<td><c:choose>
											<c:when test="${room.parking eq 'P'}">가능(무료)</c:when>
											<c:otherwise>불가능</c:otherwise>
										</c:choose></td>
									<td>불가능</td>
								</tr>
							</tbody>
						</c:when>
						<c:otherwise>
							<tbody>
								<tr>
									<td>-</td>
									<td>-</td>
									<td><c:choose>
											<c:when test="${0 ne room.mcost}">${room.mcost} 만 원 (기타)</c:when>
											<c:otherwise>-</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${room.parking eq 'P'}">가능<br />(무료)</c:when>
											<c:otherwise>불가능</c:otherwise>
										</c:choose></td>
									<td>불가능</td>
								</tr>
							</tbody>
						</c:otherwise>
					</c:choose>










				</table>
				<br />
				<div class="card">
					<div class="row">
						<div class="col-sm-3">
							<div class="card-body text-center text-primary">한달 생활비</div>
						</div>
						<div class="col-sm-9">
							<div class="card-body">
								<h5 class="text-primary">	
								<c:choose>
									<c:when test="${0 ne room.mcost+room.monthRent}">${room.mcost+room.monthRent}만 원 + α
									<span class="text-secondary">(월세+관리비)</span></c:when>
									<c:otherwise>없음	<span class="text-secondary">(월세+관리비)</span>
									</c:otherwise></c:choose>
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
									<c:if test="${room_option.optionType eq 1}">
										<td><img src="/images/kwon/options/${room_option.optionName}" style="width: 70px; height: 80px;"
											onerror="javascript:this.src ='/images/kwon/unknown.jpg'" /></td>
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
			<h2 class="text-center">보안/안전시설</h2>
			<br />
			<table class="table table-borderless">
				<tbody>
					<tr class="item text-center">


						<c:forEach var="room_option" items="${room_options}" varStatus="status">

							<c:choose>
								<c:when test="${room_option.optionType eq 2}">
									<td><img src="/images/kwon/options/${room_option.optionName}" style="width: 70px; height: 80px;"
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

	<br /> <br /> <br />


	<hr />
	<br /> <br />

	<section id="location-section">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10 text-center">
				<h3 class="text-center">
					위치 및 주변 시설 <a href="#" data-toggle="tooltip" data-placement="right"
						title="다방은 공인중개사무소의 매물정보 기밀 유지를 위해 
							매물의 정확한 위치를 표기하지 않습니다.
							단, 매물 주변 지역 및 편의시설 정보를 확인할 수 있도록 
							반경 30m 안에서 매물이 위치해 있습니다.">⁙</a>
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
						<img src="/images/kwon/mapCategory.png" />
					</div>
				</div>
				<br />

			</div>
			<div class="col-sm-1"></div>
		</div>
	</section>
	<br /> <br />
    <hr />
    <br />
   
   <form:form action="/roomAppr" method="PUT">
	   <div class="text-center">
			<span class="text-dark">
				<input type="checkbox" />매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없음을 승인합니다.
				<input type="hidden" name="agentId" value="${sessionScope.principal.userId}" id="agentId" />
	     		<input type="hidden" name="roomId" value="${room.roomId}" id="roomId" />
			</span>
		</div>
		<br/>
		<div class="text-center">
			<span>
				<a href="/roomApprList/1"><button type="button" class="btn btn-outline-secondary">목록보기</button></a>
				<button type="submit" id="room--Approve" class="btn btn-primary">매물승인</button> 
			</span>
		</div>
   </form:form>
   
  
<br /><br /> 
</div>
<br /><br /> 
   
   


<script>
   $('#ftco-navbar').removeClass("bg-dark");
   $('#ftco-navbar').removeClass("navbar-dark");
</script>
<script src="/js/detail.js" type="text/javascript"></script>
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
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴.
		
	function roomDetail(roomId){
		location.href='/detail/'+roomId;
	}	
</script>




<%@ include file="../include/footer.jsp"%>