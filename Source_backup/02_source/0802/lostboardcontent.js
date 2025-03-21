var latitude = $('#lostboardX').val();
var longitude = $('#lostboardY').val();
var lostboardLocation = $('#lostboardLocation').val();
$(function() {
	kakaoMapAPI();
	$('#listButton').on('click', function(){
		location.href='/petcommunity/lostboardlist.do';
	});
	$('#deleteButton').on('click', function(){
		$('#lostBoardContentForm').attr('action', '/petcommunity/deleteLostBoard.do');
		$('#lostBoardContentForm')[0].submit();
	});
	$('#updateButton').on('click', function(){
		$('#lostBoardContentForm').attr('action', '/petcommunity/loadLostBoardUpdate.do');
		$('#lostBoardContentForm')[0].submit();
		
	});
});

function kakaoMapAPI() {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
//		center : new kakao.maps.LatLng(37.519972628243366, 126.85287648507145), // 지도의 중심좌표
		center : new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
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
	
	var iwContent = '<div class="alert alert-light">'+ lostboardLocation +'</div>'
    iwPosition = new kakao.maps.LatLng(latitude, longitude); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	//var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	//map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	//var zoomControl = new kakao.maps.ZoomControl();
	//map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
}

function setLocation(latitude,  longitude){
	$('#lostboardX').val(latitude);
	$('#lostboardY').val(longitude);
}
// 주소 타입 : 도로명 주소 0, 지번 주소 1
function setAddress(addressname, addressType){
	$('#lostboardLocation').val(addressname);
	$('#lostboardLocationType').val(addressType);
}