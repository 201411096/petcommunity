<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<!-- Stylesheets -->
<!-- <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>	 -->
<!-- Main Stylesheets -->
<!-- <link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css"/> -->
<!-- nav bar -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/style.css" />
<!-- search -->
<link rel="stylesheet" href="resources/css/shop.css">
<!-- Paging -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- autocomplete 3 cdn link -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<!-- Page Preloder -->

	<!-- Products page -->

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
				<h4 id="shoptitle">유기견 후원 스토어</h4>
				<p id="shopsubtitle">판매상품은 유기견에게 후원됩니다</p>
			</div>
			<br />
			<form>
				<div id="searchDiv">
					<div class="input-group" id="searchBar">
						<!-- <input class='form-control' type="text" name="serchList" id="serchSomething"/> -->

						<!-- <span id="searchBar">class="col-lg-offset-4" 
    											
  									</span> -->
						<span id="#searchInput-container"> <input
							class="form-control" id="searchSomething" type="text">
						</span> <span class="input-group-btn">
							<button id="searchBtn" type="button" class="btn btn-default">검색</button>
						</span>
					</div>
					<p style="clear: both;"></p>
				</div>
			</form>
			<br />
			<div id="ul-div1">
				<ul class="product-filter-menu">
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="all">전체</a><span id="bar">|</span>
					</li>
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="pawInHand">PAW IN HAND</a><span id="bar">|</span>
					</li>
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="폰케이스">폰케이스</a><span id="bar">|</span></li>
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="패션">패션</a></li>
				</ul>
			</div>
			<div id="ul-div2">
				<ul class="product-filter-menu">
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="악세서리">악세서리</a><span id="bar">|</span></li>
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="반려용품">반려용품</a><span id="bar">|</span></li>
					<li><a href="#" name="tagCategory" class="tagCategory"
						value="매거진">매거진</a><span id="bar">|</span></li>
					<li><a href="#" id="acc" name="tagCategory"
						class="tagCategory" value="기타 잡화">기타 잡화</a></li>
				</ul>
			</div>
			<!-- Product filter section -->

			<div id='shopTable' class="row artists-row">
				<!-- forEach 사용 -->
				<!-- 
			<c:forEach var="shop" items="${shopList}">
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
			 -->
				<!--forEach 사용 끝 -->

			</div>
			<div id="pagination-div">
				<div id="pagination_container">
					<!--  class="col-md-offset-4"  -->
					<ul id="pagination-demo" class="pagination-lg"></ul>
				</div>
			</div>
		</div>
	</section>
	<!-- Products page end -->


	<!-- Footer section  -->

	<!-- Footer section end -->


	<script src="./resources/js/shopList.js"></script>



</body>
</html>