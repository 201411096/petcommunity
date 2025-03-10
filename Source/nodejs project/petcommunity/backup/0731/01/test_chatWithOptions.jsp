<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Socket.IO chat</title>
      <style>
      * { margin: 0; padding: 0; box-sizing: border-box; }
      body { font: 13px Helvetica, Arial; }
      form { padding: 3px; position: fixed; bottom: 0; width: 100%; }
      form input { border: 0; padding: 10px; width: 90%; margin-right: 0.5%; }
      form button { width: 9%; background: rgb(130, 224, 255); border: none; padding: 10px; }
      #messages { list-style-type: none; margin: 0; padding: 0; }
      #messages li { padding: 5px 10px; }
      #messages li:nth-child(odd) { background: #eee; }
    </style>
</head>
<body>
	<div id="chatContainer">
		<input type="hidden" id="memberId" value="${memberInfo.memberId}">
	    <ul id="messages"></ul>
	    <form action="">
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