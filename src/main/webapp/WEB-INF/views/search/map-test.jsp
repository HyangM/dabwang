<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao 지도 시작하기</title>


<!-- 실제 지도를 그리는 javascript API 불러오기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ad4b165fec855f2776f599a8e5f6011"></script>


<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

</head>
<body>

<!-- 지도 담을 영역 만들기 -->
<div id="map" style="width: 500px; height: 400px;"></div>

<!-- 지도를 띄우는 코드 작성하기 -->
<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

	var = positions: [
		{
			lat: 37.27943075229118,
			lng: 127.01763998406159
			},
			{
			lat: 37.55915668706214,
			lng: 126.92536526611102
			},
			{
			lat: 35.13854258261161,
			lng: 129.1014781294671
			},
			{
			lat: 37.55518388656961,
			lng: 126.92926237742505
			},
			{
			lat: 35.20618517638034,
			lng: 129.07944301057026
			},
			{
			lat: 37.561110808242056,
			lng: 126.9831268386891
			}
			]
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level : 3	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>



</body>
</html>