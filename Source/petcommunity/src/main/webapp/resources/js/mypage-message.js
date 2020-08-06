var id = '1';
var count=0;
$(function(){
	$(".tab-link4").on("click", function(){
		count=5;
		getMypageMessage();
	})
	$(document).on("click", ".mypage-message", function(){
		id = $(this).children('.mypage-messageId').text();
		openMessageSpace(id);
		/*window.open("/petcommunity/message.do?id="+id);*/
	});
	$('#message-table').scroll(function() { 
		var innerHeight = $(this).innerHeight(); 
		var scroll=$(this).scrollTop() + $(this).innerHeight(); 
		var height=$(this)[0].scrollHeight; 

		if(scroll >= height){ 
			alert("스크롤")
			getMypageMessage()
		}
	});
});
function openMessageSpace(id){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/message.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : "json",
		data :{
			"id":id
		},
		 success: function(data) {
			 window.open("/petcommunity/message.do");
		 },
		 error: function(data){
      	   console.log('autocomplete error');
         }
	});
}
// message대상 셀렉트
function getMypageMessage(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getMessagePartner.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		success: function(data) {
       	  drawTable(data);
        },
        error: function(data){
        	console.log('autocomplete error');
        }
	});
}
// message대상 화면 구성
function drawTable(data){
	$('#message-table').empty();	
	h = '<h3>쪽지 확인</h3>';
	$('#message-table').append(h);

	for(var i=0; i<data.messageListSize; i++){
		var userId = data.messageList[i].messageSender;
		var sendTime = data.messageList[i].messageSendtime;
		var content = data.messageList[i].messageContents;
		if(userId==data.loginId){
			userId="나";
		}else{
			userId=userId+"(받음)";
		}
		var listContent =
			'<div class="mypage-message">'+
				'<table>'+
				'<colgroup>'+
				'<col style="width: 20%" />'+
				'<col style="width: 35%" />'+
				'<col style="width: 45%" />'+
				'</colgroup>'+
				'<tr>'+
					'<td><img class="mypage-messageThumbnail" src="resources/imgs/review_thumbnail'+'/thumbnail_reivew'+'.jpg" alt="썸네일"></td>'+
					'<td class="mypage-messageId" >'+userId+'</td>'+
					'<td class="mypage-messageTime">'+sendTime+'</td>'+
				'</tr>'+
				'<tr>'+
					'<td colspan="3" class="mypage-messageContent">'+content+'</td>'+
				'</tr>'+
				'</table>'+
			'</div>'+
			'<hr>';
		
		$('#message-table').append(listContent);	
	}
}