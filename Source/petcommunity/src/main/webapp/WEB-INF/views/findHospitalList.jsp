<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/slicknav.min.css"/>
	<!-- nav bar -->
	<link rel="stylesheet" href="./resources/bootstrap_template/bootstrap_ain/css/style.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="./resources/bootstrap_template/template_01/css/style.css"/>
	<!-- Paging -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="resources/css/findHospitalList.css" />


<title>게시판</title>
</head>
<body>
	
	<section class="product-filter-section">
		<div class="container">
			<div class="section-title">
				<h2>동물 병원 찾기</h2>
			</div>
		<ul class="product-filter-menu">
				<li><a href="/petcommunity/findHospitalList.do?">전체</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=서울권">서울권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=경기권">경기권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=인천권">인천권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=강원권">강원권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=충천권">충청권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=전라권">전라권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=경상권">경상권</a></li>
				<li><a href="/petcommunity/hospitalCategory.do?hospitalCategory=제주도">제주도</a></li>
			</ul>
			<!-- Product filter section -->
			</div>
		</section>
 
		
<div class="fstoreArea">
					<%--
					<div class="tabArea">
					 
						<a href="javascript:void(0);" class="all">전체</a>
						<a href="javascript:void(0);">서울권</a>
						<a href="javascript:void(0);">경기권</a>
						<a href="javascript:void(0);">인천권</a>
						<a href="javascript:void(0);">강원권</a>
						<a href="javascript:void(0);">충청권</a>
						<a href="javascript:void(0);">전라권</a>
						<a href="javascript:void(0);">경상권</a>
						<a href="javascript:void(0);">제주도</a>
					</div>
					--%>
					<div class="fssearch wo">
						<div class="findqo"><img src="./resources/imgs/product_image/pawInHand/healing.jpg" alt="" /></div>
						<!-- <p class="fs_txt" id="searchResultMsg">총 <strong>859개</strong>의 매장을 운영하고 있습니다.</p> -->
						<div class="searchArea" style="padding:30px 0 30px">
							<input type="text" id="storeSearchStr" name="" style="width:517px;" value="" placeholder="검색어, 매장명을 입력하세요."/>
							<input type="image" name="" src="./resources/imgs/product_image/pawInHand/find.gif" onclick="storeSearch()" />
						</div>
					</div>
					<div class="mapArea">
						<div class="maptxt">
							<ul>
<li>
	<div class="cityarea">
		<div class="citytit">제주도</div>
		<div class="locarea">
			<ul>
				<li class="storeLI" data-name="첨단점">
					<a href="javascript:void(0);" data-idx="2090">
						<p class="loc_tit">첨단점</p>
						<p class="loc_lo" data-coordx="33.4514041822" data-coordy="126.5764786372">제주특별자치도 제주시 첨단로동길 106 (월평동)</p>
						<p class="loc_call">0647259246</p>
					</a>
					<div class="storeImg"></div>
				</li>
			</ul>
		</div>
	</div>
</li>
</ul>
	<div id="map">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a33e4a3d21ae68ddacd68ab7eda22a2a&libraries=services"></script>
	<script src="resources/js/findHospital.js"></script>
	</div>
		</div>
		</br>
		</br>
				

					</div>
				</div>
	

</body>
</html>