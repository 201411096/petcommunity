<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="Accordions represent collapsable component with extended functionality.">
<meta name="msapplication-tap-highlight" content="no">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="resources/css/qnaBoardList.css">
<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> 
<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_footer/css/style.css" />
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
	
	<div class="container">
		<section id="container">
			<h4 id="qnatitle">
				고객센터
			</h4>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>
						<th>등록일</th>
						<th>조회수</th>	
					</tr>
				</thead>
				<tbody id="QnaBoardTbody">
				</tbody>
				<%-- 				<c:forEach items="${qnavoList}" var="item"> --%>
				<!-- 					<tr> -->
				<%-- 						<td>${item.questionboardId}</td> --%>
				<!-- 						<td> -->
				<%-- 						<a href="/petcommunity/qnaContent.do?questionboardId=${item.questionboardId}"> --%>
				<%-- 								${item.questionboardTitle}</a></td> --%>
				<%-- 						<td>${item.questionboardUploadtime}</td> --%>
				<%-- 						<td>${item.questionboardReadcount}</td> --%>
				<%-- 						<td>${item.memberId}</td> --%>
				<!-- 					</tr> -->

				<%-- 				</c:forEach> --%>
			</table>
			<div class="search row">
				<div class="col-xs-2 col-sm-2">
					<select name="searchType" id="searchType" class="form-control">
						<option value="0">-----</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">아이디</option>
					</select>
				</div>
				<div class="col-xs-10 col-sm-10">
					<div class="input-group">
						<input type="text" name="keyword" id="keywordInput" class="form-control" /> 
						<span class="input-group-btn">
							<button id="searchBtn" type="submit" class="btn btn-default">검색</button>
						</span> 
						<span class="input-group-btn">
						<button id="writeBtn" type="submit" class="btn btn-default" >글쓰기</button>
<!-- 						<a href="/petcommunity/write.do" id="writeBtn" class="btn btn-default">글쓰기</a> -->
						</span>
					</div>
				</div>
				<ul id="pagination-demo" class="pagination-lg"></ul>
			</div>
		</section>
	</div>
	<!-- Footer section  -->
<!-- 	<hr id="lineStyle"> -->
	<footer class="footer-section spad" id="footer">
		<div class="sp-container">
			<div class="row m-0">
				<div class="col-lg-4 footer-text">
					<h2>
						<strong>OKI DOG HERE</strong>
					</h2>
				</div>
				<div class="col-lg-8">
					<div class="col-lg-4 footer-text">
						<p>
							오키독히얼 <br> (153-759) 서울시 금천구 가산동 426-5 <br> 월드메르디앙 2차
							413호<br> <a href="/petcommunity/cs.do" id="qna">고객센터</a>
							1588-8282<br> 사업자번호 : 000-0000-00000<br>
						</p>

					</div>
					<div class="copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer section end -->
	<script src="resources/js/qnaBoardList.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/main.js"></script>
	<script src="resources/bootstrap_template/template_01/scripts3/main.js"></script>
</body>

</html>