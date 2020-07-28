$(document).ready(function() {
var curPage;
var defaultOpts={
		visiblePages : 5,
		onPageClick : function(event,page){
			$('#page-content').text('page'+page);
			curPage=page;
			getDataInpaging();
		}
};


$('.tab-link').on('click', function(){
	getData();
	
});
	
function getDataInpaging(){
	$.ajax({
		type : 'post',
		async : true,
		url : '/petcommunity/mypageselect.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {
			"curPage" : curPage
			},
		dataType : 'json',
		success : function(resultData){
			console.log("getDataInpaging")
			window.scrollTo(0,0);
			drawbuyTable(resultData);
		},
		error : function(request, status, error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


function getData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/mypageselect.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
			drawbuyTable(resultData);
            var totalPages = resultData.pagination.pageCnt;
            var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
            $('#pagination-demo').twbsPagination('destroy');
            $('#pagination-demo').twbsPagination($.extend({}, defaultOpts, {
                startPage: currentPage,
                totalPages: totalPages
            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}


function drawbuyTable(data){
	$('#buyListTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.buyListSize; i++){
		var listContent =
			trPrefix +				
			'<td class=buyListTd>'+
				'<a href="buyReceipt.do?buy='+data.buyList[i].buyListId +'">'+
				data.buyList[i].buyListId+'</a>'
				+tdSuffix+
				
				tdPrefix+
				data.buyList[i].buyListDate
				+tdSuffix+
				
				tdPrefix+
				data.buyList[i].buyListTotalprice
				+tdSuffix+
			trSuffix;
		
		$('#buyListTbody').append(listContent);
	}
}




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
		window.open("animalInsert.do", "반려동물 등록", "width=520,height=750")
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