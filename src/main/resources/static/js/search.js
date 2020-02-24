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
