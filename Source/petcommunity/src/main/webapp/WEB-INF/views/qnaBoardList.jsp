<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
   content="Accordions represent collapsable component with extended functionality.">
<meta name="msapplication-tap-highlight" content="no">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/css/qnaBoardList.css">
<link rel="stylesheet"
   href="./resources/bootstrap_template/template_01/css/style.css" />
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet"
   href="./resources/bootstrap_template/bootstrap_footer/css/style.css" />
<title>게시판</title>
</head>
<body>
   <div class="container">
      <section id="container">
         <h4 id="qnatitle">고객센터</h4>
         <table class="table table-hover">
            <thead>
               <tr>
                  <td>번호</td>
                  <td>제목</td>
                  <td>아이디</td>
                  <td>등록일</td>
                  <td>조회수</td>
               </tr>
            </thead>
            <tbody id="QnaBoardTbody">
            </tbody>
            <%--             <c:forEach items="${qnavoList}" var="item"> --%>
            <!--                <tr> -->
            <%--                   <td>${item.questionboardId}</td> --%>
            <!--                   <td> -->
            <%--                   <a href="/petcommunity/qnaContent.do?questionboardId=${item.questionboardId}"> --%>
            <%--                         ${item.questionboardTitle}</a></td> --%>
            <%--                   <td>${item.questionboardUploadtime}</td> --%>
            <%--                   <td>${item.questionboardReadcount}</td> --%>
            <%--                   <td>${item.memberId}</td> --%>
            <!--                </tr> -->

            <%--             </c:forEach> --%>
         </table>
         <div class="search row">
            <div class="col-xs-2 col-sm-2">
               <select name="searchType" id="searchType" class="form-control">
                  <option value="0">-----</option>
                  <option value="1">제목</option>
                  <option value="2">내용</option>
                  <option value="3">아이디</option>
               </select>
            </div>
            <div class="col-xs-10 col-sm-10">
               <div class="input-group">
                  <input type="text" name="keyword" id="keywordInput"
                     class="form-control" /> <span class="input-group-btn">
                     <button id="searchBtn" type="submit" class="btn btn-default">검색</button>
                  </span><span class="input-group-btn">
                     <button id="writeBtn" type="submit" class="btn btn-default">글쓰기</button>
                     <!--                   <a href="/petcommunity/write.do" id="writeBtn" class="btn btn-default">글쓰기</a> -->
                  </span>
               </div>
            </div>
            <ul id="pagination-demo" class="pagination-lg"></ul>
         </div>
      </section>
   </div>
   <script
      src="./resources/bootstrap_template/template_01/js/jquery-3.2.1.min.js"></script>
   <script
      src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script
      src="./resources/bootstrap_template/template_01/js/jquery.slicknav.min.js"></script>
   <script
      src="./resources/bootstrap_template/template_01/js/owl.carousel.min.js"></script>
   <script src="resources/js/qnaBoardList.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
   <script src="./resources/bootstrap_template/template_01/js/main.js"></script>
   <script src="resources/bootstrap_template/template_01/scripts3/main.js"></script>
</body>

</html>
<%@include file="../views/footer.jsp"%>