<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="resources/css/qnaBoardContent.css">
<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>고객문의</title>

</head>

<body>
<!-- header section -->
	<header class="header-section">
		<div class="header-warp">
			<a href="header.do" class="site-logo"> <img
				src="./resources/bootstrap_template/template_01/img/logo2.png"
				alt="">
			</a>
			<ul class="main-menu">

				<c:if test="${! empty sessionScope.memberVO}">
            
            ${sessionScope.memberVO.memberName}님, 안녕하세요
            <a href="logout.do">[로그아웃하기]</a>
					<a href="mypageselect.do">[마이 페이지]</a>

				</c:if>

				<li><a href="index.html">분실 동물 찾기</a></li>
				<li><a href="/petcommunity/communityBoardList.do">커뮤니티</a></li>
				<li><a href="shop.do">유기견 후원 스토어</a></li>
				<li><a href="/petcommunity/findHospitalList.do">동물 병원 정보</a></li>
				<li><a href="/petcommunity/cs.do">고객 문의</a></li>
				<li><a href="contact.html">Contact</a></li>

				<c:if test="${empty sessionScope.memberVO}">
					<li><a href="login.do">로그인/회원가입</a></li>
				</c:if>

				<c:if test="${sessionScope.memberVO.memberId eq 'admin1234'}">
					<li><a href="login.do">관리자페이지</a></li>
				</c:if>

			</ul>
			<hr>
		</div>
	</header>
	<!-- header section -->
		<table>
			<tr>
				<td colspan="2"><h4>고객문의</h4>
					<hr id="lineStyle"></td>
				<td></td>
			</tr>
			<tr>
				<td id="title" style="width: 20%">제목
					<hr>
				</td>
				<td id="content" style="width: 80%">${qnaContent.questionboardTitle}<hr></td>
			</tr>
			<tr>
				<td id="title" style="width: 20%">작성자
					<hr>
				</td>
				<td id="content" style="width: 80%">${qnaContent.memberId}<hr></td>
			</tr>
			<tr>
				<td id="title" style="width: 20%">작성일
					<hr>
				</td>
				<td id="content" style="width: 80%">${qnaContent.questionboardUploadtime}<hr></td>
			</tr>
			<tr>
				<td id="title" style="width: 20%">조회수
					<hr>
				</td>
				<td id="content" style="width: 80%">${qnaContent.questionboardReadcount}<hr></td>
			</tr>
			<tr>
				<td colspan="2" id="content-content" style="width: 80%">${qnaContent.questionboardContent}<hr
						id="lineStyle">
						</td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="2" id="listButton"><button id="qnaListBtn"
						type="button" class="btn btn-default">목록보기</button></td>
				<td id="modi">
						<a class="btn btn-default" href="/petcommunity/qnaModify.do?questionboardId=${qnaContent.questionboardId}">수정</a>
					<button id="qnaDeleteBtn" type="button" class="btn btn-default">삭제</button></td>
			</tr>
		</table>
	
	<script src="resources/js/qnaBoardContent.js"></script>
</body>
</html>