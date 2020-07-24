<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../views/header.jsp" %>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="./resources/css/productCart.css"/>
		<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/animate.css">
		<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/bootstrap.min.css">


	    
		
		
		<script src="./resources/bootstrap_template/template_01/js/jquery-3.2.1.min.js"></script>
	    <script src="./resources/bootstrap_template/template_01/js/bootstrap.min.js"></script>
	    <script src="./resources/bootstrap_template/template_01/js/jquery.slicknav.min.js"></script>
	    <script src="./resources/bootstrap_template/template_01/js/owl.carousel.min.js"></script>
	    <script src="./resources/bootstrap_template/template_01/js/circle-progress.min.js"></script>
	    <script src="./resources/bootstrap_template/template_01/js/main.js"></script>
	    <script src="./resources/js/productCart.js"></script>
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	 	<title>장바구니</title>
	</head>
	<body>
		<div class="container">
			<header>
				<h1>나의 장바구니</h1><br/>
			</header>
			<hr/>

			<table class="table">
				<colgroup>
					<col id='col1'/>
					<col id='col2'/>
					<col id='col3'/>
					<col id='col4'/>
					<col id='col5'/>
				</colgroup>
				<thead>
					<tr>						
						<th>이미지</th>
						<th>상품</th>
						<th>가격</th>
						<th>개수</th>
						<th>이미지</th>
					</tr>
				</thead>
				<tbody id="cartLists">
				<!-- 	<tr class='cartList'>
						<td><a href='#'><img src='resources/imgs/product_image/pawInHand/(유기동물 후원) 바이바이 bye  buy 강아지 하드케이스 그립톡 세트.jpg' id='cartListImg'/></a></td>
						<td><span id='productName1'>상품이름 </span>&nbsp;(<span id='productPrice1'>25000</span>원)</td>
						<td><span id='productTotalPrice1'>25000</span>원</td>
						<td>
							<span>
								<input type='number' id='productAmount1' class='form-control' min="0" value='1'/>
							</span>
						</td>
						<td><a href='#'><img src='resources/imgs/product_image/cartImg/cancelButton.png'></a></td>
						
					</tr> -->
					
								
				</tbody>
			</table>
			<br/>
			<table class='table'>
				<tbody>
					<tr>
						<td>
							<span class='totalTable'> 
								<span class='text-primary'>상품이름</span> 외 
								<span class='text-primary'>x</span>개 품목  &nbsp;&nbsp;총 
								<span class='text-danger' id='totalPrice'>10000</span>원
						
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<br/><br/>
			
				<div class='buttons'>
					<button id="backToShopping" type="button" class="main_btn">쇼핑돌아가기</button> 																
					<button id="goToPay" type="button" class="main_btn">결제하러가기</button>								
				</div>
	
			
		</div>
	</body>
</html>