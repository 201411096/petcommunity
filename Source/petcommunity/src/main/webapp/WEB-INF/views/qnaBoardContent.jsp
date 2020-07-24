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
<link rel="stylesheet" href="resources/css/qnaBoardContent.css">
<title>고객문의</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="2"><h3>고객문의</h3>
				<hr id="lineStyle"></td>
			<td></td>
		</tr>
		<tr>
			<td id="title"><strong>제목</strong>
				<hr>
			</td>
			<td id="content">${qnaContent.questionboardTitle}<hr></td>

		</tr>
		<tr>
			<td id="title"><strong>작성자</strong>
				<hr>
			</td>
			<td id="content">${qnaContent.memberId}<hr></td>

		</tr>
		<tr>
			<td id="title"><strong>작성일</strong>
				<hr>
			</td>
			<td id="content">${qnaContent.questionboardUploadtime}<hr></td>
		</tr>
		<tr>
			<td id="title"><strong>조회수</strong>
				<hr>
			</td>
			<td id="content">${qnaContent.questionboardReadcount}<hr></td>
		</tr>
		<tr>
			<td colspan="2" id="content-content">${qnaContent.questionboardContent}<hr
					id="lineStyle">
			<input type="hidden" name="questionboardGroupId" id="questionboardGroupId" value="${qnaContent.questionboardGroupId}"/>
			</td>
		</tr>
		</table>
		
			<div id="mulBtn">
				<c:if test="${admin eq '1' && groupListSize eq 1}">
					<a href="/petcommunity/reply.do?questionboardGroupId=${qnaContent.questionboardGroupId}" class="btn btn-default" id="replyBtn">답변</a>
				</c:if>
				<a id="modifyBtn" class="btn btn-default" href="/petcommunity/qnaModify.do?questionboardId=${qnaContent.questionboardId}">수정</a>
				<button type="submit" id="deleteBtn" class="btn btn-default" value="${qnaContent.questionboardId}">삭제</button>
				<a class="btn btn-default" id="qnaListBtn" href="/petcommunity/qnaList.do">목록</a>
			</div>

	<script src="resources/js/qnaBoardContent.js"></script>
</body>
</html>