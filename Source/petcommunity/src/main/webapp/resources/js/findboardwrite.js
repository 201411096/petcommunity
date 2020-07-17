$(function(){
	getLocation();
});
function setLocation(latitude, longtitude){
	$('#findboardX').val(latitude);
	$('#findboardY').val(longtitude);
}

function getLocation() {
	if (navigator.geolocation) { // GPS를 지원하면
		navigator.geolocation.getCurrentPosition(function(position) {
			console.log('gps 확인'+ position.coords.latitude + ' ' + position.coords.longitude);
			setLocation(position.coords.latitude, position.coords.longitude);
		}, function(error) {
			console.error(error);
		}, {
			enableHighAccuracy : false,
			maximumAge : 0,
			timeout : Infinity
		});
	} else {
		alert('GPS를 지원하지 않습니다');
	}
}