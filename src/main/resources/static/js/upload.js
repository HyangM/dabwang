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



// 전세, 월세, 매매 버튼을 각가 누르면, 가격을 입력하는 텍스트 상자가 나타나게 함.
//


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