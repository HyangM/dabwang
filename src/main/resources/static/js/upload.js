/**
 * 
 */
// 버튼 누른 상태 유지하기.
$('label').on('click', function(){
    $('label').removeClass('selected');
    $(this).addClass('selected');
});


//도로명 주소검색
function goPopup() {
<<<<<<< HEAD
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출.
	var pop = window.open("/popup/jusoPopup.jsp", "pop", "width=570, height=420, scrollbars=yes, resizable=yes");
=======
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출함.
	var pop = window.open("popup/jusoPopup.jsp", "pop", "width=570, height=420, scrollbars=yes, resizable=yes");
>>>>>>> 96f76bf0af31df60acbd836410267f781125896a
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
level: 3 // 지도의 확대 레벨
};
/*var mapContainer = document.getElementById('map'), // 지도를 표시할 위치인 div 
	mapOption = { 
	center: new kakao.maps.LatLng(35.131383607054290, 129.0908644085070), // 지도의 중심좌표 (카카오본사 위치)
	level: 7 // 지도의 확대 레벨
};*/


//지도를 표시할 div와  지도 옵션으로  지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);


function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, entX, entY){
	//팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록.
	$('#addr').val(roadFullAddr);
	$('#detailAddr').val(addrDetail);
	
	var data = roadAddrPart1;
	var geocoder = new kakao.maps.services.Geocoder();
	
	var valX = "";
	var valY = "";
	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	// console.log('rrrr xxx:',result[0].x);
	        
	        valY = result[0].y;  // 위도값
	        valX = result[0].x;  // 경도값
	        $('#lat').val(valY);
	    	$('#lng').val(valX);
	    		    	
	    	setCenter(valY, valX);
	    	
	    	// 마커가 표시될 위치.
	    	var markerPosition  = new kakao.maps.LatLng(result[0].y, result[0].x);
	    	//alert(result[0].y +" and "+result[0].x);
	    	// 마커를 생성합니다
	    	var marker = new kakao.maps.Marker({
	    	    position: markerPosition	    	    
	    	});
	    	// 마커가 지도 위에 표시되도록 설정합니다
	    	marker.setMap(map);		
	    }
	};
	geocoder.addressSearch(data, callback);
}


	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	function setCenter(lat,lng) {            
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(lat, lng);
	
		// 지도 중심을 이동 시킵니다
		map.setCenter(moveLatLon);
	}
 

//지우면 안댐!!
$('#areaP').on('change', function(){
	data4a = $('#areaP').val();
	data4b = data4a * 3.3058;
	$('#areaM').val(data4b);
	
	console.log("평수 : "+data4a);
	console.log("제곱미터 : "+data4b);
});



