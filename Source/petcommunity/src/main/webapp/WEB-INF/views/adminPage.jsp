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
			<div class="search row">
							<div class="col-xs-2 col-sm-2">
								<select name="type" class="form-control" id='type'>
									
									<option>제목</option>
									<option>내용</option>
									<option>작성자</option>
									
								</select>
							</div>
							 
							<div class="col-xs-10 col-sm-10">
								<div class="input-group">
									<input type="text" name="keyWord" class='form-control'id="keywordadmin"/>
									<span class="input-admin-btn">
										<input id="searchBtn" type="submit" class="btn btn-default" value="검색"> 									
									</span>												
								</div>														
							</div>
							<br>
							<table class="mypage-table">
										<colgroup>
											<col style="width: 20%" />
											<col style="width: 55%" />
											<col style="width: 10%" />
											<col style="width: 15%" />
										</colgroup>
										<thead>
											<tr>
												<td width="80">주문날짜</td>
												<td width="100">상품명</td>
												<td width="50">수량</td>
												<td width="100">가격</td>

											</tr>
										</thead>
										<tbody>
											<c:forEach items="${buyList}" var="buy">
												<tr>
													<td>2020-7-21${buy.buylistDate}</td>
													<td class="target"><a href="sdf.do">${buy.productName}</a></td>
													<td>${buy.buyCnt}</td>
													<td>72000원${buy.buylistTotalprice}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
										 				
						</div>
			
			</div>
			<div id="tab-2" class="tab-content">
			</div>
			<div id="tab-3" class="tab-content"
			></div>
		</section>
	</div>

	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="resources/js/adminPage.js" type="text/javascript"></script>
</body>
</html>