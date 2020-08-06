var id = '1';
var startPage=0;
var endPage=5;
var count=0;
var otherId='1';
var myDiv = document.getElementById('message-table');
$(function(){
	// 쪽지 눌렀을 때 전체 메시지 대화 끌고옴
	$(".tab-link4").on("click", function(){
		startPage=0;
		endPage=5;
		getMypageMessage(startPage, endPage);
	})
	// 메시지 상대방 누르면 해당 상대와의 메시지 만 끌고옴
	$(document).on('click', '.mypage-messageId', function(){
		otherId = $(this).next().val();
		myDiv.scrollTop = 0;
		startPage=0; 
		endPage=5;
		getMypageMessage(startPage, endPage);
	});
	// 종이비행기 누르면 입력 창띄움
	$(document).on("click", ".sendMsg", function(){
		tr=$(this).parent().parent().parent().parent().find('tr.tr-sendBox');/*.children('tr.tr-sendBox');*/
//		tr = $(this).parent().parent().parent().val();/**/
		if(tr.css('display')=='none'){
			tr.css('display','block');
		}else{
			tr.css('display','none');
		}
//		openMessageSpace(id);
		/*window.open("/petcommunity/message.do?id="+id);*/
	});
	// 무한스크롤
	$('#message-table').scroll(function() { 
		var innerHeight = $(this).innerHeight(); 
		var scroll=$(this).scrollTop() + $(this).innerHeight(); 
		var height=$(this)[0].scrollHeight; 

		if(scroll >= height){ 
			startPage=endPage;
			endPage+=3;
			/*alert("스크롤")*/
			getMypageMessage(startPage, endPage)
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
function getMypageMessage(startPage, endPage){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getMessagePartner.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : "json",
		data :{
			"startPage":startPage,
			"endPage":endPage,
			"otherId":otherId
		},
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
	if(startPage==0){
		$('#message-table').empty();	
		h = '<h3>쪽지 확인</h3>';
		$('#message-table').append(h);
	}
	for(var i=0; i<data.messageListSize; i++){
		var userId = data.messageList[i].messageSender;
		var sendTime = data.messageList[i].messageSendtime;
		var content = data.messageList[i].messageContents;
		var msgId = data.messageList[i].messageId;
		var iTag = '<td class="sendMsg"><i class="fa fa-paper-plane"></td>';
		// 메시지 송신자 확인
		if(userId==data.loginId){
			userId="나(보냄)";
			iTag = '<td class="sendMsg"><i class="fa fa-paper-plane" style="display:none";></td>';
		}else{
			userId=userId+"(받음)";
		}
		// 읽은 메시지인지 확인
		var listContent =
			'<div class="mypage-message" value="div">'+
				'<table>'+
				'<colgroup>'+
				'<col style="width: 20%" />'+
				'<col style="width: 30%" />'+
				'<col style="width: 45%" />'+
				'<col style="width: 5%" />'+
				'</colgroup>'+
				'<tr>'+
					'<td><img class="mypage-messageThumbnail" src="resources/imgs/review_thumbnail'+'/thumbnail_reivew'+'.jpg" alt="썸네일"></td>'+
					'<td class="mypage-messageId" >'+userId+'</td>'+
					'<input type="hidden" value="'+userId.slice(0,-4)+'">'+
					'<td class="mypage-messageTime">'+sendTime+'</td>'+
					iTag+
				'</tr>'+
				'<tr>'+
					'<td colspan="4" class="mypage-messageContent">'+content+'</td>'+
				'</tr>'+
				'</table>'+
				'<table>'+
				'<colgroup>'+
					'<col style="width: 70%" />'+
					'<col style="width: 30%" />'+
					'</colgroup>'+
					'<tr class="tr-sendBox">'+
						'<td><hr><input type="text" class="searchMessage" placeholder="메시지를 입력하세요"/>'+
						'<button class="btn-message">전송</button></td>'+
						'<input type="hidden" class="messageId" value="'+msgId+'"/>'+
					'</tr>'+
				'</table>'+
			'</div>'+
			'<hr>';
		
		$('#message-table').append(listContent);	
	}
}