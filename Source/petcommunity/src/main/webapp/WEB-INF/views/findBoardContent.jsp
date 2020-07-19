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
		<header>
			<h1>게시글</h1>
		</header>
		<br /> <br />
		<div>${findBoardContent.findboardId}</div>
		<div>${findBoardContent.findboardTitle}</div>
		<div>${findBoardContent.findboardContent}</div>
		<div>${findBoardContent.findboardLocation}</div>
		<div>${findBoardContent.findboardX}</div>
		<div>${findBoardContent.findboardY}</div>
		<div>${findBoardContent.findboardName}</div>
	</div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ccd37d4644ab2ed5ed67441dda1abb&libraries=services"></script>
<!-- 	<script src="resources/js/findboardwrite.js"></script> -->
</body>
</html>