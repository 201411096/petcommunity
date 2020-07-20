<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../views/header.jsp" %>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="./resources/css/communityBoardList.css"/>
	
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<script src="resources/js/communityBoardList.js"  type="text/javascript"></script>
	 	<title>게시판</title>
	</head>
	<body>
		<div class="container">
			<header>
				<h1> 커뮤니티</h1>
			</header>
			<hr />
			 
	
			
			<section id="container">
				<div class="col-xs-3 col-sm-2">
					<select class="form-control" id='showBy'>
						<option>전체보기</option>					
						<option>지역별</option>					
						<option>추천순</option>					
						<option>조회순</option>					
					</select>
				</div>
				<div id=hiddenBox>
					<div class="col-xs-0 col-sm-2">
						<select class="form-control" id='cityName' name ='cityName'>
							<option >-----</option>
						</select>
					</div>
					<div class="col-xs-0 col-sm-2">
						<select class="form-control" id='province' name ='province'>
							<option >-----</option>					
						</select>
					</div>
				</div>
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>추천</th><th>조회수</th></tr>
						</thead>
						
						<c:forEach items="${communityBoardList}" var = "communityBoardList">
							<tr>
								<td>${communityBoardList.communityboardId}</td>
								<td>
									<a href='getBoardContent.do?communityboardId=${communityBoardList.communityboardId}'>
									[<span id='locationTag'>${communityBoardList.communityboardLocation}</span>]
									${communityBoardList.communityboardTitle}
									</a>
								</td>
								<td>${communityBoardList.memberId}</td>
								<td>${communityBoardList.communityboardUploadtime}</td>
								<td>${communityBoardList.communityboardRecommend}</td>
								<td>${communityBoardList.communityboardReadcount}</td>
							</tr>
						</c:forEach>
						
					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option>-----</option>
								<option>제목</option>
								<option>내용</option>
								<option>작성자</option>
								<option>제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" class='form-control'id="keywordInput" value="${scri.keyword}"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 									
								</span>	
								<span class="input-group-btn">
									<button id="writeBtn" type="button" class="btn btn-default">글쓰기</button> 									
								</span>					
							</div>
							
							
						</div>
						 
						
					</div>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
			
			</section>
		</div>
	</body>
</html>