<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String mCost = request.getParameter("mCost");
String parkingN = request.getParameter("parkingN");
String parkingP = request.getParameter("parkingP");

%>


</head>
<body>
<p>관리비 : <%=mCost%></p>
<p>주차 : <%=parkingN%></p>
<p>주차 : <%=parkingN%></p>


</body>
</html>