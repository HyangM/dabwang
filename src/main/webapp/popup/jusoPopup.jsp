<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8"); //해당시스템의 인코딩타입이 UTF-8일 경우

	//원하시는 항목을 추가하여 사용하시면 됩니다.
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String addrDetail = request.getParameter("addrDetail");
	String jibunAddr = request.getParameter("jibunAddr");
	String entX = request.getParameter("entX");
	String entY = request.getParameter("entY");
%>
</head>
<script language="javascript">

function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDIwMDIyNjEyMjUwMTEwOTQ5NzY=";
	var resultType = '4'; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
	var inputYn= "<%=inputYn%>";

	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="http://www.juso.go.kr/addrlink/addrCoordUrl.do"; //인터넷망(행정망의 경우 별도 문의)
		document.form.submit();
	} else{
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>", "<%=jibunAddr%>","<%=entX%>", "<%=entY%>");
		window.close();
	}
}

</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" /> 
		<input type="hidden" id="returnUrl" name="returnUrl" value="" />
		<input type="hidden" id="resultType" name="resultType" value="" />
	</form>
</body>
</html>