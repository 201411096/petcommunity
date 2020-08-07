<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>

<head>
<!-- header 시작-->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css/style.css" />
<link rel="stylesheet" href="./resources/css/login.css" />
<!-- main.js -->

<!-- header 끝 -->


<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>결제</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/animate.css">
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/flaticon.css">
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="./resources/bootstrap_template/bootstrap_ain/css/owl.carousel.min.css">


<!-- main css -->
<link rel="stylesheet" href="./resources/css/buy.css">
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
            <a href="logout.do">[로그아웃]</a>
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
	<!-- header section -->
	<section class="checkout_area section_gap">
		<div class="container">
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>결제정보</h3>
						<form class="row contact_form" id="buyfrm" action="buyInsert.do" method="post"
							novalidate="novalidate">
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="first" name="name"
									placeholder="" value="${sessionScope.memberVO.memberName}"> <span class="placeholder"></span>
							</div>
							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="number"
									name="number" placeholder="휴대폰 번호" value="${sessionScope.memberVO.memberTel}"> <span
									class="placeholder"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="add2" name="add2"
									placeholder="email" value="${sessionScope.memberVO.memberEmail}"> <span class="placeholder"></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="email" name="compemailany" 
								value="${sessionScope.memberVO.memberAddress}"> <span class="placeholder" ></span>
							</div>
							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="add1" name="add1"
									placeholder="상세주소"> <span class="placeholder"></span>
							</div>

							<div class="col-md-12 form-group">
								<textarea class="form-control" name="message" id="message"
									rows="1" placeholder="배송 메세지"></textarea>
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<h3>쇼핑 내역</h3>
								</div>
							</div>
							<table class="buy-table">
							<colgroup>
									<col style="width: 15%" />
									<col style="width: 50%" />
									<col style="width: 10%" />
									<col style="width: 15%" />
									<col style="width: 10%" />
							</colgroup>
								<thead>
									<tr>
										<th>이미지</th>
										<th>상품정보</th>
										<th>판매가</th>
										<th>수량</th>
										<th>합계</th>
									</tr>
								</thead>
								<tbody id='listBeforePaying'>
									
								</tbody>
								<tr>
									<td height="50" colspan="5">
										합계: <span id='finalPrice'></span>원
								</tr>

							</table>
						</form>
					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>주문</h2>
							<table class="list" id='forEmptyList' style=width:100% >
							<!-- <ul class="list"> -->
								<thead><tr><th>상품 </th><th>수량</th><th>금액</th></tr></thead>
								
							<!-- </ul> -->
														
								<!-- <li><a href="#">Fresh Blackberry <span class="middle">x
											01</span> <span class="last">2,500</span>
								</a></li>
								<li><a href="#">Fresh Blackberry <span class="middle">x
											01</span> <span class="last">2,500</span>
								</a></li> -->
								
							</table><br/>
							<ul class="list list_2">
								<li><a href="#">최종 결제 금액 <span id='finalPriceBeforePaying'></span>
								</a></li>
							</ul>
							<div class="payment_item">
								<div class="radion_btn">
									<input type="radio" id="f-option5" name="selector"> <label
										for="f-option5">실시간 계좌이체</label>
									<div class="check"></div>
								</div>
							</div>
							<div class="payment_item active">
								<div class="radion_btn">
									<input type="radio" class="" id="f-option6" name="selector"> <label
										for="f-option6">신용카드</label> <img
										src="./resources/imgs/buy/card.jpg" alt="">
									<div class="check"></div>
								</div>
							</div>
							<div class="creat_account">
								<input type="checkbox" id="f-option4" name="selector"> <label
									for="f-option4">위 구매조건을 확인, 결제진행에 동의합니다.</label>
							</div>
							<a class="main_btn" href="#">결제</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script
		src="./resources/bootstrap_template/template_01/js/jquery-3.2.1.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/bootstrap.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/jquery.slicknav.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/owl.carousel.min.js"></script>
	<script
		src="./resources/bootstrap_template/template_01/js/circle-progress.min.js"></script>
	<script src="./resources/bootstrap_template/template_01/js/main.js"></script>
	<script src="./resources/js/buy.js"></script>

</body>

</html>