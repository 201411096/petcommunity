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
<title></title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css2/fonts1/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->

<link rel="stylesheet" href="./resources/css/mypage.css">

</head>
<body>

	<div class="main2">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
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
												<img class="imgAnimal"
													src="resources/imgs/animal/${animal.animalId}/${animal.imgAnimal}"
													style="width: 200px">
												<div class="mypage-animal">
													<h3>${animal.animalName}태어난지${animal.dateBirthday}일</h3>
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
							<c:choose>
								<c:when test="${empty buyList}">
									<h3>현재 주문 내역이 없습니다.</h3>
								</c:when>

								<c:otherwise>
									<table class="mypage-table">
										<colgroup>

											<col style="width: 20%" />

											<col style="width: 60%" />

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
													<td class="target"><a href="">${buy.productName}</a></td>
													<td>${buy.buyCnt}</td>
													<td>72000원${buy.buylistTotalprice}</td>
												</tr>
											</c:forEach>
										</tbody>


									</table>
								</c:otherwise>
							</c:choose>
						</div>


					</div>

				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="./resources/js/mypage.js"></script>
	<script src="./resources/bootstrap_template/template_01/js2/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>