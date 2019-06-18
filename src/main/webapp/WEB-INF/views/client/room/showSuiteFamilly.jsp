<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>Insert title here</title>
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script> 
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/css/showroom.css"/>
		
		<!-- Custom styles for this template -->
    	<link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
				
		
	</head>
	<body>
	<div class="location">
                <ul>
                    <li><a href='/'><img src="/resources/images/hotelImages/logo.png" alt="home" class="logoImage" width="25" height="25"></a></li>
                    <li><a href='/roomGrade/showRooms'>객실</a></li>
                    <li class="current"><a href='/roomGrade/showDeluxe'>스위트 패밀리룸</a></li>
                </ul>
                <h1>오아시스 객실 상세보기</h1>
    	</div>
	<div id="content" class="content content-suite">
	<div class="sub-title">
		<h1 id="pathId">${detail.rg_grade}</h1>
	</div>
	<!-- 본문 -->
	<div class="sub-section widewrap">
		<div>
			<div class="imgGallery">
				<div id="imgGallery-frame" class="imgGallery-frame">
					
				<iframe src="/resources/images/roomImage/${detail.image1}" width="790" height="450" name="view"></iframe></div>
				<div class="imgGallery-thumbnail">
					<div id="imgGallery-list" class="imgGallery-list">
						<ul>
							<li class="swiper-slide on">
							<a href="/resources/images/roomImage/${detail.image1}" target="view"><img src="/resources/images/roomImage/${detail.image1}" alt="" width="300" height="150"></a></li>
							<li class="swiper-slide">
							<a href="/resources/images/roomImage/${detail.image2}" target="view"><img src="/resources/images/roomImage/${detail.image2}" alt="" width="300" height="150"></a></li>
							<li class="swiper-slide">
							<a href="/resources/images/roomImage/${detail.image3}" target="view"><img src="/resources/images/roomImage/${detail.image3}" alt="" width="300" height="150"></a></li>
							<li class="swiper-slide">
							<a href="/resources/images/roomImage/${detail.image4}" target="view"><img src="/resources/images/roomImage/${detail.image4}" alt="" width="300" height="150"></a></li>
							<li class="swiper-slide">
							<a href="/resources/images/roomImage/${detail.image5}" target="view"><img src="/resources/images/roomImage/${detail.image5}" alt="" width="300" height="150"></a></li>
						</ul>
					</div>
					<div id="imgGallery-nav" class="imgGallery-nav"></div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="sub-section">
		<p class="paragraph">
			<em>로열 스위트</em>는 특별한 VIP를 위한 더 특별한 공간이라는 컨셉의 객실입니다.<br>
			독특한 디자인과 기능, 사우나를 갖춘 이례적으로 큰 규모의 욕실, 게스트룸과, 응접실을 갖추고 있는<br>
			단 한명의 VIP를 위한 더 오아시스의 로열 스위트룸입니다. 
		</p>
	</div>
	<div class="sub-section">
		<div class="tbl info">
			<table>
				<colgroup>
					<col style="width:14%;">
					<col style="width:25%;">
					<col style="width:14%;">
					<col>
				</colgroup>
				<tbody>
				<tr>
					<th>객실크기</th>
					<td colspan="3">${detail.rg_area}</td>
				</tr>
				<tr>
					<th>객실가격</th>
					<td colspan="3">${detail.rg_price}원~</td>
				</tr>
				<tr>
					<th>투숙인원 규정</th>
					<td colspan="3">${detail.rg_peoples}</td>
				</tr>
				<tr>
					<th>객실구성</th>
					<td colspan="3">${detail.rg_explain}</td>
				</tr>
				<tr>
					<th>전망</th>
					<td colspan="3"><strong>CITY</strong> AND <strong>RIVER</strong></td>
				</tr>
				<tr>
					<th>제공 서비스</th>
					<td>비엔베뉴 어메니티, 초고속 무료 인터넷 서비스, 무료생수 1일 2병 제공, 순면 목욕가운 및 슬리퍼</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	</body>
</html>