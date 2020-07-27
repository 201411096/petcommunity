<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../views/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지</title>

<link rel="stylesheet" href="./resources/css/buyReceipt.css">

</head>
<body>
	<div class="tedoory">
		<figure>
			<img
				src="./resources/bootstrap_template/template_01/img/gallery/buyReceipt.PNG"
				alt="sing up image" style="width: 300px">
		</figure>
		<div id="Layout">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tblTop">

			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tblTop2">
				<tr>
					<td width="45%" class="noTd">주문번호. <span class="noStxt">${buyReceipt[0].buyId}</span></td>
				</tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" class="tbl stamp">
				<tr>
					<td width="7%" rowspan="5" align="center" class="titTd">구<br>매
						<br>자<br>정<br>보
					</td>
				</tr>
				<tr>
					<th>구매자 성함</th>
					<td width="25%" align="center">${buyReceipt[0].memberName}</td>
					<th width="14%">휴대폰 번호</th>
					<td align="center">${buyReceipt[0].memberTel}</td>
				</tr>
				<tr>
					<th>배송지</th>
					<td colspan="3">${buyReceipt[0].memberAddress}</td>
				</tr>
				<tr>
					<th>구매 날짜</th>
					<td align="center" colspan="3">${buyReceipt[0].buyListDate}</td>
				</tr>
			</table>

			<div class="basicDiv"></div>
			<c:forEach items="${buyReceipt}" var="buy">
				<table width="100%" cellspacing="0" cellpadding="0" class="tbl">
					<colgroup>
						<col style="width: 15%" />
						<col style="width: 50%" />
						<col style="width: 15%" />
						<col style="width: 10%" />
						<col style="width: 10%" />
					</colgroup>
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
						<th>결제 금액</th>
					</tr>
					<tr>
						<td class="item"><img src="./resources/imgs/product_image/pawInHand/${buy.productName}.jpg"/></td>
						<td class="item">${buy.productName}</td>
						<td class="article">${buy.buyCnt}</td>
						<td class="price">${buy.productPrice}</td>
						<td class="sum">${buy.buyListTotalprice}</td>
					</tr>

				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>