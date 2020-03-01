<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<section class="hero-wrap js-fullheight"
	style="background-image: url('/images/main.jpg');" data-section="home"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
			data-scrollax-parent="true">
			<div class="col-md-6 pt-5 ftco-animate float-right">
				<div class="mt-5">
					<span class="subheading">부동산 필수 앱,다봥</span>
					<h4 class="mb-4">어떤 동네, 어떤 방에서 살고 싶으신가요?</h4>
					<div class="input-group col-10 ">
						<input onclick="sample3_execDaumPostcode()"type="text" class="form-control"
					
							placeholder="부산광역시 수영구를 검색해보세요.">
						<div class="input-group-append">
							<button class="btn btn-outline-primary">&nbsp&nbsp검&nbsp&nbsp색&nbsp&nbsp</button>
						</div>
						<div id="wrap" class="input-group-append"style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<hr />

<c:choose>
		<c:when test="${not empty sessionScope.principal}">
			<section class="ftco-section contact-section" id="contact-section">
				<div class="container">
					<div class="row justify-content-center mb-5 pb-3">
						<div class="col-md-12 heading-section ftco-animate p-4 p-lg-5">
							<h2 class="mb-4 text-center">${sessionScope.principal.name}님의 최근 본 방</h2>
							<c:choose>
							<c:when test="${empty todayRecodes}">
								<p class="text-center">최근에본 방이 없어요
								<a href ="/search" class="btn btn-info">다방에 준비된 많은 방들 보러가기</a></p>
							</c:when>
							<c:otherwise>	
								<p class="text-center">최근에 본 방을 볼 수 있어요
								<a href ="/search" class="btn btn-info">더 많은 방 찾아보기</a></p>
							</c:otherwise>
							</c:choose>
						</div>
			
						
							<c:forEach var="todayRecode" items="${todayRecodes}">
								<div class="card m-2" style="width: 300px; height: 330px;">
								<a href="#" onclick="roomDetail(${todayRecode.roomId})"><img class="card-img-top" src="/media/${todayRecode.picName}" style="width:300px; height:160px; "></a>
								<div class="card-body">
									<p class="card-title text-Strong" style="font-size: 20px">${todayRecode.dealType} <c:choose>
														<c:when test="${0 ne todayRecode.yearRent}">${todayRecode.yearRent}</c:when>
														<c:when test="${0 ne todayRecode.monthRent}">${todayRecode.deposit}/${todayRecode.monthRent}</c:when>
														<c:otherwise>${todayRecode.dealRent}</c:otherwise>
													</c:choose>
									</p>
									<p style="font-size: 12px">${todayRecode.floor}층,${todayRecode.areaP}m²,관리비
												${todayRecode.MCost} 만</p>
									<p style="font-size: 15px">${todayRecode.title}</p>
									</div>
								</div>
							</c:forEach>
						
						
						
					</div>
				</div>
			</section>
			<br />
			<hr />
		</c:when>
	</c:choose>




<section class="ftco-section contact-section" id="contact-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-12 heading-section ftco-animate p-4 p-lg-5">

				<h2 class="mb-4 text-center">쉬운 방찾기</h2>
				<p class="text-center">방 찾기 초보를 위한 초간단 솔루션!</p>
			</div>

			<div class="card m-2" style="width: 200px; height: 210px;">
				<a href="/"><img class="card-img-top" src="/images/sl_1.jpg"></a>
				<div class="card-body">
					<p class="card-title" style="font-size: 15px">월세 + 관리비</p>
					<p style="font-size: 12px">월 50 이하 원룸</p>
				</div>

			</div>
			<div class="card m-2" style="width: 200px; height: 210px;">
				<a href="/"><img class="card-img-top" src="/images/sl_2.jpg"></a>
				<div class="card-body">
					<p class="card-title" style="font-size: 15px">전세자금대출</p>
					<p style="font-size: 12px">가능한 투쓰리룸</p>
				</div>
			</div>

			<div class="card m-2" style="width: 200px; height: 210px;">
				<a href="/"><img class="card-img-top" src="/images/sl_3.jpg"></a>
				<div class="card-body">
					<p class="card-title" style="font-size: 15px">반려동물</p>
					<p style="font-size: 12px">가능한 원룸</p>
				</div>
			</div>

			<div class="card m-2" style="width: 200px; height: 210px;">
				<a href="/"><img class="card-img-top" src="/images/sl_4.jpg"></a>
				<div class="card-body">
					<p class="card-title" style="font-size: 15px">낭만적인</p>
					<p style="font-size: 12px">옥탑방 원룸</p>
				</div>
			</div>

			<div class="card m-2" style="width: 200px; height: 210px;">
				<a href="/"><img class="card-img-top" src="/images/sl_5.jpg"></a>
				<div class="card-body">
					<p class="card-title" style="font-size: 15px">2억 이하</p>
					<p style="font-size: 12px">전세 투 쓰리룸</p>
				</div>
			</div>

		</div>
	</div>
