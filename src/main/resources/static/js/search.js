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
	console.log('keyword1 : ',keyword)
	if(keyword == ''){
		keywordval = $('#keyword1').attr('placeholder'); 
	}else {
		keywordval = keyword; 
	}
	document.getElementById('keyword').value = keywordval;
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