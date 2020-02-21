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
