<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="../views/header.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>The Look - Photo Gallery Template</title>
	<meta charset="UTF-8">
	<meta name="description" content="Instyle Fashion HTML Template">
	<meta name="keywords" content="instyle, fashion, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Favicon -->
	<link href="./resources/bootstrap_template/template_01/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/slicknav.min.css"/>
	
	<!-- carousel Stylesheets -->
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/flaticon.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/slicknav.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/jquery-ui.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/animate.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/style.css"/>
	
	
	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->

	<!-- Artists page -->

		<!-- 
		<div class="sp-container">
			<div class="page-title">
				<h2>Artists</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mattis et augue non mollis. Sed sagittis.</p>
			</div>
			 -->
			
			<!-- Product filter section -->
	<section class="product-filter-section">
		<div class="container">
			<div class="section-title">
				<h2>반려동물을 위한 상품 리스트</h2>
			</div>
			<ul class="product-filter-menu">
				<li><a href="/petcommunity/shop.do?">전체</a></li>
				<li><a href="/petcommunity/shopName.do?shopName=pawInHand">PAW IN HAND</a></li>
				<li><a href="/petcommunity/shopCategory.do?shopCategory=폰케이스">폰케이스</a></li>
				<li><a href="/petcommunity/shopCategory.do?shopCategory=패션">패션</a></li>
				<li><a href="/petcommunity/shopCategory.do?shopCategory=악세서리">악세서리</a></li>
				<li><a href="/petcommunity/shopCategory.do?shopCategory=반려용품">반려용품</a></li>
				<li><a href="/petcommunity/shopCategory.do?shopCategory=매거진">매거진</a></li>
				<li><a href="/petcommunity/shop.do?shopCategory=기타 잡화">기타 잡화</a></li>
			</ul>
			<!-- Product filter section -->
			
			<div class="row artists-row">
			<!-- forEach 사용 -->
			<c:forEach var="shop" items="${shops}">
				<div class="col-lg-4 col-sm-6 artists-col">
					<a href="${shop.shopLink }" target="_blank">
					<div class="artists-item">
						<img src="./resources/imgs/product_image/pawInHand/${shop.shopProductname}.jpg" alt="">
						<h4>${shop.shopProductname}</h4>
						<span>${shop.shopProductprice}</span>
						<p>${shop.shopName}</p>
					</div>
					</a>
				</div>
			</c:forEach>
			
				<!--forEach 사용 끝 -->
				
				<!-- 
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/1.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/2.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/3.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/4.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/5.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/6.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/7.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 artists-col">
					<div class="artists-item">
						<img src="./resources/bootstrap_template/template_01/img/artists/8.jpg" alt="">
						<h4>John Doe</h4>
						<span>Photographer</span>
						<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollicitudin. </p>
					</div>
				</div>
				<div class="col-lg-4 col-sm-12 artists-col">
					<a class="artists-more-btn" href="#">
						<img src="./resources/bootstrap_template/template_01/img/icons/arrow-big.png" alt="">
					</a>
				</div>
			</div>
		-->
		</div>
	</section>
	
	<!-- Artists page end -->
	
	<!-- letest product section -->
	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>LATEST PRODUCTS</h2>
			</div>
			<div class="product-slider owl-carousel">
				<div class="product-item">
					<div class="pi-pic">
						<img src="./resources/bootstrap_template/bootstrap_ain/img/product/1.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top </p>
					</div>
				</div>
				<div class="product-item">
					<div class="pi-pic">
						<div class="tag-new">New</div>
						<img src="./resources/bootstrap_template/bootstrap_ain/img/product/2.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Black and White Stripes Dress</p>
					</div>
				</div>
				<div class="product-item">
					<div class="pi-pic">
						<img src="./resources/bootstrap_template/bootstrap_ain/img/product/3.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top </p>
					</div>
				</div>
				<div class="product-item">
						<div class="pi-pic">
							<img src="./resources/bootstrap_template/bootstrap_ain/img/product/4.jpg" alt="">
							<div class="pi-links">
								<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
								<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$35,00</h6>
							<p>Flamboyant Pink Top </p>
						</div>
					</div>
				<div class="product-item">
						<div class="pi-pic">
							<img src="./resources/bootstrap_template/bootstrap_ain/img/product/6.jpg" alt="">
							<div class="pi-links">
								<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
								<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6>$35,00</h6>
							<p>Flamboyant Pink Top </p>
						</div>
					</div>
			</div>
		</div>
	</section>
	<!-- letest product section end -->
	
	
	<!-- Footer section  -->
	<footer class="footer-section spad">
		<div class="sp-container">
			<div class="row m-0">
				<div class="col-lg-4 footer-text">
					<h2>Get in touch</h2>
					<p>Pellentesque dictum nisl in nibh dictum volutpat nec a quam. Vivamus suscipit nisl quis nulla pretium, vitae ornare leo sollic itudin. Aenean quis velit pulvinar, pellentesque neque vel, laoreet orci. Suspendisse potenti. </p>
				</div>
				<div class="col-lg-8">
					<form class="contact-form">
						<div class="row">
							<div class="col-lg-4">
								<input type="text" placeholder="Your Name">
							</div>
							<div class="col-lg-4">
								<input type="text" placeholder="Your Email">
							</div>
							<div class="col-lg-4">
								<input type="text" placeholder="Subject">
							</div>
							<div class="col-lg-12">
								<textarea placeholder="Message"></textarea>
								<button class="site-btn sb-light" type="submit">send message <img src="./resources/bootstrap_template/template_01/img/icons/arrow-right-white.png" alt=""></button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
		</div>
	</footer>
	<!-- Footer section end -->

	
	<!--====== Javascripts & Jquery ======-->
	<script src="./resources/bootstrap_template/template_01/js/jquery-3.2.1.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/bootstrap.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/jquery.slicknav.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/owl.carousel.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/circle-progress.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/main.js"></script>
	<!--====== carousel ======-->
	<script src="./resources/bootstrap_template/bootstrap_ain/js/jquery-3.2.1.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/bootstrap.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/jquery.slicknav.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/owl.carousel.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/jquery.nicescroll.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/jquery.zoom.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/jquery-ui.min.js"></script>
	<script src="./resources/bootstrap_template/bootstrap_ain/js/main.js"></script>


	</body>
</html>
