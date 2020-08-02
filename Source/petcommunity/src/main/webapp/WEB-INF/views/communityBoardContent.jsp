<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../views/header.jsp"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./resources/css/communityBoardContent.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/communityBoardContent.js"></script>		

<title>oki doghere커뮤니티</title>
</head>
<body>

	<div class="container">

	<br/><br/>
		
		
			<!-- 글내용 -->
			<br/><br/><hr/>
			<div class="form-group">
				<input type="hidden" id="forRecommend" value="${boardContent.communityboardId}">
				<span id=communityContentTitle>${boardContent.communityboardLocation}</span>
				<h2>${boardContent.communityboardTitle}</h2>
				<div id=communityContentWriter>${boardContent.memberId} <br/></div>
				<div id=communityContentTime>${boardContent.communityboardUploadtime }</div>
			</div>
			<hr/>
			
			<div class="form-group">
				<div>
					<c:forEach items="${boardContentImg}" var="file">
						<div>
							<img src="resources/imgs/communityboard/${boardContent.communityboardId}/${file.name}"  alt="..." id='communityBoardContentImg'>															
						</div>
					</c:forEach>
				</div>
				<span id=communityContentContent>${boardContent.communityboardContent}</span>
			</div>
			
			<br/><br/>
			<c:if test="${not empty sessionScope.memberVO}">
				<a href='#'><img src='resources/imgs/communityboard/like/like.PNG' id='like'></a>
				<span class='text-primary' id='recommendToContent'>추천</span>
			</c:if>
			<!-- 댓글내용 -->		
			<hr/>
			<div class="form-group">
				<h4>댓글</h4>	
				<hr/>			
				<table>			
					<c:forEach items="${boardComment}" var = "boardComment">
							
						<tr><td id="commentWriter">${boardComment.memberId}</td></tr>								
						<tr><td id="commentContent">${boardComment.boardcommentContent}	</td></tr>														
						<tr><td id="commentUploadTime">
						${boardComment.boardcommentUploadtime}
						<c:if test="${boardComment.memberId ne sessionScope.memberVO.memberId}">
							<hr/>
						</c:if>
						</td></tr>
						<c:if test="${boardComment.memberId eq sessionScope.memberVO.memberId
										or sessionScope.memberVO.memberFlag eq '1'}">
							<tr><td id="commentDelete">	
							
								<a href="#" class="commentDelete" id='commentDelete'>삭제하기</a>
								<input type="hidden" id="boardcommentId" value="${boardComment.boardcommentId}">
								<input type="hidden" id="communityboardId" value="${boardContent.communityboardId}">
								<hr/>
							</td></tr>
						</c:if>
																
					</c:forEach>
						
				</table>
			</div>			
			
			<form action="writeComment.do?">
			<div class="form-group">
				<label>댓글달기</label>
				
				<input type='hidden' name='communityboardId' value='${boardContent.communityboardId}'>
				<c:choose>
				    <c:when test="${empty sessionScope.memberVO}">
				        <textarea class="form-control" rows="5" id="commentTextarea" name="communityboardContent" placeholder="로그인 이후 이용 가능합니다" disabled></textarea>
				    </c:when>			
				
				    <c:otherwise>
				        <textarea class="form-control" rows="5" id="commentTextarea" name="boardcommentContent" placeholder="댓글입력"></textarea>
				    </c:otherwise>			
				</c:choose>
			</div>
			
			<div class="col-xs-10 col-sm-10">	
				<button type="button" class="btn btn-default" id='goToList'>목록보기</button>
				<c:if test="${boardContent.memberId eq sessionScope.memberVO.memberId or sessionScope.memberVO.memberFlag eq '1'}">
					<button type="button" class="btn btn-default" id="communityBoardModify">수정하기</button>
					<button type="button" class="btn btn-default" id="communityBoardDelete" value="${boardContent.communityboardId}">삭제하기</button>
				</c:if>
				</div>	
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default" id='commentBtn'>등록</button>
				</span>	
				</form>		
		</div>	
</body>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "https://teachablemachine.withgoogle.com/models/J7Eg9zxu4/";

    let model, webcam, labelContainer, maxPredictions;

    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // append elements to the DOM
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }
	
  
    // run the image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(document.getElementById("communityBoardContentImg"), false);
       
      
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        }
    }
</script>


<!-- 견종분류 -->	
<div>Teachable Machine Image Model</div>
<div id="label-container">here</div>	
<button type="button" onclick="init()">Start</button>
<button type="button" onclick="predict()">예측</button>	
</html>