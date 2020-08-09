var startPage=0;//최초 탭 클릭 시 0~5개의 리스트, 챗만 가져옴
var endPage=6;
var otherId='1';//상대방 id

$(function(){
	$(".tab-link4").on("click", function(){
		$('#message-table').css("display","block");
		startPage=0;
		endPage=6;
		otherId='1';
		$("#div-chat").empty();
		getMypageMessage(startPage, endPage);
	})
	// 아이디 검색 이벤트
	$('#btn-searchSomeone').on('click', function(){
		var searchNew='';
		searchNew = $('#searchSomeone').val();
		otherId='1';
		$("#div-chat").empty();
		searchId(searchNew);
		
	});
//	// 아이디 검색 이벤트(onfocus)
//	$('#searchSomeone').on('onfocus', function(){
//		var searchNew='';
//		searchNew = $('#searchSomeone').val();
//		otherId='1';
//		$("#div-chat").empty();
//		searchId(searchNew);
//	})
	// 아이디 검색 이벤트(keyup)
	$('#searchSomeone').on('keyup', function(){
		var searchNew='';
		searchNew = $('#searchSomeone').val();
		otherId='1';
		$("#div-chat").empty();
		searchId(searchNew);
		
	});
	//클릭 이벤트
	$(document).on("click", '.mypage-message', function(){
		$('.mypage-message').css({"background-color": "#fafafa"});
		$(this).css({"background-color": "#83bb44"});
		otherId=$(this).attr("value");
		getChat(startPage, endPage);
	});
	$(document).on("click", '.sendMsg', function(){
		var divColorChange = $(this).parent().parent().parent().parent();		
		$('.mypage-message').css({"background-color": "#fafafa"});
		divColorChange.css({"background-color": "#83bb44"});
		otherId=$(this).prev().attr("value");
		getChat(startPage, endPage);
	});
	// 삭제
	$(document).on('click', '.messageDel', function(){
		if(confirm("삭제하시겠습니까?")){
		var msgId = $(this).attr('value');
		delMessage(msgId);
		}
	});
	// 무한스크롤(리스트)
	$("#div-memberList").scroll(function(){
		var innerHeight = $(this).innerHeight(); 
		var scroll=$(this).scrollTop() + $(this).innerHeight(); 
		var height=$(this)[0].scrollHeight; 

		if(scroll >= height){ 
			startPage=endPage;
			endPage+=3;
//			getMypageMessage(startPage, endPage);
		}
	});
	// 전송
	$('#btn-message').on('click', function(){
		var content=$('#writeMessage').val();
		alert(content);
	});


});
function searchId(searchNew){
	$.ajax({
		async:true,
		url : '/petcommunity/searchId.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : "json",
		data :{
			"startPage":startPage,
			"endPage":endPage,
			"otherId":otherId,
			"searchNew":searchNew
		},
		success: function(data){
			if(data.noSearch=="noSearch"||data.noId=="noSearch"){
				startPage=0;
				endPage=6;
				getMypageMessage(startPage, endPage);
			}
			drwaWriteMessageTable(data);
		},
		error: function(data){
			console.log('autocomplete error');
		}
	});
}