</section>
<br />
<hr />


<section class="ftco-section testimony-section img"
	style="background-image: url(images/main33.jpg);">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-3">
			<div
				class="col-md-7 text-center heading-section heading-section-white ftco-animate">
				<span class="subheading">나? 다봥으로 구했어</span>
				<h2 class="mb-4">다봥의 솔직한 후기</h2>
			</div>
		</div>
		<div class="row ftco-animate justify-content-center">
			<div class="col-md-12">
				<div class="carousel-testimony owl-carousel ftco-owl">
					<div class="item">
						<div class="testimony-wrap text-center py-4 pb-5">
							<div class="user-img"
								style="background-image: url(/images/profile1.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text px-4">
								<p class="mb-4">다방이 다방했네요! 반려묘와 함께 살수있는 곳을 원했는데 다방으로 구했습니다!</p>
								<p class="name">혜리</p>
								<span class="position">2019년 10월 이용자</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap text-center py-4 pb-5">
							<div class="user-img"
								style="background-image: url(/images/profile2.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text px-4">
								<p class="mb-4">다방이 다방했네요! 반려묘와 함께 살수있는 곳을 원했는데 다방으로 구했습니다!</p>
								<p class="name">혜리</p>
								<span class="position">2019년 10월 이용자</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="testimony-wrap text-center py-4 pb-5">
							<div class="user-img"
								style="background-image: url(/images/profile3.jpg)">
								<span
									class="quote d-flex align-items-center justify-content-center">
									<i class="icon-quote-left"></i>
								</span>
							</div>
							<div class="text px-4">
								<p class="mb-4">다방이 다방했네요! 반려묘와 함께 살수있는 곳을 원했는데 다방으로 구했습니다!</p>
								<p class="name">혜리</p>
								<span class="position">2019년 10월 이용자</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<br />
<br />
<br />
<hr />
<br />
<br />
<br />


<section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb"
	id="about-section">
	<div class="container">
		<div class="row d-flex">
			<div class="col-md-6 col-lg-5 d-flex">
				<div class="img d-flex align-self-stretch align-items-center"
					style="background-image: url(/images/header.jpg);"></div>
			</div>
			<div class="col-md-6 col-lg-7 pl-lg-5 py-md-5">
				<div class="py-md-5">
					<div class="row justify-content-start pb-3">
						<div class="col-md-12 heading-section ftco-animate p-4 p-lg-5">
							<h3 class="mb-4">다봥 허위매물 예방하기</h3>
							<p>첫번재, 광학렌즈로 넓어보이는 사진 등 지나치게 보정된 사진이나 구조를 알아보기 힘든 사진은 허위매물의
								가능성이 있으니 주의해주세요.</p>
							<p>두번재, 다봥에서 주변의 평균월세와 전세 시세를 집계하고있습니다. 해당지역의 평균 시세를 확인해보실 것을
								추천합니다.</p>
							<p>세번째, 실제 위치와 상이할 수 있다는 문구가 노출된 매물일 경우 허위매물 가능성이 높으니 주의하시기
								바랍니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<br />
<br />
<br />
<hr />


<section class="ftco-facts img ftco-counter"
	style="background-image: url(/images/dabang.jpg);">
	<div class="overlay"></div>
	<div class="container">
		<div class="row d-flex align-items-center">
			<div class="col-md-5 heading-section heading-section-white">
				<span class="subheading">대한민국</span>
				<h2 class="mb-4">1등 부동산 서비스,다봥</h2>
			</div>
			<div class="col-md-7">
				<div class="row pt-4">
					<div
						class="col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="1800">0</strong>
								<h6>만 건의</h6>
								<span>앱 누적 다운로드</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="500">0</strong>
								<h6>만 명의</h6>
								<span>월간 사용자</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="50000">0</strong>
								<h6>여 명의</h6>
								<span>누적 가입 공인중개사</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18">
							<div class="text">
								<strong class="number" data-number="350000">0</strong>
								<h6>만 건의</h6>
								<span>월간 매물 문의</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<form id="SearchForm" >
	<input type="hidden" id="keyword" name="keyword" value="">
	<input type="hidden" id="keywordinput" name="keywordinput" value="">
