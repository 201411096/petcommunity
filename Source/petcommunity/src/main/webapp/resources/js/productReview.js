$(function(){
	$("#btn_reviewSubmit").on("click", function(){
		if($("#productreviewScore").val()==="" || $("#productreviewContent").val()===""){
			alert("평점 또는 리뷰를 입력해주세요")
		}else{
			alert("리뷰버튼 이벤트~")
			loginCheck();
		}
	});
});
function loginCheck(){
	alert("ajax함수 실행")
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/insertProductReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"productId" : $("#reviewProductId").val(), 
				"productreviewScore" : $("#productreviewScore").val(), 
				"productreviewContent" : $("#productreviewContent").val()
				},
		dataType : 'json',
		success : function(resultData){
			alert("컨트롤 찍고왔어욤 뿌우~")
			if(resultData.logout==="logout"){
				window.location.href="/petcommunity/login.do"
				//window.history.back();
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}