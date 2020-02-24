<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커 클러스터러 사용하기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
    
</head>
<body>
<p style="margin-top:-12px">
    사용한 데이터를 보시려면 
    <em class="link">
       <a href="/download/web/data/chicken.json" target="_blank">여기를 클릭하세요!</a>
    </em>
</p>
<!-- 실제 지도가 나타나는 영역. -->
<div id="map" style="width:70%;height:500px;"></div>

<!-- services와 drawing 라이브러리 불러오기 -->
<!--<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,drawing"></script> -->
<!-- 실제 지도를 그리는 javascript API 불러오기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011&libraries=clusterer"></script>

<script>
var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표??? 
    level : 14 // 지도의 확대 레벨 
});

    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });

	var data= {
			positions: [
				{
				lat: 37.58625703195563,
				lng: 126.9496035206742
				},
				{
				lat: 37.28463639199199,
				lng: 126.85984474757359
				},
				{
				lat: 35.534169458631226,
				lng: 129.31169021536095
				},
				{
				lat: 37.553341234194285,
				lng: 127.15481222237025
				},
				{
				lat: 37.62293367990081,
				lng: 126.83445005122417
				},
				{
				lat: 35.5272027005698,
				lng: 127.72953798950101
				},
				{
				lat: 35.180032285898854,
				lng: 128.06954509175367
				}
				]
				};
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    //$.get("/download/web/data/chicken.json", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng)
            });
        });

        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
   // });
</script>
</body>
</html>