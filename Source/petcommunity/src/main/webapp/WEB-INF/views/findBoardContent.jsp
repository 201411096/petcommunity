<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./resources/css/findboardwrite.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>게시판</title>
</head>
<body>

	<div class="container">
		<div class="card">
<!-- 			<img src="..." class="card-img-top" alt="..."> -->
			<ul class="list-group list-group-flush">
				<li class="list-group-item">${findBoardContent.findboardId}</li>
				<li class="list-group-item">${findBoardContent.findboardTitle}</li>
				<li class="list-group-item">${findBoardContent.findboardStatus}</li>
				<li class="list-group-item">${findBoardContent.findboardUploadtime}</li>
				<li class="list-group-item"><div id="map"></div></li>
			</ul>
			<div class="card-body">
<%-- 				<h5 class="card-title">${findBoardContent.findboardTitle}</h5> --%>
				<p class="card-text">${findBoardContent.findboardContent}</p>
			</div>
			<div class="card-body">
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ccd37d4644ab2ed5ed67441dda1abb&libraries=services"></script>
		<script src="resources/js/findboardcontent.js"></script>
</body>
</html>