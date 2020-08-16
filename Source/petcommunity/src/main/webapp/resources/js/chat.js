var curRoomName;
var memberId;
var exitSocketEventFlag = 0;
var systemMessageComponent = '<li class= "list-group-item systemMessage">';
var receiveMessageComponent = '<li class= "list-group-item receiveMessage">';
var sendMessageComponent = '<li class= "list-group-item sendMessage">';
var receiveWhisperMessageComponent = '<li class= "list-group-item receiveWhisperMessage">';
var sendWhisperMessageComponent = '<li class= "list-group-item sendWhisperMessage">';

setMemberValue();			// 멤버 아이디값 지정
setCurRoomName();		// 현재 입장할 방 세팅
selectRoom(memberId); // 방에 참가
listenAndAppendChatMessage('.messages', systemMessageComponent, receiveMessageComponent, sendMessageComponent, receiveWhisperMessageComponent, sendWhisperMessageComponent);
formSetting();
documentPreventKeyDown();
chatLocationEventHandler();
chatMessageBoxEnterListener();
socketEventHandling();
windowCloseEvent();

function windowCloseEvent(){
	$(window).on('unload', function(){
		if(exitSocketEventFlag == 0){
			var roomInfo = new Object();
			roomInfo.prev = curRoomName; // 이전 방 정보
			setCurRoomName(curRoomName);
			roomInfo.cur = '__exit__'
			roomInfo.memberId = memberId;
			socket.emit('joinRoom', roomInfo);
		}
	});
}

function chatLocationEventHandler(){
	$('#chatLocation').on('change', function(){
		selectRoom(memberId);
	});	
}

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
function chatMessageBoxEnterListener(){
	$('#m').on('keydown', function(e){
		if(e.keyCode===13){
			$('#messageSendBtn').click();
		}
	});
}

function documentPreventKeyDown(){
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	}, true);
}

function selectRoom(memberId){
	var roomInfo = new Object();
	roomInfo.prev = curRoomName; // 이전 방 정보
	setCurRoomName(curRoomName);
	roomInfo.cur = curRoomName; // 이후 방 정보
	roomInfo.memberId = memberId;
	socket.emit('joinRoom', roomInfo);
}

function listenAndAppendChatMessage(targetElement, systemComponentElement, receiveComponentElement, sendComponentElement, receiveWhisperComponentElement, sendWhisperComponentElement){
	socket.on('chat message', function(msg){
		console.log('check in socketonevent ...');
		if(msg.messageType=='system'){
			$(targetElement).append($(systemComponentElement).text(msg.messageContent));
		}else if(msg.messageType=='receive'){
			$(targetElement).append($(receiveComponentElement).text(msg.messageContent));
		}else if(msg.messageType=='send'){
			$(targetElement).append($(sendComponentElement).text(msg.messageContent));
		}else if(msg.messageType=='receive_whisper'){
			$(targetElement).append($(receiveWhisperComponentElement).text(msg.messageContent));
		}else if(msg.messageType=='send_whisper'){
			$(targetElement).append($(sendWhisperComponentElement).text(msg.messageContent));
		}		
		$(targetElement).scrollTop($(targetElement)[0].scrollHeight); // 스크롤을 맨 아래로..
	});	
}

function socketEventHandling(){
	console.log('socketEventHandling function 호출 확인');
	socket.on('eventHandling', function(socketEvent){
		if(socketEvent=='clearMessageBox'){
			console.log('clearMessage event 확인');
			$('div.messages').empty();
		}
		if(socketEvent=='exitChat'){
			exitSocketEventFlag=1;
			console.log('exitChat event 확인');
			var roomInfo = new Object();
			roomInfo.prev = curRoomName; // 이전 방 정보
			roomInfo.cur = 'tempRoom'; // 이후 방 정보
			roomInfo.memberId = memberId;
			socket.emit('joinRoom', roomInfo);
			window.close();
			return;
		}
	});
}

function setCurRoomName(){ // 현재 방 설정
	curRoomName = $('#chatLocation').val();
	console.log('curRoomName ... ' + curRoomName);
}

function setMemberValue(){
	if($('#memberId').val()!=""){
		memberId = $('#memberId').val();
	}else{
		memberId = "tempMember";
	}
}