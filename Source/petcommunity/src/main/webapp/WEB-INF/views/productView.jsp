<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<head>
	<!-- header 시작-->
	<!-- Stylesheets -->
	<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css/style.css" />
	<link rel="stylesheet" href="./resources/css/login.css" />
	<!-- main.js -->
	<script src="./resources/bootstrap_template/template_01/js/main.js"></script>
	
	
	<!-- header 끝 -->
	
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="img/favicon.png" type="image/png">
	<title>Fashiop</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/css/bootstrap.css">
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/linericon/style.css">
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/owl-carousel/owl.carousel.min.css"> -->
	<!-- <link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/lightbox/simpleLightbox.css"> -->
	<!-- <link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/nice-select/css/nice-select.css"> -->
	<!-- <link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/animate-css/animate.css"> -->
	<!-- <link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/jquery-ui/jquery-ui.css"> --> 
	<!-- main css -->

	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/css/style.css">
	<!-- 아래거는 리뷰 별 -->
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/productDetail/css/responsive.css">
		
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
	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_product_img">
						<img src="./resources/imgs/product_image/pawInHand/${productInfo.productName}.jpg">
					</div>
				</div>
				<!-- 제품 상세내역 -->
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${productInfo.productName }</h3>
						<h2>${productInfo.productPrice }원</h2>
						<ul class="list">
							<li>
								<a class="active" href="#">
									<span>카테고리</span> : ${productInfo.productFeature }</a>
							</li>
							<li>
								<a href="#">
									<span>재고</span> : ${productInfo.productCnt }</a>
							</li>
						</ul>
						<p>${productInfo.productContent }</p>
						<div class="product_count">
							<form action="/petcommunity/buyCartList.do">
							<label for="qty">개수:</label>
							<input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:" class="input-text qty">
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							 class="increase items-count" type="button">
								<i class="lnr lnr-chevron-up"></i>
							</button>
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 1 ) result.value--;return false;"
							 class="reduced items-count" type="button">
								<i class="lnr lnr-chevron-down"></i>
							</button>
						</div>
						
							<div class="card_area">
								<button id="addCart_btn" type="submit" class="main_btn">Add to Cart</button>
								<input type="hidden" name="productId" value="${productInfo.productId }">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">Reviews</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>Beryl Cook is one of Britain’s most talented and amusing artists .Beryl’s pictures feature women of all shapes and sizes
						enjoying themselves .Born between the two world wars, Beryl Cook eventually left Kendrick School in Reading at the
						age of 15, where she went to secretarial school and then into an insurance office. After moving to London and then
						Hampton, she eventually married her next door neighbour from Reading, John Cook. He was an officer in the Merchant
						Navy and after he left the sea in 1956, they bought a pub for a year before John took a job in Southern Rhodesia with
						a motor company. Beryl bought their young son a box of watercolours, and when showing him how to use it, she decided
						that she herself quite enjoyed painting. John subsequently bought her a child’s painting set for her birthday and it
						was with this that she produced her first significant work, a half-length portrait of a dark-skinned lady with a vacant
						expression and large drooping breasts. It was aptly named ‘Hangover’ by Beryl’s husband and</p>
					<p>It is often frustrating to attempt to plan meals that are designed for one. Despite this fact, we are seeing more and
						more recipe books and Internet websites that are dedicated to the act of cooking for one. Divorce and the death of
						spouses or grown children leaving for college are all reasons that someone accustomed to cooking for more than one
						would suddenly need to learn how to adjust all the cooking practices utilized before into a streamlined plan of cooking
						that is more efficient for one person creating less</p>
				</div>
				
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li>
												<a href="#">5 Star
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i> 01</a>
											</li>
											<li>
												<a href="#">4 Star
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i> 01</a>
											</li>
											<li>
												<a href="#">3 Star
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i> 01</a>
											</li>
											<li>
												<a href="#">2 Star
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i> 01</a>
											</li>
											<li>
												<a href="#">1 Star
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i> 01</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-3.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list">
									<li>
										<a href="#">
											<i class="fa fa-star"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star"></i>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-star"></i>
										</a>
									</li>
								</ul>
								<p>Outstanding</p>
								<!-- <form class="row contact_form" action="/petcommunity/insertProductReview.do" method="post" id="contactForm" novalidate="novalidate"> -->
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name" placeholder="Your Full name">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email" name="email" placeholder="Email Address">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="productreviewScore">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="productreviewContent" rows="1"/>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="button" value="submit" id="btn_reviewSubmit" class="btn submit_btn">작성하기</button>
										<input type="hidden" id="reviewProductId" name="productId" value="${productInfo.productId }">
										<input type="hidden" id="loginCheck" name="loginCheck" value="${loginCheck }">
									</div>
								<!-- </form> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- 프로덕트뷰 -->
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/jquery-3.2.1.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/popper.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/bootstrap.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/stellar.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/isotope/isotope-min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/jquery.ajaxchimp.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/mail-script.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/jquery-ui/jquery-ui.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/counter-up/jquery.waypoints.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/vendors/counter-up/jquery.counterup.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/productDetail/js/theme.js"></script>
	<!-- js 이벤트 -->
	<script src="./resources/js/productReview.js"></script>
</body>

</html>