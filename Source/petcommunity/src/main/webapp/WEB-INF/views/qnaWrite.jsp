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

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/qnaWrite.js"></script>

<title>게시판</title>
</head>
<body>

	<div class="container">
		<header>
			<h1>게시글 작성하기</h1>
		</header>
		<br />
		<br />
		<form action="writeIntoQna.do" method='get' name="commitWrite">

			<!-- 글쓰기 -->
			<br />
			<br />
			<div class="form-group">
				<label>글 제목</label> <input type="text" class="form-control"
					name="questionboardTitle" id="questionboardTitle"
					placeholder="title">${qnaContent.questionboardTitle }
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="5" name="questionboardContent"
					id="questionboardContent" placeholder="contents">${qnaContent.questionboardContent}</textarea>
			</div>

			<input type="hidden" name="questionboardReadcount"
				id="questionboardReadcount" value="0">
			<div class="col-md-4 col-md-offset-10">
				<span class="input-group-btn"> <input>
					<button type="submit" class="btn btn-default" id='commitWrite'>작성완료</button>
					<button type="button" class="btn btn-default" id='cancelWrite'>글쓰기
						취소</button>
				</span>
			</div>
		</form>




	</div>
</body>
</html>