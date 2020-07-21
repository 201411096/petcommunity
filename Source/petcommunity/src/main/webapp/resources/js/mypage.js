$(document).ready(function () {

$("#animal").click(function(){
		window.open("mypageAnimal.do", "반려동물 등록", "width=500,height=600")
	});
	
	if ($("#result").val() == 0){
		alert("오류 , 다시 등록 해주세요")
	}

	$("#exit22").click(function(){
		alert("asdf");
		close();
	});
	
});