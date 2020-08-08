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

<div id="map" style="width:100%;height:350px;"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41ccd37d4644ab2ed5ed67441dda1abb&libraries=services"></script>
<script type="text/javascript">
// var socket = io("https://192.168.0.18:3000");
var socket = io("https://121.171.119.57:3000");
waitingPublicData();
getPublicData();

function waitingPublicData(){
	console.log('waitingPublicData 함수 확인 ... ');
	socket.on('getPublicData', function(data){
// 		console.log('socket.on ... waitingPublicData 이벤트 확인 ... ' + data);
// 		console.log('socket.on ... waitingPublicData 이벤트 확인 ... ' + data[0]);
// 		console.log('socket.on ... waitingPublicData 이벤트 확인 ... 데이터 길이 : ' + data.length);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.519972628243366, 126.85287648507145), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		drawMarker(map, data);
	});
}

function getPublicData(){
	var dataOptions = new Object();
	dataOptions.startDate = '20200101';
	dataOptions.endDate = '20201231';
	dataOptions.dataCnt = '50';
	socket.emit('getPublicData', dataOptions);
}
function drawMarker(map, data){
	var geocoder = new kakao.maps.services.Geocoder();
	
	for(var i=0; i<data.length; i++){
		geocoder.addressSearch(data[i].happenPlace, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});  
	}
}
</script>
</body>
</html>