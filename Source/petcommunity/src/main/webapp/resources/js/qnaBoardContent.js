$(function(){
	
	// 삭제버튼
	$('#deleteBtn').click(function(){
		var result=confirm("삭제하시겠습니까?");
		
		if(result){
			window.location.href="/petcommunity/delete.do?questionboardId="+$('#deleteBtn').val();
		}
	});
	
	
});