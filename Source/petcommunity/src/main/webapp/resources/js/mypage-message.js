$(function(){
	$(".tab-link4").on("click", function(){
		getMypageMessage();
	})
	$(".mypage-message").on("click", function(){
		window.open("/petcommunity/message.do");
	});
});


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

function drawTable(data){
	alert("드로우테이블");
	$('#message-table').empty();
	h = '<h3>쪽지 확인</h3>';
	$('#message-table').append(h);
	for(var i=0; i<data.messageListSize; i++){
		var listContent =
			'<div class="mypage-message">'+
				'<tr>'+
					'<td><img class="mypage-messageThumbnail" src="resources/imgs/review_thumbnail'+'/thumbnail_reivew'+'.jpg" alt="썸네일"></td>'+
					'<td><span class="mypage-messageId" >'+data.messageList[i]+'</span></td>'+
					'<td><span class="mypage-messageTime">'+'시간'+'</span></td>'+
				'</tr>'+
			'</div>';
		$('#message-table').append(listContent);	
	}
}