function delMessage(msgId){
	$.ajax({
		async:true,
		url : '/petcommunity/delMessage.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : "json",
		data :{
			"startPage":startPage,
			"endPage":endPage,
			"otherId":otherId,
			"msgId":msgId
		},
		success: function(data){
			alert("삭제완료");
			drawChatTable(data);
		},
		error: function(data){
			console.log('autocomplete error');
		}
	});
}
function getChat(startPage, endPage){
	$.ajax({
		async:true,
		url : '/petcommunity/getChat.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : "json",
		data :{
			"startPage":startPage,
			"endPage":endPage,
			"otherId":otherId
		},
		success: function(data){
			drawChatTable(data);
		},
		error: function(data){
			console.log('autocomplete error');
		}
	});
}
function getMypageMessage(startPage, endPage){
	$.ajax({type : 'post',
		async:true,
		url : '/petcommunity/getMessagePartner2.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : "json",
		data :{
			"startPage":startPage,
			"endPage":endPage,
			"otherId":otherId
		},
		success: function(data){
			drwaWriteMessageTable(data);
		},
		error: function(data){
			console.log('autocomplete error');
		}
		
	});
}
function drawChatTable(data){
	$('#div-chat').empty();
	var chatMessage='';
	for(var i=0; i<data.messageVOSize; i++){
		var target1 = data.messageVO[i].messageTarget1;
		var target2 = data.messageVO[i].messageTarget2;
		var sender = data.messageVO[i].messageSender;
		var sendtime = data.messageVO[i].messageSendtime;
		var contents = data.messageVO[i].messageContents;
		var messageId = data.messageVO[i].messageId;
		var loginId = data.loginId;
		var fromWho = '<td class="messageDel" value="'+messageId+'">X</td>';
		if(loginId!=sender){
			chatMessage= '<div class="chatMessageLeft">';
			fromWho = '<td class="messageDel" value="'+messageId+'"></td>';;
		}else{
			sender="나";
			chatMessage= '<div class="chatMessageRight">';
			fromWho = '<td class="messageDel" value="'+messageId+'">X</td>';
		}
		var listContent = 
			chatMessage+
				'<table>'+
				'<colgroup>'+	
				'<col style="width: 20%" />'+
				'<col style="width: 2%" />'+
				'</colgroup>'+
				'<tr>'+
					'<td class="messageTime" value="'+sendtime+'">'+sendtime.slice(5, -3)+'  '+'('+sender+')'+'</td>'+
					fromWho+
				'</tr>'+
				'<tr>'+
					'<td class="messageContent">'+contents+'</td>'+
				'</tr>'+
				'</table>'+
			'</div>'+
			'<div></div>';
		
		$('#div-chat').append(listContent);
	}
}

function drwaWriteMessageTable(data){
	if(startPage==0){
		$('#div-memberList').empty();
	}
	
	for (var i=0; i<data.messagePartnerListSize; i++){
		var userId='';
		var tdInfo='';
		if(data.memberList!=null){
			userId=data.memberList[i].memberId;
			userAdress=data.memberList[i].memberAddress;
			tdInfo=userAdress.slice(0, 2);
			
		}else{
		userId = data.messagePartnerList[i];
		tdInfo='대화중';
		}
//		var userId = data.messagePartnerList[i].split("/")[0];
/*		var content = data.messagePartnerList[i].split("/")[1];
		var sendTime = data.messagePartnerList[i].split("/")[2];*/
//		var userId = data.messageList[i].messageSender;
//		var sendTime = data.messageList[i].messageSendtime;
//		var content = data.messageList[i].messageContents;
//		var msgId = data.messageList[i].messageId;
		var tdTag = '<td colspan="4" class="mypage-messageContent">'+tdInfo+'</td>';
		var iTag = '<td class="sendMsg"><i class="fa fa-paper-plane"></td>';
		var listContent =
		'<div class="mypage-message" value="'+userId+'">'+
		'<table>'+
		'<colgroup>'+	
		'<col style="width: 20%" />'+
		'<col style="width: 30%" />'+
		'<col style="width: 45%" />'+
		'<col style="width: 5%" />'+
		'</colgroup>'+
		'<tr>'+
			'<td><img class="mypage-messageThumbnail" src="resources/imgs/review_thumbnail'+'/thumbnail_reivew'+'.jpg" alt="썸네일"></td>'+
			'<td class="mypage-messageId" value="'+userId+'">'+userId+'</td>'+
			'<td></td>'+
//			'<td class="mypage-messageTime" value="'+sendTime+'">'+sendTime.slice(2,-3)+'</td>'+
			'<input type="hidden" value="'+userId+'"/>'+
			iTag+
		'</tr>'+
		'<tr>'+
			tdTag+
//			'<td colspan="4" class="mypage-messageContent">'+'대화중'+'</td>'+
		'</tr>'+
		'</table>'+
		'</div>'+
		'<hr>';
		
		$('#div-memberList').append(listContent);
	}
	
	
}