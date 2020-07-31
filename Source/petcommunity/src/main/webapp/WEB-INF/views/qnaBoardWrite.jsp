<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css" />
<link rel="stylesheet" href="./resources/css/qnaBoardWrite.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<title>게시판</title>
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
            <li><a href="lostboardlist.do">분실 동물 찾기</a></li>
            <li><a href="findboardlist.do">분실 동물 신고</a></li>
            <li><a href="/petcommunity/communityBoardList.do">커뮤니티</a></li>
            <li><a href="shop.do">유기견 후원 스토어</a></li>
            <li><a href="/petcommunity/productList.do">오키도키 굿즈</a></li>
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

	<div class="container">
		<div id="qnaTitle">
			<h4>게시글 작성하기</h4>
		</div>
		<br />
		<br />
		<form action="writeIntoQna.do" method='get' name="commitWrite">

			<!-- 글쓰기 -->
			<br />
			<br />
			<div class="form-group">
				<p>글 제목</p> <input type="text" class="form-control"
					name="questionboardTitle" id="questionboardTitle"
					placeholder="제목">${qnaContent.questionboardTitle }
			</div>
			<div class="form-group">
				<p>글 내용</p>
				<textarea class="form-control" rows="5" name="questionboardContent"
					id="questionboardContent" placeholder="내용을 입력해주세요.">${qnaContent.questionboardContent}</textarea>
			</div>7
			<input type="hidden" name="questionboardReadcount"
				id="questionboardReadcount" value="0">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default" id='commitWrite'>작성완료</button>
					<a class="btn btn-default" id='cancelWrite' href="/petcommunity/cs.do">돌아가기</a>
				</span>
		</form>
	</div>
</body>
</html>