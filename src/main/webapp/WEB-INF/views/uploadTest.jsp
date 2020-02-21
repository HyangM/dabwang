<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String roomType = request.getParameter("roomType");
String address = request.getParameter("address");

String dealType = request.getParameter("dealType");
String deposit = request.getParameter("deposit");
String monthRent = request.getParameter("monthRent");
String yearRent = request.getParameter("yearRent");
String dealRent = request.getParameter("dealRent");

String areaP = request.getParameter("areaP");
String areaM = request.getParameter("areaM");
String floor = request.getParameter("floor");
String moveDay = request.getParameter("moveDay");

String mCost = request.getParameter("mCost");
String parking = request.getParameter("parking");
String elevator = request.getParameter("elevator");
String options = request.getParameter("options");
String lof = request.getParameter("lof");

String title = request.getParameter("title");
String content = request.getParameter("content");
String picName  = request.getParameter("picName");




%>


</head>
<body>
<p> 매물종류 : <%=roomType%></p>
<p> 매물종류 : ${roomType}</p>
<p> 주소 : <%=address%></p>
<hr/>
<p> 거래유형 : <%=dealType%></p>
<p> 보증금 : <%=deposit%></p>
<p> 월세 : <%=monthRent%></p>
<p> 전세 : <%=yearRent%></p>
<p> 매매가 : <%=dealRent%></p>

<p> 평수 : <%=areaP%></p>
<p> 제곱미터 : <%=areaM%></p>
<p> 층수 : <%=floor%></p>
<p> 입주가능일 : <%=moveDay%></p>

<p> 관리비 : <%=mCost%></p>
<p> 주차여부 : <%=parking%></p>
<p> 엘리베이터 : <%=elevator%></p>
<p> 옵션들 : <%=options%></p>
<p> 전세자금대출 : <%=lof%></p>

<p> 제목 : <%=title%></p>
<p> 글내용 : <%=content%></p>
<p> 방사진이름(1장) : <%=picName%></p>


</body>
</html>