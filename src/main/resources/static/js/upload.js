/**
 * 
 */
var data1 ="";
var data2 ="";
var data3a ="";
var data3b ="";
var data4a ="";
var data4b ="";
var data5 ="";
var data6 ="";
var data7 ="";
var data8 ="";
var data9 ="";
//$('.room--type').on('click', function(){
//	data2 = $('.room--type').val();
//	console.log("종류선택 : "+data2);
//});  이거 쓰면 버튼이 한번 클릭 됐을때 data2 값이 변하지 않음.
//

$('.room--type').on('click', function(event){
	data1 = event.target.attributes.rtype.value;
 	console.log("종류선택 : "+data1);

});


//이거 안됨.ㅜㅜ
function goPopup() {	
//	alert('aaaa');
	var pop = window.open("/popup/jusoPopup.jsp", "pop", "width=570, height=300, scrollbars=yes, resizable=yes");
}


//이거 안됨.ㅜㅜ
function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	document.form.address.value = roadFullAddr;		
//	$('#address').val(roadFullAddr);
}


$('#address').on('change', function(){
	data2 = $('#address').val();
 	console.log("주소 : "+data2);
});

// 전세, 월세, 매매 버튼을 각가 누르면, 가격을 입력하는 텍스트 상자가 나타나게 함.
//
$('#mBuy').on('click', function(){
//	data3a = $('#mBuyDeposit').val();
//	data3b = $('#mBuyPrice').val();
// 	console.log("월세 : "+data3a + "/" +data3b );
});

$('#mBuyDeposit').on('change', function(){
	data3a = $('#mBuyDeposit').val();
 	console.log("보증금 : "+data3a);
});
$('#mBuyPrice').on('change', function(){
	data3b = $('#mBuyPrice').val();
 	console.log("월세 : "+data3b);
});

$('#areaP').on('change', function(){
	data4a = $('#areaP').val();
	data4b = data4a * 3.3058;
	$('#areaM').val(data4b);
	
	console.log("평수 : "+data4a);
	console.log("제곱미터 : "+data4b);
});

$('#floorNum').on('change', function(){
	data5 = $('#floorNum').val();
 	console.log("층수 : "+data5);
 	
 	console.log("평수 : "+data4a);
	console.log("제곱미터 : "+data4b);
});


$('.mDay').on('click', function(event){
	data6 = event.target.attributes.mDay.value;
 	console.log("입주가능일 : "+data6);
});

$('#mCost').on('change', function(){
	data7 = $('#mCost').val();
 	console.log("관리비 : "+data7);
});

$('.parking').on('click', function(event){
	data8 = event.target.attributes.parking.value;
 	console.log("주차여부 : "+data8);
});
$('.elevator').on('click', function(event){
	data9 = event.target.attributes.elevator.value;
 	console.log("엘리베이터 : "+data9);
});





// 마지막에 서브밋 눌럿을때!!
// 이거 말고 폼데이터로 보내야 함.
$('#room--upload').on('click', function() {
	var data = {
			
		username : $('#username').val(),
		password : $('#password').val(),
		email : $('#email').val()
	};

	$.ajax({
		type : 'POST',
		url : '/user/join',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json'
	}).done(function(r) {
		if (r.statusCode == 200) {
			console.log(r);
			alert('회원가입 성공');
			location.href = '/user/login';
		} else {
			if (r.msg == '아이디중복') {
				console.log(r);
				alert('아이디가 중복되었습니다.');
			} else {
				console.log(r);
				alert('회원가입 실패');
			}
		}
	}).fail(function(r) {
		var message = JSON.parse(r.responseText);
		console.log((message));
		alert('서버 오류');
	});
});



















	