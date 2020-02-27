/**
 * 
 */
// src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=services,clusterer,drawing"

$('label').on('click', function(){
    $('label').removeClass('selected');
    $(this).addClass('selected');
});

//$('.room--type').on('click', function(){
//	data2 = $('.room--type').val();
//	console.log("종류선택 : "+data2);
//});  이거 쓰면 버튼이 한번 클릭 됐을때 data2 값이 변하지 않음.



//도로명 주소검색
function goPopup() {
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출함.
	var pop = window.open("/popup/jusoPopup.jsp", "pop", "width=570, height=420, scrollbars=yes, resizable=yes");
}

//function jusoCallBack(roadFullAddr, addrDetail, entX, entY){
//	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
//	
//	$('#addr').val(roadFullAddr);
//	$('#detailAddr').val(addrDetail);
//	
//	$('#entX').val(entX);
//	$('#entY').val(entY);
//	
//	
////	var data = roadFullAddr;
////	var geocoder = new kakao.maps.services.Geocoder();
////	
////	var callback = function(result, status) {
////	    if (status === kakao.maps.services.Status.OK) {
////	        console.log(result);
////	    }
////	};
////	
////	geocoder.addressSearch(data, callback);
////	alert(data);
//	
//	
//	
//}

// 카카오 좌표계 WCONG 의 x좌표(lng 경도), y좌표(lat 위도) 가져오는것.
//$('#entX').on('change', function(){
//
//	alert('aaa');	
//	var data = $('#addr').val();  //주소값을 data 변수에 넣는다.
//	 console.log(data);
//	
//	
//	var geocoder = new kakao.maps.services.Geocoder();
//	
//	var callback = function(result, status) {
//	    if (status === kakao.maps.services.Status.OK) {
//	        console.log(result);
//	    }
//	};
//	geocoder.addressSearch(data, callback);
//});





//geocoder.addressSearch('해남군 송지면', callback);




//var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs"; // from
//var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
//
//// 변환한 위도 경도 값 저장
//var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
//
//// Proj4js 라이브러리를 위한 CDN  :  https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.0/proj4-src.js
////<!-- https://mvnrepository.com/artifact/org.locationtech.geotrellis/geotrellis-proj4 -->
////	<dependency>
////	    <groupId>org.locationtech.geotrellis</groupId>
////	    <artifactId>geotrellis-proj4_2.12</artifactId>
////	    <version>3.2.0</version>
////	</dependency>
//
////var firstProjection =  ' PROJCS [ "NAD83 / 매사추세츠 본토", GEOGCS [ "NAD83", DATUM [ "North_American_Datum_1983", SPHEROID [ "GRS 1980", 6378137,298.257222101, AUTHORITY [ "EPSG", "7019"]], AUTHORITY [ "EPSG", "6269"]], PRIMEM [ "그리니치", 0, AUTHORITY [ "EPSG", "8901"]], UNIT [ "정도", 0.01745329251994328, AUTHORITY [ "EPSG", "9122"]], AUTHORITY [ "EPSG", "4269"]], UNIT [ "metre", 1, AUTHORITY [ "EPSG", "9001"]], PROJECTION [ "Lambert_Conformal_Conic_2SP"], PARAMETER [ "standard_parallel_1", 42.68333333333333], PARAMETER [ "standard_parallel_2", 41.71666666666667], PARAMETER [ "latitude_of_origin", 41], PARAMETER [ "central_meridian ",-71.5], PARAMETER ["false_easting ", 200000], PARAMETER ["false_northing ", 750000], AUTHORITY ["EPSG ","26986 "], AXIS ["X ", EAST], AXIS ["Y " , NORTH]] ' ;
////var secondProjection =  " + proj = gnom + lat_0 = 90 + lon_0 = 0 + x_0 = 6300000 + y_0 = 6300000 + ellps = WGS84 + datum = WGS84 + units = m + no_defs " ;
////후자의 예제에서는이 두 가지를 다시 정의하지 않겠습니다. 
//proj4 (firstProjection, secondProjection, [ 2 , 5 ]);
////[-2690666.2977344505, 3662659.885459918]
//
//
//
////
////var coordinates = req.body; // 받아온 XY좌표
//// point array 1
////var point1 = [coordinates.x1, coordinates.y1]
//
//// point array 2 : var point2 = [coordinates.x2, coordinates.y2]
//
//var firstProjection = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs"; // from
//var secondProjection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"; // to
//
//// #1. 변환한 위도 경도 값 저장
//var lonAndLat1 = proj4(firstProjection, secondProjection, point1);// from 경위도
////var lonAndLat2 = proj4(firstProjection, secondProjection, point2); // to 경위도
//
//출처: https://windingroad.tistory.com/27 [나의 Winding Road]











// 전세, 월세, 매매 버튼을 각가 누르면, 가격을 입력하는 텍스트 상자가 나타나게 함.
//

//지우면 안댐!!
$('#areaP').on('change', function(){
	data4a = $('#areaP').val();
	data4b = data4a * 3.3058;
	$('#areaM').val(data4b);
	
	console.log("평수 : "+data4a);
	console.log("제곱미터 : "+data4b);
});





// 마지막에 서브밋 눌럿을때!!
// 이거 말고 폼데이터로 보내야 함.
//$('#room--upload').on('click', function() {
//	var data = {
//			
//		username : $('#username').val(),
//		password : $('#password').val(),
//		email : $('#email').val()
//	};
//
//	$.ajax({
//		type : 'POST',
//		url : '/user/join',
//		data : JSON.stringify(data),
//		contentType : 'application/json; charset=utf-8',
//		dataType : 'json'
//	}).done(function(r) {
//		if (r.statusCode == 200) {
//			console.log(r);
//			alert('회원가입 성공');
//			location.href = '/user/login';
//		} else {
//			if (r.msg == '아이디중복') {
//				console.log(r);
//				alert('아이디가 중복되었습니다.');
//			} else {
//				console.log(r);
//				alert('회원가입 실패');
//			}
//		}
//	}).fail(function(r) {
//		var message = JSON.parse(r.responseText);
//		console.log((message));
//		alert('서버 오류');
//	});
//});