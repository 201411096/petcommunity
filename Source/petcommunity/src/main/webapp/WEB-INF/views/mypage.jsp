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
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css2/fonts1/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet"
	href="./resources/bootstrap_template/template_01/css2/style.css">


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
								src="./resources/bootstrap_template/template_01/img/gallery/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.PNG"
								alt="sing up image" style="width: 300px">
						</figure>
						<br>
						<h2 class="form-title">마이페이지</h2>
						<input type="button" id="animal" value="나의 반려동물 등록" />

						<c:choose>
							<c:when test="${empty animalList}">
							<h4>현재 등록 되어있는 반려동물이 없습니다</h4>
							
							</c:when>
									
							<c:otherwise>

								<c:forEach items="${animalList}" var="animal">
									<!-- 프라퍼티이름 변경 -->
									<tr>
										<td>${animal.animalName }</td>
										<td>${animal.animalBirthday }</td>
										<td>${animal.animalGender }</td>
										<td>${animal.animalFeature }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="./resources/js/sh.js"></script>
	<script src="./resources/bootstrap_template/template_01/js2/main.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>