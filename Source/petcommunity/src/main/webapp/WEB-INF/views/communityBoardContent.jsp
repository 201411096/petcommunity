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
<link rel="stylesheet" href="./resources/css/communityBoardContent.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/communityBoardContent.js"></script>

<title>게시판</title>
</head>
<body>

	<div class="container">

	<br/><br/>
		
		
			<!-- 글내용 -->
			<br/><br/><hr/>
			<div class="form-group">
				<span id=communityContentTitle>${boardContent.communityboardLocation}</span>
				<h2>${boardContent.communityboardTitle}</h2>
				<div id=communityContentWriter>${boardContent.memberId} <br/></div>
				<div id=communityContentTime>${boardContent.communityboardUploadtime }</div>
			</div>
			<hr/>
			
			<div class="form-group">
				<span id=communityContentTitle>${boardContent.communityboardContent}</span>
			</div>
			<hr/>
					
			
			
			
			<div class="form-group">
				<label>댓글달기</label>
				<textarea class="form-control" rows="5" id="commentTextarea" name="communityboardContent" placeholder="댓글입력"></textarea>		
			</div>
			
				<div class="col-xs-10 col-sm-10">	
				<button type="button" class="btn btn-default" id='goToList'>목록보기</button>
				<c:if test="${boardContent.memberId eq sessionScope.memberVO.memberId}">
					<button type="button" class="btn btn-default">수정하기</button>
					<button type="button" class="btn btn-default">삭제하기</button>
				</c:if>
				</div>	
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default" id='commentBtn'>등록</button>
				</span>			
			</div>		
	
		

</body>
</html>