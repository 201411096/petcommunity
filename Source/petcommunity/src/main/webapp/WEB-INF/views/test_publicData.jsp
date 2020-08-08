<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.marker-infowindow{
   width:300px;
   height:250px;
   text-align:center;
   border-radius:10px;
   border-collapse: separate;
}
img.infoWindowImage{
	width:100%;
	height:100px;
}
div.infoWindowImageContainer{
	max-width:50%;
	margin:auto;
}
</style>
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
		console.log('socket.on ... waitingPublicData 이벤트 확인 ... 데이터 길이 : ' + data.length);
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.519972628243366, 126.85287648507145), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		data = convertAddress(data);
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
	console.log()
	var geocoder = new kakao.maps.services.Geocoder();
	var iwContet;
	for(var i=0; i<data.length; i++){
		iwContent = '<div class="marker-infowindow">'+
						 '<div class="form-group">품종 : '+data[i].kindCd+'</div>'+
						 '<div class="form-group">발견 장소 : '+data[i].happenPlace+'</div>'+
						 '<div class="infoWindowImageContainer">'+'<img src="'+ data[i].popfile +'" class="infoWindowImage" alt="이미지가 존재하지 않습니다.">'+'</div>'+
						 '</div>'; 
        // 결과값으로 받은 위치를 마커로 표시합니다
        console.log(i + '번째 data의 coords 확인' + data[i].coords);
        var marker = new kakao.maps.Marker({
            map: map,
            position: data[i].coords
        });
        var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent
        });
        kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
	}
}
function convertAddress(data){
	console.log('convertAddress 함수 시작');
	var geocoder = new kakao.maps.services.Geocoder();
	for(var i=0; i<data.length; i++){
		geocoder.addressSearch(data[i].happenPlace, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		    	 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
// 		    	 console.log('resultx ... ' + result[0].x);
// 		    	 console.log('resulty ... ' + result[0].y);
		    	 data.coords = coords;
		     }
		}); 
	}
	console.log('convertAddress 함수 끝');
	return data;
}
function makeClickListener(map, marker, infowindow) {
	var status = 0;
	return function() {
		if(status==0){
			infowindow.open(map, marker);
			status=1;
		}else{
			infowindow.close(map, marker);
			status=0;
		}			
	};
}
</script>
</body>
</html>