<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>

<!-- <script src="/js/jquery.min.js"></script> -->
<!-- <script src="/js/jquery-migrate-3.0.1.min.js"></script> -->
<!-- <script src="/js/popper.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- 카카오 지도 APL 라이브러리 걸기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=services,clusterer,drawing"></script>
<style>
   .selected { 
    background:#1A5AE8; 
    color:white; 
    }
</style>
<script>
//$("label").each(function () {
$(document).ready(function () {
	$('label.btn-outline-secondary').each(function () {

        $(this).click(function () {
            $(this).addClass("selected");    //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
            $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
        });
    });
});

$(document).ready(function () {
	$('label.btn-outline-info').each(function () {

        $(this).click(function () {
        
            $(this).addClass("selected");    //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
		//	toggleClass("selected");
            //$(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
        });
    });
});
$(document).ready(function () {
	$('label.btn-outline-primary').each(function () {

        $(this).click(function () {
        
            $(this).addClass("selected");    //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
		//	toggleClass("selected");
            $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
        });
    });
});
</script>

<div class="container">
	<br/>
	<h2 class="text-center">방 내놓기</h2>
	<br />

	<table class="table table-borderless">
		<tbody>
			<tr class="text-center" id="detail_menu">
				<td class="text-primary">방 내놓기</td>
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
	<br /> 

	<form id="frm" action="/uploadProc" method="POST" enctype="multipart/form-data">
	
		<div class="card">
			<div class="card-header text-center">매물 종류</div>
			<div class="card-body pb-0">
				<table class="table table-borderless pb-0">
					<tbody>
						<tr>
							<td colspan="1" class="text-left">종류선택</td>
							
							<td colspan="5" class="text-left">
							<div class="form-group roomType">					
							<label for ="option1" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="원룸" id="option1" autocomplete="off">원룸
							</label>
							
							<label for ="option2" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="투룸" id="option2" autocomplete="off">투룸
							</label> 
							
							<label for ="option3" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="쓰리룸" id="option3" autocomplete="off">쓰리룸
							</label> 
							
							<label for ="option4" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="오피스텔" id="option4" autocomplete="off">오피스텔
							</label> 
							
							<label for ="option5" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="아파트" id="option5" autocomplete="off">아파트
							</label>
							</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<br /> 
		<div class="card">
			<div class="card-header text-center">
				<span>위치 정보</span> 
				<span class="text-secondary"> (등기부등본 상의 주소를 입력해 주세요.)</span>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-sm-1 text-center">주소</div>
					<div class="col-sm-6">
						<div class="form-group">
							<span><label for="addr" class="text-smaller">도로명,건물명,지번에 대해 통합검색이 가능합니다.</label></span> 
							<span>
							<button onclick="goPopup()" type="button" class="btn btn-dark float-right btn-sm">주소찾기</button>
							<input type="text" id="addr" name="addr" class="addr form-control" placeholder="도로명 주소" required="required" readonly="readonly" />
							<input type="text" name="detailAddr" class="form-control" placeholder="상세 주소" id="detailAddr" readonly="readonly" />
							
							<input type="hidden" name="jibunAddr" id="jibunAddr" /> 						
							<input type="hidden" name="lat" id="lat" />
							<input type="hidden" name="lng" id="lng" /> 
							<br/>
							</span> 
							<span><input type="checkbox" />등본에 동 정보가 없는 경우 선택해 주세요.</span><br /> 
							<span class="text-primary">주소가 검색되지 않는다면 고객센터(1899-6840)로 문의주세요.</span><br />
						</div>
					</div>
					<!-- 지도를 표시할 div -->
					<div class="col-sm-5 text-center">
					<div id="map" style="width: 420px; height: 350px;"></div>
					</div>
				</div>
			</div>
		</div>

		<br />
		<!-- 거래정보 -->
		<div class="card">
			<div class="card-header text-center">
				<span>거래정보</span> 
				<span class="text-secondary"> (처음에 선택한 거래 종류가 우선노출 됩니다.)</span>
			</div>

			<div class="card-body pb-3">
				<div class="row">
					<div class="col-sm-2 text-center">거래종류</div>

					<div class="col-sm-10">
					<div class="form-group">
						<div>
							<label for ="option11" class="btn btn-outline-primary btn-small"> 
							<input type="radio" style="display: none;" name="dealType" value="월세" id="option11" autocomplete="off">월세
							</label> 
							
							<span class="text-secondary"> 
							<input id="deposit" class="text-right" type="text" name="deposit" value="0" placeholder="보증금" style="width:120px;" />만원  / 
							<input id="monthRent" class="text-right" type="text" name="monthRent" value="0" placeholder="월세금" style="width:120px;"/>만원   (예: 월세 500/20만원)
							</span>
						</div>
						<br />
						<div>
							<label for ="option12" class="btn btn-outline-primary btn-small"> 
							<input type="radio" style="display: none;" name="dealType" value="전세" id="option12" autocomplete="off">전세
							</label> 
							
							<span class="text-secondary"> 
							<input type="text" class="text-right" name="yearRent" value="0" placeholder="전세금" style="width:120px;" />만원 (예: 전세 3000만원)
							</span>
						</div>
						<br />
						<div>
							<label for ="option13" class="btn btn-outline-primary btn-small"> 
							<input type="radio" style="display: none;" name="dealType" value="매매" id="option13" autocomplete="off">매매
							</label> <span class="text-secondary"> 
							<input type="text" class="text-right" name="dealRent" value="0" placeholder="매매가" style="width:120px;" />만원 (예: 매매 7000만원)
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
	
						<tr>
							<td colspan="1" class="text-left">건물크기<br />(1P=3.3058㎡)</td>
							<td colspan="2">
							<div class="form-group text-left">
							<span>공급면적 
							<input type="number" style="width:60px;" name="areaP" id="areaP" />평 <input type="text" style="width: 60px;" name="areaM"
									id="areaM" />㎡
							</span>
							</div>
							</td>
							<td colspan="1" class="text-right">해당 층수</td>
							<td colspan="2" class="text-left">
							<div class="form-group text-left">
							
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
							<td colspan="1" class="text-right">입주가능일</td>
							<td colspan="5" class="text-left">
							<div class="form-group">
							<label for ="option24" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="moveDay" value="즉시입주" id="option24" autocomplete="off">즉시입주
							</label> 
							<label for ="option25" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="moveDay" value="날짜협의" id="option25" autocomplete="off">날짜협의
							</label> 
							<label for ="option26" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="moveDay" value="날짜선택" id="option26" autocomplete="off">날짜선택
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
				<div class="row">
					<div class="col-sm-2 text-right">
					<span>관리비</span>
					</div>
					<div class="col-sm-10">
						<div class="form-group">
						<input class="text-right" type="number" name="mCost" value="0" style="width: 50px;" />만원  (없으면 0원으로 표시됨.)</div>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-sm-2 text-right">
					<span>주차여부</span>
					</div>
					<div class="col-sm-4 text-left">
						<div class="form-group">
							<label for ="option27" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="parking" value="N" id="option27" autocomplete="off">불가능
							</label> 
							<label for ="option28" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="parking" value="P" id="option28" autocomplete="off">가능
							</label>
						</div>
					</div>
					<div class="col-sm-2 text-right">
					<span>엘리베이터</span>
					</div>
					<div class="col-sm-4 text-left">
						<div class="form-group">
							<label for ="option29" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="elevator" value="N" id="option29" autocomplete="off">없음
							</label> 
							<label for ="option30" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="elevator" value="P" id="option30" autocomplete="off">있음
							</label>
						</div>	
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-sm-2 text-right">
					<span>옵션항목</span>
					</div>
					<div class="col-sm-10">
						<div class="form-group">							
							<label for ="option31" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op1" id="option31" autocomplete="off">에어컨
							</label>
						
							<label for ="option32" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op2" id="option32" autocomplete="off">세탁기
							</label>
							
							<label for ="option33" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op3" id="option33" autocomplete="off">옷장
							</label>
							
							<label for ="option34" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op4" id="option34" autocomplete="off">냉장고
							</label>
							
							<label for ="option35" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op5" id="option35" autocomplete="off">전자도어락
							</label>
						
							<label for ="option36" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op6" id="option36" autocomplete="off">가스레인지
							</label>
							
							<label for ="option37" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op7" id="option37" autocomplete="off">비데
							</label>
							
							<label for ="option38" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op8" id="option38" autocomplete="off">신발장
							</label>
							
							<label for ="option39" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op9" id="option39" autocomplete="off">인덕션
							</label>
						
							<label for ="option40" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op10" id="option40" autocomplete="off">전자레인지
							</label>
						
							<label for ="option41" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op11" id="option41" autocomplete="off">책상
							</label>
						
							<label for ="option42" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op12" id="option42" autocomplete="off">침대
							</label>
						
							<label for ="option43" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op13" id="option43" autocomplete="off">TV
							</label>
						
							<label for ="option44" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op14" id="option44" autocomplete="off">비디오폰
							</label>
						
							<label for ="option45" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op15" id="option45" autocomplete="off">공동현관
							</label>
							
							<label for ="option46" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op16" id="option46" autocomplete="off">경비원
							</label>
							
							<label for ="option47" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op17" id="option47" autocomplete="off">CCTV
							</label>
							
							<label for ="option48" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op18" id="option48" autocomplete="off">방범창
							</label>
						
							<label for ="option49" class="btn btn-outline-info btn-small"> 
							<input type="checkbox" class="form-check-label" style="display: none;" name="optionId" value="op19" id="option49" autocomplete="off">인터폰
							</label>
						</div>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-sm-2 text-right">
					<span>전세자금대출</span>
					</div>
					<div class="col-sm-10">
						<div class="form-group">
							<label for ="option50" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="lof" value="N" id="option50" autocomplete="off">불가능
							</label>
							<label for ="option51" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="lof" value="P" id="option51" autocomplete="off">가능
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />
	<!-- 상세 설명 입력란 -->
	<div class="card">
		<div class="card-header text-center">
			<span>상세 설명</span>
		</div>
		<div class="card-body">
			<table class="table table-borderless mb-0">
				<tbody>
					<tr class="text-center">
						<td>제목</td>
						<td colspan="5">
							<div class="form-group">
								<input type="text" name="title" style="width: 900px;" placeholder="예) 신논현역 도보 5분거리, 혼자 살기 좋은 방 입니다." />
							</div>
						</td>
					</tr>
					<tr class="text-center">
						<td>글내용</td>
						<td colspan="5">
							<div class="form-group">
