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
			<div class="input-group">
				<input type="text" class="form-control" id="locationSearch">
				<span class="input-group-btn">
						<button id="joinRoomBtn" class="btn btn-primary">생성</button>
				</span>
			</div>
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