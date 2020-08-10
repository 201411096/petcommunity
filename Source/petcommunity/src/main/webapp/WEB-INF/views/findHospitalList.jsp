<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./resources/css/findHospitalList.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/findHospital.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>


<title>게시판</title>
</head>
<body>
 
<div class="container">
	<header>
			<h1>병원 찾기</h1>
	</header>
	<hr/>

			<!-- 도시 고를 수 있는 셀렉트박스 -->
		<section id="container">			
			<div class="col-xs-0 col-sm-3" style="margin-right: 10%;">
				<!-- <input name="sGubun" type="radio" checked value="0" > -->
					<label class="radio">지역별 검색</label>
						<select class="form-control" id='cityName' name ='cityName'>
							<option >시/도</option>
							<option >서울</option>
							<option >인천</option>
							<option >대전</option>
							<option >광주</option>
							<option >울산</option>
							<option >대구</option>
							<option >부산</option>
							<option >세종</option>
							<option >경기</option>
							<option >강원</option>
							<option >충북</option>
							<option >충남</option>
							<option >전북</option>
							<option >전남</option>
							<option >경북</option>
							<option >경남</option>
							<option >제주</option>
						</select>
						<select class="form-control" id='province' name ='province'>
							<option >구/군</option>					
						</select>
										
						<span class="input-group-btn" style="padding-top: 10px;">
							<button type="button" class="btn btn-default" id='searchLocation'>지역별 검색
							</button>
						</span><br/><br/>
			 </div>
								

			<div class="col-xs-0 col-sm-3" style="margin-right: 10%;">
				<!-- <input name="sGubun" type="radio" value="1"> -->	
				  <label class="radio">병원명 검색</label>
						<input type="text" name="keyword" id="keywordInput" class="form-control"  placeholder="검색어, 병원명을 입력하세요."/>
							
						<span class="input-group-btn" style="padding-top: 10px;">
							<button type="button" class="btn btn-default" id='searchName'>병원명 검색
							</button>
						</span><br/><br/>			
			</div>
			
			
			<div class="col-xs-0 col-sm-3">
				<label class="radio">동물병원 워드 클라우드↓↓</label>
				<button type="button" class="btn btn-default" id='wordCloud'>word cloud here
				</button>
				<!-- <a href="#" onclick="window.open('https://localhost:8443/petcommunity/resources/imgs/wordCloud/동물병원.png', 'width=1000, height=1000')"><img src="./resources/imgs/wordCloud/동물병원.png"></a>
	 -->
			</div>
			
			
		
	<br/><br/><br/>	


			<!-- 병원 리스트 맵 영역 -->
	<div class="form-group">
	 <div id="map">
	 	<script type="text/javascript" language="javascript">
		var htmlTag = "<src='hospital.html' />";
	 	</script>
		$("#map").html(htmlTag);
    
	</div></div>
	 
				<!-- 이 영역에 맵 API 를 넣어주시면 됩니다.  -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a33e4a3d21ae68ddacd68ab7eda22a2a&libraries=services,clusterer,drawing"></script>	
					<input type="hidden" id="findHospitalX" name="findHospitalX" value="${findHospitalList.findHospitalX}">
					<input type="hidden" id="findHospitalY" name="findHospitalY" value="${findHospitalList.findHospitalY}">
					<input type="hidden" id="findhospitalAddress" name="findhospitalAddress" value="${findHospitalList.findhospitalAddress}">
				
				
	<br/><br/>
	
			<form role="form" method="get">
				<table class="table table-hover" id="findHospitalTable">	
					<thead>
						<tr>
							<th>병원명</th>
							<th>전화 번호</th>
							<th>주소</th>
							<th>운영 시간</th>
						</tr>
					</thead>
					<tbody id="findHospitalTbody">
	
					</tbody>
				</table>
			</form>
		
		
	<div class="col-md-offset-3" id="pagination_container">		
		<ul id="pagination-demo" class="pagination-lg"></ul>
	</div>

		
	
	<!-- Footer -->
	
	</section></div></body></html> 



