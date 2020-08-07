<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var socket = io("https://192.168.0.18:3000");
waitingPublicData();
getPublicData();

function waitingPublicData(){
	console.log('waitingPublicData 함수 확인 ... ');
	socket.on('getPublicData', function(data){
		console.log('socket.on ... waitingPublicData 이벤트 확인 ... ' + data);
		console.log('socket.on ... waitingPublicData 이벤트 확인 ... ' + data[0]);
		console.log('socket.on ... waitingPublicData 이벤트 확인 ... 데이터 길이 : ' + data.length);
	});
}

function getPublicData(){
	var dataOptions = new Object();
	dataOptions.startDate = '20200101';
	dataOptions.endDate = '20201231';
	dataOptions.dataCnt = '100';
	socket.emit('getPublicData', dataOptions);
// 	console.log('socket.on ... getPublicData 이벤트 확인 ... ');
}
</script>
</body>
</html>