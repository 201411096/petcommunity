<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Socket.IO chat</title>
    <link rel="stylesheet" type="text/css" href="./resources/css/test_chat.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="chatWrapper">
		<div class="chatContainer">
			<select class="form-control" id="chatLocation">
				<option value="전체">전체</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="강원">강원</option>
				<option value="충북">충북</option>
				<option value="충남">충남</option>
				<option value="대전">대전</option>
				<option value="세종">세종</option>
				<option value="전북">전북</option>
				<option value="전남">전남</option>
				<option value="광주">광주</option>
				<option value="경북">경북</option>
				<option value="경남">경남</option>
				<option value="부산">부산</option>
				<option value="울산">울산</option>
				<option value="대구">대구</option>
				<option value="제주">제주</option>
			</select>
			<div class="messages"></div>
			<input type="hidden" id="memberId" value="${memberInfo.memberId}">
			<form class="messageForm">
				<div class="input-group">
					<input type="text" class="form-control" id="m">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">Send</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<!-- 	<div id="chatContainer"> -->
<%-- 		<input type="hidden" id="memberId" value="${memberInfo.memberId}"> --%>
<!-- 	    <ul class="messages"></ul> -->
<!-- 	    <form class="messageForm" action=""> -->
<!-- 	        <div> -->
<!-- 	        	<select name="option1" id="option1"> -->
<!-- 	        		<option selected value="roomA">A</option> -->
<!-- 	        		<option value="roomB">B</option> -->
<!-- 	        		<option value="roomC">C</option> -->
<!-- 	        	</select> -->
<!-- 	        </div> -->
<!-- 	      <input id="m" autocomplete="off" /><button>Send</button> -->
<!-- 	    </form>     -->
<!--     </div> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="./resources/js/test_chat.js"></script>
</body>
</html>