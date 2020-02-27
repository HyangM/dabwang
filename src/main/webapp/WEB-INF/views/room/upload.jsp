<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>

<!-- <script src="/js/jquery.min.js"></script> -->
<!-- <script src="/js/jquery-migrate-3.0.1.min.js"></script> -->
<!-- <script src="/js/popper.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">    -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- 카카오 지도 APL 라이브러리 걸기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=services,clusterer,drawing"></script>

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

	<form action="/uploadProc" method="POST" enctype="multipart/form-data">
	
		<div class="card">
			<div class="card-header text-center">매물 종류</div>
			<div class="card-body pb-0">
				<table class="table table-borderless pb-0">
					<tbody>
						<tr>
							<td colspan="1" class="text-center">종류선택</td>
							
							<td colspan="5" class="text-left">
							<div class="form-group">					
							<label for ="option1" class="btn btn-outline-primary"> 
							<input type="radio" style="display: none;" name="roomType" value="원룸" id="option1" autocomplete="off">원룸
							</label>
							
							<label for ="option1" class="btn btn-outline-primary"> 
							<input type="radio" name="roomType" value="원룸" id="option1" autocomplete="off">원룸
							</label> 
							
							<label for ="option2" class="btn btn-outline-primary"> 
							<input type="radio" name="roomType" value="투룸" id="option2" autocomplete="off">투룸
							</label> 
							
							<label for ="option3" class="btn btn-outline-primary"> 
							<input type="radio" name="roomType" value="쓰리룸" id="option3" autocomplete="off">쓰리룸
							</label> 
							
							<label for ="option4" class="btn btn-outline-primary"> 
							<input type="radio" name="roomType" value="오피스텔" id="option4" autocomplete="off">오피스텔
							</label> 
							
							<label for ="option5" class="btn btn-outline-primary"> 
							<input type="radio" name="roomType" value="아파트" id="option5" autocomplete="off">아파트
							</label>
							</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<br /> <br />
		<div class="card">
			<div class="card-header text-center">
				<span class="">위치 정보</span> 
				<span class="text-secondary">*등기부등본 상의 주소를 입력해 주세요.</span>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-sm-1 text-center">주소</div>
					<div class="col-sm-6">
						<div class="form-group">
							<span><label for="addr" class="text-smaller">도로명,건물명,지번에 대해 통합검색이 가능합니다.</label></span> 
							<span>
							<button onclick="goPopup()" type="button" class="btn btn-dark float-right btn-sm">주소찾기</button>
							<input type="text" id="addr" name="addr" class="addr form-control" placeholder="도로명 주소" required="required" />
							<input type="text" name="detailAddr" class="form-control" placeholder="상세 주소" id="detailAddr" />
													
							<input type="hidden" name="lat" id="lat" />
							<input type="hidden" name="lng" id="lng" /> 
							<br/>
							</span> 
							<span><input type="checkbox" />등본에 동정보가 없는 경우 선택해 주세요.</span><br /> 
							<span class="text-primary">주소가 검색되지 않는다면 고객센터(1899-6840)로 문의주세요.</span><br />
						</div>
					</div>
					<!-- 지도를 표시할 div -->
					<div class="col-sm-5 text-center">
					<div id="map" style="width: 420px; height: 350px;"></div>
