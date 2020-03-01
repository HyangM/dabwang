//주소창
// 우편번호 찾기 찾기 화면을 넣을 element
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
            juso(keywordval);
            search();
            

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
       
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}
//주소창


	$(document).on("click", ".fJNXpX", function () {
     if ($(this).next().css("display") == "none") {
       $(this).removeClass("fJNXpX");
       $(this).addClass("cRtqxV");
       $(this).children(".search__btn1__icon").removeClass("fa-angle-down");
       $(this).children(".search__btn1__icon").addClass("fa-angle-up");
       $(this).next().show();
     }
   });
   $(document).on("click", ".cRtqxV", function () {
       $(this).next().hide();
       $(this).removeClass("cRtqxV");
       $(this).addClass("fJNXpX");
       $(this).children(".search__btn1__icon").removeClass("fa-angle-up");
       $(this).children(".search__btn1__icon").addClass("fa-angle-down");
   });
   
   $(document).on("click", ".fUMVvC", function () {
    if ($(this).next().css("display") == "none") {
      $(this).removeClass("fUMVvC");
      $(this).addClass("hKGAZL");
      $(this).children(".search__btn1__icon").removeClass("fa-angle-down");
      $(this).children(".search__btn1__icon").addClass("fa-angle-up");
      
      $(this).next().show();
    }
  });
  $(document).on("click", ".hKGAZL", function () {
      $(this).next().hide();
      $(this).removeClass("hKGAZL");
      $(this).addClass("fUMVvC");
      $(this).children(".search__btn1__icon").removeClass("fa-angle-up");
      $(this).children(".search__btn1__icon").addClass("fa-angle-down");
  });  
  
  $(document).on("click", ".bAZEbe", function () {
   if ($(this).next().css("display") == "none") {
     $(this).removeClass("bAZEbe");
     $(this).addClass("kdfXro");
     $(this).next().show();
   }
 });
  $(document).on("click", ".kdfXro", function () {
      $(this).next().hide();
      $(this).removeClass("kdfXro");
      $(this).addClass("bAZEbe");
  });  
  

 $('.bRnFtN').on('click', function () {
	 if( $('.portal').css("display") == "none"){
		 $('.portal').show();
	 }else {
		 $('.portal').hide();
	}
});
 

function roomDetail(roomId){

	location.href='/detail/'+roomId;
}


let checkArr = [];
$('.hpBewf .PcMeW:checkbox[name="multi_room_type"]').each(function(i){
	if($(this).is(":checked")) {//체크된 애들만 넣어줄 값
		checkArr.push($(this).val());
		console.log('checkArr[i]: ',checkArr[i]);
	}else {//체크되지 않은 애들만 넣어줄 값
		this.checked=false;
	}

});
document.getElementById('roomType').value = checkArr;
console.log('checkArr: ',checkArr);	

$('.hpBewf .PcMeW').on('click', function () {
	let checkArr = [];
	
	$('input:checkbox[name="multi_room_type"]').each(function(i){
		if($(this).is(":checked")) {//체크된 애들만 넣어줄 값
			checkArr.push($(this).val());
		}else {//체크되지 않은 애들만 넣어줄 값
			this.checked=false;
		}
		   
	});
	document.getElementById('roomType').value = checkArr;
	search();
}); 

$('.eLjSYd .PcMeW').on('click', function () {
	let checkArr2 = [];
	
	$('input:checkbox[name="selling_type"]').each(function(i){
		if($(this).is(":checked")) {//체크된 애들만 넣어줄 값
			checkArr2.push($(this).val());
			console.log('checkArr2[i]: ',checkArr2[i]);
		}else {//체크되지 않은 애들만 넣어줄 값
			this.checked=false;
		}
		   
	});
	document.getElementById('dealType').value = checkArr2;
	search();
});


let checkArr2 = [];

$('input:checkbox[name="selling_type"]').each(function(i){
	if($(this).is(":checked")) {//체크된 애들만 넣어줄 값
		checkArr2.push($(this).val());
//		console.log('checkArr2[i]: ',checkArr2[i]);
	}else {//체크되지 않은 애들만 넣어줄 값
		this.checked=false;
	}
	   
});
document.getElementById('dealType').value = checkArr2;
//console.log('checkArr2: ',checkArr2);	

var searchForm = $("#SearchForm");

