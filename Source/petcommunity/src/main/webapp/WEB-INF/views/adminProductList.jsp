<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./resources/css/adminProduct.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/adminProduct.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

<title>관리자 페이지</title>
</head>
<body>
	<div class="container">
		<section id="container">

			<ul class="tabs">
				<li class="tab-link" data-tab="tab-1">판매 내역</li>
				<li class="tab-link" data-tab="tab-2">판매 통계</li>
				<li class="tab-link current" data-tab="tab-3">관리자 페이지</li>
			</ul>
			<hr />

			<div id="tab-3" class="tab-content current">
				<div class="search row">
					<div class="col-xs-2 col-sm-2">
						<select name="type" class="form-control" id='type'>
							<option>상품명</option>
							<option>카테고리</option>
						</select>
					</div>

					<div class="col-xs-10 col-sm-10">
						<div class="input-group">	
							<span id="search-container">
							<input type="text" name="searchWord" class='form-control' id="searchWord" placeholder="검색어를 입력하세요."/>
							</span> 
							<span class="input-group-btn"> 
								<button id="searchBtn" type="button" class="btn btn-default">검색</button>
							</span>	
					</div></div></div>
					<br>

					<div id="productInfoButtonContainer">
						<div class="input-group">				
							<form action="/petcommunity/loadInsertProduct.do">
								<span class="input-group-btn">
									<button id="writeBtn" type="submit" class="btn btn-default">상품 등록</button>
								</span>
							</form>
					</div></div><br>	
					
						<form role="form" method="get">
							<table id="productDataTable" class="table table-hover">
								<thead>
									<tr>
										<th scope="col">상품 번호</th>
										<th scope="col">상품명</th>
										<th scope="col">가격</th>
										<th scope="col">수량</th>
										<th scope="col">카테고리</th>
										<th scope="col">상품 내용</th>
										<th scope="col">수정</th>
										<th scope="col">삭제</th>
									</tr>
								</thead>
								<tbody id="productTable">
							
								</tbody>
							</table>
						</form>
							
								<div class="col-md-offset-3" id="pagination_container">
									<ul id="pagination-demo" class="pagination-lg"></ul>
								</div>
							<div id="tab-1" class="tab-content"></div>
							<div id="tab-2" class="tab-content"></div>
							
						</div>
		</section>
	</div>
</body>
</html>