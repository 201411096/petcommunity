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
			<h1>게시글 작성하기</h1>
		</header>
		<br /> <br />
		<form action="/petcommunity/insertFindBoard.do" method='post'
			enctype='multipart/form-data'>
			<!-- 글쓰기 -->
			<br /> <br />
			<div class="form-group">
				<label>상태</label> <select class="form-control" id='status'
					name='status'>
					<option value=0>목격</option>
					<option value=1>보관</option>
					<option value=2>유기센터 이관</option>
				</select>
			</div>
			<div class="form-group">
				<label>위치</label>
				<div id="map"></div>
			</div>
			<c:if test="${empty sessionScope.memberVO}">
				<div class="form-group">
					<span> <label>작성자</label> <input type="text"
						class="form-control" name="findboardName" placeholder="writer">
					</span>
				</div>
				<div class="form-group">
					<span> <label>전화번호</label> <input type="text"
						class="form-control" name="findboardTel" placeholder="tel">
					</span>
				</div>
			</c:if>
			<c:if test="${not empty sessionScope.memberVO}">
				<div class="form-group">
					<span><input type="hidden" class="form-control"
						name="memberId" placeholder="memberId"
						value="${sessionScope.memberVO.memberId}"> </span>
				</div>
			</c:if>
			<input type="hidden" name="findboardX" id="findboardX" value="">
			<input type="hidden" name="findboardY" id="findboardY" value="">
			<input type="hidden" name="findboardLocation" id="findboardLocation"
				value="">
			<input type="hidden" name="findboardLocationType" id="findboardLocationType" value="">
			<div class="form-group">
				<label>글 제목</label> <input type="text" class="form-control"
					name="findboardTitle" placeholder="title">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="5" name="findboardContent"
					placeholder="contents"></textarea>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-default" name='imgUpload'>이미지
					첨부</button>
			</div>
			<div class="col-md-4 col-md-offset-10">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default">작성완료</button>
					<button type="button" class="btn btn-default" id='cancelWrite'>글쓰기
						취소</button>
				</span>
			</div>
		</form>
	</div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ccd37d4644ab2ed5ed67441dda1abb&libraries=services"></script>
	<script src="resources/js/findboardwrite.js"></script>
</body>
</html>