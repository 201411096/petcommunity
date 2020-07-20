<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
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
<link rel="stylesheet" href="resources/css/findboardlist.css">
<title>게시판</title>
</head>
<body>
	<!-- 글내용 -->
			<br/><br/><hr/>
			<div class="form-group">
				<span id=questionboardTitle></span>
				<h2>${qnavo.questionboardTitle}</h2>
				<div id=memberId>${qnavo.memberId} <br/></div>
				<div id=questionboardUploadtime>${qnavo.questionboardUploadtime }</div>
			</div>
			<hr/>
			
			<div class="form-group">
				<span id=questionboardContent>${qnavo.questionboardContent}</span>
			</div>
			<hr/>
	<script src="resources/js/qna.js"></script>
</body>
</html>