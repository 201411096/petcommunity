<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../views/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css2/fonts1/material-icon/css/material-design-iconic-font.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<!-- Main css -->

<link rel="stylesheet" href="./resources/css/mypage.css">

</head>
<body>

	<div class="main2">

		<!-- Sign up form -->
				<div class="signup-content">
						<figure>
							<img
								src="./resources/bootstrap_template/template_01/img/gallery/mypage.PNG"
								alt="sing up image" style="width: 300px">
						</figure>
						<br />
						<ul class="tabs">
							<li class="tab-link current" data-tab="tab-1">나의 반려동물</li>
							<li class="tab-link" data-tab="tab-2">나의 주문내역</li>
						</ul>
						<hr>

						<div id="tab-1" class="tab-content current">
							<c:choose>
								<c:when test="${empty animalList}">
									<h4>현재 등록 되어있는 반려동물이 없습니다</h4>

								</c:when>

								<c:otherwise>

									<c:forEach items="${animalList}" var="animal">

										<form action="AnimalUdate.do" method="post">
											<input type="hidden" name="animalName"
												value="${animal.animalName}" /> <input type="hidden"
												name="animalId" value="${animal.animalId}" /> <input
												type="hidden" name="animalBirthday"
												value="${animal.animalBirthday}" /> <input type="hidden"
												name="animalGender" value="${animal.animalGender}" /> <input
												type="hidden" name="animalFeature"
												value="${animal.animalFeature}" />


											<div class="tedoory">
												<c:if test="${! empty animal.imgAnimal}">
												<img class="imgAnimal"
													src="resources/imgs/animal/${animal.animalId}/${animal.imgAnimal}"
													style="width: 200px">
												</c:if>
												
												<div class="mypage-animal">
													<h3>${animal.animalName}태어난지&nbsp;&nbsp;${animal.dateBirthday}일</h3>
												</div>
												<div class="mypage-animal">
													<label for='animalBirthday'>생일</label> <input type="text"
														name="animalBirthday" id="animalBirthday"
														name="animalBirthday" value="${animal.animalBirthday}"
														disabled />
												</div>
												<div class="mypage-animal">
													<label for=''>성별</label> <input type="text"
														name="animalGender" id="animalGender"
														value="${animal.animalGender}" disabled />
												</div>
												<div class="mypage-animal">
													<label for=''>특징</label>
													<textarea name="animalFeature" id="animalFeature" disabled>${animal.animalFeature}</textarea>
												</div>
												<div class="mypage-animal">
													<input type="submit" value="수정" id="uBtn" />
													<button id='dBtn'>
														<a href='animalDelete.do?animalId=${animal.animalId}'>삭제</a>
													</button>
												</div>
											</div>
										</form>
										<br>

									</c:forEach>
								</c:otherwise>
							</c:choose>
							<br> <input type="submit" id="animal" class="animal-submit"
								value="반려동물 등록" />
						</div>

						<div id="tab-2" class="tab-content">	
								<div class="tedoory2">
									<table class="mypage-table">
										<colgroup>
											<col style="width: 30%" />
											<col style="width: 30%" />
											<col style="width: 30%" />
										</colgroup>
										<thead>
											<tr>
												<td>주문번호</td>
												<td>주문날짜</td>
												<td>총가격</td>
											</tr>
										</thead>
										<tbody id="buyListTbody">
										</tbody>
									</table>
									</div>
							<ul id="pagination-demo" class="pagination-lg"></ul>
						</div>
				</div>
	</div>

	<!-- JS -->
	<script src="./resources/js/mypage.js"></script>
	<script src="./resources/bootstrap_template/template_01/js2/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>