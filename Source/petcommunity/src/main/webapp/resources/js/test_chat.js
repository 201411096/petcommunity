var socket = io("https://192.168.0.18:3000");
//var socket = io("https://121.171.119.57:3000");

var curRoomName;
var memberId;

setMemberValue();			// 멤버 아이디값 지정
setCurRoomName(curRoomName);		// 현재 입장할 방 세팅
selectRoom(curRoomName, memberId); // 방에 참가
listenAndAppendChatMessage('.messages', '<li>')
formSetting();
documentPreventKeyDown();
console.log(memberId);

$('#option1').on('change', function(){
	selectRoom(curRoomName, memberId);
});
function formSetting(){
	$('form').submit(function(e) {
	    e.preventDefault(); 
	    var messageObject = new Object();
	    messageObject.roomName = curRoomName;
	    messageObject.messageContent = $('#m').val();
	    messageObject.memberId = memberId;
	    console.log('check in submit ... ' + messageObject.roomName);
	    console.log('check in submit ... ' + messageObject.messageContent);
	    console.log('check in submit ... ' + messageObject.memberId);
	    socket.emit('chat message', messageObject);
	    $('#m').val('');
	    return false;
	});	
}

function documentPreventKeyDown(){
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	}, true);
}

function selectRoom(curRoomName, memberId){
	var roomInfo = new Object();
	roomInfo.prev = curRoomName; // 이전 방 정보
	setCurRoomName(curRoomName);
	roomInfo.cur = curRoomName; // 이후 방 정보
	roomInfo.memberId = memberId;
	socket.emit('joinRoom', roomInfo);
}

function listenAndAppendChatMessage(targetElement, componentElement){
	socket.on('chat message', function(msg){
		console.log('check in socketonevent ...');
		$(targetElement).append($(componentElement).text(msg));
		$(targetElement).scrollTop($(targetElement)[0].scrollHeight); // 스크롤을 맨 아래로..
	});	
}

function setCurRoomName(curRoomName){ // 현재 방 설정
	curRoomName = $('#option1').val();
}

function setMemberValue(){
	if($('#memberId').val()!=""){
		memberId = $('#memberId').val();
	}else{
		memberId = "tempMember";
	}
}