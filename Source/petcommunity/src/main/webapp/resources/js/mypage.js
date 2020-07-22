$(document).ready(function() {

	$('#register-form input[type=submit]').click(function(){
		
        var submit = false;
        if($('#animalName').val()==="")
        {
            alert("반려동물 이름을 입력하세요");return false;        
        }
        else if($("input:radio[name=animalGender]").is(":checked") == false) {
            alert("반려동물의 성별을 선택하세요");
            return false;
        }
        else if($('#animalBirthday').val()===""){
            alert("반려동물 생일을 입력하세요");return false;
        }
        else if($('#animalFeature').val()==="")
        {
            alert("반려동물 특징을 입력하세요");return false;    
        }
        
        else
        	submit = true;
        if(submit === true)
            $('#register-form').submit();
	});
	
	$("#mypageButton").click(function() {
		opener.parent.location.reload();
		close();
	});

	$("#animal").click(function() {
		window.open("mypageAnimal.do", "반려동물 등록", "width=520,height=750")
	});

	if ($("#result").val() == 0) {
		alert("오류 , 다시 등록 해주세요")
	};
	
	
	$(document).on("click", "#dBtn", function() {
		var result = confirm('삭제 하시겠습니까?');

		if (result) {

		} else {
			event.preventDefault();
		}
	});

	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});

});