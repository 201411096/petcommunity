<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/qnaReplyBoardWrite.css">
<!-- <link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css" /> -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">


<title>게시판</title>
</head>
<body>
<section id="container">
	<div class="container">
		<div id="qnaTitle">
			<h4>Qna center</h4>
			<p id="qnasubtitle">고객문의 답변페이지 입니다.</p>
			</div>
		<br /> <br />
		<form action="replyWrite.do" method='get' name="commitReplyWrite">
			<br /> <br />
			<div class="form-group">
					<input type="hidden" name="questionboardGroupId" value="${qnaReplyContent.questionboardGroupId}" />
			</div>
			<div class="form-group">
				<label>글 제목</label> <input type="text" class="form-control"
					name="questionboardTitle" id="questionboardTitle"
					placeholder="제목" value="${qnaReplyContent.questionboardTitle}">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="5" name="questionboardContent"
					id="questionboardContent" placeholder="내용을 입력하세요." ></textarea>
					<input type="hidden" id="questionboardAnswerflag" name="questionboardAnswerflag" value="1" />
			</div>

			<input type="hidden" name="questionboardReadcount"
				id="questionboardReadcount" value="0">
			<div class="col-md-4 col-md-offset-10">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default" name='commitReplyWrite' id='commitReplyWrite'>작성완료</button>
					<a class="btn btn-default" id='cancelWrite'
					href="/petcommunity/cs.do">돌아가기</a>
				</span>
			</div>
		</form>
	</div>
	</section>
</body>
</html>
<%@include file="../views/footer.jsp"%>