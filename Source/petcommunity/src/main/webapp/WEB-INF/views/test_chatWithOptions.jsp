<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Socket.IO chat</title>
    <link rel="stylesheet" type="text/css" href="./resources/css/test_chatWithOptions.css">
</head>
<body>
	<div id="chatContainer">
		<input type="hidden" id="memberId" value="${memberInfo.memberId}">
	    <ul class="messages"></ul>
	    <form class="messageForm" action="">
	        <div>
	        	<select name="option1" id="option1">
	        		<option selected value="roomA">A</option>
	        		<option value="roomB">B</option>
	        		<option value="roomC">C</option>
	        	</select>
	        </div>
	      <input id="m" autocomplete="off" /><button>Send</button>
	    </form>    
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="./resources/js/test_chatWithOptions.js"></script>
</body>
</html>