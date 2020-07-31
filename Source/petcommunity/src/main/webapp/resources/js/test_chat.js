var socket = io("https://192.168.0.18:3000");
$('form').submit(function(e) {
      e.preventDefault(); 
      socket.emit('chat message', $('#m').val());
      $('#m').val('');
      return false;
});
socket.on('chat message', function(msg){
  $('#messages').append($('<li>').text(msg));
});
//var memberId = $('#memberId').val();
//socket.emit('memberInfo', memberId);


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