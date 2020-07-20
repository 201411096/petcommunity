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
			<ul class="list-group list-group-flush">
				<li class="list-group-item">${findBoardContent.findboardId}</li>
				<li class="list-group-item">${findBoardContent.findboardTitle}</li>
				<li class="list-group-item">${findBoardContent.findboardStatus}</li>
				<li class="list-group-item">${findBoardContent.findboardName}</li>
				<li class="list-group-item">${findBoardContent.findboardTel}</li>
				<li class="list-group-item">${findBoardContent.findboardUploadtime}</li>
				<li class="list-group-item"><div id="map"></div></li>
				<li class="list-group-item">
					<div id="carouselExampleControls" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
						<c:if test="${not empty fileflag}">
							<div class="carousel-item active" data-interval='3000'>
								<img src="${pageContext.request.contextPath}/resources/imgs/findboard/default/1.png" class="d-block w-100" alt="...">
							</div>
						</c:if>
						<c:if test="${empty fileflag}">
							<div class="carousel-item active" data-interval='3000'>
								<img src="${pageContext.request.contextPath}/resources/imgs/findboard/${findBoardContent.findboardId}/${file.name}" class="d-block w-100" alt="...">
							</div>
						</c:if>
							<c:forEach items="${fileList}" var="file">
								<div class="carousel-item" data-interval='3000'>
									<img src="${pageContext.request.contextPath}/resources/imgs/findboard/${findBoardContent.findboardId}/${file.name}" class="d-block w-100" alt="...">
								</div>							
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</li>
			</ul>
			<div class="card-body">
				<p class="card-text">${findBoardContent.findboardContent}</p>
			</div>
			<div class="card-body">
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
				<c:forEach items="${fileList}" var="file">
						<img
							src="/resources/imgs/findboard/${findBoardContent.findboardId}/${file.name}" alt="...">
				</c:forEach>
			</div>
			<input type="hidden" id="findboardX" name="findboardX" value="${findBoardContent.findboardX}">
			<input type="hidden" id="findboardY" name="findboardY" value="${findBoardContent.findboardY}">
			<input type="hidden" id="findboardLocation" name="findboardLocation" value="${findBoardContent.findboardLocation}">
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ccd37d4644ab2ed5ed67441dda1abb&libraries=services"></script>
		<script src="resources/js/findboardcontent.js"></script>
</body>
</html>