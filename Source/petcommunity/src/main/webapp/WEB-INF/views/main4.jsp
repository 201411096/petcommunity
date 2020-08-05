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
		<div class="sp-container">
			<div class="blog-title-col">
				<h2>오늘 많이본 글</h2>
			</div>
			<div class="blog-content-col">
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/img1-3.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>반려동물 실종 신고</h4> <span>Find Board List</span>
						</span>
						<p>위치기반의 알림서비스 : 지정된 위치 목격글 업로드시 알림</p>
						<a href="/petcommunity/find.do" class="site-btn">이동하기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
					</div>
				</div>
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/img1-1.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>동물병원 찾기</h4> <span>Find hospital</span>
						</span>
						<p>전국 동물병원 정보 다모여~!</p>
						<a href="/petcommunity/hospital.do" class="site-btn">이동하기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
					</div>
				</div>
				<div class="blog-item">
					<div class="blog-thumb">
						<img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/gallery/img1-2.png"
							alt="">
					</div>
					<div class="blog-content">
						<span class="blog-cata-title">
							<h4>커뮤니티</h4> <span>COMMUNITY BOARD</span>
						</span>
						<p>우리동네 갱얼쥐들 다모여라~</p>
						<a href="/petcommunity/community.do" class="site-btn">이동하기 <img
							src="./resources/bootstrap_template/bootstrap_seyeong/img/icons/arrow-right-black.png"
							alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</section>
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