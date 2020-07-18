var latitude = -1;
var longitude = -1;
$(function() {
	kakaoMapAPI();
});

function kakaoMapAPI() {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.519972628243366, 126.85287648507145), // 지도의 중심좌표
		level : 7
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	});
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
	
	// 지도 클릭 이벤트
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng;
	    latitude = latlng.getLat();
	    longitude = latlng.getLng();
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    setLocation(latitude,  longitude)
	});
}

function setLocation(latitude,  longitude){
	$('#findboardX').val(latitude);
	$('#findboardY').val(longitude);
}
