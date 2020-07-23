<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../views/header.jsp" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<!-- Stylesheets -->
	<!-- <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>	 -->
	<!-- Main Stylesheets -->
	<!-- <link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css"/> -->
	<!-- nav bar -->
 	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/style.css"/>
	<!-- search -->
	<link rel="stylesheet" href="resources/css/shop.css">
	<!-- Paging -->
	<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- autocomplete 3 cdn link -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</head>
<body>
	<!-- Page Preloder -->

	<!-- Products page -->			
			<!-- Product filter section -->
	<section class="product-filter-section">
		<div class="container">
			<div class="section-title">
				<h2>반려동물들을 위한 상품 리스트</h2>
			</div>
			<br/>
				<form>
					<div id="searchDiv">
						<div class="input-group" id="searchBar">
  							<span id="#searchInput-container">
  								<input class="form-control" id="searchSomething" type="text">
							</span>
							<span class="input-group-btn">	
								<button id="searchBtn" type="button" class="btn btn-default">검색</button>
							</span>
						</div>
						<p style="clear:both;"></p>
					</div>	
				</form>
			<br/>
		<div id="ul-div">
			<ul class="product-filter-menu">
				<li><a href="#" name="tagCategory" class="tagCategory" value="test2">test2</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="test">test</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="폰케이스">폰케이스</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="패션">패션</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="악세서리">악세서리</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="반려용품">반려용품</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="매거진">매거진</a></li>
				<li><a href="#" name="tagCategory" class="tagCategory" value="기타 잡화">기타 잡화</a></li>
			</ul>
		</div>
			<!-- Product filter section -->
			
			<div id='productTable' class="row artists-row">
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
		<div id="pagination_container"><!--  class="col-md-offset-4"  -->
			<ul id="pagination-demo" class="pagination-lg"></ul>
		</div>
		</div>
		</div>
	</section>
	<!-- Products page end -->
	
	
	<!-- Footer section  -->

	<!-- Footer section end -->

	<script src="./resources/js/productList.js"></script>


	</body>
</html>
