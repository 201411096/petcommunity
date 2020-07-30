/*
서버로 보낼 데이터 구조
object
	ㄴ option : 객체
		ㄴ option1, option2 ..
	ㄴ content : 메시지 내용 
*/
var socket = io("https://192.168.0.18:3000");
$('form').submit(function(e) {
      e.preventDefault();
      var messageObject = new Object();
      var optionObject = new Object();
      optionObject.option1 = $('#option1').val();
//      optionObject.option2 = $('#option2').val();
      messageObject.content = $('#m').val();
      messageObject.option = optionObject;
      socket.emit('chat message', messageObject);
      //socket.emit('chat message', $('#m').val());
      $('#m').val('');
      return false;
});
socket.on('chat message', function(msg){
  $('#messages').append($('<li>').text(msg));
});


getMemberInfo(); // 로그인 정보를 서버로 넘김
function getMemberInfo(){
	$.ajax({
		 type: 'get',
		 aysnc:true,
         url: "/petcommunity/getMemberInfo.do",
         contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
         data : {},
         dataType: "json",
         success: function(data) {
        	 console.log('getMemberInfo ajax 확인');
        	 var memberInfo = data.memberInfo
        	 console.log(memberInfo);
        	 if(memberInfo!=null && memberInfo!=undefined && memberInfo!=""){
        		 socket.emit('memberInfo', memberInfo);
        	 }else{
        		 socket.emit('memberInfo', 'tempMember');
        	 }
        		 
         },
         error: function(data){
      	   console.log('getMemberInfo error');
         }
	});
}