</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function roomDetail(roomId){
		location.href='/detail/'+roomId;
	}
</script>
<script>
	//주소창
	//우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');
	
	function foldDaumPostcode() {
	 // iframe을 넣은 element를 안보이게 한다.
	 element_wrap.style.display = 'none';
	}
	
	function sample3_execDaumPostcode() {
	 // 현재 scroll 위치를 저장해놓는다.
	 var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	 new daum.Postcode({
	     oncomplete: function(data) {
	         // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	     	keywordval = data.query;
	         var bname = data.bname;
	         $('#keyword1').val(bname);
	     	document.getElementById('keywordinput').value = bname;
	         search(bname, keywordval);
	         
	
	         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	         var addr = ''; // 주소 변수
	         var extraAddr = ''; // 참고항목 변수
	
	         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	             addr = data.roadAddress;
	         } else { // 사용자가 지번 주소를 선택했을 경우(J)
	             addr = data.jibunAddress;
	         }
	
	         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	         if(data.userSelectedType === 'R'){
	             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                 extraAddr += data.bname;
	             }
	             // 건물명이 있고, 공동주택일 경우 추가한다.
	             if(data.buildingName !== '' && data.apartment === 'Y'){
	                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	             }
	             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	             if(extraAddr !== ''){
	                 extraAddr = ' (' + extraAddr + ')';
	             }
	             // 조합된 참고항목을 해당 필드에 넣는다.
	        //     document.getElementById("sample3_extraAddress").value = extraAddr;
	         
	         } else {
	         //    document.getElementById("sample3_extraAddress").value = '';
	         }
	
	         // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        // document.getElementById('sample3_postcode').value = data.zonecode;
	        // document.getElementById("sample3_address").value = addr;
	         // 커서를 상세주소 필드로 이동한다.
	       //  document.getElementById("sample3_detailAddress").focus();
	
	         // iframe을 넣은 element를 안보이게 한다.
	         // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	         element_wrap.style.display = 'none';
	
	         // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	         document.body.scrollTop = currentScroll;
	     },
	     // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	    
         onresize : function(size) {
             if(size.height == 466){
                 element_wrap.style.height = size.height+'px';
             }else {
                 element_wrap.style.height = 500+'px';
             }
             console.log(size.height);
         },
	     width : '100%',
	     height : '100%'
	 }).embed(element_wrap);
	
	 // iframe을 넣은 element를 보이게 한다.
	 element_wrap.style.display = 'block';
	}
	//주소창
	
	var searchForm = $("#SearchForm");
	
	function search(keywordinput, keywordval){
		
		document.getElementById('keyword').value = keywordval;
		document.getElementById('keywordinput').value = keywordinput;
		searchForm.attr('action', '/search').attr('method', 'get');
		searchForm.submit();
	
	}

	
	function isNotInMyArea( $targetObj )
	{
	    var isIn = true;
	    var $objArr = Array();
	    var opts = {
	        left: 99999, right: 0, top: 99999, bottom: 0
	    }
	    
	    if( $targetObj )
	    {
	        if( $targetObj.length == 1 ) {
	            $objArr.push( $targetObj );
	        } else {
	            $objArr = $targetObj;
	        }

	        $.each($objArr, function(i, $obj){          
	            var obj_position = $obj.offset();
	            obj_position.right = parseInt( obj_position.left ) + ( $obj.width() );
	            obj_position.bottom = parseInt( obj_position.top ) + parseInt( $obj.height() );
	            
	            if( obj_position.left < opts.left ) opts.left = obj_position.left;
	            if( obj_position.right > opts.right ) opts.right = obj_position.right;
	            if( obj_position.top < opts.top ) opts.top = obj_position.top;
	            if( obj_position.bottom > opts.bottom ) opts.bottom = obj_position.bottom;
	        });
	        
	        if( ( opts.left <= event.pageX && event.pageX <= opts.right )
	            && ( opts.top <= event.pageY && event.pageY <= opts.bottom ) )
	        {
	            isIn = false;
	        }
	    }
	    
	    return isIn;
	}

	$(function(){
	    $(document).mousedown(function( e ){
	        if( isNotInMyArea ( [ $("input"), $("#wrap") ] ) ) {
	            $("#wrap").hide();
	        }
	    });
	    
	    $("input").click(function(){
	        if( !$("#wrap").is(":visible") ) {
	            $("#wrap").show();
	        }
	    });
	});

</script>
<%@ include file="include/footer.jsp"%>