<textarea name="content" rows="10" cols="123" 
placeholder="상세설명 작성 주의사항

- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다.
- 중개수수료를 언급한 내용은 입력할 수 없습니다.

*주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다."></textarea>
							</div>
						</td>
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
		<div class="card-body mb-0">
			<div class="card">
				<div class="card-body">
					<div>- 사진은 가로로 찍은 사진을 권장합니다.(가로 사이즈 최소 800px)</div>
					<div>- 사진 용량은 사진 한 장당 10MB 까지 등록이 가능합니다.</div>
					<div>- 사진은 최소 4장 이상 등록해야하며, 최대 16장 까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.</div>
				</div>
			</div>
			<div class="form-group">
			<label for="picName" class="text-danger">※ 다방 로고를 제외한 불필요한 정보(워터마크, 상호, 전화번호 등)가 있는 매물은 비공개 처리 됩니다.</label>
			<input type="file" class="form-control" name="picFiles" id="picFiles" readonly="readonly" multiple />
			<span class="text-secondary">⁋ 허위 매물을 등록할 경우 다방에서 임의로 계정 및 매물 전체 삭제 처리 됩니다.
			<a href="#">허위매물 제재 정책 확인하기</a></span>
			</div>
		</div>
	</div>
	<br /><br />
	<div class="text-center">
		<span class="text-dark">
			<input type="checkbox" id="final" />매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.
		</span>
	</div>
	<br/>
	<div class="text-center">
		<span>
			<button type="button" class="btn btn-outline-secondary">등록취소</button>
			<button type="submit" id="room--upload--submit" class="btn btn-primary">매물등록</button>
		</span>
	</div>
