$(function(){
	
	$('#commentBtn').attr('disabled',true);
	$('#commentTextarea').focusin(function(){		
		if($('#commentTextarea').text()!=null){
			$('#commentBtn').attr('disabled',false);
		}else if($('#commentTextarea').text()==""){
			$('#commentBtn').attr('disabled',true);
		}
	});
	
	$('#goToList').click(function(){
		window.location.href='/petcommunity/communityBoardList.do';
	});
});