function search(){
	
	var keyword = $('#keyword1').val();
//	console.log('keyword1 : ',keyword)
//	if(keyword == ''){
//		keywordval = $('#keyword1').attr('placeholder'); 
//	}else {
//		keywordval = keyword; 
//	}
	document.getElementById('keyword').value = keywordval;
	//juso(keywordval);
	searchForm.attr('action', '/search').attr('method', 'get');
	searchForm.submit();

}

/* 찜등록, 삭제 */
$('.hjVNgq').on('click',function(){

	let id_like = $(this).attr("id");
	console.log(id_like);
	
	let roomId = $(this).attr('value');
	let userId = $('#userId').val();
	let likeId = $(this).attr('name');
	
	if(userId == ""){
		location.href = "/login"
	}else{

		let data = { 
				userId : userId,
				roomId : roomId
		};
		//console.log('likeId : ',likeId);
		
		if(likeId == 0){

		 	$.ajax({
				type:'POST',
				url:'/likeroom',
				data:JSON.stringify(data),
				contentType:'application/json; charset=utf-8',
				dataType:'json'			
			}).done(function(result){
				if(result.statusCode == 200){
					//alert('찜등록 성공.');
					$('#'+id_like).css('background','url(/images/like_fill.svg)');
					document.getElementById(id_like).setAttribute('name', result.likeId);
				}
			}).fail(function(result){
				//alert('찜등록 실패.');
			}); 
		}else {

		 	$.ajax({
				type:'DELETE',
				url:'/likeroom/'+likeId,
				data:JSON.stringify(data),
				contentType:'application/json; charset=utf-8',
				dataType:'json'			
			}).done(function(result){
				if(result.statusCode==200){
					//alert('찜삭제 성공.');
					$('#'+id_like).css('background','url(/images/like.svg)');
					document.getElementById(id_like).setAttribute('name', 0);
				}
			}).fail(function(result){
				//alert('찜삭제 실패.');
			});
		}
		
	}
});

/* 
var pmdSliderValueRange = document.getElementById('pmd-slider-value-range');

noUiSlider.create(pmdSliderValueRange, {
	start: [ 0, 99999 ], // Handle start position
	connect: true, // Display a colored bar between the handles
	 tooltips: [ wNumb({ decimals: 0 }), wNumb({ decimals: 0 }) ], 
	format: wNumb({
		decimals: 0,
		thousand: '',
		postfix: '',
	}),
	range: { // Slider can select '0' to '100'
		'min': 0,
		'max': 100
	},
step: 5,
	  pips: { 
		  mode: 'steps',
		  density: 10
	  }
});



function amt1(num){
	if(num == 5){
		console.log('num : ',num);
		return 100;
	}else if(num == 10){
		return 200;
	}else if(num == 15){
		return 300;
	}else if(num == 20){
		return 400;
	}else if(num == 25){
		return 500;
	}else if(num == 30){
		return 1000;
	}else if(num == 35){
		return 5000;
	}else if(num == 40){
		return 9000;
	}else if(num == 45){
		return 10000;
	}else if(num == 50){
		return 12000;
	}else if(num == 55){
		return 15000;
	}else if(num == 60){
		return 20000;
	}else if(num == 65){
		return 30000;
	}else if(num == 70){
		return 35000;
	}else if(num == 75){
		return 40000;
	}else if(num == 80){
		return 50000;
	}else if(num == 85){
		return 60000;
	}else if(num == 90){
		return 70000;
	}else if(num == 95){
		return 80000;
	}else if(num == 100){
		return 무제한;
	}
}

var valueMax = document.getElementById('value-max'),
	valueMin = document.getElementById('value-min');

// When the slider value changes, update the input and span
pmdSliderValueRange.noUiSlider.on('update', function( values, handle ) {
	let Lval = 0;
	let Rval = 0;
	let Ltxt = '0';
	let Rtxt = '무제한';
	if ( handle ) {
		let Rvalue = values[handle];
		if(Rvalue == 100) {
			let Rtxt = '무제한';
		}
	} else {
		let Lvalue = values[handle];
		console.log(Lvalue);
		Lval = amt1(Lvalue);
		let Rtxt = Lval;
	}
	$('.eavwzc[name=first1_1]').text(Ltxt,'~',Rtxt);
});	

 */