<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./resources/css/communityBoardList.css" />
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/communityBoardWrite.js"></script>

<title>게시판</title>
</head>
<body>

   <div class="container">
   <header>
         <h1> 게시글 작성하기</h1>
   </header>
   <br/><br/>
      <form action="writeIntoBoard.do" method='get' enctype='multipart/form-data'>
         <!-- 도시 고를 수 있는 셀렉트박스 -->
         <div class="col-xs-0 col-sm-2">
            <select class="form-control" id='cityName' name ='cityName'>
               <option value=0>목격</option>
               <option value=1>보관</option>
               <option value=2>유기센터 이관</option>
            </select>
         </div>
<!--          <div class="col-xs-0 col-sm-2"> -->
<!--             <select class="form-control" id='province' name ='province'> -->
<!--                <option >-----</option>                -->
<!--             </select> -->
<!--          </div> -->
         
         <!-- 글쓰기 -->
         <br/><br/>
         <div class="form-group">
            <label>글 제목</label> 
            <input type="text" class="form-control" name="communityBoardTitle" placeholder="title">
         </div>
         <div class="form-group">
            <label>글 내용</label>
            <textarea class="form-control" rows="5" name="communityBoardContent" placeholder="contents"></textarea>
         </div>
         <div>
            <button type="button" class="btn btn-default" name='imgUpload'>이미지 첨부</button>
         </div>
         <div class="col-md-4 col-md-offset-10">         
         <span class="input-group-btn">
            <button type="submit" class="btn btn-default">작성완료</button>
            <button type="button" class="btn btn-default" id='cancelWrite'>글쓰기 취소</button>
         </span>
         </div>         
      </form>      
   </div>
</body>
</html>