$(document).ready(function () {
	
	$("#memberId").focusout(function(){
        $.ajax({
                type:'post',
                async:true,
                url : 'checkid.do',
                contentType :'application/x-www-form-urlencoded;charset=UTF-8',
                data : "memberId="+ $("#memberId").val(),
                success : function(resultData){
                    $("#idresult").html(resultData);
                    if($("#memberId").val()==="")
                        $("#idresult").html("ID를 입력하세요.");
                }
        
        });
        
        
    });
	
	$("#memberPassword").focusout(function(){
		
	var pass1 =$("#memberPassword").val()
	var pass2 =$("#re_pass").val()
	
	if(pass1==="")
		$("#passresult").html("비밀번호를 입력하세요.");
	

});
	$("#re_pass").focusout(function(){
		
		var pass1 =$("#memberPassword").val()
		var pass2 =$("#re_pass").val()
		
		if(pass1!=pass2 || pass1==="")
			$("#passresult").html("비밀번호 확인이 틀립니다");
			
		else $("#passresult").html("비밀번호 확인 되었습니다");
	});

	
	$('#register-form input[type=submit]').click(function(){
		var re = /^[a-zA-Z0-9]{4,12}$/;
		var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

        var submit1 = false;
        if($('#memberName').val()==="")
        {
            alert("이름을 입력하세요");return false;        
        }
        else if($('#memberTel').val()===""){
            alert("전화번호를 입력하세요.");return false;
        }
        else if($('#memberId').val()===""){
            alert("ID를 입력하세요.");return false;
        }
        else if($('#memberPassword').val()==="")
        {
            alert("비밀번호를 입력하세요.");return false;    
        }
        else if($('#re_pass').val()==="")
        {
            alert("비밀번호 확인을 입력하세요."); return false;       
        }
        else if($('#memberPassword').val()!==$('#re_pass').val())
        {
            alert("비밀번호 확인이 다릅니다.");return false;        
        }
        else if(!re.test($('#memberPassword').val()) || !re.test($('#re_pass').val()) ){
        	alert("비밀번호는 4~12의 영문자와 숫자로 입력해주세요"); return false;
        }
        else if($('#memberEmail').val()==="")
        {
            alert("이메일을 입력하세요.");return false;
        }else if(!email.test($('#memberEmail').val())){
            	alert("이메일 형식이 아닙니다"); return false;
        }
        else if($('#memberBirthday').val()===""){
            alert("생년월일을 입력하세요");return false;
        }
        else if($('#sample2_address').val()===""){
            alert("주소를 입력하세요");return false;
        }
       
        else if($("input:checkbox[id=agree-term]").is(":checked") == false) {
            alert("필수 약관에 동의 하셔야합니다.");
            return false;
        }
        else if($("input:checkbox[id=agree-term2]").is(":checked") == false) {
            alert("필수 약관에 동의 하셔야합니다.");
            return false;
        }
        
        else
        	submit1 = true;
        if(submit1 === true)
        	alert("회원가입되었습니다! 로그인페이지로 이동합니다")
            $('#register-form').submit();
    });
	
	if ($("#message").val() != null){
		alert("아이디와 비밀번호가 맞지 않습니다!")
	}
	
		

});

