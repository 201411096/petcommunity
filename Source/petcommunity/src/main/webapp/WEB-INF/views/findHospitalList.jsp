<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/findHospitalList.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

<title>게시판</title>
</head>
<body>

	<div id="container" >
		<section id="contents"  class="hospital_contents">
			<h2 class="cont_tit t_center">병원찾기</h2>
			<form name="searchform" onsubmit="return false;">
			<div class="hospital_search">
			<input type="hidden" name="ex" value="Hospital" />
			<input type="hidden" name="ac" value="selectHospital" />
			<input type="hidden" name="sPage" value="1" />
			
			<input type="hidden" name="lat" id="lat" value="" />
			<input type="hidden" name="lng" id="lng" value="" />
				<div class="hospital_search_area">
					<ul>
						<li>
							<p><label class="radio"><input name="sGubun" type="radio" checked value="0" ><span class="lbl">지역별 검색</span></label></p>
							<p class="area_search">
								<span>
									<select name="sSelsi" id="sSelsi">
										<option value="">시/도</option>
										<option value="서울특별시">서울특별시</option>
										<option value="경기도">경기도</option>
										<option value="인천광역시">인천광역시</option>
										<option value="강원도">강원도</option>
										<option value="충청남도">충청남도</option>
										<option value="대전광역시">대전광역시</option>
										<option value="충청북도">충청북도</option>
										<option value="세종특별자치시">세종특별자치시</option>
										<option value="부산광역시">부산광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="대구광역시">대구광역시</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="전라남도">전라남도</option>
										<option value="광주광역시">광주광역시</option>
										<option value="전라북도">전라북도</option>
										<option value="제주도">제주도</option>
									</select>
								</span>
								
								<span>
									<select name="sSelgu" id="sSelgu">
										<option value="">구/군</option>
											<option value="강남구">강남구</option>
											
										
									</select>
								</span>
								<a href="" class="btn_mid btn_blk btn_search search_sel">검색</a>
							</p>
						</li>
						<li>
							<p><label class="radio"><input name="sGubun" type="radio" value="1" ><span class="lbl">병원명 검색</span></label></p>
							<p class="name_search"><input type="text" name="sText" id="sText" value=""><a href="#" class="btn_mid btn_blk btn_search search_txt">검색</a></p>
						</li>
					</ul>
				</div>
			</div>
			</form>
			<!-- 병원 리스트 맵 영역 -->
			<div id="hospital_map" class="hospital_map" style="position: relative; overflow: hidden; background: url("http://t1.daumcdn.net/mapjsapi/images/bg_tile.png");">
				<!-- 이 영역에 맵 API 를 넣어주시면 됩니다.  -->
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a33e4a3d21ae68ddacd68ab7eda22a2a&libraries=services"></script>
				<script src="resources/js/findHospital.js"></script>
			</div>
	
			
			<div class="table_wrap hospital_search_table map_table">
				<table class="table">
					<caption>병원 리스트 테이블</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:20%;">
						<col/>
					</colgroup>

					<tbody id="hospital_list">	
						
						<tr>
							<td colspan="3" class="no_data">데이터 조회중 입니다.</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="col-md-offset-3" id="pagination_container">
				<ul id="pagination-demo" class="pagination-lg"></ul>
			</div>
		</section>
	</div>
	
	
	<!-- Footer -->
	

</body>
</html>


<%--
	<div class="fHsptlArea">
			
					
					<div class="findHsptl">
						<div class="div_img"><img src="./resources/imgs/product_image/pawInHand/healing.jpg" alt="" /></div></br>
						<div class="searchArea">
							<input type="text" id="findHsptStr" style="width: 536.22222px;"name="" placeholder="검색어, 매장명을 입력하세요."/></br>
							<input type="image" id="findHsptBtn" name="" src="./resources/imgs/product_image/pawInHand/find.gif" onclick="storeSearch()" />
						</div>
					</div>
					</div>

	<div id="map">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a33e4a3d21ae68ddacd68ab7eda22a2a&libraries=services"></script>
	<script src="resources/js/findHospital.js"></script>
	</div></div></br></br>
</body>
</html>

--%>