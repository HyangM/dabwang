$('#typeNum').focusout(function() {
	var typeNum = $('#typeNum').val();
	if(typeNum.length == 10){
		$('#typeLength').remove();
	}else {
		$('#typeLength').remove();
		var message = "<p id='typeLength' class='text-danger'>사업자등록번호 길이를 확인해주세요.</p>"
		$('#typeNum').after(message);
	}
});