
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> --%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/board.css">
<link rel="stylesheet" type="text/css" href="/css/board-detail.css">
</head>
<body>

			<c:choose>
				<c:when test="${empty blogHeadlineDto.image && empty blogHeadlineDto.blogName}">
					<header id="header--no--image">
						<div id="header--left">
						<div id="header--title">My Blog</div>
				</c:when>
				<c:when test="${empty blogHeadlineDto.image}">
					<header id="header--no--image">
						<div id="header--left">
						<div id="header--title">${blogHeadlineDto.blogName }</div>
				</c:when>
				<c:otherwise>
					<header id="header--image" style="background-image: url('http://localhost:9999/image/${blogHeadlineDto.image}');">
						<div id="header--left">
						<div id="header--title">${blogHeadlineDto.blogName}</div>
				</c:otherwise>
			</c:choose>

			<div class="wrap">
				<a class="popup--open" id="header--setting" href="#pop--up"> <img
					id="header--setting--img" src="/images/setting.png" alt="설정">
				</a>

				<form action="/blog-headline" method="post" enctype="multipart/form-data">
					<div id="pop--up" class="popup--wrap" style="display: none;">
						<div class="popup--inner" >
							<div class="popup--item">
								<h3>블로그명</h3>
								<div>
									<input class="input--text" type="text" name="blogName"  
									value="${blogHeadlineDto.blogName }" autofocus="autofocus"
									onkeyup="characterCheck(this);" onkeydown="characterCheck(this);">
									<div class="input--plus">한글, 영문, 숫자, 혼용가능 (4-25자 이내)</div>
								</div>
							</div>
							<div class="popup--item">
								<h3>블로그 상단 배경</h3>	
								<div>
								<div style="display: flex;">
									<label for="img--save" id="img--save--label">이미지 등록</label> 
									<input type="file" id="img--save"  name="file"> 
									<input class="upload-name" readonly > 
									<img src="/images/trashcan.png" id="trashcan--img" alt="휴지통"
											 style="display: none;">
									</div>
									<div class="input--plus">가로 1000px, 세로 80~300px</div>
								</div>
							</div>
										
						
							<div class="popup--item">
								<h3>YouTube URL</h3>
								<div>
								<div style="position: absolute;" class="social--text" type="text" >http://www.youtube.com/@</div>
								<input class="input--text" id="social--input" type="text" name="youtubeURL"
								onkeyup="socialCheck(this);" value="${blogHeadlineDto.youtubeURL }">
								<div class="input--plus">User ID 입력</div>
								</div>
							</div>
							<div class="popup--item">
								<h3>Instagram URL</h3>
								<div>
								<div style="position: absolute;" class="social--text" type="text" >http://www.instagram.com/</div>
								<input class="input--text"  id="social--input" type="text" name="instagramURL"
								onkeyup="socialCheck(this);" value="${blogHeadlineDto.instagramURL }">
								<div class="input--plus">User ID 입력</div>
								</div>
							</div>
							
								<button class="popup-cancel" id="popup-cancel" type="button">취소</button>
								<button class="popup--btn" id="popup--save" type="submit">확인</button>
							
						</div>
					</div>
				</form>
			</div>


		</div>
		<div id="header--right">
		<c:choose>
			<c:when test="${empty blogHeadlineDto.instagramURL }"></c:when>
			<c:otherwise>
				<a id="header--img" href="http://www.instagram.com/${instagramURL }" target="_blank"> <img id="header--insta--img"
				src="/images/instagram.png" alt="인스타그램" ></a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${empty blogHeadlineDto.youtubeURL }"></c:when>
			<c:otherwise>
			 <a id="header--img" href="http://www.youtube.com/${youtubeURL }" target="_blank"> <img id="header--youtube--img"
				src="/images/youtube.png" alt="유튜브">
			</a>
			</c:otherwise>
		</c:choose>


		</div>
	</header>

	<script type="text/javascript" src="/js/header.js"></script>