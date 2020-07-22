<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
 <meta name="description" content="Accordions represent collapsable component with extended functionality.">
 <meta name="msapplication-tap-highlight" content="no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/qnaBoardList.css">
<!-- <link rel="stylesheet" href="resources/bootstrap_template/template_01/css3/main.css"> -->

<title>게시판</title>
</head>
<body>
	<div class="wrapper">
		<div class="col-md-6">
			<div class="accordion_left">
				<h3><strong>자주하는 질문</strong></h3>
			</div>
			<div id="accordion" class="accordion-wrapper mb-3">
				<div class="card">
					<div id="headingOne" class="card-header">
						<button type="button" data-toggle="collapse"
							data-target="#collapseOne1" aria-expanded="true"
							aria-controls="collapseOne"
							class="text-left m-0 p-0 btn btn-link btn-block">
							<h5 class="m-0 p-0">아이디를 잃어버렸어요.</h5>
						</button>
					</div>
					<div data-parent="#accordion" id="collapseOne1"
						aria-labelledby="headingOne" class="collapse show">
						<div class="card-body">아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수
							있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다. 아이디 찾기를 통해 가입 시 등록한 정보로
							조회할 수 있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다. 아이디 찾기를 통해 가입 시
							등록한 정보로 조회할 수 있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다.</div>
					</div>
				</div>
				<div class="card">
					<div id="headingTwo" class="b-radius-0 card-header">
						<button type="button" data-toggle="collapse"
							data-target="#collapseOne2" aria-expanded="false"
							aria-controls="collapseTwo"
							class="text-left m-0 p-0 btn btn-link btn-block">
							<h5 class="m-0 p-0">아이디를 잃어버렸어요.</h5>
						</button>
					</div>
					<div data-parent="#accordion" id="collapseOne2" class="collapse">
						<div class="card-body">아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수
							있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다. 아이디 찾기를 통해 가입 시 등록한 정보로
							조회할 수 있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다. 아이디 찾기를 통해 가입 시
							등록한 정보로 조회할 수 있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다.</div>
					</div>
				</div>
				<div class="card">
					<div id="headingThree" class="card-header">
						<button type="button" data-toggle="collapse"
							data-target="#collapseOne3" aria-expanded="false"
							aria-controls="collapseThree"
							class="text-left m-0 p-0 btn btn-link btn-block">
							<h5 class="m-0 p-0">아이디를 잃어버렸어요.</h5>
						</button>
					</div>
					<div data-parent="#accordion" id="collapseOne3" class="collapse">
						<div class="card-body">아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수
							있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다. 아이디 찾기를 통해 가입 시 등록한 정보로
							조회할 수 있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다. 아이디 찾기를 통해 가입 시
							등록한 정보로 조회할 수 있습니다.아이디 찾기를 통해 가입 시 등록한 정보로 조회할 수 있습니다.</div>
					</div>
				</div>
			</div>

		</div>

		<div class="container">
			<section id="container">
				<form role="form" method="get">
					
					<h5><strong>고객센터</strong></h5>
					<hr id="lineStyle"/>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>아이디</th>
								<th>관리자 권한</th>
							</tr>
						</thead>
						<c:forEach items="${qnavoList}" var="item">
							<tr>
								<td>${item.questionboardId}</td>
								<td><a href="/petcommunity/qnaContent.do?questionboardId=${item.questionboardId}">
							${item.questionboardTitle}</a></td>
								<td>${item.questionboardUploadtime}</td>
								<td>${item.questionboardReadcount}</td>
								<td>${item.memberId}</td>
								<td><button name="managerD" id="managerD">삭제</button></td>
							</tr>

						</c:forEach>
					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n" <c:out value="0"/>>-----</option>
								<option value="t" <c:out value="1"/>>제목</option>
								<option value="c" <c:out value="2"/>>내용</option>
								<option value="w" <c:out value="3"/>>작성자</option>
								<option value="tc" <c:out value="4"/>>제목+내용</option>
							</select>
						</div>
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput"
									class="form-control" value="${scri.keyword}" /> <span
									class="input-group-btn">
									<button id="qnaSearchBtn" type="button" class="btn btn-default">검색</button>
								</span> <span class="input-group-btn">
									<button id="qnaWriteBtn" type="button" class="btn btn-default">
										<a href="/petcommunity/write.do">글쓰기</a>
									</button>
								</span>
							</div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>
	<script src="resources/js/qnaBoardList.js"></script>
	<script src="resources/bootstrap_template/template_01/scripts3/main.js"></script>
</body>
</html>