<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="./resources/css/communityBoardList.css" />
<link rel="stylesheet" href="./resources/css/adminPage.css" />
<title>관리자 페이지</title>
</head>
<body>
	<div class="container">
		<section id="container">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">판매 내역</li>
				<li class="tab-link" data-tab="tab-2">판매 통계</li>
				<li class="tab-link" data-tab="tab-3">관리자 페이지</li>
			</ul>
			<hr />
			<div id="tab-1" class="tab-content current">
				<div class="search">
					<form action="/petcommunity/datesearch.do" id="datesearch" name="datesearch">

						<div class="input-group">
							<input type="date" name="startDate" class='form-control'
								id="startDate" /> 
							<input type="date" name="endDate" class='form-control' id="endDate" /> 
							<input id="searchBtn" type="submit" class="btn btn-default" value="검색">
						</div>
					</form>
					<br>
					<table class="mypage-table">
						<colgroup>
							<col style="width: 20%" />
							<col style="width: 50%" />
							<col style="width: 10%" />
							<col style="width: 20%" />
						</colgroup>
						<thead>
							<tr id="title">
								<th>주문날짜</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${salesList}" var="item">
								<tr>
									<td>${item.buylistDate}</td>
									<td><input type="hidden" name="productId" id="productId" />
										<a href="productView.do?productId=${item.productId}">
											${item.productName}</a></td>
									<td>${item.buyCnt}</td>
									<td>${item.buyTotalprice}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="tab-2" class="tab-content"></div>
			<div id="tab-3" class="tab-content"></div>
		</section>
	</div>
	
	<script src="resources/js/adminPage.js" type="text/javascript"></script>
</body>
</html>