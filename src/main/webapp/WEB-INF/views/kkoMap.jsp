<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>지도 생성하기</title>
</head>
<body>

<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:50%; height:500px; margin-top:30px; margin-left:30px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 위치인 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 (카카오본사 위치)
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성!!
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도 중심좌료 설정하기.
map.setCenter(new kakao.maps.LatLng(37.537183, 127.005454));
//지도의 중심좌표 반환하기.
var position = map.getCenter();
//지도의 타입 설정하기.
//map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
//지도에 컨트롤 추가하기.
var control = new kakao.maps.ZoomControl();
map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT); 
// 마우스 드래그와 모바일 터치를 이용한 지도이동 가능여부를 설정.
map.setDraggable(true);
//마우스 휠과 모바일 터치를 이용한 지도 확대, 축소 가능 여부를 설정
map.setZoomable(true);

//이 메소드로  API 내부의 좌표계의 투영 방법을 설정가능.
//map.setProjectionId(kakao.maps.ProjectionId.NONE);





</script>

</body>
</html>