<!-- 				<img src="/images/kwon/map1.png" id="location_map" style="width: 400px; height: 250px;" /> -->
					</div>
				</div>
			</div>
		</div>

		<br />
		<!-- 거래정보 -->
		<div class="card">
			<div class="card-header text-center">
				<span>거래정보 *처음에 선택한 거래 종류가 우선노출됩니다. 예치금이 있는 경우 보증금 입력란에 필히 입력하세요.</span>
			</div>

			<div class="card-body pb-3">
				<div class="row">
					<div class="col-sm-2 text-center">거래종류</div>

					<div class="col-sm-10">
					<div class="form-group">
						<div>
							<label class="btn btn-primary btn-small"> 
							<input type="radio" name="dealType" value="월세" id="option1" autocomplete="off">월세
							</label> <span class="text-secondary"> 
							<input id="deposit" type="text" name="deposit" value="0" placeholder="보증금" style="width:120px;" />만원  / 
							<input id="monthRent"type="text" name="monthRent" value="0" placeholder="월세금" style="width:120px;"/>만원   (예: 월세 1000만원/50만원)
							</span>
						</div>
						<br />
						<div>
							<label class="btn btn-primary btn-small"> 
							<input type="radio" name="dealType" value="전세" id="option2" autocomplete="off">전세
							</label> <span class="text-secondary"> 
							<input type="text" name="yearRent" value="0" placeholder="전세금" style="width:120px;" />만원 (예: 전세 1000만원)
							</span>
						</div>
						<br />
						<div>
							<label class="btn btn-primary btn-small"> 
							<input type="radio" name="dealType" value="매매" id="option3" autocomplete="off">매매
							</label> <span class="text-secondary"> 
							<input type="text" name="dealRent" value="0" placeholder="매매가" style="width:120px;" />만원 (예: 매매 1000만원)
							</span>
						</div>
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
	
						<tr class="text-center">
							<td>건물크기<br />(1P=3.3058㎡)
							</td>
							<td colspan="2">
							<div class="form-group">
							<span>공급면적 
							<input type="number" style="width:60px;" name="areaP" id="areaP" />평 <input type="text" style="width: 60px;" name="areaM"
									id="areaM" />㎡
							</span>
							</div>
							</td>

							
							<td>해당 층수</td>
							<td colspan="2">
							<div class="form-group">
							
							<select class="form-control" name="floor">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
									<option>13</option>
									<option>14</option>
									<option>15</option>
									<option>16</option>
									<option>17</option>
									<option>18</option>
									<option>19</option>
									<option>20</option>
									<option>21</option>
									<option>22</option>
									<option>23</option>
									<option>24</option>
									<option>25</option>
									<option>26</option>
									<option>27</option>
									<option>28</option>
									<option>29</option>
									<option>30</option>
									
							</select></div></td>
							

							<td>입주가능일</td>
							<td colspan="5">
							<div class="form-group">
							<label class="btn btn-primary btn-small"> <input type="radio" name="moveDay" value="즉시입주" id="option1" autocomplete="off">즉시입주
							</label> <label class="btn btn-primary btn-small"> <input type="radio" name="moveDay" value="날짜협의" id="option2" autocomplete="off">날짜협의
							</label> <label class="btn btn-primary btn-small"> <input type="radio" name="moveDay" value="날짜선택" id="option3" autocomplete="off">날짜선택
							</label></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<br />
		<!-- 추가정보 ----------->
		<div class="card">
			<div class="card-header text-center">
				<span>추가정보</span>
			</div>
			
			<div class="card-body text-left">
				<table class="table">
				
					<tbody>
						<tr>
							<td colspan="2">관리비</td>
							<td colspan="2">
							<div class="form-group">
							<input type="number" name="mCost" value="0" style="width: 50px;" />만원  (없으면 공백)</div></td>
							<td colspan="2"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2">주차여부</td>
							<td colspan="2">
							<div class="form-group">
							<label class="btn btn-outline-primary btn-small"> 
							<input type="radio" name="parking" value="N" id="option1" autocomplete="off">불가능
							</label> 
							<label class="btn btn-outline-primary btn-small"> 
							<input type="radio" name="parking" value="P" id="option2" autocomplete="off">가능
							</label></div></td>

							<td colspan="2">엘리베이터</td>
							<td colspan="2">
							<div class="form-group">
							<label class="btn btn-outline-primary btn-small"> 
							<input type="radio" name="elevator" value="N" id="option1" autocomplete="off">없음
							</label> 
							<label class="btn btn-outline-primary btn-small"> 
							<input type="radio" name="elevator" value="P" id="option2" autocomplete="off">있음
							</label></div></td>
						</tr>

						<tr>
							<td colspan="2">옵션항목</td>
							<td colspan="6">
							<div class="form-group">							
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op1" id="option1" autocomplete="off">에어컨
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op2" id="option2" autocomplete="off">세탁기
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op3" id="option3" autocomplete="off">옷장
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op4" id="option4" autocomplete="off">냉장고
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op5" id="option5" autocomplete="off">전자도어락
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op6" id="option6" autocomplete="off">가스레인지
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op7" id="option7" autocomplete="off">비데
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op8" id="option8" autocomplete="off">신발장
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op9" id="option9" autocomplete="off">인덕션
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op10" id="option10" autocomplete="off">전자레인지
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op11" id="option11" autocomplete="off">책상
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op12" id="option12" autocomplete="off">침대
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op13" id="option13" autocomplete="off">TV
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op14" id="option14" autocomplete="off">비디오폰
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op15" id="option15" autocomplete="off">공동현관
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op16" id="option16" autocomplete="off">경비원
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op17" id="option17" autocomplete="off">CCTV
							</label>
							
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op18" id="option18" autocomplete="off">방범창
							</label>
						
							<label class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" name="optionId" value="op19" id="option19" autocomplete="off">인터폰
							</label></div>	
							</td>
						</tr>	
						<tr>
							<td colspan="2">전세자금대출</td>
							<td colspan="2">
							<div class="form-group">
							<label class="btn btn-outline-primary btn-small"> 
							<input type="radio" name="lof" value="N" id="option1" autocomplete="off">불가능
							</label>
							<label class="btn btn-outline-primary btn-small"> 
							<input type="radio" name="lof" value="P" id="option2" autocomplete="off">가능
							</label></div> 
							</td>
							<td colspan="2"></td>
							<td colspan="2"></td>
						</tr>
					</tbody>
				</table>
				
				
			</div>
		</div>

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
						<td colspan="5">
						<div class="form-group">
						<input type="text" name="title" style="width: 700px;" placeholder="예)신논현역 도보 5분거리.혼자 살기 좋은 방!" />	</div></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td colspan="5">
						<div class="form-group">
						<textarea name="content" rows="5" cols="80" placeholder="글내용"></textarea>
						</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br />
