<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io-stream/0.9.1/socket.io-stream.min.js" integrity="sha512-LTN7WQKvmCiOWbwxE4XRu3NCRqLzkFo28vBDHVhAyKjhmorNGjtvFxQgbvAttO31Ij6An4AIXU4GVaYOC0eNpQ==" crossorigin="anonymous"></script>
</head>
<body>
<input type="file" name="file" class="file" id="file" accept="image/gif, image/jpeg, image/png"/>
<button id="imageToServerBtn">버튼</button>
<script>
$(function() {
	var socket = io("https://192.168.0.18:3000");
	 
	  $('#file').change(function(e) {
		var formData = new FormData();
		formData.append('imageFile', document.getElementById('file')[0].files[0])
	  });
	});
</script>
</body>
</html>