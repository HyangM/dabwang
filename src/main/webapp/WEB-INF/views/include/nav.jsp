<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>부동산 필수 앱 다봥</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">

<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">

<link rel="stylesheet" href="/css/aos.css">

<link rel="stylesheet" href="/css/ionicons.min.css">

<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/icomoon.css">
<link rel="stylesheet" href="/css/style.css">


<link rel="shortcut icon" href="/images/icon.jpg">
<!-- 윤정추가 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">    -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->

<style>
.list-group-item {
	border-style: none;
}

#map_card {
	border: none;
	padding-bottom: 0px;
}

#map_card_body {
	height: 0px;
}

#table_1 {
	border-color: white;
}
</style>


</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/">다봥</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<c:choose>
						<c:when test="${sessionScope.principal.type eq '세입자'}">
							<li class="nav-item"><a href="/search" class="nav-link"><span>방찾기</span></a></li>
							<li class="nav-item"><a href="/" class="nav-link"><span>관심목록</span></a></li>
							<li class="nav-item"><a href="/mypage" class="nav-link"><span>마이페이지</span></a></li>
							<li class="nav-item"><a href="/logout" class="nav-link"><span>로그아웃</span></a></li>
						</c:when>
						
						<c:when test="${sessionScope.principal.type eq '방주인'}">
							<li class="nav-item"><a href="/search" class="nav-link"><span>방찾기</span></a></li>
							<li class="nav-item"><a href="/upload" class="nav-link"><span>방내놓기</span></a></li>
							<li class="nav-item"><a href="/mypage" class="nav-link"><span>마이페이지</span></a></li>
							<li class="nav-item"><a href="/logout" class="nav-link"><span>로그아웃</span></a></li>
						</c:when>
						
						<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer eq 'Y'}">
							<li class="nav-item"><a href="/search" class="nav-link"><span>방 찾기</span></a></li>
							<li class="nav-item"><a href="/roomApprList/1" class="nav-link"><span>매물 승인하기</span></a></li>
							<li class="nav-item"><a href="/mypage" class="nav-link"><span>마이페이지</span></a></li>
							<li class="nav-item"><a href="/logout" class="nav-link"><span>로그아웃</span></a></li>
						</c:when>
						
						<c:when test="${sessionScope.principal.type eq '공인중개사' && sessionScope.principal.typeCer eq 'N'}">
							<li class="nav-item"><a href="/search" class="nav-link"><span>방 찾기</span></a></li>
							<li class="nav-item"><a href="/mypage" class="nav-link"><span>마이페이지</span></a></li>
							<li class="nav-item"><a href="/logout" class="nav-link"><span>로그아웃</span></a></li>
						</c:when>
						
						<c:when test="${sessionScope.principal.role eq '관리자'}">
							<li class="nav-item"><a href="/search" class="nav-link"><span>방 찾기</span></a></li>
							<li class="nav-item"><a href="/" class="nav-link"><span>관심목록</span></a></li>
							<li class="nav-item"><a href="/upload" class="nav-link"><span>방내놓기</span></a></li>
							<li class="nav-item"><a href="roomApprList/1" class="nav-link"><span>매물 승인하기</span></a></li>
							<li class="nav-item"><a href="/typeApprList/1" class="nav-link"><span>공인중개사 승인하기</span></a></li>
							<li class="nav-item"><a href="/mypage" class="nav-link"><span>마이페이지</span></a></li>
							<li class="nav-item"><a href="/logout" class="nav-link"><span>로그아웃</span></a></li>
						</c:when>
						
						<c:otherwise>
							<li class="nav-item"><a href="/search" class="nav-link"><span>방찾기</span></a></li>
							<li class="nav-item"><a href="/join" class="nav-link"><span>회원가입</span></a></li>
							<li class="nav-item"><a href="/login" class="nav-link"><span>로그인</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<hr />
	</nav>
	<br />
	<br />
	<br />
	<br />
	