<!-- 	                                               상세설명 작성 주의사항<br /> -->
<!-- 	                     -방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다.<br /> -->
<!-- 	                     -중개수수료를 언급한 내용은 입력할 수 없습니다.<br /><br /> -->
<!-- 	                     *주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용 제한이 있음<br /> -->
<!-- 	                     *다방의 매물등록 규정에 위반되는 금칙어는 등록이 불가합니다.<br /> -->


	
	
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
			
			<div class="form-group">
			<label for="picName">프로필 사진</label> 
			<input type="file" class="form-control" name="picFiles" id="picFiles" readonly="readonly" multiple />
			<span class="text-primary">허위 매물을 등록할 경우 다방에서 임의로 계정 및 매물 전체 삭제 처리 됩니다.</span>
<%-- 			<p class="my__profile">${sessionScope.principal.profile}</p> --%>


			</div>
		</div>
	</div>
	<br /> <br />
	<div>
		<span><input type="checkbox" />매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</span>
	</div>
	
		<!--       <button type="button" class="btn btn-outline-secondary">취소</button> -->


<!-- <input type="hidden" name="agentId" value="1" id="agentId" /> -->

<!-- 여기가 form 끝 -->
<button type="submit" id="room--upload--submit" class="btn btn-primary">매물등록</button>
</form>
	

	<br /> <br />

<!--전체 컨테이너 끝 div -->
</div>

<script src="/js/upload.js" type="text/javascript">
// 평수랑 제곱미터 변환하기 들어있음.
</script>






<br />
<br />
<%@ include file="../include/footer.jsp"%>