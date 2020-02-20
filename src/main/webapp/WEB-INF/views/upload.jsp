<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>

<!-- <script src="/js/jquery.min.js"></script> -->
<!-- <script src="/js/jquery-migrate-3.0.1.min.js"></script> -->
<!-- <script src="/js/popper.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">    -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>



<div class="container">
	<h2 class="text-center">방 내놓기</h2>
	<br /> <br /> <br />

	<table class="table table-borderless">
		<tbody>
			<tr class="text-center" id="detail_menu">
				<td>방 내놓기</td>
				<td>내방관리</td>
			</tr>
		</tbody>
	</table>
	<hr />

	<br />
	<div class="card text-left">
		<div class="card-body">
			<ul>
				<li>등록한 매물은 30일 동안 노출됩니다.</li>
				<li>일반 회원은 1개의 매물만 내놓을 수 있고, 직거래로 표시됩니다.</li>
			</ul>
		</div>
	</div>
	<br /> <br /> <br />


	<form action="/uploadTest" method="POST">

		<div class="card">
			<div class="card-header">매물 종류</div>
			<div class="card-body pb-0">
				<table class="table table-borderless pb-0">
					<tbody>
						<tr>
							<td colspan="1">종류선택</td>
							<td colspan="5"><label class="btn btn-primary active"> <input type="radio" name="roomType" value="원룸" id="option1" autocomplete="off" checked>원룸
							</label> <label class="btn btn-primary"> <input type="radio" name="roomType" value="투룸" id="option2" autocomplete="off">투룸
							</label> <label class="btn btn-primary"> <input type="radio" name="roomType" value="쓰리룸" id="option3" autocomplete="off">쓰리룸
							</label> <label class="btn btn-primary"> <input type="radio" name="roomType" value="오피스텔" id="option4" autocomplete="off">오피스텔
							</label> <label class="btn btn-primary"> <input type="radio" name="roomType" value="아파트" id="option5" autocomplete="off">아파트
							</label></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<br /> <br />
		<div class="card">
			<div class="card-header">
				<span class="">위치 정보</span> <span class="text-secondary">*등기부등본 상의 주소를 입력해 주세요.</span>
			</div>

			<div class="card-body pb-0">
				<div class="row">
					<div class="col-sm-2 text-center">주소</div>

					<div class="col-sm-6">
						<!--               	<form action="#" method="GET"> -->
						<div class="form-group">
							<span> <label for="addr" class="text-smaller">도로명,건물면,지번에 대해 통합검색이 가능합니다.</label>
							</span> <span>
								<button onclick="goPopup()" type="button" class="btn btn-dark float-right btn-sm">주소찾기</button> <input type="text" name="address" class="form-control"
								placeholder="" id="address" />
							</span> <span><input type="checkbox" />등본에 동정보가 없는 경우 선택해 주세요.</span><br /> <a href="" class="text-primary">주소가 검색되지 않으세요?</a> <br />
						</div>
						<!-- 				</form>                -->
					</div>
					<div class="col-sm-4">
						<img src="/images/kwon/map1.png" id="location_map" style="width: 400px; height: 300px;" />
					</div>
				</div>
			</div>
		</div>

		<br />
		<!-- 거래정보 -->
		<div class="card">
			<div class="card-header">
				<span>거래정보 *처음에 선택한 거래 종류가 우선노출됩니다. 예치금이 있는 경우 보증금 입력란에 필히 입력하세요.</span>
			</div>

			<div class="card-body pb-3">
				<div class="row">
					<div class="col-sm-2 text-center">거래종류</div>

					<div class="col-sm-10">
						<div>
							<label class="btn btn-primary btn-small"> <input type="radio" name="dealType" value="월세" id="option1" autocomplete="off">월세
							</label> <span class="text-secondary"> <input type="text" name="deposit" placeholder="보증금" /> / <input type="text" name="monthRent" placeholder="월세" />(예: 월세
								1000만원/50만원)
							</span>
						</div>
						<br />
						<div>
							<label class="btn btn-primary btn-small"> <input type="radio" name="dealType" value="전세" id="option2" autocomplete="off">전세
							</label> <span class="text-secondary"> <input type="text" name="yearRent" placeholder="전세" /> (예: 전세 1000만원)
							</span>
						</div>
						<br />
						<div>
							<label class="btn btn-primary btn-small"> <input type="radio" name="dealType" value="매매" id="option3" autocomplete="off">매매
							</label> <span class="text-secondary"> <input type="text" name="dealRent" placeholder="매매가" />(예: 매매 1000만원)
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />

		<!-- 기본정보 -->
		<div class="card">
			<div class="card-header text-center">
				<span>기본정보</span>
			</div>
			<div class="card-body">
				<table class="table table-borderless">
					<tbody>

						<tr>
							<td>건물크기<br />(1P=3.3058㎡)
							</td>
							<td colspan="2"><span>공급면적 <input type="number" style="width: 70px;" name="areaP" id="areaP" />평 <input type="text" style="width: 70px;" name="areaM"
									id="areaM" />㎡
							</span></td>


							<td>해당 층수</td>
							<td colspan="2"><select class="form-control" name="floor">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
							</select></td>

							<td>입주가능일</td>
							<td colspan="5"><label class="btn btn-primary btn-small"> <input type="radio" name="moveDay" value="즉시입주" id="option1" autocomplete="off">즉시입주
							</label> <label class="btn btn-primary btn-small"> <input type="radio" name="moveDay" value="날짜협의" id="option2" autocomplete="off">날짜협의
							</label> <label class="btn btn-primary btn-small"> <input type="radio" name="moveDay" value="날짜선택" id="option3" autocomplete="off">날짜선택
							</label></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<br />
		<!-- 추가정보 ----------->
		<div class="card">
			<div class="card-header">
				<span>추가정보</span>
			</div>
			<div class="card-body">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td colspan="4">관리비</td>
							<td colspan="4"><span><input type="number" name="mCost" style="width: 50px;" />만원</span></td>
						</tr>
						<tr>
							<td colspan="4">주차여부</td>
							<td colspan="2"><label class="btn btn-outline-primary btn-small"> <input type="radio" name="parking" value="N" id="option1" autocomplete="off">불가능
							</label> <label class="btn btn-outline-primary btn-small"> <input type="radio" name="parking" value="P" id="option2" autocomplete="off">가능
							</label></td>

							<td colspan="1">엘리베이터</td>
							<td colspan="1">
							<label class="btn btn-outline-primary btn-small"> <input type="radio" name="elevator" value="N" id="option1" autocomplete="off">없음
							</label> <label class="btn btn-outline-primary btn-small"> <input type="radio" name="elevator" value="P" id="option2" autocomplete="off">있음
							</label></td>
						</tr>

						<tr>
							<td colspan="4">옵션항목</td>
							<td colspan="4">
														
							<span class="form-check-inline">
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="options" value="op1" id="option1" autocomplete="off">에어컨
							</label></span>
							
							<span class="form-check-inline">
						<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="options" value="op2" id="option2" autocomplete="off">세탁기
							</label></span>
					
							





								


 							<span>
									
									<button class="options btn btn-outline-info">옷장</button>
									<button class="btn btn-outline-info">냉장고</button>
									<button class="btn btn-outline-info">전자도어락</button>
									<button class="btn btn-outline-info">가스레인지</button>
									<button class="btn btn-outline-info">비데</button>
									<button class="btn btn-outline-info">신발장</button>
									<button class="btn btn-outline-info">인덕션</button>
									<button class="btn btn-outline-info">전자레인지</button>
									<button class="btn btn-outline-info">책상</button>
									<button class="btn btn-outline-info">침대</button>
									<button class="btn btn-outline-info">TV</button>
									<button class="btn btn-outline-info">비디오폰</button>
									<button class="btn btn-outline-info">공동현관</button>
									<button class="btn btn-outline-info">경비원</button>
									<button class="btn btn-outline-info">CCTV</button>
									<button class="btn btn-outline-info">방범창</button>
									<button class="btn btn-outline-info">인터폰</button>

							</span>
							</td>
						</tr>
						
						
						<tr>
							<td colspan="4">전세자금대출</td>
							<td colspan="4"><span>
									<button class="btn btn-outline-info">가능</button>
									<button class="btn btn-outline-info">불가능</button>
							</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<!-- 여기가 form 끝 -->
		<button type="submit" class="btn btn-primary">매물등록</button>
	</form>




	<!-- 상세 설명 입력란 -->
	<div class="card">
		<div class="card-header text-center">
			<span>상세 설명</span>
		</div>
		<div class="card-body">
			<table class="table table-borderless">
				<tbody>
					<tr>
						<td>제목</td>
						<td colspan="5"><<input type="text" style="width: 200px;" placeholder="예)신논현역 도보 5분거리.혼자 살기 좋은 방!" />
						</td>
					</tr>
					<tr>
						<td>주차여부</td>
						<td colspan="5"><textarea rows="10" cols="80">
                     상세설명 작성 주의사항<br />
                     -방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다.<br />
                     -중개수수료를 언급한 내용은 입력할 수 없습니다.<br /><br />
                     *주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.<br />
                     *다방의 매물등록 규정에 위반되는 금칙어는 등록이 불가합니다.<br /><br />      
                     
                     </textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br />
	<!-- 사진 등록 -->
	<div class="card">
		<div class="card-header text-center">
			<span>사진등록</span>
		</div>
		<div class="card-body">
			<div class="card">
				<div class="card-body">
					<div>-사진은 가로로 찍은 사진을 권장합니다.</div>
					<div>-사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</div>
				</div>
			</div>

			<input type="file" name="photo" id="" /> <span class="text-primary">허위 매물을 등록할 경우 다방에서 임의로 계정 및 매물 전체 삭제 처리 됩니다.</span>

		</div>
	</div>
	<br /> <br />


	<div>
		<span><input type="checkbox" />매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</span>
	</div>
	<div>
		<!--       <button type="button" class="btn btn-outline-secondary">취소</button> -->
		<button type="submit22" class="btn btn-primary" id="room--upload">매물등록</button>

	</div>

	<br /> <br />



	<!--전체 컨테이너 끝 div -->
</div>






<script src="/js/upload.js" type="text/javascript"></script>

<br />
<br />
<%@ include file="include/footer.jsp"%>