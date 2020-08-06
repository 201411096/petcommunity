<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../views/header.jsp"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>The Look - Photo Gallery Template</title>
<meta charset="UTF-8">
<meta name="description" content="Instyle Fashion HTML Template">
<meta name="keywords" content="instyle, fashion, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Noto+Serif+KR:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<!-- Stylesheets -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_seyeong/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_seyeong/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_seyeong/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_seyeong/css/slicknav.min.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_seyeong/css/animate.css" />
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_footer/css/style.css" />


<!-- Main Stylesheets -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_seyeong/css/style.css" />


<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->

</head>
<body>


	<!-- Hero section -->
	<div id="bodyBackgroundColor">
	<section class="hero-section">
		<!--       <figure><img id="dialogFlow" src="./resources/bootstrap_template/template_01/img/gallery/noun_364.png" alt="" style="width: 10%"></figure> -->
		<div class="hero-slider owl-carousel">
			<div class="hs-item">
				<div class="hs-bg set-bg sm-overlay" id="imgMain"
					data-setbg="resources/bootstrap_template/bootstrap_seyeong/img/slider/cover1-1.jpg"></div>
				<div class="sp-container">
					<div class="hs-text">
						<h2>
							Give Love,<br>Give Hope,
						</h2>
						<p>
							반려동물과<br>함께
						</p>
					</div>
				</div>
			</div>
			<div class="hs-item">
				<div class="hs-bg set-bg sm-overlay"
					data-setbg="resources/bootstrap_template/bootstrap_seyeong/img/slider/cover1-2.jpg"></div>
				<div class="sp-container">
					<div class="hs-text">
						<h2>
							Together,<br>get better
						</h2>

					</div>
				</div>
			</div>
			<div class="hs-item">
				<div class="hs-bg set-bg sm-overlay"
					data-setbg="resources/bootstrap_template/bootstrap_seyeong/img/slider/cover1-3.jpg"></div>
				<div class="sp-container">
					<div class="hs-text">
						<h2>
							Together,<br>get better
						</h2>
					</div>
				</div>
			</div>
		</div>

	</section>

	<!-- Hero section end -->

	<!-- Gallery section -->
	<section class="gallery-section">
		<div class="sp-container">
			<div class="gallery-text">
				<h1>about okidoghere</h1>
			</div>
			<div class="gallery-item">
				<p>
					작은 생명을 돕고싶은 마음을 모아<br>깨끗하고 투명하게 후원되는 프로젝트
				</p>
				<img
					src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/2.jpg"
					alt="#">
			</div>


			<div class="gallery-item">
				<p>
					반려동물을 잃어버렸을 때<br>정보를 공유할 수 있는 커뮤니티   
				</p>
								<img
					src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/3.jpg"
					alt="#">
			</div>
			<div class="gallery-item">
				<p>
					커뮤니티<br>동물병원 찾기
				</p>
				<img
					src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/3.jpg"
					alt="#">
			</div>
		</div>

	</section>
	<!-- Gallery section end -->

	<!-- Blog section -->
	<section class="blog-section">
	<div class="blog-text-title"><h2>오늘 많이 본 게시글</h2></div>
	
		<div class="sp-container-form">
		
			<div class="blog-title-col">
			
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/01.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>반려동물 실종 신고</h4> <span>Find Board List</span>
						</span>
						<c:forEach items="${lostBoardvo}" var="item">
						<a id="link" href="/petcommunity/getLostBoard.do?lostboardId=${item.lostboardId}">${item.lostboardTitle}</a> <br>
						</c:forEach>
						<div id="moreView">
						<a href="/petcommunity/lostboardlist.do" class="site-btn">더보기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
							</div>
					</div>
				</div>
				
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/03.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>반려동물 발견</h4> <span>Find Board List</span>
						</span>
						<c:forEach items="${FindBoardvo}" var="item">
						<a id="link" href="/petcommunity/getFindBoard.do?findboardId=${item.findboardId}">${item.findboardTitle} </a><br>
						</c:forEach>
						<div id="moreView">
						<a href="/petcommunity/findboardlist.do" class="site-btn">더보기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
							</div>
					</div>
				</div>
				
			</div>
			
			<div class="blog-content-col">
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/02.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>고객문의</h4> <span>Qna Board List</span>
						</span>
						<c:forEach items="${Qnavo}" var="item">
						<a id="link" href="/petcommunity/qnaContent.do?questionboardId=${item.questionboardId}">${item.questionboardTitle}</a><br>
						</c:forEach>
						<div id="moreView">
						<a href="/petcommunity/cs.do" class="site-btn">더보기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
							</div>
					</div>
				</div>
				
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/04.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>커뮤니티</h4> <span>COMMUNITY BOARD</span>
						</span>
						<c:forEach items="${CommunityBoardvo}" var="item">
						<a id="link" href="/petcommunity/getBoardContent.do?communityboardId=${item.communityboardId}">${item.communityboardTitle}</a><br>
						</c:forEach>
						<div id="moreView">
						<a href="/petcommunity/communityBoardList.do" class="site-btn">더보기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	
	<!-- Blog section end -->
	<!--    <!-- Footer section  -->
	<%@include file="../views/footer.jsp"%>

	<!--====== Javascripts & Jquery ======-->
	<script
		src="./resources/bootstrap_template/bootstrap_seyeong/js/jquery-3.2.1.min.js"></script>
	<script
		src="./resources/bootstrap_template/bootstrap_seyeong/js/bootstrap.min.js"></script>
	<script
		src="./resources/bootstrap_template/bootstrap_seyeong/js/jquery.slicknav.min.js"></script>
	<script
		src="./resources/bootstrap_template/bootstrap_seyeong/js/owl.carousel.min.js"></script>
	<script
		src="./resources/bootstrap_template/bootstrap_seyeong/js/circle-progress.min.js"></script>
	<script
		src="./resources/bootstrap_template/bootstrap_seyeong/js/main.js"></script>
	<script src="./resources/js/chatbot.js"></script>

</body>
</html>