</form>
<!-- 여기가 form 끝 -->


<br /> <br />
<!--전체 컨테이너 끝 div -->
</div>





<!-- <script>
// $('#final').on('click', function(){
	
// 	if (document.getElementsByName("roomType").value == null){
// 		alert('매물종류가 입력되지 않았습니다.');	
//  	if (document.getElementsByName("addr").value == null || document.getElementsByName("detailAddr").value == null){
//  		alert('주소가 입력되지 않았습니다.');
// 	if (document.getElementsByName("dealType").value == null){
//  		alert('거래유형이 입력되지 않았습니다 .');
// 	if (
//  			document.getElementsByName("yearRent").value == null || 
//  			document.getElementsByName("deposit").value == null ||
//  			document.getElementsByName("monthRent").value == null || 
//  			document.getElementsByName("dealRent").value == null){
//  		alert('거래금액이 입력되지 않았습니다.');
//  	if (document.getElementsByName("areaP").value == null){
//  		alert('평수가 입력되지 않았습니다.');
//  	if (document.getElementsByName("floor").value == null){
//  		alert('층수가 입력되지 않았습니다.');
//  	if (document.getElementsByName("moveDay").value == null){
//  		alert('입주가능일이 입력되지 않았습니다.');
// 	if (document.getElementsByName("parking").value == null){
//  		alert('주차가능여부가 입력되지 않았습니다.');
// 	if (document.getElementsByName("elevator").value == null){
//  		alert('엘리베이터 유무가 입력되지 않았습니다.');
// 	if (document.getElementsByName("lof").value == null){
//  		alert('전세자금대출가능 여부가 입력되지 않았습니다.');
// 	if (document.getElementsByName("title").value == null || document.getElementsByName("content").value == null){
//  		alert('글제목 또는 글내용이 입력되지 않았습니다.');
// 	if (document.getElementsByName("optionId").value == null){
//  		alert('옵션사항이 입력되지 않았습니다.');
//  	} } } } } } } } } } } }
// });
</script> -->

<script src="/js/upload.js" type="text/javascript"></script>








<br />
<br />
<%@ include file="../include/footer.jsp"%>